<?php

//Devman Extensions - info@devmanextensions.com - 2017-01-20 16:33:18 - Excel library
    require_once DIR_SYSTEM . 'library/Spout/Autoloader/autoload.php';
    use Box\Spout\Reader\ReaderFactory;
    use Box\Spout\Writer\WriterFactory;
    use Box\Spout\Common\Type;
    use Box\Spout\Writer\Style\StyleBuilder;
    use Box\Spout\Writer\Style\Color;
    use Box\Spout\Writer\Style\Border;
    use Box\Spout\Writer\Style\BorderBuilder;
//END

class ControllerExtensionModuleImportXls extends Controller {
    private $error = array();

    private $data_to_view = array();

    public function __construct($registry) {

        if (strpos(ini_get('default_charset'), ';') !== false) {
           ini_set('default_charset', 'UTF-8');
        }

        ini_set("memory_limit","2048M");
        ini_set("max_execution_time",360);

        error_reporting(E_ALL);
        ini_set('display_errors', 'On');

        parent::__construct($registry);

        if(phpversion() < '5.4') {
            die('ERROR: YOUR PHP VERSION IS <b>'.phpversion().'</b> REQUIRED <b>5.4.0 or higher</b>');
        }

        if( !ini_get('allow_url_fopen') ) {
           die('ERROR: YOU NEED ENABLE PHP DIRECTIVE "<b>allow_url_fopen</b>" IN YOUR SERVER<br>IF YOU DON\'T KNOW HOW TO DO IT, YOUR HOSTING SUPPORT TEAM WILL CAN DO IT FOR YOU.');
        }

        $this->extension_type = 'module';
        $this->real_extension_type = (version_compare(VERSION, '2.3', '>=') ? 'extension/':'').$this->extension_type;

        $this->extension_url_cancel_oc_15x = 'common/home';
        $this->extension_url_cancel_oc_2x = 'common/dashboard';

        $this->extension_name = 'import_xls';
        $this->extension_group_config = 'import_xls';
        $this->extension_id = '5a6cb0bb-ced4-47df-ac9a-6b79953eaa19';

        $this->oc_version = version_compare(VERSION, '3.0.0.0', '>=') ? 3 : (version_compare(VERSION, '2.0.0.0', '>=') ? 2 : 1);

        $this->data_to_view = array(
            'button_apply_allowed' => false,
            'button_save_allowed' => false,
            'extension_name' => $this->extension_name,
            'license_id' => $this->config->get($this->extension_group_config.'_license_id') ? $this->config->get($this->extension_group_config.'_license_id') : '',
            'oc_version' => $this->oc_version
        );

        $this->license_id = $this->config->get($this->extension_group_config.'_license_id') ? $this->config->get($this->extension_group_config.'_license_id') : '';
        $this->form_file_path = str_replace('system/', '', DIR_SYSTEM).$this->extension_name.'_form.txt';
        $this->form_file_url = HTTP_CATALOG.$this->extension_name.'_form.txt';

        $this->attn = 3;
        $this->filgron = 1;
        $this->filgrofiln = 2;
        $this->catindn = 2;
        $this->cattren = 1;
        $this->cattrechin = 2;
        $this->extimgn = 3;
        $this->spen = 1;
        $this->disn = 1;
        $this->down = 2;

        $this->allow_options = true;
        $this->dp_img = false;
        $this->ignore_columns = array();
        $this->is_oc_3x = $this->oc_version >= 3;

        $this->token_name = version_compare(VERSION, '3.0.0.0', '<') ? 'token' : 'user_token';
        $this->token = $this->session->data[$this->token_name];
        $this->extension_view = version_compare(VERSION, '3.0.0.0', '<') ? $this->extension_name.'.tpl' : $this->extension_name;

        $loader = new Loader($registry);

        $loader->language($this->real_extension_type.'/'.$this->extension_name);
        $loader->model('extension/module/import_export_xls');
        $loader->model('extension/module/export_xls');
        $loader->model('extension/module/import_xls');
        $loader->model('localisation/language');
        $loader->model('catalog/product');
        $loader->model('catalog/category');
        $loader->model('catalog/download');
        $loader->model('catalog/attribute');
        $loader->model('catalog/attribute_group');
        $loader->model('catalog/attribute');
        $loader->model('catalog/attribute_group');
        $loader->model('localisation/tax_class');
        $loader->model('extension/devmanextensions/tools_trial');
        if(version_compare(VERSION, '1.5.1', '>'))
            $loader->model('localisation/tax_rate');

        $model_name = version_compare(VERSION, '2.1.0.1', '>=') ? 'customer/customer' : 'sale/customer';
        $this->model_customer_name = version_compare(VERSION, '2.1.0.1', '>=') ? 'model_customer_customer' : 'model_sale_customer';
        $this->load->model($model_name);

        $model_cust_group_name = version_compare(VERSION, '2.1.0.1', '>=') ? 'customer/customer_group' : 'sale/customer_group';
        $this->model_customer_group_name = version_compare(VERSION, '2.1.0.1', '>=') ? 'model_customer_customer_group' : 'model_sale_customer_group';
        $this->load->model($model_cust_group_name);

        $loader->model('tool/image');
        $this->stores_import_format = $this->model_extension_module_import_xls->get_stores();
        $this->stores_export_format = $this->model_extension_module_export_xls->get_stores();
        $this->stores_count = count($this->stores_import_format);

        $this->hasFilters = version_compare(VERSION, '1.5.1.3', '>');
        $this->hasCustomerDescriptions = version_compare(VERSION, '1.5.1.3', '>');

        if($this->hasFilters)
            $loader->model('catalog/filter');

        $loader->model('catalog/attribute');
        $loader->model('catalog/option');

        $this->translation = false;
        if($this->translation)
            $loader->language('extension/module/import_xls_translation');

        //Devman Extensions - info@devmanextensions.com - 2017-05-14 11:45:51 - Get Tax classes
            $tax_clases = $this->model_localisation_tax_class->getTaxClasses(array('order' => 'ASC'));
            $final_tax = array();

            if(version_compare(VERSION, '1.5.1', '>'))
            {
                foreach ($tax_clases as $key => $tax_class) {
                    $tax_rules = $this->model_localisation_tax_class->getTaxRules($tax_class['tax_class_id']);

                    foreach ($tax_rules as $key2 => $tax_rule) {
                        if($tax_rule['based'] == 'store')
                        {
                            $tax_rate = $this->model_localisation_tax_rate->getTaxRate($tax_rule['tax_rate_id']);
                            $tax_clases[$key]['rule'] = $tax_rate;
                        }
                    }
                }
            }
            else
            {
                foreach ($tax_clases as $key => $tax_class) {
                    $tax_rate = $this->model_localisation_tax_class->getTaxRates($tax_class['tax_class_id']);
                    $tax_clases[$key]['rule'] = $tax_rate;
                }
            }

            foreach ($tax_clases as $key => $tax_class) {
                $final_tax[$tax_class['tax_class_id']] = $tax_class;
            }

            $this->tax_clases = $final_tax;
        //END

        $this->opt_types_val_requires = array('select', 'radio', 'checkbox', 'image');
        $this->opt_values_sort_order = $this->model_extension_module_export_xls->get_option_values_sort_order();

        $fields_multilanguage = array('name', 'description', 'meta_description', 'meta_title', 'meta_keyword', 'tag', 'option', 'option_value');

        if($this->is_oc_3x)
            array_push($fields_multilanguage, 'keyword');

        for ($i=1; $i <= $this->attn; $i++) {
            array_push($fields_multilanguage, 'attribute_group_'.$i);
            array_push($fields_multilanguage, 'attribute_attribute_'.$i);
            array_push($fields_multilanguage, 'attribute_value_'.$i);
        }

        for ($i=1; $i <= $this->down; $i++) {
            array_push($fields_multilanguage, 'download_'.$i);
        }

        for ($i=1; $i <= $this->cattren; $i++) {
            array_push($fields_multilanguage, 'cat__tree_'.$i.'_parent');
            for ($j=1; $j <= $this->cattrechin; $j++) {
                array_push($fields_multilanguage, 'cat__tree_'.$i.'_level_'.$j);
            }
        }

        for ($i=1; $i <= $this->catindn; $i++) {
            array_push($fields_multilanguage, 'cat__'.$i);
        }

        $this->fields_multilanguage = $fields_multilanguage;

        $fields_multilanguage_names = array($this->language->get('Name'), $this->language->get('Description'), $this->language->get('Meta description'), $this->language->get('Meta title'), $this->language->get('Meta keywords'), $this->language->get('Tags'), $this->language->get('Option'), $this->language->get('Option value'));

        if($this->is_oc_3x)
            array_push($fields_multilanguage_names, $this->language->get('SEO url'));

        for ($i=1; $i <= $this->attn; $i++) {
            array_push($fields_multilanguage_names, $this->language->get('Attr. Group').' '.$i);
            array_push($fields_multilanguage_names, $this->language->get('Attribute').' '.$i);
            array_push($fields_multilanguage_names, $this->language->get('Attribute value').' '.$i);
        }
        for ($i=1; $i <= $this->down; $i++) {
            array_push($fields_multilanguage_names, $this->language->get('Download name').' '.$i);
        }

        for ($i=1; $i <= $this->cattren; $i++) {
            array_push($fields_multilanguage_names, $this->language->get('Cat. tree').' '.$i.' '.$this->language->get('parent'));
            for ($j=1; $j <= $this->cattrechin; $j++) {
                array_push($fields_multilanguage_names, $this->language->get('Cat. tree').' '.$i.' '.$this->language->get('level').' '.$j);
            }
        }

        for ($i=1; $i <= $this->catindn; $i++) {
            array_push($fields_multilanguage_names, $this->language->get('Cat.').' '.$i);
        }

        $this->fields_multilanguage_names = $fields_multilanguage_names;

        //Devman Extensions - info@devmanextensions.com - 2017-07-03 20:34:53 - Multistore fields Opencart more that 3.0.0.0
            $fields_multistore = array();

            if($this->is_oc_3x)
                array_push($fields_multistore, 'keyword');

            $this->fields_multistore = $fields_multistore;

            $fields_multistore_names = array();

            if($this->is_oc_3x)
                array_push($fields_multistore_names, $this->language->get('SEO url'));

            $this->fields_multistore_names = $fields_multistore_names;
        //END

        //Get all customer groups
            if(version_compare(VERSION, '2.0.3.1', '<='))
            {
                $loader->model('sale/customer_group');
                $this->customer_groups = $this->model_sale_customer_group->getCustomerGroups();
            }
            else
            {
                $loader->model('customer/customer_group');
                $this->customer_groups = $this->model_customer_customer_group->getCustomerGroups();
            }
        //END Get all customer groups

        //Count languages active
            $loader->model('localisation/language');
            $languages = $this->model_localisation_language->getLanguages();
            $languages_ids = array();
            foreach ($languages as $key => $value) {
                $code_formatted = $this->model_extension_module_import_xls->format_column_name($value['code']);
                $languages[$key]['code'] = $code_formatted;
                $languages_ids[$value['language_id']] = $code_formatted;
            }

            $this->languages = $languages;
            $this->languages_ids = $languages_ids;
            $this->count_languages = 0;

            foreach ($this->languages as $key => $lang) {
                if($lang['status'])
                    $this->count_languages++;
                if($lang['language_id'] == $this->config->get('config_language_id'))
                {
                    $this->default_language_code = $lang['code'];
                    $this->default_language_id = $lang['language_id'];
                }
            }
        //END Count languages active

        //Devman Extensions - info@devmanextensions.com - 2017-01-21 13:13:48 - Array category columns names
            $array_category_columns_name = array();
            if(!$this->config->get('import_xls_categories_tree'))
            {
                for ($i=1; $i <= $this->catindn; $i++) {
                    if($this->count_languages == 1)
                        array_push($array_category_columns_name, $this->language->get('Cat.').' '.($i));
                    else
                    {
                        $cat_column_name = $this->language->get('Cat.').' '.$i;
                        $temp = array($cat_column_name => array());
                        foreach ($this->languages as $key => $lang) {
                            $temp[$cat_column_name][$lang['code']] = $cat_column_name;
                        }
                        array_push($array_category_columns_name, $temp);
                    }
                }
            }
            else
            {
                for ($i=1; $i <= $this->cattren ; $i++) {
                    for ($j=0; $j <= $this->cattrechin ; $j++) {
                        if($this->count_languages == 1)
                        {
                            $cat_column_name = $this->language->get('Cat. tree').' '.$i.' '.($j == 0 ? $this->language->get('parent') : $this->language->get('level').' '.$j);
                            array_push($array_category_columns_name, $cat_column_name);
                        }
                        else
                        {
                            $cat_column_name = $this->language->get('Cat. tree').' '.$i.' '.($j == 0 ? $this->language->get('parent') : $this->language->get('level').' '.$j);
                            $temp = array($cat_column_name => array());
                            foreach ($this->languages as $key => $lang) {
                                $temp[$cat_column_name][$lang['code']] = $cat_column_name;
                            }
                            array_push($array_category_columns_name, $temp);
                        }
                    }
                }
            }

            $this->array_category_columns_name = $array_category_columns_name;
        //END

        //Formatted values to export
            $this->formatted_product_id = $this->model_extension_module_import_xls->format_column_name($this->language->get('Product ID'));
            $this->formatted_model = $this->model_extension_module_import_xls->format_column_name($this->language->get('Model'));
            $this->formatted_name = $this->model_extension_module_import_xls->format_column_name($this->language->get('Name'));
            $this->formatted_description = $this->model_extension_module_import_xls->format_column_name($this->language->get('Description'));
            $this->formatted_meta_description = $this->model_extension_module_import_xls->format_column_name($this->language->get('Meta description'));
            $this->formatted_meta_title = $this->model_extension_module_import_xls->format_column_name($this->language->get('Meta title'));
            $this->formatted_meta_keywords = $this->model_extension_module_import_xls->format_column_name($this->language->get('Meta keywords'));
            $this->formatted_seo_url = $this->model_extension_module_import_xls->format_column_name($this->language->get('SEO url'));
            $this->formatted_tags = $this->model_extension_module_import_xls->format_column_name($this->language->get('Tags'));
            $this->formatted_sku = $this->model_extension_module_import_xls->format_column_name($this->language->get('SKU'));
            $this->formatted_ean = $this->model_extension_module_import_xls->format_column_name($this->language->get('EAN'));
            $this->formatted_upc = $this->model_extension_module_import_xls->format_column_name($this->language->get('UPC'));
            $this->formatted_jan = $this->model_extension_module_import_xls->format_column_name($this->language->get('JAN'));
            $this->formatted_mpn = $this->model_extension_module_import_xls->format_column_name($this->language->get('MPN'));
            $this->formatted_isbn = $this->model_extension_module_import_xls->format_column_name($this->language->get('ISBN'));
            $this->formatted_minimum = $this->model_extension_module_import_xls->format_column_name($this->language->get('Minimum'));
            $this->formatted_subtract = $this->model_extension_module_import_xls->format_column_name($this->language->get('Subtract'));
            $this->formatted_out_of_status = $this->model_extension_module_import_xls->format_column_name($this->language->get('Out stock status'));
            $this->formatted_price = $this->model_extension_module_import_xls->format_column_name($this->language->get('Price'));
            $this->formatted_quantity = $this->model_extension_module_import_xls->format_column_name($this->language->get('Quantity'));
            $this->formatted_points = $this->model_extension_module_import_xls->format_column_name($this->language->get('Points'));
            $this->formatted_weight = $this->model_extension_module_import_xls->format_column_name($this->language->get('Weight'));
            $this->formatted_option = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option'));
            $this->formatted_option_type = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option type'));
            $this->formatted_option_value = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option value'));
            $this->formatted_option_value_sort_order = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option value sort order'));
            $this->formatted_option_required = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option required'));
            $this->formatted_option_subtract = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option subtract'));
            $this->formatted_option_image = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option image'));
            $this->formatted_option_price_prefix = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option price prefix'));
            $this->formatted_option_points_prefix = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option points prefix'));
            $this->formatted_option_weight_prefix = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option weight prefix'));
            $this->formatted_option_ob_sku = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option SKU (Options Boost)'));
            $this->formatted_option_ob_image = $this->model_extension_module_import_xls->format_column_name($this->language->get('Option image (Options Boost)'));
            $this->formatted_spe = $this->model_extension_module_import_xls->format_column_name($this->language->get('Spe. '));
            $this->formatted_special_priority = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Priority'));
            $this->formatted_special_price = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Price'));
            $this->formatted_special_date_start = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Date start'));
            $this->formatted_special_date_end = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Date end'));
            $this->formatted_dis = $this->model_extension_module_import_xls->format_column_name($this->language->get('Dis. '));
            $this->formatted_dis_quantity = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Quantity'));
            $this->formatted_dis_priority = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Priority'));
            $this->formatted_dis_price = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Price'));
            $this->formatted_dis_date_start = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Date start'));
            $this->formatted_dis_date_end = $this->model_extension_module_import_xls->format_column_name($this->language->get(' Date end'));
            $this->formatted_manufacturer = $this->model_extension_module_import_xls->format_column_name($this->language->get('Manufacturer'));
            $this->formatted_cat = $this->model_extension_module_import_xls->format_column_name($this->language->get('Cat.'));
            $this->formatted_cat_tree = $this->model_extension_module_import_xls->format_column_name($this->language->get('Cat. tree'));
            $this->formatted_cat_parent = $this->model_extension_module_import_xls->format_column_name($this->language->get('parent'));
            $this->formatted_cat_level = $this->model_extension_module_import_xls->format_column_name($this->language->get('level'));
            $this->formatted_main_image = $this->model_extension_module_import_xls->format_column_name($this->language->get('Main image'));
            $this->formatted_image = $this->model_extension_module_import_xls->format_column_name($this->language->get('Image'));
            $this->formatted_products_related = $this->model_extension_module_import_xls->format_column_name($this->language->get('Products related'));
            $this->formatted_date_available = $this->model_extension_module_import_xls->format_column_name($this->language->get('Date available'));
            $this->formatted_requires_shipping = $this->model_extension_module_import_xls->format_column_name($this->language->get('Requires shipping'));
            $this->formatted_location = $this->model_extension_module_import_xls->format_column_name($this->language->get('Location'));
            $this->formatted_tax_class = $this->model_extension_module_import_xls->format_column_name($this->language->get('Tax class'));
            $this->formatted_sort_order = $this->model_extension_module_import_xls->format_column_name($this->language->get('Sort order'));
            $this->formatted_store = $this->model_extension_module_import_xls->format_column_name($this->language->get('Store'));
            $this->formatted_status = $this->model_extension_module_import_xls->format_column_name($this->language->get('Status'));
            $this->formatted_class_weight = $this->model_extension_module_import_xls->format_column_name($this->language->get('Class weight'));
            $this->formatted_class_length = $this->model_extension_module_import_xls->format_column_name($this->language->get('Class length'));
            $this->formatted_length = $this->model_extension_module_import_xls->format_column_name($this->language->get('Length'));
            $this->formatted_width = $this->model_extension_module_import_xls->format_column_name($this->language->get('Width'));
            $this->formatted_height = $this->model_extension_module_import_xls->format_column_name($this->language->get('Height'));
            $this->formatted_attr_group = $this->model_extension_module_import_xls->format_column_name($this->language->get('Attr. Group'));
            $this->formatted_attr_attribute = $this->model_extension_module_import_xls->format_column_name($this->language->get('Attribute'));
            $this->formatted_attr_value = $this->model_extension_module_import_xls->format_column_name($this->language->get('Attribute value'));
            $this->formatted_filter_group = $this->model_extension_module_import_xls->format_column_name($this->language->get('Filter Group'));
            $this->formatted_filter_gro = $this->model_extension_module_import_xls->format_column_name($this->language->get('Filter Gr.'));
            $this->formatted_filter = $this->model_extension_module_import_xls->format_column_name($this->language->get('Filter'));
            $this->formatted_download = $this->model_extension_module_import_xls->format_column_name($this->language->get('Download name'));
            $this->formatted_download_file = $this->model_extension_module_import_xls->format_column_name($this->language->get('Download file'));
            $this->formatted_download_hash = $this->model_extension_module_import_xls->format_column_name($this->language->get('Download hash'));
            $this->formatted_download_mask = $this->model_extension_module_import_xls->format_column_name($this->language->get('Download mask'));
            $this->formatted_layout = $this->model_extension_module_import_xls->format_column_name($this->language->get('Layout'));
            $this->formatted_deleted = $this->model_extension_module_import_xls->format_column_name($this->language->get('Deleted'));

            //Add new formated values here
        //END

        $this->filename = 'import_export_xls_product_tools';
        $this->export_history_folder = DIR_TEMPLATE.$this->real_extension_type.'/import_xls_files/export_backups/';
        $this->export_history_path = HTTPS_SERVER.'view/template/'.$this->real_extension_type.'/import_xls_files/export_backups/';
        $this->progress_path = DIR_TEMPLATE.$this->real_extension_type.'/import_xls_files/progress.json';
        $this->progress_route = HTTPS_SERVER.'view/template/'.$this->real_extension_type.'/import_xls_files/progress.json';

        $this->all_downloads_export_format = $this->model_extension_module_export_xls->get_all_downloads();
        $this->customer_groups_format_export = $this->model_extension_module_export_xls->get_all_customer_groups();
        $this->customer_groups_format_import = $this->model_extension_module_import_xls->getCustomerGroups(array(), true);

         //Devman Extensions - info@devmanextensions.com - 2017-09-07 19:14:07 - To new version license system
            $this->api_url = defined('DEVMAN_SERVER_TEST') ? DEVMAN_SERVER_TEST : 'https://devmanextensions.com/';

            $this->use_session_form = !$this->is_oc_3x;
            $this->form_token_name = 'devmanextensions_form_token_'.$this->extension_group_config;
            $this->form_session_name = 'devmanextensions_form_'.$this->extension_group_config;

            //Is the first time that configure extension?
                $this->setting_group_code = version_compare(VERSION, '2.0.1.0', '>=') ? 'code' : '`group`';
                $results = $this->db->query('SELECT setting_id FROM '. DB_PREFIX . 'setting WHERE '.$this->setting_group_code.' = "'.$this->extension_group_config.'" AND `key` NOT LIKE "%license_id%" LIMIT 1');
                $this->first_configuration = empty($results->row['setting_id']);
            //END

            //Devman Extensons - info@devmanextensions.com - 2016-10-09 19:39:52 - Load languages
                $languages = $this->model_localisation_language->getLanguages();
                $this->langs = $this->model_extension_devmanextensions_tools_trial->formatLanguages($languages);
            //END

            //Devman Extensions - info@devmanextensions.com - 2017-08-29 19:25:03 - Get customer groups
                $customer_groups = $this->model_extension_devmanextensions_tools_trial->getCustomerGroups();
                $this->cg = $customer_groups;
            //END

            $this->oc_2 = version_compare(VERSION, '2.0.0.0', '>=');
            $this->oc_3 = version_compare(VERSION, '3.0.0.0', '>=');

            $form_basic_datas = array(
                'tab_changelog' => false,
                'tab_help' => false,
                'tab_faq' => true,
                'extension_id' => $this->extension_id,
                'first_configuration' => $this->first_configuration,
                'stores' => $this->stores,
                'languages' => $this->langs,
                'oc_2' => $this->oc_2,
                'oc_3' => $this->oc_3,
                'version' => VERSION,
                'token' => $this->token,
                'extension_group_config' => $this->extension_group_config,
                'no_image_thumb' => $this->no_image_thumb,
                'lang' => array(
                    'choose_store' => $this->language->get('choose_store'),
                    'text_browse' => $this->language->get('text_browse'),
                    'text_clear' => $this->language->get('text_clear'),
                    'text_sort_order' => $this->language->get('text_sort_order'),
                    'text_clone_row' => $this->language->get('text_clone_row'),
                    'text_remove' => $this->language->get('text_remove'),
                    'text_add_module' => $this->language->get('text_add_module'),
                    'tab_help' => $this->language->get('tab_help'),
                    'tab_changelog' => $this->language->get('tab_changelog'),
                    'tab_faq' => $this->language->get('tab_faq'),
                ),
            );

            $this->form_basic_datas = $form_basic_datas;
        //END

        if ($this->request->get['route'] == $this->real_extension_type.'/'.$this->extension_name)
            $this->form = $this->_construct_view_form();

        $this->column_product_description_enabled = true;
    }

    public function index() {
        /*$this->_construct_view_form();
        die("delete_this!");*/

        //Set document title
            $this->document->setTitle($this->language->get('heading_title_2'));

        //Devman Extensions - info@devmanextensions.com - 2016-10-21 18:57:30 - Custom functions
            if(
                !empty($this->request->post['ajax_function']) || !empty($this->request->get['ajax_function'])
                ||
                !empty($this->request->post[$this->extension_group_config.'_ajax_function']) || !empty($this->request->get[$this->extension_group_config.'ajax_function'])
            )
            {
                if(!empty($this->request->post['ajax_function']) || !empty($this->request->get['ajax_function']))
                    $index = 'ajax_function';
                else
                    $index = $this->extension_group_config.'_force_function';

                $post_get = !empty($this->request->post[$index]) ? 'post' : 'get';
                $this->{$this->request->{$post_get}[$index]}();
            }
        //END

        //Pressed save button
            if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
                $this->session->data['error'] = '';

                //Devman Extensions - info@devmanextensions.com - 2016-10-21 18:57:30 - Custom functions
                    if(
                        !empty($this->request->post['force_function']) || !empty($this->request->get['force_function'])
                        ||
                        !empty($this->request->post[$this->extension_group_config.'_force_function']) || !empty($this->request->get[$this->extension_group_config.'force_function'])
                    )
                    {
                        if(!empty($this->request->post['force_function']) || !empty($this->request->get['force_function']))
                            $index = 'force_function';
                        else
                            $index = $this->extension_group_config.'_force_function';

                        $post_get = !empty($this->request->post[$index]) ? 'post' : 'get';
                        $this->{$this->request->{$post_get}[$index]}();
                    }
                //END

                //OC Versions compatibility
                $this->_redirect($this->real_extension_type.'/'.$this->extension_name);
            }
            else
                $this->importing = '';
        //END Pressed save button

        //Send token to view
            $this->data_to_view['token'] = $this->session->data[$this->token_name];

        //Actions
            $this->data_to_view['action'] = $this->url->link($this->real_extension_type.'/'.$this->extension_name, $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL');

            $this->data_to_view['cancel'] = $this->url->link(version_compare(VERSION, '2.0.0.0', '>=') ? $this->extension_url_cancel_oc_2x : $this->extension_url_cancel_oc_15x, $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL');

        //Devman Extensions - info@devmanextensions.com - 2017-06-28 20:47:35 - Opencart 3.x compatibility with alerts
            if(version_compare(VERSION, '3.0.0.0', '>='))
            {
                if(!empty($this->session->data['error']))
                {

                    $this->data_to_view['error_warning'] = $this->session->data['error'];
                    unset($this->session->data['error']);
                }

                if(!empty($this->session->data['error_expired']))
                {
                    $this->data_to_view['error_warning_expired'] = $this->session->data['error_expired'];
                    unset($this->session->data['error_expired']);
                }

                if(!empty($this->session->data['success']))
                {
                    $this->data_to_view['success_message'] = $this->session->data['success'];
                    unset($this->session->data['success']);
                }

                if(!empty($this->session->data['info']))
                {
                    $this->data_to_view['info_message'] = $this->session->data['info'];
                    unset($this->session->data['info']);
                }
            }
        //END

        //Load extension languages
            $lang_array = array(
                'heading_title',
                'heading_title_2',
                'button_save',
                'button_cancel',
                'apply_changes',
                'text_image_manager',
                'text_browse',
                'text_clear',
                'image_upload_description',
                'text_validate_license',
                'text_license_id',
                'text_send',
            );

            foreach ($lang_array as $key => $value) {
                $this->data_to_view[$value] = $this->language->get($value);
            }
        //END Load extension languages

        //Devman Extensons - info@devmanextensions.com - 2016-11-19 14:43:03 - Send custom variables to view
            $this->_send_custom_variables_to_view();
        //END

        $this->data_to_view['breadcrumbs'] = array();
        $this->data_to_view['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'),
            'separator' => false
        );

        $this->data_to_view['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title_2'),
            'href'      => $this->url->link($this->real_extension_type.'/'.$this->extension_name, $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'),
            'separator' => ' :: '
        );

        $this->data_to_view['form'] = $this->form;

        //OC Versions compatibility
            if(version_compare(VERSION, '2.0.0.0', '>='))
            {
                $data = $this->data_to_view;
                $data['header'] = $this->load->controller('common/header');
                $data['column_left'] = $this->load->controller('common/column_left');
                $data['footer'] = $this->load->controller('common/footer');

                $this->response->setOutput($this->load->view($this->real_extension_type.'/'.$this->extension_view, $data));
            }
            else
            {
                $this->data = $this->data_to_view;
                $this->template = $this->real_extension_type.'/'.$this->extension_view;
                $this->children = array(
                    'common/header',
                    'common/footer'
                );

                $this->response->setOutput($this->render());
            }
    }

    private function validate() {
        if (!$this->user->hasPermission('modify', $this->real_extension_type.'/'.$this->extension_name)) {
            if(!empty($this->request->post['no_exit']))
            {
                $array_return = array(
                    'error' => true,
                    'message' => $this->language->get('error_permission')
                );
                echo json_encode($array_return); die;
            }
            else
                throw new Exception($this->language->get('error_permission'));
                //$this->session->data['error'] = $this->language->get('error_permission');
            return false;
        }
        return true;
    }

    //<editor-fold desc="Functions called by ajax">
        public function convert_to_innodb() {
            $this->load->language($this->real_extension_type.'/import_xls');
            $array_return = array('error' => false, 'message' => $this->language->get('success_inno_db'));

            $rs = $this->db->query("SELECT TABLE_NAME FROM INFORMATION_SCHEMA.TABLES
            WHERE TABLE_SCHEMA = '".DB_DATABASE."' 
            AND ENGINE = 'MyISAM'");

            foreach ($rs->rows as $key => $table) {
                try {
                    $this->db->query("ALTER TABLE `".$table['TABLE_NAME']."` ENGINE=INNODB");
                } catch (Exception $e) {
                    $array_return['error'] = true;
                    $array_return['message'] = $e->getMessage();
                    break;
                }
            }

            if(!$array_return['error'])
            {
                $temp = array(
                    'import_xls_innodb_converted' => true
                );

                $this->load->model('setting/setting');
                $this->model_setting_setting->editSetting('import_xls', $temp);
            }

            echo json_encode($array_return); die;
        }
        public function save_configuration() {
            $this->request->post['no_exit'] = true;
            if($this->validate())
            {
                $this->load->language($this->real_extension_type.'/import_xls');
                $ignore_inputs = array(
                    'no_exit',
                    'force_function',
                    'import_xls_select_unselect_all',
                    'import_xls_value',
                    'import_xls_i_want_export',
                    'import_xls_main_conditional',
                    'import_xls_field',
                    'import_xls_condition_number',
                    'import_xls_condition_string',
                    'import_xls_condition_date',
                    'import_xls_condition_boolean',
                    'import_xls_value',
                    'import_xls_value_date',
                    'import_xls_deleted',
                    'import_xls_attributes_export_only_assigned',
                    'import_xls_attributes_export_only_not_assigned',
                    'import_xls_option_values_export_only_assigned',
                    'import_xls_option_values_export_only_not_assigned',
                    'import_xls_filters_export_only_assigned',
                    'import_xls_filters_export_only_not_assigned',
                );

                $post_data = $this->request->post;

                foreach ($post_data as $key => $value) {
                    if(in_array($key, $ignore_inputs) || strpos($key, 'import_xls_export_') !== false)
                        unset($post_data[$key]);
                }

                $post_data['import_xls_innodb_converted'] = $this->config->get('import_xls_innodb_converted');

                $this->load->model('setting/setting');
                $this->model_setting_setting->editSetting('import_xls', $post_data);

                $this->session->data['success'] = $this->language->get('save_configuration_success');
                $array_return = array('error' => false, 'message' => $this->language->get('save_configuration_success'));
                echo json_encode($array_return); die;
            }
        }
    //</editor-fold>

    //<editor-fold desc="Functions related with excel file operations">
        public function read_xls_full($file, $sheet_number = 1) {
            $data = array('status' => 'progress_import_xls_reading');
            $this->model_extension_module_import_export_xls->update_process($data);

            $reader = ReaderFactory::create(Type::XLSX);
            $reader->open($file);

            $final_excel = array(
                'columns' => array(),
                'data' => array(),
            );

            $rows = 0;

            foreach ($reader->getSheetIterator() as $sheet) {
                foreach ($sheet->getRowIterator() as $key => $row) {
                    $rows++;
                    $data = array('message' => sprintf($this->language->get('progress_import_xls_reading_rows'), $rows));
                    $this->model_extension_module_import_export_xls->update_process($data, true);

                    if ($key == 1) {
                        $columns_only_spaces = array();
                        foreach ($row as $col_numb => $col) {
                           if (strlen($col) > 0 && strlen(trim($col)) == 0)
                               $columns_only_spaces[] = $col_numb+1;
                        }
                        if(!empty($columns_only_spaces))
                            throw new Exception(sprintf($this->language->get('ajax_checking_file_column_spaces'), implode($columns_only_spaces, ',')));

                        $final_excel['columns'] = $row;
                    } else {
                        foreach ($row as $key2 => $dat) {
                            if(is_a($dat, 'DateTime')) {
                                $temp = $dat->format('Y-m-d');
                                $row[$key2] = $temp;
                            }
                        }
                        $final_excel['data'][] = $row;
                    }
                }
                break;
            }

            $reader->close();

            return $final_excel;
        }
        public function validate_columns_names($xls_data, $force_type = '', $google_format = false) {
            $error = false;

            $hopped_columns = $this->get_hopped_columns(false, $force_type);
            $all_columns = $this->get_hopped_columns(true);
            $colum_final_check = $google_format ? $this->google_spreadsheet_get_columns_formatted($hopped_columns) : $hopped_columns;

            $xls_columns = $xls_data['columns'];

            foreach ($xls_columns as $key => $ec) {
                $found = false;
                foreach ($colum_final_check as $key2 => $hc) {
                    if($hc == $ec) {
                        $found = true;
                        break;
                    }
                }
                if(!$found)  {
                    $error .=  '<li>'.sprintf($this->language->get('error_column_name'), $ec).'</li>';
                }
            }

            if($error)
                throw new Exception($error);

            return true;
        }
        public function validate_columns_data($xls_data, $pattern) {
            $error = false;

            $column_name = $this->language->get('Name').($this->count_languages > 1 ? ' '.$this->default_language_code : '');

            //Get all models
            $models = $this->db->query('SELECT model FROM '.DB_PREFIX.'product');

            $model_products = array();

            foreach ($xls_data['data'] as $row => $data) {

                $row += 2;

                $index_model = array_key_exists($this->language->get('Model'), $pattern) && $pattern[$this->language->get('Model')]['created'] ? $pattern[$this->language->get('Model')]['index'] : '';
                $model = array_key_exists($index_model, $data) ? $data[$index_model] : '';

                $index_product_id = array_key_exists($this->language->get('Product ID'), $pattern) && $pattern[$this->language->get('Product ID')]['created'] ? $pattern[$this->language->get('Product ID')]['index'] : '';
                $product_id = array_key_exists($index_product_id, $data) ? $data[$index_product_id] : '';

                //Model and product is empty
                if(empty($model) && empty($product_id))
                    $error .= '<li>'.sprintf($this->language->get('error_data_empty_model'), $row).'</li>';

                //Option, Option type or option value empty
                    $index_option_type = array_key_exists($this->language->get('Option type'), $pattern) && array_key_exists('index', $pattern[$this->language->get('Option type')]) ? $pattern[$this->language->get('Option type')]['index'] : '';
                    $option_type = !empty($index_option_type) && array_key_exists($index_option_type, $data) && !empty($data[$index_option_type]) ? $data[$index_option_type] : 'select';
                    $value_cant_empty = in_array($option_type, $this->opt_types_val_requires);

                    if($this->count_languages == 1)
                    {
                        if(!empty($pattern[$this->language->get('Option')]['index']) && !empty($pattern[$this->language->get('Option value')]['index']))
                        {
                            if(!empty($data[$pattern[$this->language->get('Option')]['index']]) || !empty($data[$pattern[$this->language->get('Option value')]['index']]))
                            {
                                if ($value_cant_empty && empty($data[$pattern[$this->language->get('Option value')]['index']]))
                                    $error .= '<li>'.sprintf($this->language->get('error_data_empty_option_value'), $row).'</li>';

                                if (empty($data[$pattern[$this->language->get('Option')]['index']]))
                                    $error .= '<li>'.sprintf($this->language->get('error_data_empty_option'), $row).'</li>';
                            }
                        }
                    }
                    else
                    {
                        if(!empty($pattern[$this->language->get('Option').' '.$this->default_language_code]['index']) && !empty($pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']))
                        {
                            if(!empty($data[$pattern[$this->language->get('Option').' '.$this->default_language_code]['index']]) || !empty($data[$pattern[$this->language->get('Option type')]['index']]) || !empty($data[$pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']]))
                            {
                                if ($value_cant_empty && empty($data[$pattern[$this->language->get('Option value').' '.$this->default_language_code]['index']]))
                                    $error .= '<li>'.sprintf($this->language->get('error_data_empty_option_value'), $row).'</li>';

                                if (empty($data[$pattern[$this->language->get('Option').' '.$this->default_language_code]['index']]))
                                    $error .= '<li>'.sprintf($this->language->get('error_data_empty_option'), $row).'</li>';
                            }
                        }
                    }
                //END Option, Option type or option value empty

                //Option type incorrect
                    $option_types = array('select', 'radio', 'text', 'checkbox', 'image', 'date', 'datetime', 'textarea', 'file');
                    if(!empty($pattern[$this->language->get('Option type')]['index']) && !empty($data[$pattern[$this->language->get('Option type')]['index']]))
                    {
                        if(!in_array($data[$pattern[$this->language->get('Option type')]['index']], $option_types))
                            $error .= '<li>'.sprintf($this->language->get('error_data_wrong_options_type'), $row).'</li>';
                    }
                //END Option type incorrect

                //Option prefix incorrect
                    $option_prefix = array('+', '-', '*', '=', '%', '~+', '~-', '~*', '~=', '~%');
                    if(!empty($pattern[$this->language->get('Option price prefix')]['index']) && !empty($data[$pattern[$this->language->get('Option price prefix')]['index']]))
                    {
                        if(!in_array($data[$pattern[$this->language->get('Option price prefix')]['index']], $option_prefix))
                            $error .= '<li>'.sprintf($this->language->get('error_data_wrong_options_prefix'), $row).'</li>';
                    }
                    if(!empty($pattern[$this->language->get('Option points prefix')]['index']) && !empty($data[$pattern[$this->language->get('Option points prefix')]['index']]))
                    {
                        if(!in_array($data[$pattern[$this->language->get('Option points prefix')]['index']], $option_prefix))
                            $error .= '<li>'.sprintf($this->language->get('error_data_wrong_options_prefix'), $row).'</li>';
                    }
                    if(!empty($pattern[$this->language->get('Option weight prefix')]['index']) && !empty($data[$pattern[$this->language->get('Option weight prefix')]['index']]))
                    {
                        if(!in_array($data[$pattern[$this->language->get('Option weight prefix')]['index']], $option_prefix))
                            $error .= '<li>'.sprintf($this->language->get('error_data_wrong_options_prefix'), $row).'</li>';
                    }
                //END Option prefix incorrect
            }

            if($error)
                throw new Exception($error);

            return true;
        }
        public function get_xls_pattern($xls_data, $force_type = '', $google_format = false) {
            $hopped_columns = $this->get_hopped_columns(false, $force_type);

            $xls_columns = $xls_data['columns'];

            $array_columns = array();
            $index = 0;

            foreach ($hopped_columns as $key2 => $hopped_colum) {
                $hopped_colum_final = $google_format ? $this->google_spreadsheet_get_column_name_formatted($hopped_colum) : $hopped_colum;

                $array_columns[$hopped_colum] = array();
                $array_columns[$hopped_colum]['created'] = false;
                $array_columns[$hopped_colum]['index'] = false;

                foreach ($xls_columns as $key => $excel_column) {
                    if($hopped_colum_final == $excel_column) {
                        $array_columns[$hopped_colum]['created'] = true;
                        $array_columns[$hopped_colum]['index'] = $google_format ? $excel_column : $key;
                    }
                }
            }
            return $array_columns;
        }
        public function get_hopped_columns($get_all = false, $force_type = '') {
            $uploading = !empty($force_type) ? $force_type : $this->importing;

            $columns = array(
                $this->language->get('Product ID'),
                $this->language->get('Model'),
                $this->language->get('Name'),
                $this->language->get('Description'),
                $this->language->get('Meta description'),
                $this->language->get('Meta title'),
                $this->language->get('Meta keywords'),
                $this->language->get('SEO url'),
                $this->language->get('Tags'),
                $this->language->get('SKU'),
                $this->language->get('EAN'),
                $this->language->get('UPC'),
                $this->language->get('JAN'),
                $this->language->get('MPN'),
                $this->language->get('ISBN'),
                $this->language->get('Minimum'),
                $this->language->get('Subtract'),
                $this->language->get('Out stock status'),
                $this->language->get('Price'),
                $this->language->get('Quantity'),
                $this->language->get('Points'),
                $this->language->get('Weight'),
                $this->language->get('Option'),
                $this->language->get('Option type'),
                $this->language->get('Option value'),
                $this->language->get('Option value sort order'),
                $this->language->get('Option required'),
                $this->language->get('Option subtract'),
                $this->language->get('Option image'),
                $this->language->get('Option price prefix'),
                $this->language->get('Option points prefix'),
                $this->language->get('Option weight prefix'),
                $this->language->get('Option SKU (Options Boost)'),
                $this->language->get('Option image (Options Boost)'),
            );

            foreach ($this->customer_groups as $id => $cg) {
                for ($i=1; $i <= $this->spen; $i++) {
                    array_push($columns, $this->language->get('Spe. ') . $i . $this->language->get(' Priority') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Spe. ') . $i . $this->language->get(' Price') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Spe. ') . $i . $this->language->get(' Date start') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Spe. ') . $i . $this->language->get(' Date end') . ' ' . $cg['name']);
                }
            }
            foreach ($this->customer_groups as $id => $cg) {
                for ($i=1; $i <= $this->disn; $i++) {
                    array_push($columns, $this->language->get('Dis. ') . $i . $this->language->get(' Quantity') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Dis. ') . $i . $this->language->get(' Priority') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Dis. ') . $i . $this->language->get(' Price') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Dis. ') . $i . $this->language->get(' Date start') . ' ' . $cg['name']);
                    array_push($columns, $this->language->get('Dis. ') . $i . $this->language->get(' Date end') . ' ' . $cg['name']);
                }
            }

            array_push($columns, $this->language->get('Manufacturer'));

            foreach ($this->array_category_columns_name as $col_name) {
                if($this->count_languages > 1)
                {
                    foreach ($col_name as $key => $languages) {
                        foreach ($languages as $lang_code => $col_name_real) {
                            array_push($columns, $col_name_real.' '.$lang_code);
                        }
                    }
                }
                else
                    array_push($columns, $col_name);
            }

            array_push($columns, $this->language->get('Main image'));
            for ($i=2; $i <= $this->extimgn ; $i++) {
                array_push($columns, $this->language->get('Image').' '.$i);
            }

            array_push($columns, $this->language->get('Products related'));
            array_push($columns, $this->language->get('Date available'));
            array_push($columns, $this->language->get('Requires shipping'));
            array_push($columns, $this->language->get('Location'));
            array_push($columns, $this->language->get('Tax class'));
            array_push($columns, $this->language->get('Sort order'));
            array_push($columns, $this->language->get('Store'));
            array_push($columns, $this->language->get('Status'));
            array_push($columns, $this->language->get('Class weight'));
            array_push($columns, $this->language->get('Class length'));
            array_push($columns, $this->language->get('Length'));
            array_push($columns, $this->language->get('Width'));
            array_push($columns, $this->language->get('Height'));

            for ($i=1; $i <= $this->attn; $i++) {
                array_push($columns, $this->language->get('Attr. Group').' '.$i);
                array_push($columns, $this->language->get('Attribute').' '.$i);
                array_push($columns, $this->language->get('Attribute value').' '.$i);
            }
            for ($i=1; $i <= $this->filgron; $i++) {
                array_push($columns, $this->language->get('Filter Group').' '.$i);
                for ($j=1; $j <= $this->filgrofiln; $j++) {
                    array_push($columns, $this->language->get('Filter Gr.').$i.' '.$this->language->get('filter').' '.$j);
                }
            }

            for ($i=1; $i <= $this->down; $i++) {
                array_push($columns, $this->language->get('Download name').' '.$i);
                array_push($columns, $this->language->get('Download file').' '.$i);
                array_push($columns, $this->language->get('Download hash').' '.$i);
                array_push($columns, $this->language->get('Download mask').' '.$i);
            }

            array_push($columns, $this->language->get('Layout'));
            array_push($columns, $this->language->get('Deleted'));

            //Add extra columns here

            //Add multilanguage and multistore columns to hopped columns
            $columns = $this->model_extension_module_export_xls->add_multilanguage_multistore_fields_to_hopped_columns($columns);

            //Customer group Points

                $final_columns = array();

                foreach ($columns as $key => $col_name) {
                    $final_columns[] = $col_name;
                    if($col_name == $this->language->get('Points'))
                    {
                        foreach ($this->customer_groups as $key => $cg) {
                            $final_columns[] = $this->language->get('Points').' '.$cg['name'];
                        }
                    }
                }
                $columns = $final_columns;
            //END Customer group points

            //OC Versions compatibility
            if(version_compare(VERSION, '2.0.0.0', '<'))
            {
                foreach ($columns as $key => $col_name) {
                    if(strstr($col_name,$this->language->get('Meta title')))
                        unset($columns[$key]);
                }
            }
            $columns = array_values($columns);

            return $columns;
        }
    //</editor-fold>

    //<editor-fold desc="Another functions">
        function catchError($errno = '', $errstr = '', $errfile = '', $errline = '')
        {
            $message = '<b>Error number</b>: '.$errno.'<br>';
            $message .= '<b>Error details</b>: '.$errstr.'<br>';
            $message .= '<b>Error file</b>: '.$errfile.'<br>';
            $message .= '<b>Error line</b>: '.$errline;
            throw new Exception($message);
        }
        public  function _redirect($url) {
            if(version_compare(VERSION, '2.0.0.0', '>='))
                $this->response->redirect($this->url->link($url, $this->token_name.'=' . $this->session->data[$this->token_name]));
            else
                $this->redirect($this->url->link($url, $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'));
        }
    //</editor-fold>

    //<editor-fold desc="Functions import process">
        public function ajax_clean_progress() {
            $array_return = array('error' => false);
            set_error_handler(array(&$this, 'catchError'));
            try{
                $this->model_extension_module_import_export_xls->clean_process();
            } catch (Exception $e) {
                $array_return['error'] = true;
                $array_return['message'] = $e->getMessage();
                echo json_encode($array_return); die;
            }
            restore_error_handler();
            echo json_encode($array_return); die;
        }

        public function ajax_start_import()
        {
            set_error_handler(array(&$this, 'catchError'));
            try{
                //<editor-fold desc="Validate file">
                    $data = array('status' => 'progress_import_starting');
                    $this->model_extension_module_import_export_xls->update_process($data);

                    $this->validate();

                    $data = array('status' => 'progress_import_validating_file');
                    $this->model_extension_module_import_export_xls->update_process($data);

                    $array_return = array('error' => false, 'message' => $this->language->get('ajax_importing_validating_file'));
                    $file_name = array_key_exists('file', $_FILES) && array_key_exists('name', $_FILES['file']) ? $_FILES['file']['name'] : '';
                    $file_tmp_name = array_key_exists('file', $_FILES) && array_key_exists('tmp_name', $_FILES['file']) ? $_FILES['file']['tmp_name'] : '';
                    $file_size = array_key_exists('file', $_FILES) && array_key_exists('size', $_FILES['file']) ? ($_FILES['file']['size'] * .0009765625) * .0009765625 : '';

                    $type = array_key_exists('type', $this->request->post) ? $this->request->post['type'] : '';
                    $spreadsheet = array_key_exists('spreadsheet', $this->request->post) ? $this->request->post['spreadsheet'] : '';
                    $google_format = false;

                    if ((empty($file_name) || empty($file_tmp_name)) && empty($spreadsheet))
                        throw new Exception($this->language->get('ajax_checking_file_empty_file'));

                    if ($type == 'undefined')
                        throw new Exception($this->language->get('ajax_checking_file_empty_type'));

                    if (!empty($file_name)) {
                        $extension_file = pathinfo($file_name, PATHINFO_EXTENSION);

                        if (!in_array($extension_file, array('xlsx', 'xml')))
                            throw new Exception($this->language->get('ajax_checking_file_wrong_extension'));

                        $post_max_size = (float)ini_get('post_max_size');

                        if ($file_size > $post_max_size)
                            throw new Exception(sprintf($this->language->get('ajax_checking_file_post_max_size'), $post_max_size, round($file_size,4)));

                        $this->importing = $type;

                        if (!in_array($type, array('backups', 'orders')) && $extension_file != 'xml') {
                            $xls_data = $this->read_xls_full($file_tmp_name);
                            $pattern = $this->get_xls_pattern($xls_data);
                        } elseif (!in_array($type, array('backups', 'orders')) && $extension_file == 'xml') {
                            $xls_data = $this->read_xml_full($file_tmp_name);
                            $pattern = $this->get_xml_pattern($xls_data);
                        }
                    }

                    $data = array('status' => 'progress_import_validating_column_names');
                    $this->model_extension_module_import_export_xls->update_process($data);

                    $this->validate_columns_names($xls_data, '');


                    $data = array('status' => 'progress_import_validating_product_data');
                    $this->model_extension_module_import_export_xls->update_process($data);
                    $this->validate_columns_data($xls_data, $pattern);
                //</editor-fold>

                //<editor-fold desc="Start import">
                    $this->load->model('extension/module/import_xls');

                    $results = array(
                        'elements_created' => 0,
                        'elements_modified' => 0,
                        'elements_deleted' => 0,
                    );
                    $this->db->query("START TRANSACTION");
                        $import_started = true;
                        $results = $this->model_extension_module_import_xls->start_import($xls_data, $pattern);
                        $data = array('status' => 'progress_import_applying_changes');
                        $this->model_extension_module_import_export_xls->update_process($data);
                    $this->db->query("COMMIT");

                    $message = '';
                    if(!empty($results)) {
                        $message = sprintf($this->language->get('progress_import_import_finished_resume'), $results['elements_deleted'], $results['elements_modified'], $results['elements_created'] );
                    }

                    $data = array('status' => 'progress_import_import_finished', 'title' => $this->language->get('progress_import_import_finished'), 'message' => $message);
                    $this->model_extension_module_import_export_xls->update_process($data);
                //</editor-fold>
            } catch (Exception $e) {
                if(isset($import_started))
                    $this->db->query("ROLLBACK");

                $data = array(
                    'status' => 'error',
                    'message' => $e->getMessage(),
                );
                $this->model_extension_module_import_export_xls->update_process($data);
            }
            restore_error_handler();
        }

        public function ajax_stop_import() {
            $data = array(
                'status' => 'error',
                'title' => $this->language->get('ajax_importing_internal_error'),
                'message' => array_key_exists('error', $this->request->post) ? $this->request->post['error'] : $this->language->get('ajax_importing_internal_error'),
                'error'=> true
            );

            $this->model_extension_module_import_export_xls->update_process($data);
            echo json_encode(array('error' => 'false')); die;
        }
    //</editor-fold>

    //<editor-fold desc="Functions export proccess">
        public function export() {
            set_error_handler(array(&$this, 'catchError'));
            try {
                $data = array('status' => 'progress_export_start_process');
                $this->model_extension_module_import_export_xls->update_process($data);
                $filename = array_key_exists('products_export_spreadsheet_name', $this->request->post) && !empty($this->request->post['products_export_spreadsheet_name']) ? $this->request->post['products_export_spreadsheet_name'] : '';
                $export_format = !empty($this->request->post['format']) ? $this->request->post['format'] : 'xlsx';

                //Devman Extensions - info@devmanextensions.com - 2017-07-04 20:59:41 - Scape fields
                    if(!empty($this->request->post))
                    {
                        foreach ($this->request->post as $field_name => $val) {
                            if (strpos($field_name, 'import_xls_export_') !== false && !is_array($val))
                                $this->request->post[$field_name] = $this->db->escape($val);
                        }
                    }
                //END

                $sheetName = $this->language->get('Products');

                $data = array('status' => 'progress_export_getting_column_names');
                $this->model_extension_module_import_export_xls->update_process($data);
                $columns_names = $this->get_columns_name_array_to_export();

                if(empty($this->request->get['empty_file'])) {
                    $data = array('status' => 'progress_export_getting_elements_to_export');
                    $this->model_extension_module_import_export_xls->update_process($data);
                    $products_to_export = $this->get_products_to_export();
                    $rows_to_excel = count($products_to_export);
                    $data = array('message' => sprintf($this->language->get('progress_export_element_to_excel'), $rows_to_excel));
                    $this->model_extension_module_import_export_xls->update_process($data);
                }


                $data = array('status' => 'progress_export_aplying_styles_columns');
                $this->model_extension_module_import_export_xls->update_process($data);

                $filename = empty($this->request->get['empty_file']) ? date('Y-m-d-His').' - '.$this->language->get('export_data_products') : $this->filename;
                $filePath = empty($this->request->get['empty_file']) ? $this->export_history_folder . $filename . '.xlsx' : DIR_TEMPLATE . ''.$this->real_extension_type.'/' . $filename . '.xlsx';
                $downloadPath = empty($this->request->get['empty_file']) ? $this->export_history_path . $filename . '.xlsx' : HTTPS_SERVER . 'view/template/'.$this->real_extension_type.'/' . $filename . '.xlsx';

                $writer = WriterFactory::create(Type::XLSX);
                $writer->openToFile($filePath);

                $firstSheet = $writer->getCurrentSheet();
                $firstSheet->setName($sheetName);

                //Devman Extensions - info@devmanextensions.com - 2017-01-20 15:49:04 - Insert columns
                $border = (new BorderBuilder())
                    ->setBorderTop('000000', Border::WIDTH_THIN)
                    ->setBorderBottom('000000', Border::WIDTH_THIN)
                    ->setBorderLeft('000000', Border::WIDTH_THIN)
                    ->setBorderRight('000000', Border::WIDTH_THIN)
                    ->build();
                $style = (new StyleBuilder())
                    ->setBorder($border)
                    ->setFontBold()
                    ->setFontSize(11)
                    ->setFontColor('ffffff')
                    ->setShouldWrapText(false)
                    ->setBackgroundColor('55acee')
                    ->build();

                //Devman Extensions - info@devmanextensions.com - 2017-09-21 20:42:39 - Creating styles
                $styles_array = array();
                foreach ($columns_names as $key => $col) {
                    $styles_array[] = $col['background'];
                }
                $styles_array = array_unique($styles_array);

                $styles_final = array();

                foreach ($styles_array as $bg_color) {
                    $styles_final[$bg_color] = (new StyleBuilder())
                        ->setBorder($border)
                        ->setFontBold()
                        ->setFontSize(10)
                        ->setFontColor('ffffff')
                        ->setShouldWrapText(false)
                        ->setBackgroundColor($bg_color)
                        ->build();
                }
                //END

                $final_column_names = array();

                foreach ($columns_names as $key2 => $col) {
                    $final_column_names[] = array(
                        'value' => $col['name'],
                        'style' => $styles_final[$col['background']]
                    );
                }
                $writer->addRowWithStyle($final_column_names, $style);
                //END

                //Devman Extensions - info@devmanextensions.com - 2017-01-20 16:01:58 - Exporting products
                $border = (new BorderBuilder())->build();
                if (empty($this->request->get['empty_file'])) {
                    $style = (new StyleBuilder())
                        ->setBorder($border)
                        ->setShouldWrapText(false)
                        ->build();

                    if (!empty($products_to_export)) {
                        //$writer->addRowsWithStyle($products_to_export, $style);
                        $data = array('message' => sprintf($this->language->get('progress_export_element_to_excel_count'), 0, $rows_to_excel));
                        $this->model_extension_module_import_export_xls->update_process($data);

                        foreach ($products_to_export as $key => $prod) {
                            $writer->addRowWithStyle($prod, $style);
                            $data = array('message' => sprintf($this->language->get('progress_export_element_to_excel_count'), ($key+1), $rows_to_excel));
                            $this->model_extension_module_import_export_xls->update_process($data, true);
                        }
                    }
                }
                //END

                $writer->close();
                $data = array('status' => 'progress_export_finished', 'redirect' => $downloadPath);
                $this->model_extension_module_import_export_xls->update_process($data);
            } catch (Exception $e) {
                $data = array(
                    'status' => 'error',
                    'message' => $e->getMessage(),
                );
                $this->model_extension_module_import_export_xls->update_process($data);
            }
            restore_error_handler();

            if(empty($this->request->get['empty_file'])) {
                echo json_encode(array('status' => 'export_finished'));
                die;
            } else {
                header('Location: ' . $downloadPath);
                exit();
            }
        }

        private function get_products_to_export() {

            $data = array('status' => 'progress_export_aplying_filters');
            $this->model_extension_module_import_export_xls->update_process($data);

            foreach ($this->request->post as $key => $val) {
                if(!is_array($val) && $val == 'null')
                    unset($this->request->post[$key]);
                else if(is_array($val) && count($val) == 1 && $val[0] == 'null')
                    unset($this->request->post[$key]);
            }

            //Devman Extensions - info@devmanextensions.com - 2017-07-04 21:04:05 - Export optimization
                $columns = $this->get_columns_names_formatted();

                $variables_active = array('attr', 'filter', 'dis', 'spe', 'option', 'seo_url', 'image', 'related', 'points', 'download');

                foreach ($variables_active as $key => $var_active) {
                    ${$var_active.'_status'} = false;

                    //Special case to column image
                    if($var_active == 'image')
                    {
                        foreach ($columns as $key2 => $col) {
                            if (strpos($col, $var_active) !== false && !in_array($col, array('option_image', 'option_image_options_boost')))
                                ${$var_active.'_status'} = true;
                        }
                    }elseif($var_active == 'points')  //Special case to column points
                    {
                        foreach ($columns as $key2 => $col) {
                            if (strpos($col, $var_active) !== false && $col != 'option_points_prefix')
                                ${$var_active.'_status'} = true;
                        }
                    }
                    else
                    {
                        foreach ($columns as $key2 => $col) {
                            if (strpos($col, $var_active) !== false)
                                ${$var_active.'_status'} = true;
                        }
                    }
                }
            //END

            //Devman Extensions - info@devmanextensions.com - 2017-01-20 16:07:50 - Get products it by filter sent
                $where_inserted = false;

                //Get all options
                $all_options = $option_status ? $this->model_extension_module_export_xls->get_all_options() : array();

                //Get all attributes
                $all_attributes = $attr_status ? $this->model_extension_module_export_xls->get_all_attributes() : array();

                //Get all filters
                $all_filters = array();

                if($this->hasFilters)
                    $all_filters = $filter_status ? $this->model_extension_module_export_xls->get_all_filters() : array();

                //Get all manufacturers
                $all_manufacturers = $this->model_extension_module_export_xls->get_all_manufacturers();

                //Get all categories
                $all_categories = $this->model_extension_module_export_xls->get_all_categories();

                //Get all products
                $database =& $this->db;
                $sql = "SELECT p.product_id FROM " . DB_PREFIX . "product p";

                //Check ranges
                    if(!empty($this->request->post['import_xls_export_range_from']) && !empty($this->request->post['import_xls_export_range_to']))
                    {
                        $from = $this->request->post['import_xls_export_range_from'];
                        $to = $this->request->post['import_xls_export_range_to'];

                        if(!is_numeric($from) || !is_numeric($to))
                        {
                            $this->session->data['error'] = $this->language->get('export_range_error_number');
                            $error = true;
                        }
                        elseif($from > $to)
                        {
                            $this->session->data['error'] = $this->language->get('export_range_error_more');
                            $error = true;
                        }

                        if(!empty($error))
                        {
                            if(version_compare(VERSION, '2.0.0.0', '>='))
                                $this->response->redirect($this->url->link($this->real_extension_type.'/import_xls', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'));
                            else
                                $this->redirect($this->url->link($this->real_extension_type.'/import_xls', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'));
                        }else
                        {
                            $sql .= ' limit '.($from-1).','.($to-($from-1));
                        }
                    }
                //END Check ranges
                $data = array('status' => 'progress_export_getting_elements');
                $this->model_extension_module_import_export_xls->update_process($data);
                $result = $database->query( $sql );

                $products_to_format = count($result->rows);
                $data = array('message' => sprintf($this->language->get('progress_export_elements_formatted'), 0, $products_to_format));
                $this->model_extension_module_import_export_xls->update_process($data);
            //END

            //Devman Extensions - info@devmanextensions.com - 2017-01-20 16:08:14 - Get products formated to insert directly to excel file
                $final_products_array = array();
                $products_formatted = 0;
                if(!empty($result))
                {
                    foreach ($result->rows as $pro) {
                        $product = $this->model_catalog_product->getProduct($pro['product_id']);

                        if(!empty($product))
                        {
                            $product['product_description'] = $this->model_catalog_product->getProductDescriptions($pro['product_id']);
                            $product['product_store'] = $this->model_catalog_product->getProductStores($pro['product_id']);
                            $product['product_categories'] = $this->model_catalog_product->getProductCategories($pro['product_id']);

                            if($this->hasFilters)
                                $product['product_filters'] = $filter_status ? $this->model_catalog_product->getProductFilters($pro['product_id']) : array();

                            $product['product_attributes'] = $attr_status ? $this->model_catalog_product->getProductAttributes($pro['product_id']) : array();
                            $product['product_options'] = $option_status ? $this->model_catalog_product->getProductOptions($pro['product_id']) : array();

                            //Devman Extensions - info@devmanextensions.com - 2017-07-03 20:14:23 - SEO URL multilanguage, more than Opencart 3.0.0.0
                                if($this->is_oc_3x)
                                    $product['product_seo_url'] = $seo_url_status ? $this->model_catalog_product->getProductSeoUrls($pro['product_id']) : array();
                            //END

                            //Devman Extensions - info@devmanextensions.com - 2017-04-22 16:53:21 - Add sort order to option value
                            //END
                            $product['product_options_values'] = array();

                            foreach ($product['product_options'] as $product_option) {
                                if ($product_option['type'] == 'select' || $product_option['type'] == 'radio' || $product_option['type'] == 'checkbox' || $product_option['type'] == 'image') {
                                    if (!isset($product['product_options_values'][$product_option['option_id']])) {
                                        $product['product_options_values'][$product_option['option_id']] = $this->model_catalog_option->getOptionValues($product_option['option_id']);
                                    }
                                }elseif($product_option['type'] == 'text')
                                {

                                }
                            }

                            $product['product_discount'] = $dis_status ? $this->model_catalog_product->getProductDiscounts($pro['product_id']) : array();
                            foreach ($product['product_discount'] as $key2 => $dis) {
                                $product['product_discount'][$key2]['date_start'] = $dis['date_start'] == '0000-00-00' ? '' : $dis['date_start'];
                                $product['product_discount'][$key2]['date_end'] = $dis['date_end'] == '0000-00-00' ? '' : $dis['date_end'];
                            }
                            $product['product_special'] = $spe_status ? $this->model_catalog_product->getProductSpecials($pro['product_id']) : array();
                            foreach ($product['product_special'] as $key2 => $spe) {
                                $product['product_special'][$key2]['date_start'] = $spe['date_start'] == '0000-00-00' ? '' : $spe['date_start'];
                                $product['product_special'][$key2]['date_end'] = $spe['date_end'] == '0000-00-00' ? '' : $spe['date_end'];
                            }
                            $product['product_images'] = $image_status ? $this->model_catalog_product->getProductImages($pro['product_id']) : array();
                            $product['related'] = $related_status ? $this->model_catalog_product->getProductRelated($pro['product_id']) : array();
                            $product['product_layout'] = $this->model_catalog_product->getProductLayouts($pro['product_id']);
                            $product['product_reward'] = $points_status ? $this->model_catalog_product->getProductRewards($pro['product_id']) : array();
                            $product['product_download'] = $download_status ? $this->model_catalog_product->getProductDownloads($pro['product_id']) : array();

                            $products = $this->model_extension_module_export_xls->format_products($product, $all_options, $all_attributes, $all_filters, $all_manufacturers, $all_categories);

                            foreach ($products as $key => $pro_temp) {
                                $final_products_array[] = $this->get_product_to_export($pro_temp);
                            }

                            $products_formatted++;
                            $data = array('message' => sprintf($this->language->get('progress_export_elements_formatted'), $products_formatted, $products_to_format));
                            $this->model_extension_module_import_export_xls->update_process($data, true);
                        }
                    }
                }
            //END
            return $final_products_array;
        }
        private function get_columns_names_formatted() {
            $product_fields = array();

            $columns = $this->get_hopped_columns();
            foreach ($columns as $key => $col_name) {
                $product_fields[] = $this->model_extension_module_import_xls->format_column_name($col_name);
            }

            return $product_fields;
        }
        private function get_product_to_export($product) {
            $product_fields = $this->get_columns_names_formatted();

            $num_colums = count($product_fields);

            if(version_compare(VERSION, '2.0.0.0', '<'))
            {
                foreach ($product_fields as $key => $field) {
                    if(strpos($field, 'meta_title') !== false)
                        unset($product_fields[$key]); //META_TITLE
                }

                $product_fields = array_values($product_fields);
            }

            $product_return = array();
            foreach ($product_fields as $key => $field) {
                if (strpos($field, 'description') !== false)
                    $product[$field] = html_entity_decode($product[$field]);

                if(in_array($field, $product_fields))
                {
                    $product_return[] = array_key_exists($field, $product) ? $product[$field] : '';
                }
            }
            return $product_return;
        }
        private function get_columns_name_array_to_export() {
            $columns = $this->get_hopped_columns();

            $final_columns = array();

            foreach ($columns as $key => $col_name) {
                $final_columns[] = array(
                    'name' => $col_name,
                    'background' => strtoupper($this->get_column_background($col_name))
                );
            }

            return $final_columns;
        }
        private function get_column_background($col_name) {
            $array_styles = array('30c5f0','31869b','60497a','e26b0a','c0504d','9bbb59','948a54','4f6228','1f497d','494529','30c5f0','403151','a6a6a6','974706','595959');

            switch ($col_name) {
                case strstr($col_name,$this->language->get('Model')):
                case strstr($col_name,$this->language->get('Name')):
                case strstr($col_name,$this->language->get('Description')):
                    return $array_styles[0];
                break;

                case strstr($col_name,$this->language->get('Meta description')):
                case strstr($col_name,$this->language->get('Meta title')):
                case strstr($col_name,$this->language->get('Meta keywords')):
                case strstr($col_name,$this->language->get('SEO url')):
                case strstr($col_name,$this->language->get('Tags')):
                    return $array_styles[1];
                break;

                case strstr($col_name,$this->language->get('SKU')):
                case strstr($col_name,$this->language->get('EAN')):
                case strstr($col_name,$this->language->get('UPC')):
                case strstr($col_name,$this->language->get('JAN')):
                case strstr($col_name,$this->language->get('MPN')):
                case strstr($col_name,$this->language->get('ISBN')):
                    return $array_styles[2];
                break;

                case strstr($col_name,$this->language->get('Minimum')):
                case strstr($col_name,$this->language->get('Subtract')):
                case strstr($col_name,$this->language->get('Out stock status')):
                    return $array_styles[3];
                break;

                case strstr($col_name,$this->language->get('Price')):
                case strstr($col_name,$this->language->get('Quantity')):
                case strstr($col_name,$this->language->get('Points')):
                case strstr($col_name,$this->language->get('Weight')):
                    return $array_styles[5];
                break;

                case strstr($col_name,$this->language->get('Option')):
                case strstr($col_name,$this->language->get('Option type')):
                case strstr($col_name,$this->language->get('Option value')):
                case strstr($col_name,$this->language->get('Option value sort order')):
                case strstr($col_name,$this->language->get('Option required')):
                case strstr($col_name,$this->language->get('Option subtract')):
                case strstr($col_name,$this->language->get('Option image')):
                case strstr($col_name,$this->language->get('Option price prefix')):
                case strstr($col_name,$this->language->get('Option points prefix')):
                case strstr($col_name,$this->language->get('Option weight prefix')):
                case strstr($col_name,$this->language->get('Option SKU (Options Boost)')):
                case strstr($col_name,$this->language->get('Option image (Options Boost)')):
                    return $array_styles[4];
                break;

                case strstr($col_name,$this->language->get('Spe. Customer Group')):
                case strstr($col_name,$this->language->get('Spe. Priority')):
                case strstr($col_name,$this->language->get('Spe. Price')):
                case strstr($col_name,$this->language->get('Spe. Date start')):
                case strstr($col_name,$this->language->get('Spe. Date end')):
                    return $array_styles[6];
                break;



                case strstr($col_name,$this->language->get('Dis. ')):
                    return $array_styles[7];
                break;

                case strstr($col_name,$this->language->get('Manufacturer')):
                case strstr($col_name,$this->language->get('Cat.')):
                    return $array_styles[8];
                break;

                case strstr($col_name,$this->language->get('Main image')):
                case strstr($col_name,$this->language->get('Image')):
                    return $array_styles[9];
                break;

                case strstr($col_name,$this->language->get('Date available')):
                case strstr($col_name,$this->language->get('Requires shipping')):
                case strstr($col_name,$this->language->get('Location')):
                case strstr($col_name,$this->language->get('Tax class')):
                case strstr($col_name,$this->language->get('Sort order')):
                case strstr($col_name,$this->language->get('Store')):
                case strstr($col_name,$this->language->get('Status')):
                    return $array_styles[10];
                break;

                case strstr($col_name,$this->language->get('Class weight')):
                    return $array_styles[11];
                break;

                case strstr($col_name,$this->language->get('Class length')):
                case strstr($col_name,$this->language->get('Length')):
                case strstr($col_name,$this->language->get('Width')):
                case strstr($col_name,$this->language->get('Height')):
                    return $array_styles[12];
                break;


                case strstr($col_name,$this->language->get('Attr. Group')):
                case strstr($col_name,$this->language->get('Attribute')):
                case strstr($col_name,$this->language->get('Attribute value')):
                    return $array_styles[13];
                break;

                case strstr($col_name,$this->language->get('Filter Group')):
                case strstr($col_name,$this->language->get('Filter Gr.')):
                    return $array_styles[14];
                break;

                default:
                    return $array_styles[0];
                break;
            }
        }
        private function construct_style($color_rgb) {
            return array(
                'font'  => array(
                    'bold'  => true,
                    'color' => array('rgb' => 'FFFFFF'),
                    'size' => 10
                ),
                'fill' => array(
                    'color' => array('rgb' => $color_rgb),
                )
            );
        }
    //</editor-fold>

    public function _construct_view_form() {
        //Count products
            $sql = "SELECT COUNT(*) FROM " . DB_PREFIX . "product";
            $products_in_shop = $this->db->query($sql);
            $products_in_shop = $products_in_shop->row['COUNT(*)'];
        //END Count products

        //END
        $form_data = array(
            'action' => html_entity_decode($this->url->link($this->real_extension_type.'/import_xls', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL')),
            'oc_version' => $this->oc_version,
            'import_xls_innodb_converted' => $this->config->get('import_xls_innodb_converted'),
            'href_download_xls' => $this->url->link($this->real_extension_type.'/'.$this->extension_name.'/export&empty_file=true', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL'),
            'url_backup_tool' => $this->url->link('tool/backup', $this->token_name . '=' . $this->session->data[$this->token_name], 'SSL'),
            'products_in_shop' => $products_in_shop,
            'config' => array(
                'import_xls_categories_tree' => $this->config->get('import_xls_categories_tree'),
                'import_xls_categories_last_tree' => $this->config->get('import_xls_categories_last_tree'),

            )
        );

        $form_view = $this->model_extension_devmanextensions_tools_trial->_get_form($form_data);

        return $form_view;
    }

    public function _send_custom_variables_to_view() {
        $this->data_to_view['jquery_variables'] = array(
            'token' => $this->session->data[$this->token_name],
            'token_name' => $this->token_name,
            'action' => html_entity_decode($this->url->link($this->real_extension_type.'/import_xls', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL')),
            'convert_to_innodb_url' => htmlspecialchars_decode($this->url->link($this->real_extension_type.'/'.$this->extension_name.'&ajax_function=convert_to_innodb', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL')),
            'save_configuration_url' => html_entity_decode($this->url->link($this->real_extension_type.'/import_xls/save_configuration', $this->token_name.'=' . $this->session->data[$this->token_name], 'SSL')),
            'url_export' => 'index.php?route='.$this->real_extension_type.'/import_xls/export&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'text_image_manager' => $this->language->get('text_image_manager'),
            'progress_export_start_process' => $this->language->get('progress_export_start_process'),
            'url_ajax_validate_file' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_validate_file&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'ajax_checking_file_starting_import_process' => $this->language->get('ajax_checking_file_starting_import_process'),
            'url_ajax_start_import' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_start_import&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'url_ajax_clean_progress' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_clean_progress&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'url_ajax_check_import_process' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_check_import_process&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'url_ajax_finish_import' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_finish_import&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'url_ajax_stop_import' => 'index.php?route='.$this->real_extension_type.'/import_xls/ajax_stop_import&'.$this->token_name.'='.$this->session->data[$this->token_name],
            'progress_route' => $this->progress_route
        );
    }
}
?>