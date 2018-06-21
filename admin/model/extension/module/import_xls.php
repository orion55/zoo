<?php
class ModelExtensionModuleImportXls extends ModelExtensionModuleImportExportXls {
	public function __construct($registry) {
        parent::__construct($registry);
    }

    //<editor-fold desc="Import products">
        function start_import($xls_data, $pattern) {
            $this->load->model('localisation/language');
            $this->load->model('setting/store');
            $this->load->model('catalog/product');

            $all_categories = $this->get_all_categories();
            $all_manufacturers = $this->get_all_manufacturers();
            $all_options = $this->get_all_options();

            $all_filters = array();
            if($this->hasFilters)
                $all_filters = $this->get_all_filters();

            $all_attributes = $this->get_all_attributes();
            $all_stores = $this->model_setting_store->getStores();
            $all_downloads = $this->get_all_downloads();


            //Create news categories
                $this->create_categories($xls_data, $pattern, $all_categories, $all_stores);

            //Create news manufacturers
                $this->create_manufacturers($xls_data, $pattern, $all_manufacturers, $all_stores);

            //Create news options
                $this->create_options($xls_data, $pattern, $all_options);
                $all_options = $this->get_all_options();

            //Create news attributes
                $this->create_attributes($xls_data, $pattern, $all_attributes);

            //Create news filters
                if($this->hasFilters)
                    $this->create_filters($xls_data, $pattern, $all_filters);

            //Create news downloads
                $this->create_downloads($xls_data, $pattern, $all_downloads);

            //Format products
                $data = array(
                    'status' => 'progress_import_formatting_products',
                );
                $this->update_process($data);

                $products = $this->format_products($xls_data, $pattern);
                $prod_number = count($products);
                $data = array(
                    'message' => sprintf($this->language->get('progress_import_formatting_products_to_import'), $prod_number)
                );
                $this->update_process($data);
            //Option boost?
                $option_boost = $this->db->query("SHOW COLUMNS FROM `" . DB_PREFIX . "product_option_value` LIKE 'ob_image'");
                $option_boost_installed = !empty($option_boost->row) ? true : false;

            //Import products
                $elements_deleted = 0;
                $elements_modified = 0;
                $elements_created = 0;
                $elements_processed = 0;
                $elements_processed = 0;

                $data = array(
                    'message' => sprintf($this->language->get('progress_import_products_completed'), $elements_processed, $prod_number)
                );
                $this->update_process($data);
                foreach ($products as $key => $pro) {
                    if($pro['deleted'] && !empty($pro['editting'])) {
                        $this->model_catalog_product->deleteProduct($pro['editting']);
                        $elements_deleted++;
                    }
                    elseif($pro['editting']) {
                        $result = $this->db->query('SELECT product_id FROM `' . DB_PREFIX . 'product` WHERE product_id='.$pro['editting']);
                        if(!$result->num_rows)
                            throw new Exception (sprintf($this->language->get('error_product_id_doesnt_exist'), $pro['editting']));
                        $this->editProduct($pro['editting'], $pro, $option_boost_installed, $all_options);
                        $elements_modified++;
                    }
                    else
                    {
                        if($pro['product_discount'] == 'NO DISCOUNTS')
                            unset($pro['product_discount']);
                        if($pro['product_special'] == 'NO SPECIALS')
                            unset($pro['product_special']);

                        foreach ($pro['product_description'] as $lang_id => $values) {
                            foreach ($values as $val_name => $val) {
                                if($val == 'NOT FOUND')
                                    $pro['product_description'][$lang_id][$val_name] = '';
                            }
                        }

                        $this->model_catalog_product->addProduct($pro);
                        $elements_created++;
                    }
                    $elements_processed++;

                    $data = array(
                        'message' => sprintf($this->language->get('progress_import_products_completed'), $elements_processed, $prod_number)
                    );
                    $this->update_process($data, true);
                }
            //Devman Extensions - info@devmanextensions.com - 2016-12-29 14:56:11 - Related products
                $data = array(
                    'status' => 'progress_import_processing_related_products',
                );
                $this->update_process($data);

                foreach ($products as $key => $pro) {
                    if(!empty($pro['editting']))
                        $product_id = $pro['editting'];
                    else
                        $product_id = $this->get_product_id_by_model($pro['model']);

                    if($this->config->get('import_xls_strict_edit'))
                        $this->db->query("DELETE FROM `" . DB_PREFIX . "product_related` WHERE product_id = ".(int)$product_id);

                    if(!empty($pro['related']))
                    {
                        $final_related = array();

                        if(!empty($product_id))
                        {
                            $models_related = explode(',', $pro['related']);
                            foreach ($models_related as $key => $model) {
                                $related_id = $this->get_product_id_by_model($model);
                                if(!empty($related_id))
                                    $final_related[] = $related_id;
                            }
                        }

                        if(!empty($final_related))
                        {
                            foreach ($final_related as $key => $related_id) {
                                $insert_related = true;
                                if(!$this->config->get('import_xls_strict_edit'))
                                {
                                    $result = $this->db->query("SELECT * FROM `" . DB_PREFIX . "product_related` WHERE product_id = ".(int)$product_id." AND related_id = ".$related_id);
                                    $insert_related = empty($result->row['product_id']);
                                }

                                if($insert_related)
                                    $this->db->query("INSERT INTO " . DB_PREFIX . "product_related SET product_id = " . (int)$product_id . ", related_id = ".$related_id);
                            }
                        }
                    }
                }
            //END
            $result = array(
                'elements_deleted' => $elements_deleted,
                'elements_modified' => $elements_modified,
                'elements_created' => $elements_created,
            );

            return $result;
        }
	    function format_products($xls_data, $pattern) {
			$all_categories = $this->get_all_categories();
			$all_manufacturers = $this->get_all_manufacturers();
			$all_options = $this->get_all_options();

			$all_downloads = $this->get_all_downloads();

			$import_xls_strict_edit = $this->config->get('import_xls_strict_edit');

			$all_filters = array();
			if($this->hasFilters)
				$all_filters = $this->get_all_filters();

			$all_attributes = $this->get_all_attributes();
			$all_stores = $this->model_setting_store->getStores();
			$all_customer_groups = $this->getCustomerGroups();
			$stock_statuses = $this->get_stock_statuses();
			$stock_statuses = array_values($stock_statuses);
			$prods_by_model = array();

			$column_model = $this->language->get('Model');
			$column_name = 'Name'.($this->count_languages > 1 ? ' '.$this->default_language_code : '');

			if($this->allow_options)
			{
				foreach ($xls_data['data'] as $key => $data) {
					$index_model = $pattern[$column_model]['index'];
					if(!isset($prods_by_model[$data[$index_model]]))
						$prods_by_model[$data[$index_model]] = array();

					$prods_by_model[$data[$index_model]][] = $data;
				}
			}
			else
				$prods_by_model = $xls_data['data'];

			$final_products = array();

			foreach ($prods_by_model as $product_model => $products) {
				$count_products = 0;
				$temp = array();
				$quantity = 0;
				$final_options = array();

				if(!$this->allow_options)
				{
					$temp_products = array();
					$temp_products[] = $products;
					$products = $temp_products;
				}

				foreach ($products as $key => $pro) {
					if($count_products == 0)
					{
						//Check product exists
                            $index_product_id = array_key_exists($this->language->get('Product ID'), $pattern) && $pattern[$this->language->get('Product ID')]['created'] ? $pattern[$this->language->get('Product ID')]['index'] : '';
                            $product_id = array_key_exists($index_product_id, $pro) && !empty($pro[$index_product_id]) ? $pro[$index_product_id] : '';

                            $index_product_model = array_key_exists($this->language->get('Model'), $pattern) && $pattern[$this->language->get('Model')]['created'] ? $pattern[$this->language->get('Model')]['index'] : '';
                            $product_model = array_key_exists($index_product_model, $pro) && !empty($pro[$index_product_model]) ? $pro[$index_product_model] : '';

							$editting = empty($product_id) ? $this->get_product_id_by_model($product_model) : $product_id;

							if(!empty($editting) && !is_numeric($editting)) {
							     throw new Exception(sprintf($this->language->get('ajax_importing_error_product_id_no_numeric'), $editting));
                            }
						//END Check product exists

						//Default values 0 or 1
							$subtract = !empty($pattern[$this->language->get('Subtract')]['index']) && isset($pro[$pattern[$this->language->get('Subtract')]['index']]) ? $pro[$pattern[$this->language->get('Subtract')]['index']] : 1;

							$requires_shipping = !empty($pattern[$this->language->get('Requires shipping')]['index']) && isset($pro[$pattern[$this->language->get('Requires shipping')]['index']]) ? $pro[$pattern[$this->language->get('Requires shipping')]['index']] : 1;

							$status = !empty($pattern[$this->language->get('Status')]['index']) && isset($pro[$pattern[$this->language->get('Status')]['index']]) ? $pro[$pattern[$this->language->get('Status')]['index']] : 1;
						//END Default values 0 or 1

						$quantity_is_filled = !empty($pattern[$this->language->get('Quantity')]['index']) && is_numeric($pro[$pattern[$this->language->get('Quantity')]['index']]);
						$name_to_empty_seo = array_key_exists($column_name, $pattern) && !empty($pro[$pattern[$column_name]['index']]) ? $pro[$pattern[$column_name]['index']] : '';

						$temp = array(
							'editting' => $editting,
							'product_description' => array(),
							'model' => $pro[$pattern[$this->language->get('Model')]['index']],
							'sku' => !empty($pattern[$this->language->get('SKU')]['index']) && !empty($pro[$pattern[$this->language->get('SKU')]['index']]) ? $pro[$pattern[$this->language->get('SKU')]['index']] : '',
							'upc' => !empty($pattern[$this->language->get('UPC')]['index']) && !empty($pro[$pattern[$this->language->get('UPC')]['index']]) ? $pro[$pattern[$this->language->get('UPC')]['index']] : '',
							'ean' => !empty($pattern[$this->language->get('EAN')]['index']) && !empty($pro[$pattern[$this->language->get('EAN')]['index']]) ? $pro[$pattern[$this->language->get('EAN')]['index']] : '',
							'jan' => !empty($pattern[$this->language->get('JAN')]['index']) && !empty($pro[$pattern[$this->language->get('JAN')]['index']]) ? $pro[$pattern[$this->language->get('JAN')]['index']] : '',
							'isbn' => !empty($pattern[$this->language->get('ISBN')]['index']) && !empty($pro[$pattern[$this->language->get('ISBN')]['index']]) ? $pro[$pattern[$this->language->get('ISBN')]['index']] : '',
							'mpn' => !empty($pattern[$this->language->get('MPN')]['index']) && !empty($pro[$pattern[$this->language->get('MPN')]['index']]) ? $pro[$pattern[$this->language->get('MPN')]['index']] : '',
							'subtract' => $subtract,
							'location' => !empty($pattern[$this->language->get('Location')]['index']) && !empty($pro[$pattern[$this->language->get('Location')]['index']]) ? $pro[$pattern[$this->language->get('Location')]['index']] : '',
							'price' => !empty($pattern[$this->language->get('Price')]['index']) && !empty($pro[$pattern[$this->language->get('Price')]['index']]) ? $pro[$pattern[$this->language->get('Price')]['index']] : '',
							'tax_class_id' => !empty($pattern[$this->language->get('Tax class')]['index']) && !empty($pro[$pattern[$this->language->get('Tax class')]['index']]) ? $pro[$pattern[$this->language->get('Tax class')]['index']] : 0,
							'quantity' => !empty($pattern[$this->language->get('Quantity')]['index']) && !empty($pro[$pattern[$this->language->get('Quantity')]['index']]) ? $pro[$pattern[$this->language->get('Quantity')]['index']] : 0,
							'minimum' => !empty($pattern[$this->language->get('Minimum')]['index']) && !empty($pro[$pattern[$this->language->get('Minimum')]['index']]) ? $pro[$pattern[$this->language->get('Minimum')]['index']] : 1,
							'stock_status_id' => !empty($pattern[$this->language->get('Out stock status')]['index']) && !empty($pro[$pattern[$this->language->get('Out stock status')]['index']]) ? $pro[$pattern[$this->language->get('Out stock status')]['index']] : $stock_statuses[0]['stock_status_id'],
							'shipping' => $requires_shipping,
							'keyword' => !empty($pattern[$this->language->get('SEO url')]['index']) && !empty($pro[$pattern[$this->language->get('SEO url')]['index']]) ? $pro[$pattern[$this->language->get('SEO url')]['index']] : '',
							'image' => !empty($pattern[$this->language->get('Main image')]['index']) && !empty($pro[$pattern[$this->language->get('Main image')]['index']]) ? $pro[$pattern[$this->language->get('Main image')]['index']] : $pro[$pattern[$this->language->get('Model')]['index']].'.jpg',
							'date_available' => !empty($pattern[$this->language->get('Date available')]['index']) && !empty($pro[$pattern[$this->language->get('Date available')]['index']]) ? date('Y-m-d', strtotime(str_replace('/', '-', $pro[$pattern[$this->language->get('Date available')]['index']]))) : date('Y-m-d'),
							'length' => !empty($pattern[$this->language->get('Length')]['index']) && !empty($pro[$pattern[$this->language->get('Length')]['index']]) ? $pro[$pattern[$this->language->get('Length')]['index']] : '',
							'width' => !empty($pattern[$this->language->get('Width')]['index']) && !empty($pro[$pattern[$this->language->get('Width')]['index']]) ? $pro[$pattern[$this->language->get('Width')]['index']] : '',
							'height' => !empty($pattern[$this->language->get('Height')]['index']) && !empty($pro[$pattern[$this->language->get('Height')]['index']]) ? $pro[$pattern[$this->language->get('Height')]['index']] : '',
							'weight' => !empty($pattern[$this->language->get('Weight')]['index']) && !empty($pro[$pattern[$this->language->get('Weight')]['index']]) ? $pro[$pattern[$this->language->get('Weight')]['index']] : '',
							'length_class_id' => !empty($pattern[$this->language->get('Class length')]['index']) && !empty($pro[$pattern[$this->language->get('Class length')]['index']]) ? $pro[$pattern[$this->language->get('Class length')]['index']] : $this->config->get('config_length_class_id'),
							'weight_class_id' => !empty($pattern[$this->language->get('Class weight')]['index']) && !empty($pro[$pattern[$this->language->get('Class weight')]['index']]) ? $pro[$pattern[$this->language->get('Class weight')]['index']] : $this->config->get('config_weight_class_id'),
							'status' => $status,
							'sort_order' => !empty($pattern[$this->language->get('Sort order')]['index']) && !empty($pro[$pattern[$this->language->get('Sort order')]['index']]) ? $pro[$pattern[$this->language->get('Sort order')]['index']] : 0,
							'manufacturer_id' => !empty($pattern[$this->language->get('Manufacturer')]['index']) && !empty($pro[$pattern[$this->language->get('Manufacturer')]['index']]) ? $all_manufacturers[$pro[$pattern[$this->language->get('Manufacturer')]['index']]] : 0,
							'product_category' => array(),
							'product_filter' => array(),
							'product_store' => !empty($pattern[$this->language->get('Store')]['index']) && !empty($pro[$pattern[$this->language->get('Store')]['index']]) ? explode('|', $pro[$pattern[$this->language->get('Store')]['index']]) : array(0),
							'product_download' => array(),
							'related' => '',
							'option' => '',
							'points' => !empty($pattern[$this->language->get('Points')]['index']) && !empty($pro[$pattern[$this->language->get('Points')]['index']]) ? $pro[$pattern[$this->language->get('Points')]['index']] : 0,
							'product_reward' => array(),
							'product_attribute' => array(),
							'product_layout' => array(),
							'product_image' => array(),
							'product_special' => 'NO SPECIALS',
							'product_discount' => 'NO DISCOUNTS',
							'deleted' => !empty($pattern[$this->language->get('Deleted')]['index']) && !empty($pro[$pattern[$this->language->get('Deleted')]['index']]) ? 1 : 0,
						);

						//Devman Extensions - info@devmanextensions.com - 2017-07-04 19:09:26 - Opencart 3.x seo url multilanguage and multistore compatibility
							if($this->is_oc_3x)
							{
								$base_seo_url = array();

								foreach ($this->stores_import_format as $store) {
									$store_id = $store['store_id'];

									foreach ($this->languages as $key => $lang) {
										$language_code = $lang['code'];
										$language_id = $lang['language_id'];

										if($this->count_languages > 1 && $this->stores_count > 1)
											$index_seo_url = !empty($pattern[$this->language->get('SEO url').' '.$store_id.' '.$language_code]['index']) ? $pattern[$this->language->get('SEO url').' '.$store_id.' '.$language_code]['index'] : '';
										elseif($this->count_languages == 1 && $this->stores_count > 1)
											$index_seo_url = !empty($pattern[$this->language->get('SEO url').' '.$store_id]['index']) ? $pattern[$this->language->get('SEO url').' '.$store_id]['index'] : '';
										elseif($this->count_languages > 1 && $this->stores_count == 1)
											$index_seo_url = !empty($pattern[$this->language->get('SEO url').' '.$language_code]['index']) ? $pattern[$this->language->get('SEO url').' '.$language_code]['index'] : '';
                                        elseif($this->count_languages == 1 && $this->stores_count == 1)
                                            $index_seo_url = !empty($pattern[$this->language->get('SEO url')]['index']) ? $pattern[$this->language->get('SEO url')]['index'] : '';

										$seo_url = !empty($index_seo_url) ? $pro[$index_seo_url] : '';

										$base_seo_url[$store_id][$language_id] = $seo_url;
									}
								}

								$temp['product_seo_url'] = $base_seo_url;
							}
						//END

						//Add extra product fields here

						//If editting unset all index that hasn't columns
							if(!$import_xls_strict_edit && $editting)
							{
								if(!isset($pattern[$this->language->get('SKU')]['created'])) unset($temp['sku']);
								if(!isset($pattern[$this->language->get('UPC')]['created'])) unset($temp['upc']);
								if(!isset($pattern[$this->language->get('EAN')]['created'])) unset($temp['ean']);
								if(!isset($pattern[$this->language->get('JAN')]['created'])) unset($temp['jan']);
								if(!isset($pattern[$this->language->get('ISBN')]['created'])) unset($temp['isbn']);
								if(!isset($pattern[$this->language->get('MPN')]['created'])) unset($temp['mpn']);
								if(!isset($pattern[$this->language->get('Subtract')]['created'])) unset($temp['subtract']);
								if(!isset($pattern[$this->language->get('Location')]['created'])) unset($temp['location']);
								if(!isset($pattern[$this->language->get('Price')]['created'])) unset($temp['price']);
								if(!isset($pattern[$this->language->get('Tax class')]['created'])) unset($temp['tax_class_id']);
								if(!isset($pattern[$this->language->get('Quantity')]['created'])) unset($temp['quantity']);
								if(!isset($pattern[$this->language->get('Minimum')]['created'])) unset($temp['minimum']);
								if(!isset($pattern[$this->language->get('Out stock status')]['created'])) unset($temp['stock_status_id']);
								if(!isset($pattern[$this->language->get('Requires shipping')]['created'])) unset($temp['shipping']);
								if(!isset($pattern[$this->language->get('SEO url')]['created'])) unset($temp['keyword']);
								if(!isset($pattern[$this->language->get('Main image')]['created'])) unset($temp['image']);
								if(!isset($pattern[$this->language->get('Date available')]['created'])) unset($temp['date_available']);
								if(!isset($pattern[$this->language->get('Length')]['created'])) unset($temp['length']);
								if(!isset($pattern[$this->language->get('Width')]['created'])) unset($temp['width']);
								if(!isset($pattern[$this->language->get('Height')]['created'])) unset($temp['height']);
								if(!isset($pattern[$this->language->get('Weight')]['created'])) unset($temp['weight']);
								if(!isset($pattern[$this->language->get('Class length')]['created'])) unset($temp['length_class_id']);
								if(!isset($pattern[$this->language->get('Class weight')]['created'])) unset($temp['weight_class_id']);
								if(!isset($pattern[$this->language->get('Status')]['created'])) unset($temp['status']);
								if(!isset($pattern[$this->language->get('Sort order')]['created'])) unset($temp['sort_order']);
								if(!isset($pattern[$this->language->get('Manufacturer')]['created'])) unset($temp['manufacturer_id']);
								if(!isset($pattern[$this->language->get('Store')]['created'])) unset($temp['product_store']);
								if(!isset($pattern[$this->language->get('Points')]['created'])) unset($temp['points']);
							}
						//END If editting unset all index that hasn't columns

						//Fix to values 0/empty
							$indexs = array();

						//Save this variables to options
							$first_price = !empty($temp['price']) ? $temp['price'] : 0;
							$first_points = !empty($temp['points']) ? $temp['points'] : 0;
							$first_weight = !empty($temp['weight']) ? $temp['weight'] : 0;

						//Categories
							if(!$this->config->get('import_xls_categories_tree'))
							{
								foreach ($this->array_category_columns_name as $col_name) {
									if($this->count_languages > 1)
									{
										foreach ($col_name as $cols_name_lang) {
											foreach ($cols_name_lang as $lang_code => $col_name_lang) {
												$final_column_name = $col_name_lang.' '.$lang_code;

												$cat_name = array_key_exists($final_column_name, $pattern) && array_key_exists($pattern[$final_column_name]['index'], $pro) ? $pro[$pattern[$final_column_name]['index']] : '';
												if(!empty($cat_name) && array_key_exists($cat_name, $all_categories))
												{
													$temp['product_category'][] = $all_categories[html_entity_decode($cat_name)];
													break;
												}
											}
										}
										$temp['product_category'] = array_unique($temp['product_category']);
									}
									else
									{
										if(!empty($pattern[$col_name]['index']) && !empty($pro[$pattern[$col_name]['index']])) {
                                            $index_cat = html_entity_decode($pro[$pattern[$col_name]['index']]);
                                            $temp['product_category'][] = $all_categories[$index_cat];
                                        }
									}
								}
							}
							else
							{
								$count_temp = 0;
								for ($i=1; $i <= $this->cattren ; $i++) {
									$col_name = $this->array_category_columns_name[$count_temp];

									if($this->count_languages > 1)
									{
										$col_name_array = $col_name;
										foreach ($col_name as $key => $languages_col) {
											foreach ($languages_col as $lang_code_temp => $col_name_temp) {
												$final_col_name = $col_name_temp.' '.$lang_code_temp;
												if(!empty($pattern[$final_col_name]['index']) && !empty($pro[$pattern[$final_col_name]['index']]))
												{
													$col_name = $final_col_name;
													break;
												}
											}
										}
										if(is_array($col_name))
											$col_name = '';
									}

									$count_temp++;
									$last_cat_id = '';
									$last_child_tree = $this->config->get('import_xls_categories_last_tree');

									if(!empty($col_name) && !empty($pattern[$col_name]['index']) && !empty($pro[$pattern[$col_name]['index']]))
									{
										$parent_name = $pro[$pattern[$col_name]['index']];

										if($this->count_languages > 1)
										{
											$temp_name = array();

											foreach ($col_name_array as $col_name_lang) {
												foreach ($col_name_lang as $lang_code => $col_name_lng) {
													$col_name_lng .= ' '.$lang_code;
													$temp_name[$lang_code] = array_key_exists($col_name_lng, $pattern) && array_key_exists($pattern[$col_name_lng]['index'], $pro) ? $pro[$pattern[$col_name_lng]['index']] : '';
												}
											}
											$parent_name = $temp_name;
										}

										$parent_tree = $this->get_category_parent_tree($all_categories, $parent_name);

										if(!$last_child_tree)
											$temp['product_category'][] = $parent_tree['category_id'];
										else
											$last_cat_id = $parent_tree['category_id'];

					                    for ($j=1; $j <= $this->cattrechin ; $j++) {
					                    	$col_name = $this->array_category_columns_name[$count_temp];

					                    	if($this->count_languages > 1)
											{
												$col_name_array = $col_name;
												foreach ($col_name as $key => $languages_col) {
													foreach ($languages_col as $lang_code_temp => $col_name_temp) {
														$final_col_name = $col_name_temp.' '.$lang_code_temp;
														if(!empty($pattern[$final_col_name]['index']) && !empty($pro[$pattern[$final_col_name]['index']]))
														{
															$col_name = $final_col_name;
															break;
														}
													}
												}

												if(is_array($col_name))
													$col_name = '';
											}

											$count_temp++;

											if(!empty($col_name) && !empty($pattern[$col_name]) && array_key_exists($pattern[$col_name]['index'], $pro))
											{
						                        $parent_name = $pro[$pattern[$col_name]['index']];

						                        if($this->count_languages > 1)
												{
													$temp_name = array();

													foreach ($col_name_array as $col_name_lang) {
														foreach ($col_name_lang as $lang_code => $col_name_lng) {
															$col_name_lng .= ' '.$lang_code;
															$temp_name[$lang_code] = array_key_exists($col_name_lng, $pattern) && array_key_exists($pattern[$col_name_lng]['index'], $pro) ? $pro[$pattern[$col_name_lng]['index']] : '';
														}
													}
													$parent_name = $temp_name;
												}

												$parent_tree = $this->get_category_parent_tree($parent_tree['childrens'] ? $parent_tree['childrens'] : array(), $parent_name);

												if(!empty($parent_tree['category_id']))
												{
													if(!$last_child_tree)
														$temp['product_category'][] = $parent_tree['category_id'];
													else
														$last_cat_id = $parent_tree['category_id'];
												}
											}
					                    }

					                    if($last_child_tree)
					                    	$temp['product_category'][] = $last_cat_id;
					                }
					                else
					                	$count_temp += $this->cattrechin;
				                }
							}
							$temp['product_category'] = array_unique($temp['product_category']);
						//Descriptions
							foreach ($this->languages as $key => $lng) {
								if($this->count_languages > 1)
								{
									$language_code = isset($pattern[$this->language->get('Name').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$name = !empty($pattern[$this->language->get('Name').' '.$language_code]) && !empty($pro[$pattern[$this->language->get('Name').' '.$language_code]['index']]) ? $pro[$pattern[$this->language->get('Name').' '.$language_code]['index']] : 'NOT FOUND';

									$language_code = isset($pattern[$this->language->get('Description').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$description = !empty($pattern[$this->language->get('Description').' '.$language_code]) && !empty($pro[$pattern[$this->language->get('Description').' '.$language_code]['index']]) ? $pro[$pattern[$this->language->get('Description').' '.$language_code]['index']] : 'NOT FOUND';

									$language_code = isset($pattern[$this->language->get('Meta description').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$meta_description = !empty($pattern[$this->language->get('Meta description').' '.$language_code]) && !empty($pro[$pattern[$this->language->get('Meta description').' '.$language_code]['index']]) ? $pro[$pattern[$this->language->get('Meta description').' '.$language_code]['index']] : 'NOT FOUND';

									$language_code = isset($pattern[$this->language->get('Meta title').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$meta_title = !empty($pattern[$this->language->get('Meta title').' '.$language_code]) && !empty($pro[$pattern[$this->language->get('Meta title').' '.$language_code]['index']]) ? $pro[$pattern[$this->language->get('Meta title').' '.$language_code]['index']] : 'NOT FOUND';

									$language_code = isset($pattern[$this->language->get('Meta keywords').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$meta_keyword = !empty($pattern[$this->language->get('Meta keywords').' '.$language_code]) && !empty($pro[$pattern[$this->language->get('Meta keywords').' '.$language_code]['index']]) ? $pro[$pattern[$this->language->get('Meta keywords').' '.$language_code]['index']] : 'NOT FOUND';

									$language_code = isset($pattern[$this->language->get('Tags').' '.$lng['code']]) ? $lng['code'] : $this->default_language_code;
									$tags = !empty($pattern['Tags'.' '.$language_code]) && !empty($pro[$pattern['Tags'.' '.$language_code]['index']]) ? $pro[$pattern['Tags'.' '.$language_code]['index']] : 'NOT FOUND';
								}
								else
								{
									$name = !empty($pattern[$this->language->get('Name')]) && !empty($pro[$pattern[$this->language->get('Name')]['index']]) ? $pro[$pattern[$this->language->get('Name')]['index']] : 'NOT FOUND';

									$description = !empty($pattern[$this->language->get('Description')]) && !empty($pro[$pattern[$this->language->get('Description')]['index']]) ? $pro[$pattern[$this->language->get('Description')]['index']] : 'NOT FOUND';

									$meta_description = !empty($pattern[$this->language->get('Meta description')]) && !empty($pro[$pattern[$this->language->get('Meta description')]['index']]) ? $pro[$pattern[$this->language->get('Meta description')]['index']] : 'NOT FOUND';

									$meta_title = !empty($pattern[$this->language->get('Meta title')]['index']) && !empty($pro[$pattern[$this->language->get('Meta title')]['index']]) ? $pro[$pattern[$this->language->get('Meta title')]['index']] : 'NOT FOUND';

									$meta_keyword = !empty($pattern[$this->language->get('Meta keywords')]['index']) && !empty($pro[$pattern[$this->language->get('Meta keywords')]['index']]) ? $pro[$pattern[$this->language->get('Meta keywords')]['index']] : 'NOT FOUND';

									$tags = !empty($pattern['Tags']) && !empty($pro[$pattern['Tags']['index']]) ? $pro[$pattern['Tags']['index']] : 'NOT FOUND';
								}
								$temp['product_description'][$lng['language_id']] = array(
									'name' => htmlspecialchars($name),
				                    'meta_description' => htmlspecialchars($meta_description),
				                    'meta_title' => htmlspecialchars($meta_title),
				                    'meta_keyword' => htmlspecialchars($meta_keyword),
				                    'description' => htmlspecialchars($description),
				                    'tag' => htmlspecialchars($tags),
								);
							}

						//Filters
							for ($i=1; $i <= $this->filgron; $i++) {
								$index_filter_group = !empty($pattern[$this->language->get('Filter Group').' '.$i]['index']) ? $pattern[$this->language->get('Filter Group').' '.$i]['index'] : '';
								if(!empty($index_filter_group) && !empty($pro[$index_filter_group]))
								{
									for ($j=1; $j <= $this->filgrofiln; $j++) {
										$index_filter = !empty($pattern[$this->language->get('Filter Gr.').$i.' '.$this->language->get('filter').' '.$j]['index']) ? $pattern[$this->language->get('Filter Gr.').$i.' '.$this->language->get('filter').' '.$j]['index'] : '';
										if(!empty($index_filter) && !empty($pro[$index_filter]))
										{
											$index_filter_group_final = html_entity_decode($pro[$index_filter_group]);
											$index_filter_final = html_entity_decode($pro[$index_filter]);
											$temp['product_filter'][] = $all_filters[$index_filter_group_final]['filters'][$index_filter_final];
										}
									}
								}
							}

						//Layouts
							if(!empty($pattern[$this->language->get('Layout')]['index']) && !empty($pro[$pattern[$this->language->get('Layout')]['index']]))
							{
								$temp['product_layout'][0] = $pro[$pattern[$this->language->get('Layout')]['index']];
								foreach ($all_stores as $key => $store) {
									$temp['product_layout'][$store['store_id']] = $pro[$pattern[$this->language->get('Layout')]['index']];
								}
							}

						//Reward points
							foreach ($all_customer_groups as $key => $cg) {
								$points = 0;

								if(!empty($pattern[$this->language->get('Points').' '.$cg['name']]['index']))
									$points = !empty($pro[$pattern[$this->language->get('Points').' '.$cg['name']]['index']]) ? $pro[$pattern[$this->language->get('Points').' '.$cg['name']]['index']] : 0;

								$temp['product_reward'][$cg['customer_group_id']]['points'] = $points;
							}

							//if($editting && !isset($pattern[$this->language->get('Points')]['created'])) unset($temp['product_reward']);

						//Images
							for ($i=2; $i <= $this->extimgn; $i++) {
								if(!empty($pattern[$this->language->get('Image').' '.$i]['index']) && !empty($pro[$pattern[$this->language->get('Image').' '.$i]['index']]))
								{
									$temp['product_image'][] = array(
										'image' => $pro[$pattern[$this->language->get('Image').' '.$i]['index']],
										'sort_order' => $i-2
									);
								}
							}

						//Devman Extensions - info@devmanextensions.com - 2016-12-29 14:52:51 - Products related
							if(!empty($pattern[$this->language->get('Products related')]['index']) && !empty($pro[$pattern[$this->language->get('Products related')]['index']]))
								$temp['related'] = $pro[$pattern[$this->language->get('Products related')]['index']];
						//Special
                            foreach ($this->customer_groups as $id => $cg) {
                                for ($i=1; $i <= $this->spen; $i++) {
                                    $index_price = $this->get_index($pattern, $this->language->get('Spe. ') . $i . $this->language->get(' Price') . ' ' . $cg['name']);
                                    if(is_numeric($index_price) && !empty($pro[$index_price])) {
                                        $index_priority = $this->get_index($pattern, $this->language->get('Spe. ') . $i . $this->language->get(' Priority') . ' ' . $cg['name']);
                                        $index_date_start = $this->get_index($pattern, $this->language->get('Spe. ') . $i . $this->language->get(' Date start') . ' ' . $cg['name']);
                                        $index_date_end = $this->get_index($pattern, $this->language->get('Spe. ') . $i . $this->language->get(' Date end') . ' ' . $cg['name']);

                                        if(!is_array($temp['product_special']))
                                            $temp['product_special'] = array();

                                        $temp['product_special'][] = array(
                                            'customer_group_id' => $this->customer_groups_format_import[$cg['name']],
                                            'price' => $pro[$index_price],
                                            'priority' => is_numeric($index_priority) && !empty($pro[$index_priority]) ? $pro[$index_priority] : 0,
                                            'date_start' => is_numeric($index_date_start) && !empty($pro[$index_date_start]) ? date('Y-m-d', strtotime(str_replace('/', '-', $pro[$index_date_start]))) : '',
                                            'date_end' => is_numeric($index_date_end) && !empty($pro[$index_date_end]) ? date('Y-m-d', strtotime(str_replace('/', '-', $pro[$index_date_end]))) : '',
                                        );
                                    }
                                }
                            }

						//Discount
                            foreach ($this->customer_groups as $id => $cg) {
                                for ($i=1; $i <= $this->disn; $i++) {
                                    $index_price = $this->get_index($pattern, $this->language->get('Dis. ') . $i . $this->language->get(' Price') . ' ' . $cg['name']);
                                    if(is_numeric($index_price) && !empty($pro[$index_price])) {
                                        $index_quantity = $this->get_index($pattern, $this->language->get('Dis. ') . $i . $this->language->get(' Quantity') . ' ' . $cg['name']);
                                        $index_priority = $this->get_index($pattern, $this->language->get('Dis. ') . $i . $this->language->get(' Priority') . ' ' . $cg['name']);
                                        $index_date_start = $this->get_index($pattern, $this->language->get('Dis. ') . $i . $this->language->get(' Date start') . ' ' . $cg['name']);
                                        $index_date_end = $this->get_index($pattern, $this->language->get('Dis. ') . $i . $this->language->get(' Date end') . ' ' . $cg['name']);

                                        if(!is_array($temp['product_discount']))
                                            $temp['product_discount'] = array();

                                        $temp['product_discount'][] = array(
                                            'customer_group_id' => $this->customer_groups_format_import[$cg['name']],
                                            'price' => $pro[$index_price],
                                            'quantity' => is_numeric($index_quantity) && !empty($pro[$index_quantity]) ? $pro[$index_quantity] : 1,
                                            'priority' => is_numeric($index_priority) && !empty($pro[$index_priority]) ? $pro[$index_priority] : 0,
                                            'date_start' => is_numeric($index_date_start) && !empty($pro[$index_date_start]) ? date('Y-m-d', strtotime(str_replace('/', '-', $pro[$index_date_start]))) : '',
                                            'date_end' => is_numeric($index_date_end) && !empty($pro[$index_date_end]) ? date('Y-m-d', strtotime(str_replace('/', '-', $pro[$index_date_end]))) : '',
                                        );
                                    }
                                }
                            }

						//Attributes
							for ($i=1; $i <= $this->attn; $i++) {

								if($this->count_languages == 1)
								{
									$attr_group_index = $this->language->get('Attr. Group').' '.$i;
									$attr_index = $this->language->get('Attribute').' '.$i;
									$attr_value_index = $this->language->get('Attribute value').' '.$i;
								}
								else
								{
									$attr_group_index = $this->language->get('Attr. Group').' '.$i.' '.$this->default_language_code;
									$attr_index = $this->language->get('Attribute').' '.$i.' '.$this->default_language_code;
									$attr_value_index = $this->language->get('Attribute value').' '.$i.' '.$this->default_language_code;
								}

								if(
									!empty($pattern[$attr_group_index]['index']) && !empty($pro[$pattern[$attr_group_index]['index']])
									&&
									!empty($pattern[$attr_index]['index']) && !empty($pro[$pattern[$attr_index]['index']])
									&&
									!empty($pattern[$attr_value_index]['index']) && !empty($pro[$pattern[$attr_value_index]['index']])
								)
								{
									$attribute_name = !empty($pro[$pattern[$attr_index]['index']]) ? $pro[$pattern[$attr_index]['index']] : '';
									$attribute_id = $all_attributes[$pro[$pattern[$attr_group_index]['index']]]['attributes'][$pro[$pattern[$attr_index]['index']]];
									$attribute_description = array();

									foreach ($this->languages as $key => $lng) {
										if($this->count_languages > 1)
											$attr_value_index = $this->language->get('Attribute value').' '.$i." ".$lng['code'];

										$attribute_description[$lng['language_id']] = array(
											'text' => !empty($pattern[$attr_value_index]['index']) && !empty($pro[$pattern[$attr_value_index]['index']]) ? $pro[$pattern[$attr_value_index]['index']] : '',
										);
									}

									$temp['product_attribute'][] = array(
										'name' => $attribute_name,
										'attribute_id' => $attribute_id,
										'product_attribute_description' => $attribute_description
									);
								}
							}

						//Downloads
							foreach ($this->languages as $key => $lng) {
								for ($i=1; $i <= $this->down ; $i++) {

									$name_column = $this->language->get('Download name').' '.$i.($this->count_languages > 1 ? ' '.$lng['code'] : '');
									$language_code = isset($pattern[$name_column]) ? $lng['code'] : $this->default_language_code;
									$download_name = !empty($pattern[$name_column]) && !empty($pro[$pattern[$name_column]['index']]) ? $pro[$pattern[$name_column]['index']] : '';
									$download_id = !empty($all_downloads[$download_name]) ? $all_downloads[$download_name] : '';
									if(!empty($download_id))
										$temp['product_download'][] = $download_id;

								}
							}
					}

					//Options
						if($count_products != 0)
							$quantity += !empty($pattern[$this->language->get('Quantity')]['index']) && is_numeric($pro[$pattern[$this->language->get('Quantity')]['index']]) ? $pro[$pattern[$this->language->get('Quantity')]['index']] : 1;

						$column_option = $this->language->get('Option').($this->count_languages > 1 ? ' '.$this->default_language_code : '');
						$column_option_value = $this->language->get('Option value').($this->count_languages > 1 ? ' '.$this->default_language_code : '');

						$index_option = !empty($pattern[$column_option]['index']) ? $pattern[$column_option]['index'] : '';
						$option_type = !empty($pattern[$this->language->get('Option type')]['index']) && !empty($pro[$pattern[$this->language->get('Option type')]['index']]) ? $pro[$pattern[$this->language->get('Option type')]['index']] : 'select';
						$index_option_value = !empty($pattern[$column_option_value]['index']) ? $pattern[$column_option_value]['index'] : '';

						$is_option_without_option_value = in_array($option_type, array('text', 'textarea', 'date', 'datetime', 'file'));

						if(
							!empty($index_option) && !empty($index_option_value) &&
							!empty($pro[$index_option]) && (!empty($pro[$index_option_value]) || $is_option_without_option_value)
						)
						{
							//Calc price
								$current_price = !empty($pattern[$this->language->get('Price')]['index']) && !empty($pro[$pattern[$this->language->get('Price')]['index']]) ? $pro[$pattern[$this->language->get('Price')]['index']] : 0;

								if(!empty($pattern['Option price prefix']['index']) && !empty($pro[$pattern['Option price prefix']['index']]))
								{
									$price_symbol = $pro[$pattern[$this->language->get('Option price prefix')]['index']];
									$price_symbol = str_replace('~', '', $price_symbol);
									$price_total = $current_price;
								}
								else
								{
									if($current_price == 0)
										$price_symbol = '+';
									else
										$price_symbol = $first_price > $current_price ? '-':'+';

									if($current_price == 0)
										$price_total = 0;
									else
										$price_total = $first_price > $current_price ? $first_price - $current_price : $current_price - $first_price;
								}
							//END Calc price

							//Calc points
								$current_points = !empty($pattern[$this->language->get('Points')]['index']) && !empty($pro[$pattern[$this->language->get('Points')]['index']]) ? $pro[$pattern[$this->language->get('Points')]['index']] : 0;

								if(!empty($pattern[$this->language->get('Option points prefix')]['index']) && !empty($pro[$pattern[$this->language->get('Option points prefix')]['index']]))
								{
									$points_symbol = $pro[$pattern[$this->language->get('Option points prefix')]['index']];
									$points_symbol = str_replace('~', '', $points_symbol);
									$points_total = $current_points;
								}
								else
								{
									if($current_points == 0)
										$points_symbol = '+';
									else
										$points_symbol = $first_points > $current_points ? '-':'+';

									if($current_points == 0)
										$points_total = 0;
									else
										$points_total = $first_points > $current_points ? $first_points - $current_points : $current_points - $first_points;
								}
							//END Calc points

							//Calc weight
								$current_weight = !empty($pattern[$this->language->get('Weight')]['index']) && !empty($pro[$pattern[$this->language->get('Weight')]['index']]) ? $pro[$pattern[$this->language->get('Weight')]['index']] : 0;

								if(!empty($pattern[$this->language->get('Option weight prefix')]['index']) && !empty($pro[$pattern[$this->language->get('Option weight prefix')]['index']]))
								{
									$weight_symbol = $pro[$pattern[$this->language->get('Option weight prefix')]['index']];
									$weight_symbol = str_replace('~', '', $weight_symbol);
									$weight_total = $current_weight;
								}
								else
								{
									if($current_weight == 0)
										$weight_symbol = '+';
									else
										$weight_symbol = $first_weight > $current_weight ? '-':'+';

									if($current_weight == 0)
										$weight_total = 0;
									else
										$weight_total = $first_weight > $current_weight ? $first_weight - $current_weight : $current_weight - $first_weight;
								}
							//END Calc weight

							$excel_option_value_name = html_entity_decode((string)$pro[$index_option].'_'.$option_type);
							$option_id = $all_options[$excel_option_value_name]['option_id'];
							$option_value_name = htmlspecialchars_decode($pro[$index_option_value]);
							$option_value_id = $is_option_without_option_value ? '' : $all_options[$excel_option_value_name]['option_values'][$option_value_name];

							if(!isset($final_options[$option_id]))
							{
								$option_required = !empty($pattern[$this->language->get('Option required')]['index']) && isset($pro[$pattern[$this->language->get('Option required')]['index']]) ? $pro[$pattern[$this->language->get('Option required')]['index']] : 1;

								$final_options[$option_id] = array(
									'option_id' => $option_id,
									'type' => $option_type,
									'required' => $option_required,
									'product_option_value' => array()
								);
							}

							$option_val_subtract = !empty($pattern[$this->language->get('Option subtract')]['index']) && isset($pro[$pattern[$this->language->get('Option subtract')]['index']]) ? $pro[$pattern[$this->language->get('Option subtract')]['index']] : 1;

							if(!empty($option_type) && !$is_option_without_option_value)
							{
								$temp_option_value = array(
									'option_value_id' => $option_value_id,
	                                'product_option_value_id' => null,
	                                'quantity' => !empty($pattern[$this->language->get('Quantity')]['index']) && is_numeric($pro[$pattern[$this->language->get('Quantity')]['index']]) ? $pro[$pattern[$this->language->get('Quantity')]['index']] : 1,
	                                'subtract' => $option_val_subtract,
	                                'price_prefix' => $price_symbol,
	                                'price' => $price_total,
	                                'points_prefix' => $points_symbol,
	                                'points' => $points_total,
	                                'weight_prefix' => $weight_symbol,
	                                'weight' => $weight_total,
	                                'ob_sku' => !empty($pattern[$this->language->get('Option SKU (Options Boost)')]['index']) && !empty($pro[$pattern[$this->language->get('Option SKU (Options Boost)')]['index']]) ? $pro[$pattern[$this->language->get('Option SKU (Options Boost)')]['index']] : '',
									'ob_image' => !empty($pattern[$this->language->get('Option image (Options Boost)')]['index']) && !empty($pro[$pattern[$this->language->get('Option image (Options Boost)')]['index']]) ? $pro[$pattern[$this->language->get('Option image (Options Boost)')]['index']] : '',
									'uo_sku' => !empty($pattern[$this->language->get('Option SKU (Options Boost)')]['index']) && !empty($pro[$pattern[$this->language->get('Option SKU (Options Boost)')]['index']]) ? $pro[$pattern[$this->language->get('Option SKU (Options Boost)')]['index']] : '',
									'uo_swap_image' => !empty($pattern[$this->language->get('Option image (Options Boost)')]['index']) && !empty($pro[$pattern[$this->language->get('Option image (Options Boost)')]['index']]) ? $pro[$pattern[$this->language->get('Option image (Options Boost)')]['index']] : '',
								);

								$final_options[$option_id]['product_option_value'][] = $temp_option_value;
							}
							else
							{
								unset($final_options[$option_id]['product_option_value']);

								if($this->count_languages == 1)
								{
									$final_options[$option_id]['value'] = !empty($pro[$pattern[$this->language->get('Option value')]['index']]) ? $pro[$pattern[$this->language->get('Option value')]['index']] : '';
								}
								else
								{
									$final_options[$option_id]['value'] = !empty($pro[$pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']]) ? $pro[$pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']] : '';
								}
							}
						}
					//END Options

					$count_products++;
				}

				if(!empty($final_options))
				{
					foreach ($final_options as $key => $opt) {
						$temp['product_option'][] = $opt;
					}
				}

				//Devman Extensions - info@devmanextensions.com - 2017-02-01 19:46:42 - Quantity sum options values
					if($count_products > 1 && !$quantity_is_filled)
						$temp['quantity'] = $quantity;
				//END

				//Devman Extensions - info@devmanextensions.com - 2016-12-27 12:17:08 - Sum tax in create
					if(!$editting && ($this->config->get('import_xls_sum_tax') || $this->config->get('import_xls_rest_tax')) && !empty($temp['tax_class_id']))
					{
						$tax_rule = !empty($this->tax_clases[$temp['tax_class_id']]['rule']) ? $this->tax_clases[$temp['tax_class_id']]['rule'] : '';
						if(!empty($tax_rule))
						{
							$operator = $this->config->get('import_xls_sum_tax') ? '+':'-';

							$temp['price'] = $this->calculate_tax_rate($temp['price'], $tax_rule['type'], $tax_rule['rate'], $operator);

							if(!empty($temp['product_special']))
							{
								foreach ($temp['product_special'] as $key => $val) {
									$price_copy = $temp['product_special'][$key]['price'];
									$temp['product_special'][$key]['price'] = $this->calculate_tax_rate($price_copy, $tax_rule['type'], $tax_rule['rate'], $operator);
								}
							}
							if(!empty($temp['product_discount']))
							{
								foreach ($temp['product_discount'] as $key => $val) {
									$price_copy = $temp['product_discount'][$key]['price'];
									$temp['product_discount'][$key]['price'] = $this->calculate_tax_rate($price_copy, $tax_rule['type'], $tax_rule['rate'], $operator);
								}
							}
							if(!empty($temp['product_option']))
							{
								foreach ($temp['product_option'] as $key => $option) {
									if(!empty($option['product_option_value']))
									{
										foreach ($option['product_option_value'] as $key2 => $optval) {
											$price_copy = $temp['product_option'][$key]['product_option_value'][$key2]['price'];
											$temp['product_option'][$key]['product_option_value'][$key2]['price'] = $this->calculate_tax_rate($price_copy, $tax_rule['type'], $tax_rule['rate'], $operator);
										}
									}
								}
							}
						}
					}
				//END

				$final_products[] = $temp;
			}

			return $final_products;
		}
		function editProduct($product_id, $data, $option_boost_installed, $all_options) {
			$import_xls_strict_edit  = $this->config->get('import_xls_strict_edit');

			//Update basic datas
				$sql = "UPDATE " . DB_PREFIX . "product SET ";

					$basic_datas = array(
						'model','sku', 'upc','jan','ean','isbn','mpn','location','quantity',
						'minimum','subtract','stock_status_id','date_available',
						'manufacturer_id','shipping','price','points','weight',
						'weight_class_id','length','width','height','length_class_id',
						'status','tax_class_id','sort_order', 'image'
					);

					if(version_compare(VERSION, '1.5.1.2', '<'))
					{
						if(($key = array_search('jan', $basic_datas)) !== false) {
						    unset($basic_datas[$key]);
						}
					}

					foreach ($basic_datas as $key => $value) {
						if(isset($data[$value]))
							$sql .= $value." = '" . $this->db->escape($data[$value])."', ";
					}
					$sql .= 'date_modified = NOW() ';
				$sql .= "WHERE product_id = '" . (int)$product_id . "'";

				$this->db->query($sql);
			//END Update basic datas

			//Product descriptions
				$language_datas = array('name','meta_description','meta_keyword','description','tag');

				if(version_compare(VERSION, '2.0.0.0', '>='))
					$language_datas[] = 'meta_title';

				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_description WHERE product_id = " . (int)$product_id);

				foreach ($data['product_description'] as $language_id => $value) {
					$sql = '';
					$insert = false;
					$validate_query = true;

					if(!$import_xls_strict_edit)
					{
						$sql = "SELECT `name` FROM " . DB_PREFIX . "product_description ";
						$sql .= "WHERE product_id = '" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "'";
						$results = $this->db->query($sql);

						if(isset($results->row['name']))
						{
							$some_updates = false;
							$sql = "UPDATE " . DB_PREFIX . "product_description SET ";
								foreach ($language_datas as $key => $value) {
									if(isset($data['product_description'][$language_id][$value]) && $data['product_description'][$language_id][$value] != 'NOT FOUND')
									{
										$sql .= $value." = '" . $this->db->escape($data['product_description'][$language_id][$value])."', ";
										$some_updates = true;
									}
								}
								if(!$some_updates)
									$validate_query = false;
							$sql = substr($sql, 0, -2).' ';
							$sql .= "WHERE product_id = '" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "'";
						}
						else
							$insert = true;
					}
					else
						$insert = true;

					if($insert)
					{
						$sql = "INSERT INTO " . DB_PREFIX . "product_description SET ";
							foreach ($language_datas as $key => $value) {
								if(isset($data['product_description'][$language_id][$value]) && $data['product_description'][$language_id][$value] != 'NOT FOUND')
									$sql .= $value." = '" . $this->db->escape($data['product_description'][$language_id][$value])."', ";
							}
						$sql .= "product_id = '" . (int)$product_id . "', language_id = '" . (int)$language_id . "'";
					}

					if($validate_query)
						$this->db->query($sql);
				}
			//END Product descriptions

			//Opencart 3.x SEO URL multistores and multilanges
				if($this->is_oc_3x)
				{
					if($import_xls_strict_edit)
						$this->db->query("DELETE FROM " . DB_PREFIX . "seo_url WHERE query = 'product_id=" . (int)$product_id . "'");

					foreach ($data['product_seo_url'] as $store_id => $seo_urls) {
						foreach ($seo_urls as $language_id => $seo_url) {

							$insert = false;
							$sql = '';

							if(!$import_xls_strict_edit)
							{
								$sql = "SELECT `seo_url_id` FROM " . DB_PREFIX . "seo_url ";
								$sql .= "WHERE query = 'product_id=" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "' AND store_id = '" . (int)$store_id . "'";
								$results = $this->db->query($sql);

								if(isset($results->row['seo_url_id']))
								{
									$sql = "UPDATE " . DB_PREFIX . "seo_url SET keyword = '".$seo_url."'";
									$sql .= " WHERE seo_url_id = " . $results->row['seo_url_id'];
								}
								else
									$insert = true;
							}
							else
								$insert = true;

							if($insert)
							{
								$sql = "INSERT INTO " . DB_PREFIX . "seo_url SET ";
								$sql .= " query = 'product_id=" . (int)$product_id . "', language_id = '" . (int)$language_id . "', store_id = '" . (int)$store_id . "', keyword = '".$seo_url."'";
							}

							if(!empty($sql))
								$this->db->query($sql);
						}
					}
				}
			//END

			//Product to store
				if(isset($data['product_store']))
				{
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_store WHERE product_id = '" . (int)$product_id . "'");

					if (isset($data['product_store'])) {
						foreach ($data['product_store'] as $store_id) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_store SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "'");
						}
					}
				}
			//END Product to store

			//Product Attributes
				if(isset($data['product_attribute']))
				{
					if($import_xls_strict_edit)
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_attribute WHERE product_id = '" . (int)$product_id . "'");

					foreach ($data['product_attribute'] as $key => $attribute)
					{
						foreach ($attribute['product_attribute_description'] as $language_id => $attrdescrip)
						{
							//Exist this attribute?
							$sql = "SELECT `text` FROM " . DB_PREFIX . "product_attribute ";
							$sql .= "WHERE attribute_id = '" . (int)$attribute['attribute_id'] . "' AND product_id = '" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "'";

							$results = $this->db->query($sql);

							if(isset($results->row['text']))
							{
								//Update product attribute
								$sql = "UPDATE " . DB_PREFIX . "product_attribute SET text = '" . $this->db->escape($attrdescrip['text'])."' ";
								$sql .= "WHERE attribute_id = '" . (int)$attribute['attribute_id'] . "' AND product_id = '" . (int)$product_id . "' AND language_id = '" . (int)$language_id . "'";
							}
							else
								//Insert product attribute
								$sql = "INSERT INTO " . DB_PREFIX . "product_attribute SET text = '" . $this->db->escape($attrdescrip['text'])."', attribute_id = '" . (int)$attribute['attribute_id'] . "', product_id = '" . (int)$product_id . "', language_id = '" . (int)$language_id . "'";

							$this->db->query($sql);
						}
					}
				}
			//END Product Attributes

			//Product Options
				//First delete options and option values
					if($import_xls_strict_edit)
					{
						$sql = "DELETE FROM " . DB_PREFIX . "product_option WHERE product_id = '" . (int)$product_id . "'";
						$this->db->query($sql);
						$sql = "DELETE FROM " . DB_PREFIX . "product_option_value WHERE product_id = '" . (int)$product_id . "'";
						$this->db->query($sql);
					}
				//END First delete options and option values

				if(isset($data['product_option']))
				{
					$pov_fields = array('quantity','subtract','price_prefix','price','points_prefix','points','weight_prefix','weight','ob_sku','ob_image');

					foreach ($data['product_option'] as $key => $option) {
						//PRODUCT OPTION
							if(version_compare(VERSION, '2.0.0.0', '<'))
								$name_column = 'option_value';
							else
								$name_column = 'value';

							$value = in_array($option['type'], array('text', 'textarea', 'date', 'datetime')) ? $option['value'] : '';

							$insert_option = true;

							if(!$import_xls_strict_edit)
							{
								$sql = "SELECT * FROM " . DB_PREFIX . "product_option WHERE product_id = ".$product_id." and option_id = ".$option['option_id'];

								$results = $this->db->query($sql);
								$product_option_id = !empty($results->row['product_option_id']) ? $results->row['product_option_id'] : '';

								if($product_option_id)
								{
									$insert_option = false;
									$sql = "UPDATE " . DB_PREFIX . "product_option SET ";
									$sql .=  $name_column." = '".$value."', ";
									$sql .=  "required = '" . $this->db->escape($option['required']) . "'";
									$sql .= " WHERE product_option_id = ".$product_option_id;

									$this->db->query($sql);
								}
							}

							if($insert_option)
							{
								$sql = "INSERT INTO " . DB_PREFIX . "product_option SET ";
								$sql .=  "option_id = '" . (int)$option['option_id'] . "', ";
								$sql .=  "product_id = '" . (int)$product_id . "', ";
								$sql .=  $name_column." = '".$value."', ";
								$sql .=  "required = '" . $this->db->escape($option['required']) . "'";

								$this->db->query($sql);

								$product_option_id = $this->db->getLastId();
							}

						//END PRODUCT OPTION

						//PRODUCT OPTION VALUES
							if(!empty($option['product_option_value']))
							{
								foreach ($option['product_option_value'] as $key2 => $option_value) {
									$insert_option_value = true;
									if(!$import_xls_strict_edit)
									{
										$sql = "SELECT * FROM " . DB_PREFIX . "product_option_value WHERE product_id = ".$product_id." AND product_option_id = ".$product_option_id." AND option_id = ".$option['option_id']. " AND option_value_id = ".$option_value['option_value_id'];

										$results = $this->db->query($sql);
										$product_option_value_id = !empty($results->row['product_option_value_id']) ? $results->row['product_option_value_id'] : '';

										if($product_option_value_id)
										{
											$insert_option_value = false;

											$sql = "UPDATE " . DB_PREFIX . "product_option_value SET ";

											foreach ($pov_fields as $key3 => $field) {
												if($option_boost_installed || (!$option_boost_installed && $field != "ob_image" && $field != "ob_sku"))
												{
													if($option_value[$field] !== '')
														$sql .= $field." = '" . $this->db->escape($option_value[$field])."', ";
													else
														$sql .= $field." = '', ";
												}
											}
											$sql = substr($sql, 0, -2);

											$sql .= " WHERE product_option_value_id = ".$product_option_value_id;

											$this->db->query($sql);
										}
									}

									if($insert_option_value)
									{
										$sql = "INSERT INTO " . DB_PREFIX . "product_option_value SET ";
										$sql .= "product_option_id = '" . (int)$product_option_id . "', ";
										$sql .= "product_id = '" . (int)$product_id . "', ";
										$sql .= "option_id = '" . (int)$option['option_id'] . "', ";
										$sql .= "option_value_id = '" . (int)$option_value['option_value_id'] . "', ";
										foreach ($pov_fields as $key3 => $field) {
											if($option_boost_installed || (!$option_boost_installed && $field != "ob_image" && $field != "ob_sku"))
											{
												if($option_value[$field] !== '')
													$sql .= $field." = '" . $this->db->escape($option_value[$field])."', ";
												else
													$sql .= $field." = '', ";
											}
										}
										$sql = substr($sql, 0, -2);
										$this->db->query($sql);
									}
								}
							}
						//END PRODUCT OPTION VALUES
					}
				}
			//END Product Options

			//Product Discounts
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");

				if (isset($data['product_discount']) && $data['product_discount'] != 'NO DISCOUNTS') {

					//Devman Extensions - info@devmanextensions.com - 2016-12-26 10:40:07 - For don't do 2 querys
					if(!$import_xls_strict_edit)
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "'");

					foreach ($data['product_discount'] as $product_discount) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_discount SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_discount['customer_group_id'] . "', quantity = '" . (int)$product_discount['quantity'] . "', priority = '" . (int)$product_discount['priority'] . "', price = '" . (float)$product_discount['price'] . "', date_start = '" . $this->db->escape($product_discount['date_start']) . "', date_end = '" . $this->db->escape($product_discount['date_end']) . "'");
					}
				}
			//END Product Discounts

			//Product Special
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");

				if (isset($data['product_special']) && $data['product_special'] != 'NO SPECIALS') {
					//Devman Extensions - info@devmanextensions.com - 2016-12-26 10:40:07 - For don't do 2 querys
					if(!$import_xls_strict_edit)
						$this->db->query("DELETE FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "'");

					foreach ($data['product_special'] as $product_special) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "product_special SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$product_special['customer_group_id'] . "', priority = '" . (int)$product_special['priority'] . "', price = '" . (float)$product_special['price'] . "', date_start = '" . $this->db->escape($product_special['date_start']) . "', date_end = '" . $this->db->escape($product_special['date_end']) . "'");
					}
				}
			//END Product Special

			//Product Images - WILL BE ADDED IF NOT EXIST
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_image WHERE product_id = '" . (int)$product_id . "'");

				if (!empty($data['product_image'])) {
					foreach ($data['product_image'] as $product_image) {
						$sql = "SELECT `product_image_id` FROM " . DB_PREFIX . "product_image WHERE ";
						$sql .= "product_id = '" . (int)$product_id . "' AND ";
						$sql .= "image = '" . $this->db->escape($product_image['image']) . "'";

						$results = $this->db->query($sql);
						if(empty($results->row['product_image_id']))
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_image SET product_id = '" . (int)$product_id . "', image = '" . $this->db->escape($product_image['image']) . "', sort_order = '" . (int)$product_image['sort_order'] . "'");
					}
				}
			//Product Images - WILL BE ADDED IF NOT EXIST

			//Product Category - WILL BE ADDED IF NOT EXIST
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_category WHERE product_id = '" . (int)$product_id . "'");

				if(!empty($data['product_category']))
				{
					foreach ($data['product_category'] as $category_id) {
						$insert_category = true;
						if(!$import_xls_strict_edit)
						{
							$result = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_category WHERE product_id = " . (int)$product_id . " AND category_id = " . (int)$category_id);
							$insert_category = empty($result->row['product_id']);
						}

						if($insert_category)
						{
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_category SET product_id = '" . (int)$product_id . "', category_id = '" . (int)$category_id . "'");
						}
					}
				}
			//END Product Category - WILL BE ADDED IF NOT EXIST

			//Product filter - WILL BE ADDED IF NOT EXIST
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_filter WHERE product_id = '" . (int)$product_id . "'");

				if(!empty($data['product_filter']))
				{
					foreach ($data['product_filter'] as $filter_id) {
						$insert_product_filter = true;

						if(!$import_xls_strict_edit)
						{
							$sql = "SELECT `product_id` FROM " . DB_PREFIX . "product_filter WHERE ";
							$sql .= "product_id = '" . (int)$product_id . "' AND ";
							$sql .= "filter_id = '" . (int)$filter_id . "'";

							$results = $this->db->query($sql);

							$insert_product_filter = empty($results->row['product_id']);
						}

						if($insert_product_filter)
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_filter SET product_id = '" . (int)$product_id . "', filter_id = '" . (int)$filter_id . "'");
					}
				}
			//END Product filter - WILL BE ADDED IF NOT EXIST

			//Product reward - WILL BE ADDED IF NOT EXIST
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "'");

				if (!empty($data['product_reward']))
				{
					foreach ($data['product_reward'] as $customer_group_id => $points) {
						$insert_reward = true;

						if(!$import_xls_strict_edit)
						{
							$sql = "SELECT `product_id` FROM " . DB_PREFIX . "product_reward WHERE ";
							$sql .= "product_id = '" . (int)$product_id . "' AND ";
							$sql .= "points = '" . (int)$points['points'] . "' AND ";
							$sql .= "customer_group_id = '" . (int)$customer_group_id . "'";

							$results = $this->db->query($sql);

							$insert_reward = empty($results->row['product_id']);
						}

						if($insert_reward)
						{
							$this->db->query("DELETE FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "'");
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_reward SET product_id = '" . (int)$product_id . "', customer_group_id = '" . (int)$customer_group_id . "', points = '" . (int)$points['points'] . "'");
						}
					}
				}
			//END Product reward - WILL BE ADDED IF NOT EXIST

			//Product layout - WILL BE ADDED IF NOT EXIST
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_layout WHERE product_id = '" . (int)$product_id . "'");

				if (!empty($data['product_layout']))
				{
					foreach ($data['product_layout'] as $store_id => $layout_id) {
						$insert_product_layout = true;

						if(!$import_xls_strict_edit)
						{
							$sql = "SELECT `product_id` FROM " . DB_PREFIX . "product_to_layout WHERE ";
							$sql .= "product_id = '" . (int)$product_id . "' AND ";
							$sql .= "store_id = '" . (int)$store_id . "' AND ";
							$sql .= "layout_id = '" . (int)$layout_id . "'";

							$results = $this->db->query($sql);

							$insert_product_layout = empty($results->row['product_id']);
						}

						if($insert_product_layout)
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_layout SET product_id = '" . (int)$product_id . "', store_id = '" . (int)$store_id . "', layout_id = '" . (int)$layout_id . "'");
					}
				}
			//END Product layout - WILL BE ADDED IF NOT EXIST

			//Product Keyword
				if(!$this->is_oc_3x && !empty($data['keyword']))
				{
					$sql = "SELECT `url_alias_id` FROM " . DB_PREFIX . "url_alias WHERE ";
					$sql .= "query = 'product_id=" . (int)$product_id . "' AND ";
					$sql .= "keyword = '" . $this->db->escape($data['keyword']) . "'";

					$results = $this->db->query($sql);
					if(empty($results->row['url_alias_id']))
					{
						$this->db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = 'product_id=" . (int)$product_id . "'");
						$this->db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = 'product_id=" . (int)$product_id . "', keyword = '" . $this->db->escape($data['keyword']) . "'");
					}
				}
			//END Product Keyword

			//Product download
				if($import_xls_strict_edit)
					$this->db->query("DELETE FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "'");

				if (!empty($data['product_download'])) {
					foreach ($data['product_download'] as $download_id) {
						$insert = true;

						if(!$import_xls_strict_edit)
						{
							$results = $this->db->query("SELECT product_id FROM " . DB_PREFIX . "product_to_download WHERE product_id = '" . (int)$product_id . "' AND download_id = $download_id");

							$insert = empty($results->row['product_id']);
						}

						if($insert)
						{
							$this->db->query("INSERT INTO " . DB_PREFIX . "product_to_download SET product_id = '" . (int)$product_id . "', download_id = '" . (int)$download_id . "'");
						}
					}
				}
			//END Product download
		}
    //</editor-fold>

    //<editor-fold desc="Functions get element by name">
        public function get_product_id_by_model($model = '') {
			$temporal_sql = "SELECT product_id FROM `" . DB_PREFIX . "product` WHERE model = '".$this->db->escape($model)."';";
			$result = $this->db->query( $temporal_sql );

			return !empty($result->row['product_id']) ? $result->row['product_id'] : false;
		}
		public function get_category_id_by_name($cat_name, $parent_id = 0) {

			for ($i=1; $i <= 2 ; $i++) {

				$cat_name = $i == 1 ? $cat_name : htmlspecialchars($cat_name);

				$sql = "SELECT cd.* FROM " . DB_PREFIX . "category_description cd";

				if($parent_id > 0)
					$sql .= " INNER JOIN " . DB_PREFIX . "category cat ON(cd.category_id = cat.category_id AND cat.parent_id = ".$parent_id.")";

				$sql .= " WHERE cd.language_id = ".$this->default_language_id." AND cd.name='".$this->db->escape($cat_name)."' ORDER BY cd.category_id DESC";

				$query = $this->db->query($sql);

				if($query->num_rows > 1)
					throw new Exception (sprintf($this->language->get('error_import_category_more_than_1_category_name'), $cat_name));

				if($query->num_rows == 1)
					return $query->rows[0]['category_id'];
			}
			return false;
		}
		public function get_attribute_group_id_by_name($attribute_group_name, $from_attribute = false) {
            $sql = "SELECT atgd.* FROM " . DB_PREFIX . "attribute_group_description atgd WHERE name = '".$attribute_group_name."' AND language_id = ".$this->default_language_id;

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_attribute_group'), $attribute_group_name));
            elseif($from_attribute && $query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_not_exist_attribute_group'), $attribute_group_name));

            return $query->num_rows == 1 ? $query->rows[0]['attribute_group_id'] : false;
        }
        public function get_attribute_id_by_name($attribute_name) {
            $sql = "SELECT atd.* FROM " . DB_PREFIX . "attribute_description atd WHERE name = '".$attribute_name."' AND language_id = ".$this->default_language_id;

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_attribute'), $attribute_name));

            return $query->num_rows == 1 ? $query->rows[0]['attribute_id'] : false;
        }
        public function get_option_id_by_name($option_name, $from_option_value = false) {
            $sql = "SELECT fgd.* FROM " . DB_PREFIX . "option_description fgd WHERE name = BINARY '".$this->db->escape($option_name)."' AND language_id = ".$this->default_language_id;
            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_option'), $option_name));
            elseif($from_option_value && $query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_not_exist_option'), $option_name));

            return $query->num_rows == 1 ? $query->rows[0]['option_id'] : false;
        }
        public function get_option_value_id_by_name($option_value_name, $option_id = false) {
            $sql = "SELECT atd.* FROM " . DB_PREFIX . "option_value_description atd WHERE name = '".$option_value_name."' AND language_id = ".$this->default_language_id.($option_id ? ' AND option_id ='.(int)$option_id : '');

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_option_value'), $option_value_name));

            return $query->num_rows == 1 ? $query->rows[0]['option_value_id'] : false;
        }
        public function get_customer_group_id_by_name($customer_group_name, $from_customer = false) {
            $sql = "SELECT fgd.* FROM " . DB_PREFIX . "customer_group_description fgd WHERE name = '".$customer_group_name."' AND language_id = ".$this->default_language_id;

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_customer_group'), $customer_group_name));
            elseif($from_customer && $query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_not_exist_customer_group'), $customer_group_name));

            return $query->num_rows == 1 ? $query->rows[0]['customer_group_id'] : false;
        }
        public function get_filter_group_id_by_name($filter_group_name, $from_filter = false) {
            $sql = "SELECT fgd.* FROM " . DB_PREFIX . "filter_group_description fgd WHERE name = '".$filter_group_name."' AND language_id = ".$this->default_language_id;

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_filter_group'), $filter_group_name));
            elseif($from_filter && $query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_not_exist_filter_group'), $filter_group_name));

            return $query->num_rows == 1 ? $query->rows[0]['filter_group_id'] : false;
        }
        public function get_filter_id_by_name($filter_name) {
            $sql = "SELECT atd.* FROM " . DB_PREFIX . "filter_description atd WHERE name = '".$filter_name."' AND language_id = ".$this->default_language_id;

            $query = $this->db->query($sql);

            if($query->num_rows > 1)
                throw new Exception (sprintf($this->language->get('ajax_importing_duplicate_filter'), $filter_name));

            return $query->num_rows == 1 ? $query->rows[0]['filter_id'] : false;
        }
        public function get_country_id_by_name($country_name) {
            $sql = "SELECT country_id FROM " . DB_PREFIX . "country WHERE name = '".$country_name."'";

            $query = $this->db->query($sql);

            if($query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_addresses_country_not_found'), $country_name));

            return $query->row['country_id'];
        }
        public function get_zone_id_by_name($country_id, $zone_name) {
            $sql = "SELECT zone_id FROM " . DB_PREFIX . "zone WHERE name = '".$zone_name."' AND country_id = ".(int)$country_id;

            $query = $this->db->query($sql);

            if($query->num_rows == 0)
                throw new Exception (sprintf($this->language->get('ajax_importing_addresses_zone_not_found'), $zone_name, $country_id));

            return $query->row['zone_id'];
        }
    //</editor-fold>

    //<editor-fold desc="Functions get elements">
        public function get_all_categories() {
			$temporal_sql = "SELECT c.category_id,c.parent_id,cd.name FROM `" . DB_PREFIX . "category` c LEFT JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = ".(int)$this->config->get('config_language_id').");";
			$result = $this->db->query( $temporal_sql );

			if($this->count_languages > 1 && !empty($result->rows))
			{
				foreach ($result->rows as $key => $cat) {
					$result->rows[$key]['name'] = array();

					foreach ($this->languages as $key2 => $lang) {
						$temporal_sql = "SELECT c.category_id,c.parent_id,cd.name FROM `" . DB_PREFIX . "category` c LEFT JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = ".(int)$lang['language_id'].") WHERE c.category_id = ".$cat['category_id'].";";
						$result2 = $this->db->query( $temporal_sql );
						$result->rows[$key]['name'][(int)$lang['language_id']] = array_key_exists('name', $result2->row) ? $result2->row['name'] : '';
					}
				}
			}

			if($this->config->get('import_xls_categories_tree'))
			{
				$tree = $this->buildTree($result->rows);
				return $tree;
			}
			else
			{
				$final_categories = array();

				foreach ($result->rows as $key => $cat) {
					if($this->count_languages > 1)
					{
						$cat_name = '';

						foreach ($this->languages as $key2 => $lang) {
							$temp_name = array_key_exists($lang['language_id'], $cat['name']) ? $cat['name'][$lang['language_id']] : '';

							if(!empty($temp_name))
								$final_categories[htmlspecialchars_decode($temp_name)] = $cat['category_id'];
						}
					}
					else
					{
						$cat_name = htmlspecialchars_decode($cat['name']);
						$final_categories[$cat_name] = $cat['category_id'];
					}
				}
				return $final_categories;
			}
		}
		public function get_category_parent_tree($categories, $cat_name) {
			foreach ($categories as $key => $cat) {
				if($this->count_languages == 1)
				{
					if($cat['name'] == $cat_name)
						return $cat;
				}
				else
				{
					foreach ($this->languages as $key2 => $lang) {
						$temp_cat_name = array_key_exists($lang['code'], $cat_name) ? $cat_name[$lang['code']] : '';

						if(array_key_exists($lang['language_id'], $cat['name']) && $cat['name'][$lang['language_id']] == $temp_cat_name)
							return $cat;
					}
				}
			}

			return false;
		}
		public function get_all_manufacturers() {
			$this->load->model('catalog/manufacturer');
			$manufacturers = $this->model_catalog_manufacturer->getManufacturers();

			$manufacturers_final = array();

			foreach ($manufacturers as $key => $ma) {
				$ma_name = htmlspecialchars_decode($ma['name']);
				$manufacturers_final[$ma_name] = $ma['manufacturer_id'];
			}
			return $manufacturers_final;
		}
		public function get_all_filters() {
			$this->load->model('catalog/filter');
			$filters = $this->model_catalog_filter->getFilters(false);

			$filters_final = array();
			foreach ($filters as $key => $fi) {
				$fg_name = htmlspecialchars_decode($fi['group']);
				$f_name = htmlspecialchars_decode($fi['name']);

				if (!isset($filters_final[$fg_name]))
					$filters_final[$fg_name] = array();

				if (!isset($filters_final[$fg_name]['filters']))
					$filters_final[$fg_name]['filters'] = array();

				$filters_final[$fg_name]['filter_group_id'] = $fi['filter_group_id'];
				$filters_final[$fg_name]['filters'][$f_name] = $fi['filter_id'];
			}
			return $filters_final;
		}
		public function get_all_attributes() {
			$this->load->model('catalog/attribute');
			$attributes = $this->model_catalog_attribute->getAttributes();

			$attributes_final = array();
			foreach ($attributes as $key => $at) {
				$attr_group_name = htmlspecialchars_decode($at['attribute_group']);
				$attr_name = htmlspecialchars_decode($at['name']);

				if (!isset($attributes_final[$attr_group_name]))
					$attributes_final[$attr_group_name] = array();

				$attributes_final[$attr_group_name]['attribute_group_id'] = $at['attribute_group_id'];

				$attributes_final[$attr_group_name]['attributes'][$attr_name] = $at['attribute_id'];
			}
			return $attributes_final;
		}
		public function get_all_options() {
			$this->load->model('catalog/option');
			$all_options = $this->model_catalog_option->getOptions();

			$options_final = array();

			//Format options
			foreach ($all_options as $key => $op) {
				$opt_name = htmlspecialchars_decode($op['name']);
				$opt_type = htmlspecialchars_decode($op['type']);

				$options_final[$opt_name.'_'.$opt_type] = array(
					'option_id' => $op['option_id'],
					'option_name' => $opt_name,
					'option_values' => array()
				);
			}

			//Get all options values to each option
			foreach ($options_final as $option_name => $op) {
				$optuion_values = $this->model_catalog_option->getOptionValues($op['option_id']);

				//Format option values
				$option_values_final = array();

				foreach ($optuion_values as $key => $op) {
					$opt_name = htmlspecialchars_decode($op['name']);
					$option_values_final[$opt_name] = $op['option_value_id'];
				}

				$options_final[$option_name]['option_values'] = $option_values_final;
			}

			return $options_final;
		}
		public function get_all_downloads() {
			$downloads = $this->model_catalog_download->getDownloads();

			$final_downloads = array();

			foreach ($downloads as $key => $download) {
				$name = $download['name'];
				$download_id = $download['download_id'];

				if($this->count_languages > 1)
				{
					$names = $this->model_catalog_download->getDownloadDescriptions($download['download_id']);
					$name = $names[$this->default_language_id]['name'];
				}

				$final_downloads[htmlspecialchars_decode($name)] = $download_id;
			}

			return $final_downloads;
		}
		public function get_stock_statuses() {
			$sql = "SELECT * FROM " . DB_PREFIX . "stock_status WHERE language_id = ".(int)$this->config->get('config_language_id').";";
			$result = $this->db->query( $sql );
			$stock_statuses = $result->rows;
			$this->load->model('extension/devmanextensions/tools_trial');
			$stock_statuses = $this->model_extension_devmanextensions_tools_trial->aasort($stock_statuses, 'name');
			return $stock_statuses;
		}
		public function get_classes_weight() {
			$this->load->model('localisation/weight_class');
			$weight_classes = $this->model_localisation_weight_class->getWeightClasses();
			$config = $this->config->get('config_weight_class_id');
			foreach ($weight_classes as $key => $class_weight) {
				if($config == $class_weight['weight_class_id'])
				{
					$weight_classes[$key]['default'] = true;
					break;
				}
			}
			return $weight_classes;
		}
		public function get_stores() {
			$this->load->model('setting/store');
			$stores = array();
			$stores[0] = array(
				'store_id' => '0',
				'name' => $this->config->get('config_name')
			);

			$stores_temp = $this->model_setting_store->getStores();
			foreach ($stores_temp as $key => $value) {
				$stores[] = $value;
			}
			return $stores;
		}
		public function getCustomerGroups($data = array(), $import_format = false) {
			$sql = "SELECT * FROM " . DB_PREFIX . "customer_group cg";

			if($this->hasCustomerDescriptions)
				$sql .= " LEFT JOIN " . DB_PREFIX . "customer_group_description cgd ON (cg.customer_group_id = cgd.customer_group_id) WHERE cgd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY cgd.name ASC";
			else
				$sql .= " ORDER BY name ASC";

			$query = $this->db->query($sql);

			if($import_format) {
			    $final_return = array();
			    foreach ($query->rows as $key => $customer) {
			        if(array_key_exists($customer['name'], $final_return))
			            die('Customer group name repeat: '.$customer['name']);

			        $final_return[$customer['name']] = $customer['customer_group_id'];

			    }
			    return $final_return;
            }
			return $query->rows;
		}
		public function get_value_from_pattern($key, $pattern, $data_array, $default_value = '') {
			$return_value = array_key_exists($key, $pattern) && array_key_exists('created', $pattern[$key]) && $pattern[$key]['created'] && array_key_exists('index', $pattern[$key]) && array_key_exists($pattern[$key]['index'], $data_array) ? $data_array[$pattern[$key]['index']] : $default_value;
			return $return_value;
		}
    //</editor-fold>

    //<editor-fold desc="Functions create elements">
		public function create_categories($xls_data, $pattern, $all_categories, $all_stores) {
            $data = array(
                'message' => $this->language->get('progress_import_creating_categories')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

			$this->load->model('catalog/category');
			$array_categories = array();
			$all_categories = $this->get_all_categories();

			if($this->config->get('import_xls_categories_tree'))
			{
				foreach ($xls_data['data'] as $key => $data) {
					$count_temp = 0;
					for ($i=1; $i <= $this->categoriesTreesNumber ; $i++) {

						$col_name = $this->array_category_columns_name[$count_temp];

						if($this->count_languages > 1)
						{
							$temp = array();
							$first_category_name = '';
							foreach ($col_name as $key2 => $languages_cols) {
								foreach ($languages_cols as $lang_code => $col_name_real) {
									if(empty($first_category_name))
										$first_category_name = $col_name_real.' '.$lang_code;

									$temp[$lang_code] = $col_name_real.' '.$lang_code;
								}
							}

							$col_name_array = $temp;
							$col_name = $first_category_name;
						}

						$count_temp++;

						if(!empty($pattern[$col_name]['index']) && !empty($data[$pattern[$col_name]['index']]))
						{
							//Create parent
								$parent_name = $data[$pattern[$col_name]['index']];

								$category_tree = $this->get_category_tree($all_categories, $parent_name);

								if(!$category_tree)
								{
									if($this->count_languages > 1)
									{
										$temp_name = array();
										foreach ($col_name_array as $lang_code => $col_name_lang) {
											$temp_name[$lang_code] = array_key_exists($col_name_lang, $pattern) && array_key_exists($pattern[$col_name_lang]['index'], $data) ? $data[$pattern[$col_name_lang]['index']] : '';
										}
										$parent_name = $temp_name;
									}
									$parent_id = $this->create_category($parent_name, 0, $all_stores);
									$all_categories = $this->get_all_categories();
								}
								else
									$parent_id = $category_tree['category_id'];
							//END

							//Create childrens
								for ($j=1; $j <= $this->categoriesTreesChildrenNumber ; $j++) {
									$col_name = $this->array_category_columns_name[$count_temp];

									if($this->count_languages > 1)
									{
										$temp = array();
										$first_category_name = '';
										foreach ($col_name as $key2 => $languages_cols) {
											foreach ($languages_cols as $lang_code => $col_name_real) {
												if(empty($first_category_name))
													$first_category_name = $col_name_real.' '.$lang_code;

												$temp[$lang_code] = $col_name_real.' '.$lang_code;
											}
										}

										$col_name_array = $temp;
										$col_name = $first_category_name;
									}

									$count_temp++;

									if(!empty($pattern[$col_name]['index']) && !empty($data[$pattern[$col_name]['index']]))
									{
										$child_name = $data[$pattern[$col_name]['index']];

										$category_tree = $this->get_category_tree($category_tree['childrens'], $child_name);

										if(!$category_tree)
										{
											if($this->count_languages > 1)
											{
												$temp_name = array();
												foreach ($col_name_array as $lang_code => $col_name_lang) {
													$temp_name[$lang_code] = array_key_exists($col_name_lang, $pattern) && array_key_exists($pattern[$col_name_lang]['index'], $data) ? $data[$pattern[$col_name_lang]['index']] : '';
												}
												$child_name = $temp_name;
											}
											$parent_id = $this->create_category($child_name, $parent_id, $all_stores);
											$all_categories = $this->get_all_categories();
										}
										else
											$parent_id = $category_tree['category_id'];
									}
								}
							//END
						}
						else
							$count_temp += $this->categoriesTreesChildrenNumber;
	                }
				}
			}
			else
			{
				foreach ($xls_data['data'] as $key => $data) {
					foreach ($this->array_category_columns_name as $key => $col_name) {
						if($this->count_languages == 1)
						{
							if(!empty($pattern[$col_name]['index']) && !empty($data[$pattern[$col_name]['index']]))
								$array_categories[] = $data[$pattern[$col_name]['index']];
						}
						else
						{
							$temp = array();
							foreach ($col_name as $lang_code => $cols_cat_lang) {
								$empty = true;
								foreach ($cols_cat_lang as $lang_code => $col_cat_lang) {
									$column_cat_name = $col_cat_lang.' '.$lang_code;
									$cat_name = array_key_exists($column_cat_name, $pattern) && array_key_exists($pattern[$column_cat_name]['index'], $data) ? htmlspecialchars_decode($data[$pattern[$column_cat_name]['index']]) : '';

									if(!empty($cat_name)) $empty = false;
									$temp[$lang_code] = $cat_name;
								}
							}
							if(!$empty)
								$array_categories[] = $temp;
						}
					}
				}
				if($this->count_languages == 1)
					$array_categories = array_unique($array_categories);
				else
					$array_categories = array_map("unserialize", array_unique(array_map("serialize", $array_categories)));

				foreach ($array_categories as $key => $cat) {

					if($this->count_languages > 1)
					{
						$found = false;

						foreach ($this->languages as $key2 => $lang) {
							$main_category_name = array_key_exists($lang['code'], $cat) && !empty($cat[$lang['code']]) ? $cat[$lang['code']] : '';

							if(!empty($main_category_name) && array_key_exists($main_category_name, $all_categories))
							{
								$found = true;
								break;
							}
						}

						if(!$found)
						{
							$this->create_category($cat, 0, $all_stores);
							$all_categories = $this->get_all_categories();
						}
					}
					else
					{
						if(!isset($all_categories[$cat]))
						{
							$this->create_category($cat, 0, $all_stores);
							$all_categories = $this->get_all_categories();
						}
					}
				}
			}
		}
		public function create_category($cat_name, $parent_id = 0, $all_stores) {
			$temp = array(
				'category_description' => array(),
				'category_store' => array(0),
				'path' => null,
				'parent_id' => $parent_id,
				'filter' => null,
				'image' => 'no_image.jpg',
				'top' => 1,
				'column' => 1,
				'sort_order' => 0,
				'status' => 1,
			);
			$copy_name = $cat_name;

			foreach ($this->languages as $key => $lng) {

				if($this->count_languages > 1)
					$cat_name = array_key_exists($lng['code'], $copy_name) ? $copy_name[$lng['code']] : '';

				$temp['category_description'][$lng['language_id']] = array(
					'name' => $cat_name,
					'meta_title' => $cat_name,
					'keyword' => $this->autogenerate_seo_url($cat_name),
                    'meta_description' => null,
                    'meta_keyword' => null,
                    'description' => null,
				);
			}

			$temp['keyword'] = $this->autogenerate_seo_url($cat_name);

			foreach ($all_stores as $key => $store) {
				$temp['category_store'][] = $store['store_id'];
			}

			return $this->model_catalog_category->addCategory($temp);
		}
		public function create_manufacturers($xls_data, $pattern, $all_manufacturers, $all_stores) {
		    $data = array(
                'message' => $this->language->get('progress_import_creating_manufacturers')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

	        $this->load->model('catalog/manufacturer');

			$array_manufacturers = array();
			$index_manufacturer = !empty($pattern[$this->language->get('Manufacturer')]['index']) ? $pattern[$this->language->get('Manufacturer')]['index'] : '';
			if(!empty($index_manufacturer))
			{
				foreach ($xls_data['data'] as $key => $data) {
					if(!empty($data[$index_manufacturer]))
						$array_manufacturers[] = $data[$index_manufacturer];
				}
				$array_manufacturers = array_unique($array_manufacturers);
				foreach ($array_manufacturers as $key => $ma) {
					if(!isset($all_manufacturers[$ma]))
					{
						$temp = array(
							'name' => $ma,
					    	'manufacturer_store' => array(0),
					    	'keyword' => $this->autogenerate_seo_url($ma),
					    	'image' => 'no_image.jpg',
					    	'sort_order' => 0,
						);

						foreach ($all_stores as $key => $store) {
							$temp['manufacturer_store'][] = $store['store_id'];
						}

						$this->model_catalog_manufacturer->addManufacturer($temp);
					}
				}
			}
		}
		public function create_options($xls_data, $pattern, $all_options) {
	        $data = array(
                'message' => $this->language->get('progress_import_creating_options')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

			$this->load->model('catalog/option');

			if($this->count_languages == 1)
			{
				$index_option = !empty($pattern[$this->language->get('Option')]['index']) ? $pattern[$this->language->get('Option')]['index'] : '';
				$index_option_value = !empty($pattern[$this->language->get('Option value')]['index']) ? $pattern[$this->language->get('Option value')]['index'] : '';
			}
			else
			{
				$index_option = !empty($pattern[$this->language->get('Option').' '.$this->default_language_code]['index']) ? $pattern[$this->language->get('Option').' '.$this->default_language_code]['index'] : '';
				$index_option_value = !empty($pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']) ? $pattern[$this->language->get('Option value').' '.$this->default_language_code]['index'] : '';
			}

			$index_option_type = !empty($pattern[$this->language->get('Option type')]['index']) ? $pattern[$this->language->get('Option type')]['index'] : '';
			$index_option_image = !empty($pattern[$this->language->get('Option image')]['index']) ? $pattern[$this->language->get('Option image')]['index'] : '';
			$index_option_value_sort_order = !empty($pattern[$this->language->get('Option value sort order')]['index']) ? $pattern[$this->language->get('Option value sort order')]['index'] : '';

			$array_options = array();

			if(!empty($index_option)  && !empty($index_option_value))
			{
				foreach ($xls_data['data'] as $key => $data) {
					$option = $data[$index_option];
					$option_type = !empty($data[$index_option_type]) ? $data[$index_option_type] : 'select';
					$option_value = $data[$index_option_value];
					$option_image = !empty($data[$index_option_image]) ? $data[$index_option_image] : '';
					$option_value_sort_order = !empty($data[$index_option_value_sort_order]) ? $data[$index_option_value_sort_order] : 0;

					if(!empty($option) && !empty($option_type))
					{
						if(!isset($array_options[$option.'_'.$option_type]))
							$array_options[$option.'_'.$option_type] = array(
								'option_type' => $option_type,
								'option_values' => array(),
								'option_name' => $option,
								//Only multilanguage
								'option_names' => array(),
							);

						$options_values_multilanguage = array();
						if($this->count_languages > 1)
						{
							foreach ($this->languages as $key => $lang) {
								$language_code = isset($pattern[$this->language->get('Option').' '.$lang['code']]) ? $lang['code'] : $this->default_language_code;

								//Options multilanguage
									$index_option_temp = $pattern[$this->language->get('Option').' '.$language_code]['index'];
									$array_options[$option.'_'.$option_type]['option_names'][$lang['language_id']]['name'] = !empty($data[$index_option_temp]) ? $data[$index_option_temp] : $option;
								//END Options multilanguage

								//Option values multilanguage
									$index_option_value_temp = $pattern[$this->language->get('Option value').' '.$language_code]['index'];
									$options_values_multilanguage[$lang['language_id']]['name'] = !empty($data[$index_option_value_temp]) ? $data[$index_option_value_temp] : $option_value;
								//END Option values multilanguage
							}
						}

						$array_options[$option.'_'.$option_type]['option_values'][] = array('option_value' => $option_value, 'option_values' => $options_values_multilanguage, 'option_value_image' => $option_image, 'option_value_sort_order' => $option_value_sort_order);
					}
				}
				foreach ($array_options as $key => $opt) {
					$array_options[$key]['option_values'] = $this->remove_duplicate('option_value',$opt['option_values']);
				}
				foreach ($array_options as $opt_name => $opt) {
					$temp = array(
						'option_description' => array(),
						'type' => $opt['option_type'],
						'sort_order' => 0,
						'option_value' => array(),
					);

					if($this->count_languages > 1)
						$temp['option_description'] = $opt['option_names'];
					else
						$temp['option_description'][$this->config->get('config_language_id')]['name'] = $opt['option_name'];

					foreach ($opt['option_values'] as $key2 => $opt_val) {

						$option_value_name = array();

						if($this->count_languages > 1)
							$option_value_name = $opt_val['option_values'];
						else
							$option_value_name[$this->config->get('config_language_id')]['name'] = $opt_val['option_value'];

						$temp_opt_val = array(
							'option_value_id' => '',
							'image' => $opt_val['option_value_image'],
							'sort_order' => $opt_val['option_value_sort_order'],
							'name' => $opt_val['option_value'],
							'option_value_description' => $option_value_name
						);

						$temp['option_value'][] = $temp_opt_val;
					}

					if(!isset($all_options[(string)$opt_name]))
					{
						//Create new option with values
						$this->model_catalog_option->addOption($temp);
					}
					else
					{
						//Create new option values
						foreach ($temp['option_value'] as $key => $opt_val) {
							if(!isset($all_options[(string)$opt_name]['option_values'][$opt_val['name']]))
							{
								$option_id = $all_options[(string)$opt_name]['option_id'];
								$this->db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int)$option_id . "', image = '".$opt_val['image']."', sort_order = '".(int)$opt_val['sort_order']."'");
								$option_value_id = $this->db->getLastId();

								foreach ($this->languages as $key => $lng) {
									$this->db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int)$option_value_id . "', language_id = '" . (int)$lng['language_id'] . "', option_id = '" . (int)$option_id . "', name = '" . $this->db->escape($opt_val['name']) . "'");
								}
							}
						}
					}
				}
			}
		}
		public function create_attributes($xls_data, $pattern, $all_attributes) {
	        $data = array(
                'message' => $this->language->get('progress_import_creating_attributes')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

			$final_attributes = array();
			foreach ($xls_data['data'] as $key => $data) {
				for ($i=1; $i <= $this->attn; $i++) {
					if($this->count_languages == 1)
					{
						$attr_group_index = !empty($pattern[$this->language->get('Attr. Group').' '.$i]['index']) ? $pattern[$this->language->get('Attr. Group').' '.$i]['index'] : '';
						$attr_index = !empty($pattern[$this->language->get('Attribute').' '.$i]['index']) ? $pattern[$this->language->get('Attribute').' '.$i]['index'] : '';
					}
					else
					{
						$name_attr_group_column = $this->language->get('Attr. Group').' '.$i.' '.$this->default_language_code;
						$name_attr_colum = $this->language->get('Attribute').' '.$i.' '.$this->default_language_code;

						$attr_group_index = !empty($pattern[$name_attr_group_column]['index']) ? $pattern[$name_attr_group_column]['index'] : '';
						$attr_index = !empty($pattern[$name_attr_colum]['index']) ? $pattern[$name_attr_colum]['index'] : '';
					}

					if(!empty($attr_group_index) && !empty($attr_index) && !empty($data[$attr_group_index]) && !empty($data[$attr_index]))
					{
						$temp = array();

						$attribute_group_name = $data[$attr_group_index];
						$attribute_name = $data[$attr_index];

						if(!isset($final_attributes[$attribute_group_name]['attributes']))
							$final_attributes[$attribute_group_name]['attributes'] = array();

						if(!isset($final_attributes[$attribute_group_name]['attributes'][$attribute_name]))
							$final_attributes[$attribute_group_name]['attributes'][$attribute_name] = array();

						$attribute_group_name_original = $attribute_group_name;
						$attribute_name_original = $attribute_name;

						foreach ($this->languages as $lang_code => $lang) {
							if(!isset($final_attributes[$attribute_group_name]['translates']))
								$final_attributes[$attribute_group_name]['translates'] = array();

							$name_attr_group_column = $this->language->get('Attr. Group').' '.$i.' '.$lang_code;
							$name_attr_colum = $this->language->get('Attribute').' '.$i.' '.$lang_code;

							$attr_index_trans = !empty($pattern[$name_attr_colum]['index']) ? $pattern[$name_attr_colum]['index'] : '';
							$attribute_name = !empty($data[$attr_index_trans]) ? $data[$attr_index_trans] : $attribute_name_original;

							$attr_group_index_trans = !empty($pattern[$name_attr_group_column]['index']) ? $pattern[$name_attr_group_column]['index'] : '';
							$attribute_group_name_trans = !empty($data[$attr_group_index_trans]) ? $data[$attr_group_index_trans] : $attribute_group_name_original;

							$final_attributes[$attribute_group_name_original]['translates'][$lang_code] = $attribute_group_name_trans;

							if(!isset($final_attributes[$attribute_group_name_original]['attributes'][$attribute_name_original]['translates']))
								$final_attributes[$attribute_group_name_original]['attributes'][$attribute_name_original]['translates'] = array();

							$final_attributes[$attribute_group_name_original]['attributes'][$attribute_name_original]['translates'][$lang_code] = $attribute_name;
						}
					}
				}
			}

			foreach ($final_attributes as $attr_group_name => $attrs) {
				//Insert attributes groups
					if(!isset($all_attributes[$attr_group_name]))
					{
						$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_group SET sort_order = '0'");

						$attribute_group_id = $this->db->getLastId();
						
						foreach ($this->languages as $code => $lng) {
							$lng_code = str_replace('_', '-', $lng['code']);
							$attr_group_name = $attrs['translates'][$lng_code];
							
							$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_group_description SET attribute_group_id = '" . (int)$attribute_group_id . "', language_id = '" . (int)$lng['language_id'] . "', name = '" . $this->db->escape($attr_group_name) . "'");
						}
					}
					else
						$attribute_group_id = $all_attributes[$attr_group_name]['attribute_group_id'];
				//END Insert attributes groups

				//Insert attributes
					foreach ($attrs['attributes'] as $attr_name => $attributes) {

						if(!isset($all_attributes[$attr_group_name]['attributes'][$attr_name]))
						{
							$this->db->query("INSERT INTO " . DB_PREFIX . "attribute SET attribute_group_id = '" . (int)$attribute_group_id . "', sort_order = '0'");

							$attribute_id = $this->db->getLastId();

							foreach ($this->languages as $key => $lng) {
								$lng_code = str_replace('_', '-', $lng['code']);
								$attr_group_name = $attributes['translates'][$lng_code];
								$this->db->query("INSERT INTO " . DB_PREFIX . "attribute_description SET attribute_id = '" . (int)$attribute_id . "', language_id = '" . (int)$lng['language_id'] . "', name = '" . $this->db->escape($attr_group_name) . "'");
							}
						}
					}
				//END Insert attributes
			}
		}
		public function create_filters($xls_data, $pattern, $all_filters) {
	        $data = array(
                'message' => $this->language->get('progress_import_creating_filter')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

			$final_filters = array();
			foreach ($xls_data['data'] as $key => $data) {
				for ($i=1; $i <= $this->filgron; $i++) {
					$filter_group_index = !empty($pattern[$this->language->get('Filter Group').' '.$i]['index']) ? $pattern[$this->language->get('Filter Group').' '.$i]['index'] : '';

					for ($j=1; $j <= $this->filgrofiln; $j++) {
						$filter_index = !empty($pattern[$this->language->get('Filter Gr.').$i.' '.$this->language->get('filter').' '.$j]['index']) ? $pattern[$this->language->get('Filter Gr.').$i.' '.$this->language->get('filter').' '.$j]['index'] : '';
						if(
							!empty($filter_group_index) && !empty($filter_index) &&
							!empty($data[$filter_group_index]) && !empty($data[$filter_index])
						)
						{
							if(!isset($final_filters[$data[$filter_group_index]]))
								$final_filters[$data[$filter_group_index]] = array();

							$final_filters[$data[$filter_group_index]][] = $data[$filter_index];
						}
					}
				}
			}

			foreach ($final_filters as $key => $filters) {
				$final_filters[$key] = array_unique($filters);
			}

			foreach ($final_filters as $group_name => $filters) {
				if(!isset($all_filters[$group_name]))
				{
					$this->db->query("INSERT INTO `" . DB_PREFIX . "filter_group` SET sort_order = '0'");

					$filter_group_id = $this->db->getLastId();

					foreach ($this->languages as $key => $lng) {
						$this->db->query("INSERT INTO " . DB_PREFIX . "filter_group_description SET filter_group_id = '" . (int)$filter_group_id . "', language_id = '" . (int)$lng['language_id'] . "', name = '" . $this->db->escape($group_name) . "'");
					}
				}
				else
					$filter_group_id = $all_filters[$group_name]['filter_group_id'];

				foreach ($filters as $key => $filter) {
					if(!isset($all_filters[$group_name]['filters'][$filter]))
					{
						$this->db->query("INSERT INTO " . DB_PREFIX . "filter SET filter_group_id = '" . (int)$filter_group_id . "', sort_order = '0'");

						$filter_id = $this->db->getLastId();

						foreach ($this->languages as $key => $lng) {
							$this->db->query("INSERT INTO " . DB_PREFIX . "filter_description SET filter_id = '" . (int)$filter_id . "', language_id = '" . (int)$lng['language_id'] . "', filter_group_id = '" . (int)$filter_group_id . "', name = '" . $this->db->escape($filter) . "'");
						}
					}
				}
			}
		}
		public function create_downloads($xls_data, $pattern, $all_downloads) {
	        $data = array(
                'message' => $this->language->get('progress_import_creating_downloads')
            );
            $this->model_extension_module_import_export_xls->update_process($data);

			for ($i=1; $i <= $this->down ; $i++) {
				if($this->count_languages > 1)
					$index_download = !empty($pattern[$this->language->get('Download name').' '.$i.' '.$this->default_language_code]['index']) ? $pattern[$this->language->get('Download name').' '.$i.' '.$this->default_language_code]['index'] : false;
				else
					$index_download = !empty($pattern[$this->language->get('Download name').' '.$i]['index']) ? $pattern[$this->language->get('Download name').' '.$i]['index'] : false;


				if($index_download)
				{
					foreach ($xls_data['data'] as $key => $pro) {
						$download_name = !empty($pro[$index_download]) ? $pro[$index_download] : '';

						//Create file
						if(!empty($download_name) && !isset($all_downloads[$download_name]))
						{
							$index_file = !empty($pattern[$this->language->get('Download file '.$i)]['index']) ? $pattern[$this->language->get('Download file '.$i)]['index'] : false;
							$index_hash = !empty($pattern[$this->language->get('Download hash '.$i)]['index']) ? $pattern[$this->language->get('Download hash '.$i)]['index'] : false;
							$index_mask = !empty($pattern[$this->language->get('Download mask '.$i)]['index']) ? $pattern[$this->language->get('Download mask '.$i)]['index'] : false;

							if(!empty($index_file))
							{
								$download_file = $pro[$index_file];
								$download_hash = !empty($pro[$index_hash]) ? $pro[$index_hash] : $this->token(32);
								$download_mask = !empty($pro[$index_mask]) ? $pro[$index_mask] : $download_name;
								
								if($this->count_languages > 1)
								{
									$download_data = array(
										'filename' => $download_file.'.'.$download_hash,
										'mask' => $download_mask,
										'download_description' => array()
									);
			
									foreach ($this->languages as $lang_code => $lang) {

										$index_download_temp = !empty($pattern[$this->language->get('Download name').' '.$i.' '.$lang['code']]['index']) ? $pattern[$this->language->get('Download name').' '.$i.' '.$lang['code']]['index'] : $index_download;

										$download_data['download_description'][$lang['language_id']] = array('name' => !empty($pro[$index_download_temp]) ? $pro[$index_download_temp] : $download_name);
									}

									$this->model_catalog_download->addDownload($download_data);
									$all_downloads = $this->get_all_downloads();
								}
							}
						}
					}		
				}
			}
		}
    //</editor-fold>

    //<editor-fold desc="Functions another">
        private function autogenerate_seo_url($string) {

			$cyrylicFrom = array('А', 'Б', 'В', 'Г', 'Д', 'Е', 'Ё', 'Ж', 'З', 'И', 'Й', 'К', 'Л', 'М', 'Н', 'О', 'П', 'Р', 'С', 'Т', 'У', 'Ф', 'Х', 'Ц', 'Ч', 'Ш', 'Щ', 'Ъ', 'Ы', 'Ь', 'Э', 'Ю', 'Я', 'а', 'б', 'в', 'г', 'д', 'е', 'ё', 'ж', 'з', 'и', 'й', 'к', 'л', 'м', 'н', 'о', 'п', 'р', 'с', 'т', 'у', 'ф', 'х', 'ц', 'ч', 'ш', 'щ', 'ъ', 'ы', 'ь', 'э', 'ю', 'я');

	        $cyrylicTo   = array('A', 'B', 'W', 'G', 'D', 'Ie', 'Io', 'Z', 'Z', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'R', 'S', 'T', 'U', 'F', 'Ch', 'C', 'Tch', 'Sh', 'Shtch', '', 'Y', '', 'E', 'Iu', 'Ia', 'a', 'b', 'w', 'g', 'd', 'ie', 'io', 'z', 'z', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'r', 's', 't', 'u', 'f', 'ch', 'c', 'tch', 'sh', 'shtch', '', 'y', '', 'e', 'iu', 'ia');

			$from = array("Á", "À", "Â", "Ä", "Ă", "Ā", "Ã", "Å", "Ą", "Æ", "Ć", "Ċ", "Ĉ", "Č", "Ç", "Ď", "Đ", "Ð", "É", "È", "Ė", "Ê", "Ë", "Ě", "Ē", "Ę", "Ə", "Ġ", "Ĝ", "Ğ", "Ģ", "á", "à", "â", "ä", "ă", "ā", "ã", "å", "ą", "æ", "ć", "ċ", "ĉ", "č", "ç", "ď", "đ", "ð", "é", "è", "ė", "ê", "ë", "ě", "ē", "ę", "ə", "ġ", "ĝ", "ğ", "ģ", "Ĥ", "Ħ", "I", "Í", "Ì", "İ", "Î", "Ï", "Ī", "Į", "Ĳ", "Ĵ", "Ķ", "Ļ", "Ł", "Ń", "Ň", "Ñ", "Ņ", "Ó", "Ò", "Ô", "Ö", "Õ", "Ő", "Ø", "Ơ", "Œ", "ĥ", "ħ", "ı", "í", "ì", "i", "î", "ï", "ī", "į", "ĳ", "ĵ", "ķ", "ļ", "ł", "ń", "ň", "ñ", "ņ", "ó", "ò", "ô", "ö", "õ", "ő", "ø", "ơ", "œ", "Ŕ", "Ř", "Ś", "Ŝ", "Š", "Ş", "Ť", "Ţ", "Þ", "Ú", "Ù", "Û", "Ü", "Ŭ", "Ū", "Ů", "Ų", "Ű", "Ư", "Ŵ", "Ý", "Ŷ", "Ÿ", "Ź", "Ż", "Ž", "ŕ", "ř", "ś", "ŝ", "š", "ş", "ß", "ť", "ţ", "þ", "ú", "ù", "û", "ü", "ŭ", "ū", "ů", "ų", "ű", "ư", "ŵ", "ý", "ŷ", "ÿ", "ź", "ż", "ž");

			$to   = array("A", "A", "A", "A", "A", "A", "A", "A", "A", "AE", "C", "C", "C", "C", "C", "D", "D", "D", "E", "E", "E", "E", "E", "E", "E", "E", "G", "G", "G", "G", "G", "a", "a", "a", "a", "a", "a", "a", "a", "a", "ae", "c", "c", "c", "c", "c", "d", "d", "d", "e", "e", "e", "e", "e", "e", "e", "e", "g", "g", "g", "g", "g", "H", "H", "I", "I", "I", "I", "I", "I", "I", "I", "IJ", "J", "K", "L", "L", "N", "N", "N", "N", "O", "O", "O", "O", "O", "O", "O", "O", "CE", "h", "h", "i", "i", "i", "i", "i", "i", "i", "i", "ij", "j", "k", "l", "l", "n", "n", "n", "n", "o", "o", "o", "o", "o", "o", "o", "o", "o", "R", "R", "S", "S", "S", "S", "T", "T", "T", "U", "U", "U", "U", "U", "U", "U", "U", "U", "U", "W", "Y", "Y", "Y", "Z", "Z", "Z", "r", "r", "s", "s", "s", "s", "B", "t", "t", "b", "u", "u", "u", "u", "u", "u", "u", "u", "u", "u", "w", "y", "y", "y", "z", "z", "z");

			$from = array_merge($from, $cyrylicFrom);
			$to = array_merge($to, $cyrylicTo);

			$str = str_replace($from, $to, html_entity_decode($string, ENT_QUOTES, 'UTF-8'));

			$friendlyURL = htmlentities($str, ENT_COMPAT, "UTF-8", false);
		    $friendlyURL = preg_replace('/&([a-z]{1,2})(?:acute|circ|lig|grave|ring|tilde|uml|cedil|caron);/i','\1',$friendlyURL);
		    $friendlyURL = html_entity_decode($friendlyURL,ENT_COMPAT, "UTF-8");
		    $friendlyURL = preg_replace('/[^a-z0-9-]+/i', '-', $friendlyURL);
		    $friendlyURL = preg_replace('/-+/', '-', $friendlyURL);
		    $friendlyURL = trim($friendlyURL, '-');
		    $friendlyURL = strtolower($friendlyURL);

		    return $friendlyURL;
	    }
		function remove_duplicate($key,$data) {
			$_data = array();
			foreach ($data as $v) {
				if (isset($_data[$v[$key]])) {
					continue;
				}
				$_data[$v[$key]] = $v;
			}
			$data = array_values($_data);
			return $data;
		}
		function calculate_tax_rate($price, $type, $rate, $operation) {
			if($type == 'P')
				$price_tax = ($rate*$price) / 100;
			else
				$price_tax = $rate;

			if($operation == '+')
				return $price + $price_tax;
			else
				return $price - $price_tax;
		}
		function buildTree(array $data) {
			$tree = array();
		    foreach($data as &$v){
		    	if(array_key_exists('category_id', $v))
		    	{
					// Get childs
					if(isset($tree[$v['category_id']])) $v['childrens'] =& $tree[$v['category_id']];
					// push node into parent
					$tree[$v['parent_id']][$v['category_id']] =& $v;

					// push childrens into node
					$tree[$v['category_id']] =& $v['childrens'];
				}
			}

			// return Tree
			if(!empty($tree[0]))
				return $this->array_values_recursive($tree[0]);
			else
				return array();
		}
		function array_values_recursive( $array ) {
		    $newarray = array();
		    if(!empty($array))
		    {
				foreach ($array as $value) {
			        $value["childrens"] = $this->array_values_recursive($value["childrens"]);
			        $newarray[] = $value;
				}
			}
			return $newarray;
		}
		public function get_category_tree($categories, $name = '') {
			if(!empty($categories))
			{
				foreach ($categories as $key => $cat) {
					if($this->count_languages == 1)
					{
						if($cat['name'] == $name)
							return $cat;
					}
					else
					{
						foreach ($this->languages as $key2 => $lang) {
							if(array_key_exists($lang['language_id'], $cat['name']) && $cat['name'][$lang['language_id']] == $name)
								return $cat;
						}
					}
				}
			}

			return false;
		}
		public function get_index($pattern, $index) {
	        return array_key_exists($index, $pattern) && $pattern[$index]['created'] ? $pattern[$index]['index'] : false;
        }
        public function format_column_name($col_name) {
            $col_name_format = str_replace(' ', '_', $col_name);
            $col_name_format = str_replace('-', '_', $col_name_format);
            $col_name_format = str_replace('.', '_', $col_name_format);
            $col_name_format = str_replace('*', '', $col_name_format);
            $col_name_format = str_replace('(', '', $col_name_format);
            $col_name_format = str_replace(')', '', $col_name_format);
            $col_name_format = strtolower($col_name_format);

            return $col_name_format;
        }
		public function token($length = 32) {
			// Create random token
			$string = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
			
			$max = strlen($string) - 1;
			
			$token = '';
			
			for ($i = 0; $i < $length; $i++) {
				$token .= $string[mt_rand(0, $max)];
			}	
			
			return $token;
		}
    //</editor-fold>
}
?>