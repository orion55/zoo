<?php
class ModelExtensionModuleExportXls extends ModelExtensionModuleImportExportXls {

	public function __construct($registry) {
        parent::__construct($registry);

        $loader = new Loader($registry);
		$loader->model('extension/module/import_xls');
	}

    //<editor-fold desc="Export products">
        public function format_products($product, $all_options, $all_attributes, $all_filters, $all_manufacturers, $all_categories) {
            $general_data = array();
            $final_products = array();

            //Product ID
                $general_data[$this->formatted_product_id] = $product['product_id'];
            //Model
                $general_data[$this->formatted_model] = !empty($product['model']) ? htmlspecialchars_decode($product['model']) : '';
            //Name
                $general_data[$this->formatted_name] = !empty($product['name']) ? htmlspecialchars_decode($product['name']) : '';
            //Description
                $general_data[$this->formatted_description] = !empty($product['description']) ? htmlspecialchars_decode($product['description']) : '';
                if($this->column_product_description_enabled && strlen($general_data[$this->formatted_description]) > 32767) {
                    $error_text = '<b>Trying to add a value that exceeds the maximum number of characters allowed in a cell 32,767</b><br>';
                    $error_text .= '<b>Field:</b> description<br>';
                    $error_text .= '<b>Product name:</b> '.$general_data[$this->formatted_name].'<br>';
                    $error_text .= '<b>Product model:</b> '.$general_data[$this->formatted_model];
                    throw new Exception($error_text);
                }
            //Meta description
                $general_data[$this->formatted_meta_description] = !empty($product['meta_description']) ? htmlspecialchars_decode($product['meta_description']) : '';
            //Meta title
                $general_data[$this->formatted_meta_title] = !empty($product['meta_title']) ? htmlspecialchars_decode($product['meta_title']) : '';
            //Meta keywords
                $general_data[$this->formatted_meta_keywords] = !empty($product['meta_keyword']) ? htmlspecialchars_decode($product['meta_keyword']) : '';
            //SEO url
                $general_data[$this->formatted_seo_url] = !empty($product['keyword']) ? htmlspecialchars_decode($product['keyword']) : '';
            //Tags
                $general_data[$this->formatted_tags] = !empty($product['tag']) ? htmlspecialchars_decode($product['tag']) : '';
            //SKU
                $general_data[$this->formatted_sku] = !empty($product['sku']) ? htmlspecialchars_decode($product['sku']) : '';
            //EAN
                $general_data[$this->formatted_ean] = !empty($product['ean']) ? htmlspecialchars_decode($product['ean']) : '';
            //UPC
                $general_data[$this->formatted_upc] = !empty($product['upc']) ? htmlspecialchars_decode($product['upc']) : '';
            //JAN
                $general_data[$this->formatted_jan] = !empty($product['jan']) ? htmlspecialchars_decode($product['jan']) : '';
            //MPN
                $general_data[$this->formatted_mpn] = !empty($product['mpn']) ? htmlspecialchars_decode($product['mpn']) : '';
            //ISBN
                $general_data[$this->formatted_isbn] = !empty($product['isbn']) ? htmlspecialchars_decode($product['isbn']) : '';
            //Quantity
                $general_data[$this->formatted_quantity] = $product['quantity'];
            //Minimum
                $general_data[$this->formatted_minimum] = $product['minimum'];
            //Subtract
                $general_data[$this->formatted_subtract] = $product['subtract'];
            //Out stock status
                $general_data[$this->formatted_out_of_status] = $product['stock_status_id'];
            //Price
                $general_data[$this->formatted_price] = $product['price'];
            //Deleted
                $general_data[$this->formatted_deleted] = '';

            //Add extra product fields here

            //Multilanguage description
                if($this->count_languages > 1)
                {
                    foreach ($this->languages as $key => $lang) {
                        $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "product_description` WHERE language_id = ".$lang['language_id']." AND product_id = ".$product['product_id'].";";
                        $descriptions = $this->db->query($temporal_sql);

                        $general_data[$this->formatted_name.'_'.$lang['code']] = !empty($descriptions->row['name']) ? $descriptions->row['name'] : '';
                        $general_data[$this->formatted_description.'_'.$lang['code']] = !empty($descriptions->row['description']) ? $descriptions->row['description'] : '';
                        $general_data[$this->formatted_meta_description.'_'.$lang['code']] = !empty($descriptions->row['meta_description']) ? $descriptions->row['meta_description'] : '';
                        $general_data[$this->formatted_meta_keywords.'_'.$lang['code']] = !empty($descriptions->row['meta_keyword']) ? $descriptions->row['meta_keyword'] : '';
                        $general_data[$this->formatted_tags.'_'.$lang['code']] = !empty($descriptions->row['tag']) ? $descriptions->row['tag'] : '';

                        if(version_compare(VERSION, '2.0.0.0', '>='))
                            $general_data[$this->formatted_meta_title.'_'.$lang['code']] = !empty($descriptions->row['meta_title']) ? $descriptions->row['meta_title'] : '';
                    }
                }
            //END Multilanguage description

            //Devman Extensions - info@devmanextensions.com - 2017-07-03 20:12:04 - SEO Url multilanguage more than Opencart 3.0.0.0
                if($this->is_oc_3x) {
                    if($this->count_languages > 1)
                    {
                        foreach ($this->languages as $key => $lang) {
                            if($this->stores_count > 1)
                            {
                                foreach ($this->stores_import_format as $key2 => $sto) {
                                    $store_id = $sto['store_id'];
                                    $general_data['seo_url_'.$store_id.'_'.$lang['code']] = !empty($product['product_seo_url'][$store_id][$lang['language_id']]) ? $product['product_seo_url'][$store_id][$lang['language_id']] : '';
                                }
                            }
                            else
                                $general_data['seo_url_'.$lang['code']] = !empty($product['product_seo_url'][0][$lang['language_id']]) ? $product['product_seo_url'][0][$lang['language_id']] : '';
                        }
                    }elseif($this->stores_count > 1)
                    {
                        foreach ($this->stores_import_format as $key2 => $sto) {
                            $store_id = $sto['store_id'];
                            $general_data['seo_url_'.$store_id] = !empty($product['product_seo_url'][$store_id][$this->default_language_id]) ? $product['product_seo_url'][$store_id][$this->default_language_id] : '';
                        }
                    } elseif($this->stores_count == 1 && $this->count_languages == 1)
                    {
                        foreach ($this->stores_import_format as $key2 => $sto) {
                            $store_id = $sto['store_id'];
                            $general_data['seo_url'] = !empty($product['product_seo_url'][$store_id][$this->default_language_id]) ? $product['product_seo_url'][$store_id][$this->default_language_id] : '';
                        }
                    }
                }
            //END

            //Special
                foreach ($this->customer_groups_format_export as $key => $cg) {
                    $cgn = $this->model_extension_module_import_xls->format_column_name($cg);
                    for ($i=1; $i <= $this->spen; $i++) {
                        $general_data[$this->formatted_spe.$i.$this->formatted_special_priority.'_'.$cgn] = '';
                        $general_data[$this->formatted_spe.$i.$this->formatted_special_price.'_'.$cgn] = '';
                        $general_data[$this->formatted_spe.$i.$this->formatted_special_date_start.'_'.$cgn] = '';
                        $general_data[$this->formatted_spe.$i.$this->formatted_special_date_end.'_'.$cgn] = '';
                    }
                }
                if (!empty($product['product_special']))
                {
                    foreach ($product['product_special'] as $key => $special) {
                        $cgn = $this->model_extension_module_import_xls->format_column_name($this->customer_groups_format_export[$special['customer_group_id']]);

                        $count = 1;
                        $inserted = false;
                        while (!$inserted) {
                            $key_temp = $this->formatted_spe.$count.$this->formatted_special_price.'_'.$cgn;
                            if(empty($general_data[$key_temp])) {
                                $inserted = true;
                                $general_data[$this->formatted_spe.$count.$this->formatted_special_priority.'_'.$cgn] = $special['priority'];
                                $general_data[$this->formatted_spe.$count.$this->formatted_special_price.'_'.$cgn] = $special['price'];
                                $general_data[$this->formatted_spe.$count.$this->formatted_special_date_start.'_'.$cgn] = $special['date_start'];
                                $general_data[$this->formatted_spe.$count.$this->formatted_special_date_end.'_'.$cgn] = $special['date_end'];
                            }
                            $count++;
                        }
                    }
                }

            //Discounts
                foreach ($this->customer_groups_format_export as $key => $cg) {
                    $cgn = $this->model_extension_module_import_xls->format_column_name($cg);
                    for ($i=1; $i <= $this->spen; $i++) {
                        $general_data[$this->formatted_dis.$i.$this->formatted_dis_quantity.'_'.$cgn] = '';
                        $general_data[$this->formatted_dis.$i.$this->formatted_dis_priority.'_'.$cgn] = '';
                        $general_data[$this->formatted_dis.$i.$this->formatted_dis_price.'_'.$cgn] = '';
                        $general_data[$this->formatted_dis.$i.$this->formatted_dis_date_start.'_'.$cgn] = '';
                        $general_data[$this->formatted_dis.$i.$this->formatted_dis_date_end.'_'.$cgn] = '';
                    }
                }
                if (!empty($product['product_discount']))
                {
                    foreach ($product['product_discount'] as $key => $discount) {
                        $cgn = $this->model_extension_module_import_xls->format_column_name($this->customer_groups_format_export[$discount['customer_group_id']]);

                        $count = 1;
                        $inserted = false;
                        while (!$inserted) {
                            $key_temp = $this->formatted_dis.$count.$this->formatted_dis_price.'_'.$cgn;
                            if(empty($general_data[$key_temp])) {
                                $inserted = true;
                                $general_data[$this->formatted_dis.$count.$this->formatted_dis_quantity.'_'.$cgn] = $discount['quantity'];
                                $general_data[$this->formatted_dis.$count.$this->formatted_dis_priority.'_'.$cgn] = $discount['priority'];
                                $general_data[$this->formatted_dis.$count.$this->formatted_dis_price.'_'.$cgn] = $discount['price'];
                                $general_data[$this->formatted_dis.$count.$this->formatted_dis_date_start.'_'.$cgn] = $discount['date_start'];
                                $general_data[$this->formatted_dis.$count.$this->formatted_dis_date_end.'_'.$cgn] = $discount['date_end'];
                            }
                            $count++;
                        }

                    }
                }

            //Manufacturer
                $general_data[$this->formatted_manufacturer] = !empty($all_manufacturers[$product['manufacturer_id']]) ? $all_manufacturers[$product['manufacturer_id']]: '';


            if(!$this->config->get('import_xls_categories_tree'))
            {
                for ($i=1; $i <= $this->catindn; $i++) {
                    if($this->count_languages == 1)
                    {
                        $general_data[$this->formatted_cat.'_'.$i] = '';
                    }
                    else
                    {
                        foreach ($this->languages as $key => $lang) {
                            $general_data[$this->formatted_cat.'_'.$i.'_'.$lang['code']] = '';
                        }
                    }
                }
            }
            else
            {
                for ($i=1; $i <= $this->cattren ; $i++) {
                    for ($j=0; $j <= $this->cattrechin ; $j++) {
                        if($this->count_languages == 1)
                        {
                            $cat_column_name = $this->formatted_cat_tree.'_'.$i.($j == 0 ? '_'.$this->formatted_cat_parent : '_'.$this->formatted_cat_level.'_'.$j);
                            $general_data[$cat_column_name] = '';
                        }
                        else
                        {
                            foreach ($this->languages as $key => $lang) {
                                $cat_column_name = $this->formatted_cat_tree.'_'.$i.($j == 0 ? '_'.$this->formatted_cat_parent.'_'.$lang['code'] : '_'.$this->formatted_cat_level.'_'.$j.'_'.$lang['code']);
                                $general_data[$cat_column_name] = '';
                            }
                        }
                    }
                }
            }

            if(!empty($product['product_categories']))
            {
                if(!$this->config->get('import_xls_categories_tree'))
                {
                    $count_categories_assigns = 1;
                    foreach ($product['product_categories'] as $key => $cat_id) {
                        if($this->count_languages == 1)
                            $general_data[$this->formatted_cat.'_'.($key+1)] = !empty($all_categories[$cat_id]) ? $all_categories[$cat_id] : '';
                        else
                        {
                            foreach ($this->languages as $lang) {
                                $general_data[$this->formatted_cat.'_'.($key+1).'_'.$lang['code']] = !empty($all_categories[$cat_id][$lang['language_id']]) ? $all_categories[$cat_id][$lang['language_id']] : '';
                            }
                        }
                        if(($key+1) == $this->catindn)
                            break;
                    }
                }
                else
                {
                    $category_tree = $this->get_full_category_tree($product['product_categories']);
                    if(!empty($category_tree))
                    {
                        if($this->count_languages == 1)
                        {
                            for ($i=1; $i <= $this->cattren ; $i++) {
                                $parent_name = !empty($category_tree[($i-1)]['name']) ? $category_tree[($i-1)]['name'] : '';
                                $parent_childrens = !empty($category_tree[($i-1)]['childrens']) ? $category_tree[($i-1)]['childrens'] : array();

                                if(!empty($parent_name))
                                {
                                    $general_data[$this->formatted_cat_tree.'_'.$i.'_'.$this->formatted_cat_parent] = $parent_name;

                                    if(!empty($parent_childrens))
                                    {
                                        for ($j=1; $j <= $this->cattrechin ; $j++) {
                                            if(!empty($parent_childrens))
                                            {
                                                $parent_name = !empty($parent_childrens[0]['name']) ? $parent_childrens[0]['name'] : '';

                                                if(!empty($parent_name))
                                                    $general_data[$this->formatted_cat_tree.'_'.$i.'_'.$this->formatted_cat_level.'_'.$j] = $parent_name;

                                                $parent_childrens = !empty($parent_childrens[0]['childrens']) ? $parent_childrens[0]['childrens'] : array();
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        else
                        {
                            foreach ($this->languages as $key => $lang) {
                                for ($i=1; $i <= $this->cattren ; $i++) {
                                    $parent_name = !empty($category_tree[($i-1)]['name'][$lang['language_id']]) ? $category_tree[($i-1)]['name'][$lang['language_id']] : '';
                                    $parent_childrens = !empty($category_tree[($i-1)]['childrens']) ? $category_tree[($i-1)]['childrens'] : array();

                                    if(empty($parent_name))
                                        $parent_name = !empty($category_tree[($i-1)]['name'][$this->default_language_id]) ? $category_tree[($i-1)]['name'][$this->default_language_id] : '';

                                    if(!empty($parent_name))
                                    {
                                        $general_data[$this->formatted_cat_tree.'_'.$i.'_'.$this->formatted_cat_parent.'_'.$lang['code']] = $parent_name;

                                        if(!empty($parent_childrens))
                                        {
                                            for ($j=1; $j <= $this->cattrechin ; $j++) {
                                                if(!empty($parent_childrens))
                                                {
                                                    $parent_name = !empty($parent_childrens[0]['name'][$lang['language_id']]) ? $parent_childrens[0]['name'][$lang['language_id']] : '';

                                                    if(empty($parent_name))
                                                        $parent_name = !empty($parent_childrens[0]['name'][$this->default_language_id]) ? $parent_childrens[0]['name'][$this->default_language_id] : '';

                                                    if(!empty($parent_name))
                                                        $general_data[$this->formatted_cat_tree.'_'.$i.'_'.$this->formatted_cat_level.'_'.$j.'_'.$lang['code']] = $parent_name;

                                                    $parent_childrens = !empty($parent_childrens[0]['childrens']) ? $parent_childrens[0]['childrens'] : array();
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }

            //Main image
                $general_data[$this->formatted_main_image] = !empty($product['image']) ? $product['image'] : '';

            //Image 2 - Image 3 - Image 4 - Image 5
                for ($i=1; $i <= $this->extimgn; $i++) {
                    $general_data[$this->formatted_image.'_'.($i+1)] = '';
                }

                if(!empty($product['product_images']))
                {
                    foreach ($product['product_images'] as $key => $img) {
                        $general_data[$this->formatted_image.'_'.($key+2)] = $img['image'];
                    }
                }
            //Devman Extensions - info@devmanextensions.com - 2016-12-29 14:44:17 - Related products
                $general_data[$this->formatted_products_related] = '';
                if(!empty($product['related']))
                {
                    $string_model_related = '';

                    foreach ($product['related'] as $count => $product_id) {
                        $result = $this->db->query("SELECT model FROM " . DB_PREFIX . "product WHERE product_id = ".$product_id);
                        if(!empty($result->row['model']))
                            $string_model_related .= $result->row['model'];

                        if(($count+1) < count($product['related']))
                            $string_model_related .= ',';
                        # code...
                    }
                    $general_data[$this->formatted_products_related] = $string_model_related;
                }
            //END

            //Date available
                $general_data[$this->formatted_date_available] = !empty($product['date_available']) ? $product['date_available'] : date('Y-m-d');
            //Points
                $general_data[$this->formatted_points] = !empty($product['points']) ? $product['points'] : 0;

                foreach ($this->customer_groups as $key => $cg) {
                    $customer_group_name = $this->model_extension_module_import_xls->format_column_name($cg['name']);
                    $general_data[$this->formatted_points.'_'.$customer_group_name] = !empty($product['product_reward'][$cg['customer_group_id']]['points']) ? $product['product_reward'][$cg['customer_group_id']]['points'] : 0;
                }
            //Requires shipping
                $general_data[$this->formatted_requires_shipping] = isset($product['shipping']) && $product['shipping'] == 0 ? 0 : 1;
            //Location
                $general_data[$this->formatted_location] = !empty($product['location']) ? $product['location'] : '';
            //Tax class
                $general_data[$this->formatted_tax_class] = !empty($product['tax_class_id']) ? $product['tax_class_id'] : '';
            //Sort order
                $general_data[$this->formatted_sort_order] = !empty($product['sort_order']) ? $product['sort_order'] : 0;
            //Store
                $stores = '';
                foreach ($product['product_store'] as $key => $store) {
                    $stores .= $store;
                    if($key+1 < count($product['product_store']))
                        $stores .= "|";
                }
                $general_data[$this->formatted_store] = !empty($stores) ? $stores : 0;
            //Status
                $general_data[$this->formatted_status] = $product['status'];
            //Class weight
                $general_data[$this->formatted_class_weight] = !empty($product['weight_class_id']) ? $product['weight_class_id'] : '';
            //Weight
                $general_data[$this->formatted_weight] = !empty($product['weight']) ? $product['weight'] : '';
            //Class length
                $general_data[$this->formatted_class_length] = !empty($product['length_class_id']) ? $product['length_class_id'] : '';
            //Length
                $general_data[$this->formatted_length] = !empty($product['length']) ? $product['length'] : '';
            //Width
                $general_data[$this->formatted_width] = !empty($product['width']) ? $product['width'] : '';
            //Height
                $general_data[$this->formatted_height] = !empty($product['height']) ? $product['height'] : '';
            //Downloads
                for ($i=1; $i <= $this->down; $i++) {
                    if($this->count_languages == 1)
                    {
                        $general_data[$this->formatted_download.'_'.$i] = '';
                    }
                    else
                    {
                        foreach ($this->languages as $key => $lang) {
                            $general_data[$this->formatted_download.'_'.$i.'_'.$lang['code']] = '';
                        }
                    }

                    $general_data[$this->formatted_download_file.'_'.$i] = '';
                    $general_data[$this->formatted_download_hash.'_'.$i] = '';
                    $general_data[$this->formatted_download_mask.'_'.$i] = '';
                }

                foreach ($product['product_download'] as $key => $download_id) {
                    $download = $this->all_downloads_export_format[$download_id];

                    if($this->count_languages == 1)
                        $general_data[$this->formatted_download.'_'.($key+1)] = $download['mask'];
                    else
                    {
                        foreach ($this->languages as $lang) {
                            $general_data[$this->formatted_download.'_'.($key+1).'_'.$lang['code']] = $download['name'][$lang['code']];
                        }
                    }

                    $general_data[$this->formatted_download_file.'_'.($key+1)] = $download['filename'];
                    $general_data[$this->formatted_download_hash.'_'.($key+1)] = $download['hash'];
                    $general_data[$this->formatted_download_mask.'_'.($key+1)] = $download['mask'];
                }
            //Layout
                $general_data[$this->formatted_layout] = !empty($product['product_layout'][0]) ? $product['product_layout'][0] : '';

            //Add extra general data here

            //Attributes
                for ($i=1; $i <= $this->attn; $i++) {
                    if($this->count_languages == 1)
                    {
                        $general_data[$this->formatted_attr_group.'_'.$i] = '';
                        $general_data[$this->formatted_attr_attribute.'_'.$i] = '';
                        $general_data[$this->formatted_attr_value.'_'.$i] = '';
                    }
                    else
                    {
                        foreach ($this->languages as $key => $lang) {
                            $general_data[$this->formatted_attr_group.'_'.$i.'_'.$lang['code']] = '';
                            $general_data[$this->formatted_attr_attribute.'_'.$i.'_'.$lang['code']] = '';
                            $general_data[$this->formatted_attr_value.'_'.$i.'_'.$lang['code']] = '';
                        }
                    }
                }

                $count_attributes = 1;
                foreach ($product['product_attributes'] as $key => $attr) {
                    if($this->count_languages == 1)
                    {
                        if(array_key_exists($attr['attribute_id'], $all_attributes)) {
                            $general_data[$this->formatted_attr_group . '_' . ($key + 1)] = htmlspecialchars_decode($all_attributes[$attr['attribute_id']]['attribute_group_name']);
                            $general_data[$this->formatted_attr_attribute . '_' . ($key + 1)] = htmlspecialchars_decode($all_attributes[$attr['attribute_id']]['attribute_name']);
                            $general_data[$this->formatted_attr_value . '_' . ($key + 1)] = htmlspecialchars_decode($attr['product_attribute_description'][(int)$this->config->get('config_language_id')]['text']);
                        } else {
                            $count_attributes--;
                        }
                    }
                    else
                    {
                        foreach ($this->languages as $key2 => $lang) {
                            $attr_group_name = !empty($all_attributes[$attr['attribute_id']]['translates_attribute_group'][$lang['code']]) ? $all_attributes[$attr['attribute_id']]['translates_attribute_group'][$lang['code']] : '';
                            $general_data[$this->formatted_attr_group.'_'.($key+1).'_'.$lang['code']] = htmlspecialchars_decode($attr_group_name);

                            $attr_name = !empty($all_attributes[$attr['attribute_id']]['translates_attribute'][$lang['code']]) ? $all_attributes[$attr['attribute_id']]['translates_attribute'][$lang['code']] : '';
                            $general_data[$this->formatted_attr_attribute.'_'.($key+1).'_'.$lang['code']] = htmlspecialchars_decode($attr_name);

                            $attr_value = !empty($attr['product_attribute_description'][$lang['language_id']]['text']) ? $attr['product_attribute_description'][$lang['language_id']]['text'] : '';
                            $general_data[$this->formatted_attr_value.'_'.($key+1).'_'.$lang['code']] = htmlspecialchars_decode($attr_value);
                        }
                    }

                    $count_attributes++;

                    if($count_attributes > $this->attn)
                        break;
                }

            //Filters
                //Group product filters in filter groups.
                for ($i=1; $i <= $this->filgron ; $i++) {
                    $general_data[$this->formatted_filter_group.'_'.$i] = '';
                    for ($j=1; $j <= $this->filgrofiln; $j++) {
                        $general_data[$this->formatted_filter_gro.$i.'_'.$this->formatted_filter.'_'.$j] = '';
                    }
                }

                $final_filters = array();

                //Devman Extensions - info@devmanextensions.com - 2016-12-21 17:47:45 - Fix to Opencart versions that hasn't filters
                if(!isset($product['product_filters']))
                    $product['product_filters'] = array();

                foreach ($product['product_filters'] as $key => $filter_id) {
                    $id_group = !empty($all_filters[$filter_id]['filter_group_id']) ? $all_filters[$filter_id]['filter_group_id'] : '';
                    if(!empty($id_group))
                    {
                        if(!isset($final_filters[$id_group]))
                            $final_filters[$id_group] = array('group_name' => $all_filters[$filter_id]['group_name'], 'filters' => array());

                        array_push($final_filters[$id_group]['filters'], $all_filters[$filter_id]['name']);
                    }
                }
                $count_group_filters = 1;

                foreach ($final_filters as $key => $group_filter) {
                    $general_data[$this->formatted_filter_group.'_'.$count_group_filters] = $group_filter['group_name'];
                    $count_filters = 1;
                    foreach ($group_filter['filters'] as $key2 => $filter) {
                        if($count_filters > $this->filgrofiln)
                            break;
                        $general_data[$this->formatted_filter_gro.$count_group_filters.'_'.$this->formatted_filter.'_'.$count_filters] = $filter;

                        $count_filters++;
                    }
                    $count_group_filters++;

                    if($count_group_filters > $this->filgron)
                        break;
                }

            //Options
                $general_data[$this->formatted_option] = '';

                if($this->count_languages > 1)
                {
                    foreach ($this->languages as $key => $lang) {
                        $general_data[$this->formatted_option.'_'.$lang['code']] = '';
                        $general_data[$this->formatted_option_value.'_'.$lang['code']] = '';
                    }
                }

                $general_data[$this->formatted_option_type] = '';
                $general_data[$this->formatted_option_required] = '';
                $general_data[$this->formatted_option_value] = '';
                $general_data[$this->formatted_option_value_sort_order] = '';
                $general_data[$this->formatted_option_subtract] = '';
                $general_data[$this->formatted_option_image] = '';
                $general_data[$this->formatted_option_price_prefix] = '';
                $general_data[$this->formatted_option_points_prefix] = '';
                $general_data[$this->formatted_option_weight_prefix] = '';
                $general_data[$this->formatted_option_ob_sku] = '';
                $general_data[$this->formatted_option_ob_image] = '';

                if (empty($product['product_options']))
                {
                    $final_products[] = $general_data;
                }
                else
                {
                    //Devman Extensions - info@devmanextensions.com - 2016-12-24 18:52:14 - The first row contain general data products
                        $final_products[] = $general_data;

                    //Devman Extensions - info@devmanextensions.com - 2016-12-25 15:54:43 - FIll empty all fields
                        foreach ($general_data as $field_name => $value) {

                            $is_name_field = false;
                            if($this->count_languages > 1)
                            {
                                foreach ($this->languages as $lang) {
                                    if($field_name == $this->formatted_name.'_'.$lang['code'])
                                    {
                                        $is_name_field = true;
                                        break;
                                    }
                                }
                            }

                            if(
                                !in_array($field_name, array($this->formatted_model, $this->formatted_name))
                                &&
                                !$is_name_field
                            )
                                $general_data[$field_name] = '';
                        }
                    //END

                    $general_data['is_option'] = true;

                    foreach ($product['product_options'] as $key => $opt) {

                        $option_values = $general_data;

                        $option_values[$this->formatted_option] = $opt['name'];
                        $option_values[$this->formatted_option_type] = $opt['type'];
                        $option_values[$this->formatted_option_required] = $opt['required'];

                        if(!in_array($opt['type'], array('text', 'textarea', 'date', 'datetime', 'file')))
                        {
                            foreach ($opt['product_option_value'] as $key2 => $opt_val) {
                                //Option value image
                                    if(version_compare(VERSION, '1.5.1.3', '>') && !empty($opt_val['option_value_id']))
                                    {
                                        $temporal_sql = "SELECT image FROM `" . DB_PREFIX . "option_value` WHERE option_value_id = ".$opt_val['option_value_id'].";";
                                        $result = $this->db->query( $temporal_sql );

                                        if(!empty($result->row['image']))
                                            $option_values[$this->formatted_option_image] = $result->row['image'];
                                    }
                                //END Option value image

                                $option_values[$this->formatted_price] = $opt_val['price'];
                                $option_values[$this->formatted_points] = $opt_val['points'];
                                $option_values[$this->formatted_weight] = $opt_val['weight'];
                                $option_values[$this->formatted_option_price_prefix] = $opt_val['price_prefix'];
                                $option_values[$this->formatted_option_points_prefix] = $opt_val['points_prefix'];
                                $option_values[$this->formatted_option_weight_prefix] = $opt_val['weight_prefix'];
                                $option_values[$this->formatted_option_weight_prefix] = $opt_val['weight_prefix'];

                                //Devman Extensions - info@devmanextensions.com - 2017-04-22 16:59:21 - Option values sort order
                                $option_value_sort_order = !empty($this->opt_values_sort_order[$opt_val['option_value_id']]) ? $this->opt_values_sort_order[$opt_val['option_value_id']] : 0;
                                $option_values[$this->formatted_option_value_sort_order] = $option_value_sort_order;

                                $option_values[$this->formatted_quantity] = $opt_val['quantity'];

                                $option_values[$this->formatted_option_value] = '';

                                if(!empty($all_options[$opt['option_id']]['option_values'][$opt_val['option_value_id']]))
                                {
                                    $option_values[$this->formatted_option_value] = htmlspecialchars_decode($all_options[$opt['option_id']]['option_values'][$opt_val['option_value_id']]);

                                    if($this->count_languages > 1)
                                    {
                                        foreach ($this->languages as $key => $lang) {
                                            //BEGIN Option
                                                $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "option_description` WHERE language_id = ".$lang['language_id']." AND option_id = ".$opt['option_id'].";";
                                                $descriptions =
                                                $this->db->query($temporal_sql);
                                                $option_values[$this->formatted_option.'_'.$lang['code']] = !empty($descriptions->row['name']) ? $descriptions->row['name'] : '';
                                            //END Option

                                            //BEGIN Option value
                                                $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "option_value_description` WHERE language_id = ".$lang['language_id']." AND option_value_id = ".$opt_val['option_value_id'].";";
                                                $descriptions = $this->db->query($temporal_sql);
                                                $option_values[$this->formatted_option_value.'_'.$lang['code']] = !empty($descriptions->row['name']) ? $descriptions->row['name'] : '';
                                            //END Option value
                                        }
                                    }
                                }

                                $option_values[$this->formatted_option_subtract] = $opt_val['subtract'];
                                $option_values[$this->formatted_option_ob_sku] = !empty($opt_val['sku']) ? $opt_val['sku'] : '';
                                $option_values[$this->formatted_option_ob_image] = !empty($opt_val['image']) ? $opt_val['image'] : '';
                                $final_products[] = $option_values;
                            }
                        }
                        else
                        {
                            $value = array_key_exists('value', $opt) ? $opt['value'] : (array_key_exists('option_value', $opt) ? $opt['option_value'] : '');
                            $option_values[$this->formatted_option_value] = $value;

                            if($this->count_languages > 1)
                            {
                                foreach ($this->languages as $key => $lang) {
                                    //BEGIN Option
                                        $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "option_description` WHERE language_id = ".$lang['language_id']." AND option_id = ".$opt['option_id'].";";
                                        $descriptions =
                                        $this->db->query($temporal_sql);
                                        $option_values[$this->formatted_option.'_'.$lang['code']] = !empty($descriptions->row['name']) ? $descriptions->row['name'] : '';
                                    //END Option

                                    $option_values[$this->formatted_option_value.'_'.$lang['code']] = !empty($opt['value']) ? $opt['value'] : '';
                                }
                            }

                            $final_products[] = $option_values;
                        }
                    }
                }
            return $final_products;
        }
    //</editor-fold>

    //<editor-fold desc="Export categories">
        public function format_categories_tree_to_export($conditions = array()) {
			$categories_tree = $this->model_catalog_category->getCategories(true);
			foreach ($categories_tree as $key => $cat) {
				$categories_tree[$key]['name'] = htmlspecialchars_decode($cat['name']);
			}

			$final_cat_tree = array();

			foreach ($categories_tree as $key => $value) {
				$final_cat_tree[] = explode('>', $value['name']);
			}

			foreach ($final_cat_tree as $key => $cats) {
				foreach ($cats as $key2 => $cat) {
					$final_cat_tree[$key][$key2] = trim($cat, '&nbsp;');
				}
			}

			return $final_cat_tree;
		}
		public function get_categories_tree_columns_names($categories_tree) {
			//Devman Extensions - info@devmanextensions.com - 2017-09-22 08:32:23 - Get max count
			$max_count = $this->get_categories_max_count($categories_tree);
			$columns = array();
			for ($i=1; $i <= $max_count; $i++) { 
				$columns[] = $this->language->get('Category level '.$i);
			}

			return $columns;
		}
		public function format_categories_datas_to_export($query) {
	        $results = $this->db->query($query);

	        $final_categories = array();
	        
	        if(!empty($results->rows)) {
                foreach ($results->rows as $cat) {
                    $category_id = $cat['category_id'];
                    $cat_descriptions = $this->model_catalog_category->getCategoryDescriptions($category_id);
                    $cat_info = $this->model_catalog_category->getCategory($category_id);
                    $cat_filters = $this->model_catalog_category->getCategoryFilters($category_id);
                    $cat_stores = $this->model_catalog_category->getCategoryStores($category_id);

                    $temp = array();

                    $temp[$this->formatted_cat_id] = $cat_info['category_id'];

                    if($this->count_languages > 1)
                    {
                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_cat_name.'_'.$lang['code']] = htmlspecialchars_decode($cat_descriptions[$language_id]['name']);
                            $temp[$this->formatted_cat_description.'_'.$lang['code']] = htmlspecialchars_decode($cat_descriptions[$language_id]['description']);

                            if(version_compare(VERSION, '2', '>='))
                                $temp[$this->formatted_cat_meta_title.'_'.$lang['code']] = $cat_descriptions[$language_id]['meta_title'];

                            $temp[$this->formatted_cat_meta_description.'_'.$lang['code']] = $cat_descriptions[$language_id]['meta_description'];
                            $temp[$this->formatted_cat_meta_keyword.'_'.$lang['code']] = $cat_descriptions[$language_id]['meta_keyword'];
                        }
                    }
                    else
                    {
                        foreach ($cat_descriptions as $language_id => $description) {
                            $temp[$this->formatted_cat_name] = htmlspecialchars_decode($description['name']);
                            $temp[$this->formatted_cat_description] = htmlspecialchars_decode($description['description']);
                            if(version_compare(VERSION, '2', '>='))
                                $temp[$this->formatted_cat_meta_title] = $description['meta_title'];
                            $temp[$this->formatted_cat_meta_description] = $description['meta_description'];
                            $temp[$this->formatted_cat_meta_keyword] = $description['meta_keyword'];
                        }
                    }

                    //Parent
                        $parent_name = '';
                        if(!empty($cat_info['parent_id']))
                        {
                            $category_parent = $this->model_catalog_category->getCategory($cat_info['parent_id']);
                            $parent_name = array_key_exists('name', $category_parent) ? htmlspecialchars_decode($category_parent['name']) : '';
                        }
                        $temp[$this->formatted_cat_parent] = $parent_name;
                    //END

                    //Devman Extensions - info@devmanextensions.com - 2017-07-03 20:12:04 - SEO Url multilanguage more than Opencart 3.0.0.0
                        $seo_url_oc3 = $this->is_oc_3x && ($this->count_languages > 1 || $this->stores_count > 1);
                        if($seo_url_oc3) {
                            $seo_urls = $this->model_catalog_category->getCategorySeoUrls($category_id);
                            if($this->count_languages > 1)
                            {
                                foreach ($this->languages as $key => $lang) {
                                    if($this->stores_count > 1)
                                    {
                                        foreach ($this->stores_import_format as $key2 => $sto) {
                                            $store_id = $sto['store_id'];
                                            $temp['seo_url_'.$store_id.'_'.$lang['code']] = !empty($seo_urls[$store_id][$lang['language_id']]) ? $seo_urls[$store_id][$lang['language_id']] : '';
                                        }
                                    }
                                    else
                                        $temp['seo_url_'.$lang['code']] = !empty($seo_urls[0][$lang['language_id']]) ? $seo_urls[0][$lang['language_id']] : '';
                                }
                            }
                            elseif($this->stores_count > 1)
                            {
                                foreach ($this->stores_import_format as $key2 => $sto) {
                                    $store_id = $sto['store_id'];
                                    $temp['seo_url_'.$store_id] = !empty($seo_urls[$store_id][$this->default_language_id]) ? $seo_urls[$store_id][$this->default_language_id] : '';
                                }
                            }
                        }
                        elseif($this->is_oc_3x)
                        {
                            $seo_urls = $this->model_catalog_category->getCategorySeoUrls($category_id);
                            $temp[$this->formatted_cat_keyword] = !empty($seo_urls) ? $seo_urls[0][$this->default_language_id] : '';
                        }
                    //END

                    //Basic datas
                        if(!$this->is_oc_3x)
                            $temp[$this->formatted_cat_keyword] = $cat_info['keyword'];

                        $temp[$this->formatted_cat_image] = $cat_info['image'];
                        $temp[$this->formatted_cat_top] = $cat_info['top'];
                        $temp[$this->formatted_cat_column] = $cat_info['column'];
                        $temp[$this->formatted_cat_sort_order] = $cat_info['sort_order'];
                        $temp[$this->formatted_cat_status] = $cat_info['status'];
                    //END

                    //Stores
                        $stores = '';
                        foreach ($cat_stores as $key => $store_id) {
                            $stores .= $store_id.'|';
                        }
                        if(!empty($stores))
                            $stores = substr($stores, 0, -1);

                        $temp[$this->formatted_cat_stores] = $stores;

                    //Filters
                        $temp[$this->formatted_cat_filters] = '';
                        if(!empty($cat_filters))
                        {
                            $final_filters = '';
                            foreach ($cat_filters as $filter_id) {
                                $filter_info = $this->model_catalog_filter->getFilter($filter_id);

                                $final_filters .= array_key_exists('name', $filter_info) ? $filter_info['name'].'|' : '';
                            }
                            if(!empty($final_filters))
                                $final_filters = substr($final_filters, 0, -1);

                            $temp[$this->formatted_cat_filters] = $final_filters;
                        }

                    $temp[$this->formatted_cat_deleted] = 0;

                    $final_categories[] = $temp;
                }
            }

			return $final_categories;
		}
		public function get_categories_datas_columns_names() {
			$columns = array();
			$columns[] = $this->language->get('Category id');

            $columns[] = $this->language->get('Name');
            $columns[] = $this->language->get('Description');
            if(version_compare(VERSION, '2', '>='))
                $columns[] = $this->language->get('Meta title');
            $columns[] = $this->language->get('Meta description');
            $columns[] = $this->language->get('Meta keywords');

			$columns[] = $this->language->get('Parent');

			$columns[] = $this->language->get('SEO url');
			$columns[] = $this->language->get('Image');
			$columns[] = $this->language->get('Top');
			$columns[] = $this->language->get('Columns');
			$columns[] = $this->language->get('Sort order');
			$columns[] = $this->language->get('Status');
			$columns[] = $this->language->get('Stores');
			$columns[] = $this->language->get('Filters');
			$columns[] = $this->language->get('Deleted');

			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
		}
		public function get_categories_max_count($categories_tree) {
			$max_count = 0;
			foreach ($categories_tree as $key => $cats) {
				$num = count($cats);
				if($num > $max_count)
					$max_count = $num;
			}

			return $max_count;
		}
    //</editor-fold>

    //<editor-fold desc="Export attibutes">
        public function format_attributes_to_export($query) {
	        $results = $this->db->query($query);

	        $attribute_groups_formatted = $this->get_all_attribute_groups();

            $final_attributes = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $attr) {
                    $temp = array();
                    $attr_info = $this->model_catalog_attribute->getAttribute($attr['attribute_id']);

                    $temp[$this->formatted_attr_id] = $attr_info['attribute_id'];
                    $temp[$this->formatted_attr_attr_group] = $attribute_groups_formatted[$attr_info['attribute_group_id']];

                    if ($this->count_languages > 1) {
                        $attr_descriptions = $this->model_catalog_attribute->getAttributeDescriptions($attr_info['attribute_id']);
                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_attr_name . '_' . $lang['code']] = htmlspecialchars_decode($attr_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_attr_name] = htmlspecialchars_decode($attr_info['name']);
                    }

                    $temp[$this->formatted_attr_sort_order] = $attr_info['sort_order'];
                    $temp[$this->formatted_attr_deleted] = 0;

                    $final_attributes[] = $temp;
                }
            }

            $final_return = $final_attributes;

			return $final_return;
		}
        public function get_attributes_columns_names() {
	        $columns = array();
	        $columns[] = $this->language->get('Attribute id');
			$columns[] = $this->language->get('Attribute group');
            $columns[] = $this->language->get('Name');
			$columns[] = $this->language->get('Sort order');
			$columns[] = $this->language->get('Deleted');
			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export attribute groups">
        public function format_attribute_groups_to_export($query) {
	        $results = $this->db->query($query);

	         $attribute_groups_formatted = $this->get_all_attribute_groups();

            $final_attributes_groups = array();

            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $attr_group) {
                    $temp = array();
                    $attr_info = $this->model_catalog_attribute_group->getAttributeGroup($attr_group['attribute_group_id']);
                    $attr_info['name'] = $attribute_groups_formatted[$attr_group['attribute_group_id']];
                    $temp[$this->formatted_attr_group_id] = $attr_info['attribute_group_id'];

                    if ($this->count_languages > 1) {
                        $attr_descriptions = $this->model_catalog_attribute_group->getAttributeGroupDescriptions($attr_info['attribute_group_id']);
                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_attr_group_name . '_' . $lang['code']] = htmlspecialchars_decode($attr_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_attr_group_name] = htmlspecialchars_decode($attr_info['name']);
                    }

                    $temp[$this->formatted_attr_group_sort_order] = $attr_info['sort_order'];
                    $temp[$this->formatted_attr_group_deleted] = 0;

                    $final_attributes_groups[] = $temp;
                }
            }
            $final_return = $final_attributes_groups;

			return $final_return;
		}
        public function get_attribute_groups_columns_names() {
	        $columns = array();
			$columns[] = $this->language->get('Attribute group id');
            $columns[] = $this->language->get('Name');
			$columns[] = $this->language->get('Sort order');
			$columns[] = $this->language->get('Deleted');

			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export filters">
        public function format_filters_to_export($query) {
	        $results = $this->db->query($query);

            $final_filters = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $filter) {
                    $temp = array();
                    $filter_info = $this->model_catalog_filter->getFilter($filter['filter_id']);
                    $temp[$this->formatted_filter_id] = $filter_info['filter_id'];
                    $temp[$this->formatted_filter_filter_group] = $filter_info['group'];

                    if ($this->count_languages > 1) {
                        $filter_descriptions = $this->_getFilterDescriptions($filter_info['filter_id']);

                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_filter_name . '_' . $lang['code']] = htmlspecialchars_decode($filter_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_filter_name] = htmlspecialchars_decode($filter_info['name']);
                    }

                    $temp[$this->formatted_filter_sort_order] = $filter_info['sort_order'];
                    $temp[$this->formatted_filter_deleted] = 0;

                    $final_filters[] = $temp;
                }
            }

            $final_return = $final_filters;

			return $final_return;
		}
        public function get_filters_columns_names() {
	        $columns = array();
	        $columns[] = $this->language->get('Filter id');
			$columns[] = $this->language->get('Group');
            $columns[] = $this->language->get('Name');
			$columns[] = $this->language->get('Sort order');
			$columns[] = $this->language->get('Deleted');
			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
        }
		public function _getFilterDescriptions($filter_id) {
	        $filter_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "filter_description WHERE filter_id = '" . (int)$filter_id . "'");
            $filter_data = array();
            foreach ($filter_query->rows as $filter) {

                $filter_data[$filter['language_id']] = array(
                    'language_id' => $filter['language_id'],
                    'name' => $filter['name']
                );
            }
            return $filter_data;
        }
    //</editor-fold>

    //<editor-fold desc="Export filter groups">
        public function format_filter_groups_to_export($query) {
	        $results = $this->db->query($query);

            $final_filters_groups = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $filter_group) {
                    $temp = array();
                    $filter_info = $this->model_catalog_filter->getFilterGroup($filter_group['filter_group_id']);

                    $temp[$this->formatted_filter_group_id] = $filter_info['filter_group_id'];

                    if ($this->count_languages > 1) {
                        $filter_descriptions = $this->model_catalog_filter->getFilterGroupDescriptions($filter_info['filter_group_id']);
                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_filter_group_name . '_' . $lang['code']] = htmlspecialchars_decode($filter_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_filter_group_name] = htmlspecialchars_decode($filter_info['name']);
                    }

                    $temp[$this->formatted_filter_group_sort_order] = $filter_info['sort_order'];
                    $temp[$this->formatted_filter_group_deleted] = 0;

                    $final_filters_groups[] = $temp;
                }
            }

            $final_return = $final_filters_groups;

			return $final_return;
		}
        public function get_filter_groups_columns_names() {
	        $columns = array();
			$columns[] = $this->language->get('Filter Group id');
            $columns[] = $this->language->get('Name');
			$columns[] = $this->language->get('Sort order');
			$columns[] = $this->language->get('Deleted');

			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export customer groups">
        public function format_customer_groups_to_export($query) {
	        $results = $this->db->query($query);

            $final_customer_groups = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $customer_group) {
                    $temp = array();

                    $cust_group_info = $this->{$this->model_customer_group_name}->getCustomerGroup($customer_group['customer_group_id']);

                    $temp[$this->formatted_cust_group_customer_group_id] = $cust_group_info['customer_group_id'];

                    if ($this->count_languages > 1) {
                        $cust_gro_description = $this->{$this->model_customer_group_name}->getCustomerGroupDescriptions($cust_group_info['customer_group_id']);

                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_cust_group_name . '_' . $lang['code']] = htmlspecialchars_decode($cust_gro_description[$language_id]['name']);
                            $temp[$this->formatted_cust_group_description . '_' . $lang['code']] = htmlspecialchars_decode($cust_gro_description[$language_id]['description']);
                        }
                    } else {
                        $temp[$this->formatted_cust_group_name] = htmlspecialchars_decode($cust_group_info['name']);
                        $temp[$this->formatted_cust_group_description] = htmlspecialchars_decode($cust_group_info['description']);
                    }

                    $temp[$this->formatted_cust_group_approve] = $cust_group_info['approval'];
                    $temp[$this->formatted_cust_group_sort_order] = $cust_group_info['sort_order'];
                    $temp[$this->formatted_cust_group_deleted] = 0;

                    $final_customer_groups[] = $temp;
                }
            }

            return $final_customer_groups;
        }
        public function get_customer_groups_columns_names() {
            $columns = array();
            $columns[] = $this->language->get('Customer Group id');
            $columns[] = $this->language->get('Name');
            $columns[] = $this->language->get('Description');
            $columns[] = $this->language->get('Approve');
            $columns[] = $this->language->get('Sort order');
            $columns[] = $this->language->get('Deleted');

            $columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

            return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export customers">
        public function format_customers_to_export($query) {

            $results = $this->db->query($query);
            $customer_groups = $this->get_all_customer_groups();
            $customer_formatted = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $customer) {
                    $cus = $this->{$this->model_customer_name}->getCustomer($customer['customer_id']);

                    $temp = array(
                        $this->formatted_cust_customer_id => !empty($cus['customer_id']) ? $cus['customer_id'] : '',
                        $this->formatted_cust_customer_group => array_key_exists($cus['customer_group_id'], $customer_groups) ? $customer_groups[$cus['customer_group_id']] : '',
                        $this->formatted_cust_name => !empty($cus['name']) ? $cus['name'] : '',
                        $this->formatted_cust_firstname => !empty($cus['firstname']) ? $cus['firstname'] : '',
                        $this->formatted_cust_lastname => !empty($cus['lastname']) ? $cus['lastname'] : '',
                        $this->formatted_cust_email => !empty($cus['email']) ? $cus['email'] : '',
                        $this->formatted_cust_telephone => !empty($cus['telephone']) ? $cus['telephone'] : '',
                        $this->formatted_cust_fax => !empty($cus['fax']) ? $cus['fax'] : '',
                        $this->formatted_cust_password => !empty($cus['password']) ? $cus['password'] : '',
                        $this->formatted_cust_salt => !empty($cus['salt']) ? $cus['salt'] : '',
                        $this->formatted_cust_newsletter => !empty($cus['newsletter']) ? $cus['newsletter'] : '',
                        $this->formatted_cust_approved => !empty($cus['approved']) ? $cus['approved'] : '',
                        $this->formatted_cust_safe => !empty($cus['safe']) ? $cus['safe'] : '',
                        $this->formatted_cust_status => !empty($cus['status']) ? $cus['status'] : '',
                        $this->formatted_cust_date_added => !empty($cus['date_added']) ? $cus['date_added'] : '',
                        $this->formatted_cust_deleted => 0
                    );

                    $customer_formatted[] = $temp;
                }
            }

            return $customer_formatted;
        }
        public function get_customers_columns_names() {
            $columns = array(
	            $this->language->get('Customer ID'),
	            $this->language->get('Group'),
	            $this->language->get('Name'),
	            $this->language->get('First name'),
	            $this->language->get('Last name'),
	            $this->language->get('Email'),
	            $this->language->get('Telephone'),
	            $this->language->get('Fax'),
	            $this->language->get('Password'),
	            $this->language->get('Salt'),
	            $this->language->get('Newsletter'),
	            $this->language->get('Approved'),
	            $this->language->get('Safe'),
	            $this->language->get('Status'),
	            $this->language->get('Date added'),
                $this->language->get('Deleted'),
	        );
            return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export addresses">
        public function format_addresses_to_export($query) {
            $results = $this->db->query($query);
            $final_addresses = array();
            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $address) {
                    $add = $this->get_address($address['address_id']);
                    if(!empty($add)) {
                        $default_customer_address = $this->get_default_customer_address($add['customer_id']);
                        $zone = $this->get_address_zone_name($add['zone_id']);
                        $country = $this->get_address_country_name($add['country_id']);
                        $temp = array(
                            $this->formatted_cust_addr_id => !empty($add['address_id']) ? $add['address_id'] : '',
                            $this->formatted_cust_addr_customer_id => !empty($add['customer_id']) ? $add['customer_id'] : '',
                            $this->formatted_cust_addr_firstname => !empty($add['firstname']) ? $add['firstname'] : '',
                            $this->formatted_cust_addr_lastname => !empty($add['lastname']) ? $add['lastname'] : '',
                            $this->formatted_cust_addr_company => !empty($add['company']) ? $add['company'] : '',
                            $this->formatted_cust_addr_address_1 => !empty($add['address_1']) ? $add['address_1'] : '',
                            $this->formatted_cust_addr_address_2 => !empty($add['address_2']) ? $add['address_2'] : '',
                            $this->formatted_cust_addr_postcode => !empty($add['postcode']) ? $add['postcode'] : '',
                            $this->formatted_cust_addr_city => !empty($add['city']) ? $add['city'] : '',
                            $this->formatted_cust_addr_zone => $zone,
                            $this->formatted_cust_addr_zone_id => !empty($add['zone_id']) ? $add['zone_id'] : '',
                            $this->formatted_cust_addr_country => $country,
                            $this->formatted_cust_addr_country_id => !empty($add['country_id']) ? $add['country_id'] : '',
                            $this->formatted_cust_addr_default => $default_customer_address == $add['address_id'] ? 1 : 0,
                            $this->formatted_cust_deleted => 0
                        );

                        $final_addresses[] = $temp;
                    }
                }
            }

            return $final_addresses;
        }
        public function get_addresses_columns_names() {
	        $columns = array(
	            $this->language->get('Address ID'),
	            $this->language->get('Customer ID'),
                $this->language->get('First name'),
                $this->language->get('Last name'),
                $this->language->get('Company'),
                $this->language->get('Address 1'),
                $this->language->get('Address 2'),
                $this->language->get('Postcode'),
                $this->language->get('City'),
                $this->language->get('Zone'),
                $this->language->get('Zone ID'),
                $this->language->get('Country'),
                $this->language->get('Country ID'),
                $this->language->get('Default'),
                $this->language->get('Deleted'),
            );
            return $columns;
        }
        public function get_address($address_id) {
	        $address = $this->db->query("SELECT * FROM ".DB_PREFIX."address WHERE address_id = ".$address_id);
	        return $address->row;
        }
        public function get_default_customer_address($customer_id) {
	        $address = $this->db->query("SELECT address_id FROM ".DB_PREFIX."customer WHERE customer_id = ".$customer_id);
	        return array_key_exists('address_id', $address->row) ? $address->row['address_id'] : '';
        }
        public function get_address_zone_name($zone_id) {
	        $zone = $this->db->query("SELECT name FROM ".DB_PREFIX."zone WHERE zone_id = ".$zone_id);
	        return array_key_exists('name', $zone->row) ? $zone->row['name'] : '';
        }
        public function get_address_country_name($country_id) {
	        $country = $this->db->query("SELECT name FROM ".DB_PREFIX."country WHERE country_id = ".$country_id);
	        return array_key_exists('name', $country->row) ? $country->row['name'] : '';
        }
    //</editor-fold>

    //<editor-fold desc="Export options">
        public function format_options_to_export($query) {
	        $options_formatted = $this->get_all_options_simple();

	        $results = $this->db->query($query);

            $final_options = array();

            if(!empty($results->rows)) {
                foreach ($results->rows as $key => $option) {
                    $temp = array();
                    $option_info = $this->model_catalog_option->getOption($option['option_id']);
                    $temp[$this->formatted_option_id] = $option_info['option_id'];

                    if ($this->count_languages > 1) {
                        $option_descriptions = $this->model_catalog_option->getOptionDescriptions($option_info['option_id']);
                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_option_name . '_' . $lang['code']] = htmlspecialchars_decode($option_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_option_name] = htmlspecialchars_decode($option_info['name']);
                    }

                    $temp[$this->formatted_option_type] = $option_info['type'];
                    $temp[$this->formatted_option_sort_order] = $option_info['sort_order'];
                    $temp[$this->formatted_option_deleted] = 0;

                    $final_options[] = $temp;
                }
            }

            $final_return = $final_options;

			return $final_return;
		}
		public function get_options_columns_names() {
	        $columns = array();
			$columns[] = $this->language->get('Option id');
            $columns[] = $this->language->get('Name');
            $columns[] = $this->language->get('Option type');
            $columns[] = $this->language->get('Sort order');
            $columns[] = $this->language->get('Deleted');

			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns);

	        return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Export option values">
        public function format_option_values_to_export($query) {
		    $options_formatted = $this->get_all_options_simple();

	        $results = $this->db->query($query);

	        $final_option_values = array();

	        if(!empty($results->rows)) {
                foreach ($results->rows as $key => $opt_val) {

                    $option_val_info = $this->_getOptionValue($opt_val['option_value_id']);

                    $temp = array();

                    $temp[$this->formatted_option_value_id] = $option_val_info['option_value_id'];
                    $temp[$this->formatted_option_value_option] = $option_val_info['option'];

                    if ($this->count_languages > 1) {
                        $option_descriptions = $this->_getOptionValueDescriptions($option_val_info['option_value_id']);

                        foreach ($this->langs as $language_id => $lang) {
                            $temp[$this->formatted_option_value_name . '_' . $lang['code']] = htmlspecialchars_decode($option_descriptions[$language_id]['name']);
                        }
                    } else {
                        $temp[$this->formatted_option_value_name] = htmlspecialchars_decode($option_val_info['name']);
                    }

                    $temp[$this->formatted_option_value_image] = $option_val_info['image'];
                    $temp[$this->formatted_option_value_sort_order] = $option_val_info['sort_order'];
                    $temp[$this->formatted_option_value_deleted] = 0;

                    $final_option_values[] = $temp;
                }
            }

            $final_return = $final_option_values;

			return $final_return;
		}
        public function get_option_values_columns_names() {
	        $columns = array();
	        $columns[] = $this->language->get('Option value id');
            $columns[] = $this->language->get('Option');
            $columns[] = $this->language->get('Name');
            $columns[] = $this->language->get('Image');
            $columns[] = $this->language->get('Sort order');
            $columns[] = $this->language->get('Deleted');

			$columns = $this->add_multilanguage_multistore_fields_to_hopped_columns($columns, array($this->language->get('Option')));

	        return $columns;
        }
        public function _getOptionValueDescriptions($option_value_id) {
	        $option_val_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value_description WHERE option_value_id = '" . (int)$option_value_id . "'");
            $option_val_data = array();
            foreach ($option_val_query->rows as $option) {

                $option_val_data[$option['language_id']] = array(
                    'language_id' => $option['language_id'],
                    'name' => $option['name']
                );
            }
            return $option_val_data;
        }
        public function _getOptionValue($option_value_id) {
	        $sql = "
                    SELECT *, 
                    (SELECT name
                      FROM " . DB_PREFIX . "option_description od
                      WHERE ov.option_id = od.option_id 
                      AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'
                    ) AS `option`
                    FROM " . DB_PREFIX . "option_value ov
                    LEFT JOIN " . DB_PREFIX . "option_value_description ovd
                    ON (
                        ov.option_value_id = ovd.option_value_id
                    ) 
                    WHERE ovd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND ov.option_value_id = ".$option_value_id;
            $query = $this->db->query($sql);
		    return $query->row;
	    }
    //</editor-fold>

    //<editor-fold desc="Get functions">
        public function get_all_downloads() {
            $downloads = $this->model_catalog_download->getDownloads();

            $final_downloads = array();

            foreach ($downloads as $key => $download) {
                $explode_filename = explode('.', $download['filename']);

                $name = $download['name'];
                if($this->count_languages > 1)
                {
                    $names = $this->model_catalog_download->getDownloadDescriptions($download['download_id']);

                    $final_names = array();

                    foreach ($names as $lang_id => $nam) {
                        $final_names[$this->languages_ids[$lang_id]] = $nam['name'];
                    }

                    $name = $final_names;
                }
                if(count($explode_filename) > 1) {
                    $final_downloads[$download['download_id']] = array(
                        'filename' => $explode_filename[0] . '.' . $explode_filename[1],
                        'hash' => array_key_exists(2, $explode_filename) ? $explode_filename[2] : '',
                        'name' => $name,
                        'mask' => $download['mask']
                    );
                }
            }

            return $final_downloads;
        }

        public function get_all_categories() {
            $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "category`;";
            $result = $this->db->query( $temporal_sql );

            $category_array = array();

            foreach ($result->rows as $key => $category) {

                if($this->count_languages > 1)
                {
                    $temp = array();
                    foreach ($this->languages as $key2 => $lang) {

                        $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "category_description` WHERE category_id = ".$category['category_id']." AND language_id = ".(int)$lang['language_id'].";";
                        $result = $this->db->query( $temporal_sql );

                        $temp[(int)$lang['language_id']] = array_key_exists('name', $result->row) ? $result->row['name'] : '';
                    }

                    $category_array[$category['category_id']] = $temp;
                }
                else
                {
                    $temp = array();
                    $temp['category_id'] = $category['category_id'];

                    $temporal_sql = "SELECT * FROM `" . DB_PREFIX . "category_description` WHERE category_id = ".$category['category_id']." AND language_id = ".(int)$this->config->get('config_language_id').";";
                    $result = $this->db->query( $temporal_sql );

                    if(!empty($result->row['name']))
                    {
                        $temp['name'] = $result->row['name'];
                        $category_array[$temp['category_id']] = $temp['name'];
                    }
                }
            }

            return $category_array;
        }

        public function get_tree_categories($categories) {
            $final_categories = array();

            //Get name and parent of all categories
                foreach ($categories as $key => $cat_id) {
                    if($this->count_languages > 1)
                    {
                        $temp = array();
                        foreach ($this->languages as $key2 => $lang) {
                            $temporal_sql = "SELECT c.category_id,c.parent_id,cd.name FROM `" . DB_PREFIX . "category` c LEFT JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = ".(int)$lang['language_id'].") WHERE c.category_id = ".$cat_id;
                            $result = $this->db->query( $temporal_sql );

                            if(empty($temp))
                            {
                                $temp = $result->row;
                                $temp['name'] = array();
                                $temp['name'][(int)$lang['language_id']] = array_key_exists('name', $result->row) ? $result->row['name'] : '';
                            }
                            else
                            {
                                $temp['name'][(int)$lang['language_id']] = array_key_exists('name', $result->row) ? $result->row['name'] : '';
                            }
                        }
                        $final_categories[] = $temp;
                    }
                    else
                    {
                        $temporal_sql = "SELECT c.category_id,c.parent_id,cd.name FROM `" . DB_PREFIX . "category` c LEFT JOIN `" . DB_PREFIX . "category_description` cd ON (c.category_id = cd.category_id AND cd.language_id = ".(int)$this->config->get('config_language_id').") WHERE c.category_id = ".$cat_id;
                        $result = $this->db->query( $temporal_sql );

                        if(!empty($result->row))
                            $final_categories[] = $result->row;
                    }
                }
            //END Get name and parent of all categories

            //Construct tree categories
                if(!empty($final_categories))
                {
                    $final_categories = $this->model_extension_module_import_xls->buildTree($final_categories);
                }
            //END Construct tree categories
            return $final_categories;
        }

        public function get_full_category_tree($categories) {
            $parents = array();
            foreach ($categories as $key => $cat_id) {
                $parents[] = $cat_id;
                $has_parent = true;
                while ($has_parent) {

                    $cat_id = $this->get_category_parent_id($cat_id);

                    if($cat_id)
                        $parents[] = $cat_id;
                    else
                        $has_parent = false;
                }
            }
            $parents = array_unique($parents);
            $category_tree = $this->get_tree_categories($parents);

            return $category_tree;
        }

        public function get_category_parent_id($cat_id) {
            $temporal_sql = "SELECT c.parent_id FROM `" . DB_PREFIX . "category` c WHERE c.category_id = ".$cat_id;
            $result = $this->db->query( $temporal_sql );

            return !empty($result->row['parent_id']) ? $result->row['parent_id'] : '';
        }

        public function get_all_manufacturers() {
            $this->load->model('catalog/manufacturer');
            $manufacturers = $this->model_catalog_manufacturer->getManufacturers();

            $manufacturers_final = array();

            foreach ($manufacturers as $key => $ma) {
                $manufacturers_final[$ma['manufacturer_id']] = $ma['name'];
            }
            return $manufacturers_final;
        }

        public function get_all_filters() {
            $this->load->model('catalog/filter');
            $filters = $this->model_catalog_filter->getFilters(false);

            $filters_final = array();

            foreach ($filters as $key => $fi) {
                $filters_final[$fi['filter_id']] = array(
                    'name' => $fi['name'],
                    'group_name' => $fi['group'],
                    'filter_group_id' => $fi['filter_group_id'],
                );
            }
            return $filters_final;
        }

        public function get_all_attributes() {
            $this->load->model('catalog/attribute');
            $attributes = $this->model_catalog_attribute->getAttributes();

            $attributes_final = array();
            foreach ($attributes as $key => $at) {
                if (!isset($attributes_final[$at['attribute_id']]))
                    $attributes_final[$at['attribute_id']] = array();

                $attributes_final[$at['attribute_id']]['attribute_group_name'] = $at['attribute_group'];
                $attributes_final[$at['attribute_id']]['attribute_group_id'] = $at['attribute_group_id'];
                $attributes_final[$at['attribute_id']]['attribute_id'] = $at['attribute_id'];
                $attributes_final[$at['attribute_id']]['attribute_name'] = $at['name'];
            }

            if($this->count_languages > 1)
            {
                foreach ($attributes_final as $key => $attr_group) {
                    foreach ($this->languages as $key2 => $lang) {
                        //Attribute group name translates
                            $sql = "SELECT * FROM " . DB_PREFIX . "attribute_group_description WHERE attribute_group_id = ".$attr_group['attribute_group_id']." AND language_id = ".(int)$lang['language_id'].";";
                            $attr_translate = $this->db->query($sql);

                            if(!isset($attributes_final[$key]['translates_attribute_group']))
                                $attributes_final[$key]['translates_attribute_group'] = array();

                            $attributes_final[$key]['translates_attribute_group'][$lang['code']] = !empty($attr_translate->row['name']) ? $attr_translate->row['name'] : '';
                        //END Attribute group name translates

                        //Attribute name translates
                            $sql = "SELECT * FROM " . DB_PREFIX . "attribute_description WHERE attribute_id = ".$attr_group['attribute_id']." AND language_id = ".(int)$lang['language_id'].";";
                            $attr_translate = $this->db->query($sql);

                            if(!isset($attributes_final[$key]['translates_attribute']))
                                $attributes_final[$key]['translates_attribute'] = array();

                            $attributes_final[$key]['translates_attribute'][$lang['code']] = !empty($attr_translate->row['name']) ? $attr_translate->row['name'] : '';
                        //END Attribute name translates
                    }
                }
            }

            return $attributes_final;
        }

        public function get_all_attribute_groups() {
            $attribute_groups = $this->model_catalog_attribute_group->getAttributeGroups();

            $attribute_groups_final = array();

            foreach ($attribute_groups as $key => $attr_group) {
                $attribute_groups_final[$attr_group['attribute_group_id']] = $attr_group['name'];
            }
            return $attribute_groups_final;
        }

        public function get_all_filter_groups() {
            $filter_groups = $this->model_catalog_filter->getFilters(array());

            $filter_groups_final = array();

            foreach ($filter_groups as $key => $attr_group) {
                $filter_groups_final[$attr_group['filter_group_id']] = $attr_group['name'];
            }
            return $filter_groups_final;
        }

        public function get_all_customer_groups() {
            $custome_groups = $this->{$this->model_customer_group_name}->getCustomerGroups();

            $custome_groups_final = array();

            foreach ($custome_groups as $key => $cust_group) {
                $custome_groups_final[$cust_group['customer_group_id']] = $cust_group['name'];
            }
            return $custome_groups_final;
        }

        public function get_all_options() {
            $this->load->model('catalog/option');
            $all_options = $this->model_catalog_option->getOptions();

            $options_final = array();

            //Format options
            foreach ($all_options as $key => $op) {
                $options_final[$op['option_id']] = array(
                    'option_id' => $op['option_id'],
                    'option_name' => $op['name'],
                    'option_type' => $op['type'],
                    'option_values' => array()
                );
            }

            //Get all options values to each option
            foreach ($options_final as $option_id => $op) {
                $optuion_values = $this->model_catalog_option->getOptionValues($option_id);

                //Format option values
                $option_values_final = array();

                foreach ($optuion_values as $key => $op) {
                    $option_values_final[$op['option_value_id']] = $op['name'];
                }

                $options_final[$option_id]['option_values'] = $option_values_final;
            }

            return $options_final;
        }

        public function get_all_options_simple() {
            $this->load->model('catalog/option');
            $all_options = $this->model_catalog_option->getOptions();

            $options_final = array();
            foreach ($all_options as $key => $op) {
                $options_final[$op['option_id']] = $op['name'];
            }

            return $options_final;
        }

        public function get_option_values_sort_order() {
            $option_value_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "option_value");
            $final_opt_values = array();

            if(!empty($option_value_query->rows))
            {
                foreach ($option_value_query->rows as $opt_val) {
                    $final_opt_values[$opt_val['option_value_id']] = !empty($opt_val['sort_order']) ? $opt_val['sort_order'] : 0;
                }
            }
            return $final_opt_values;
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

            foreach ($stores_temp as $key => $store) {
                $stores[$store['store_id']] = $store;
            }
            return $stores;
        }
    //</editor-fold>

    //<editor-fold desc="Column functions">
        public function format_columns_names($function_name) {
            $columns_formatted = array();
            $columns = $this->{$function_name}();

            foreach ($columns as $key => $col_name) {
                $columns_formatted[] = $this->model_extension_module_import_xls->format_column_name($col_name);
            }

            return $columns_formatted;


        }
        public function add_multilanguage_multistore_fields_to_hopped_columns($columns, $lang_fields_skyp = array()) {
        $multistore_fields_tmp = $this->fields_multistore_names;


        if($this->count_languages > 1)
        {
            $final_columns = array();

            $languages = $this->languages;

            //Devman Extensions - info@devmanextensions.com - 2017-09-23 09:38:24 - Remove all multilanguages fields that arent in column array
            foreach ($columns as $key => $col_name) {
                if(!in_array($col_name, $this->fields_multilanguage_names) || in_array($col_name, $lang_fields_skyp))
                    $final_columns[] = $col_name;
                else
                {
                    foreach ($languages as $key2 => $lang) {
                        //Devman Extensions - info@devmanextensions.com - 2017-07-03 20:33:51 - Multistore fields
                        if($this->stores_count > 1 && in_array($col_name, $this->fields_multistore_names))
                        {
                            foreach ($this->stores_import_format as $store) {
                                $final_columns[] = $col_name.' '.$store['store_id'].' '.$lang['code'];
                            }
                        }
                        else
                            $final_columns[] = $col_name.' '.$lang['code'];
                    }
                }
            }

            $columns = $final_columns;
        }
        elseif($this->stores_count > 1)
        {
        	$final_columns = array();

            foreach ($columns as $key => $col_name) {
            	$skyp = $this->count_languages > 1 && in_array($col_name, $this->fields_multilanguage_names);

                if(!in_array($col_name, $this->fields_multistore_names) || $skyp)
                    $final_columns[] = $col_name;
                else
                {
                    foreach ($this->stores_import_format as $store) {
                        $final_columns[] = $col_name.' '.$store['store_id'];
                    }
                }
            }

            $columns = $final_columns;
        }
        $multistore_fields_tmp = array_values($multistore_fields_tmp);

        return $columns;
    }
    //</editor-fold>
}
?>