<?php

$extension_name = "Import / Export Basic";
$extension_name_image = '<a href="https://devmanextensions.com/" target="_blank"><img src="https://devmanextensions.com/trials/images/devman_face.png"> DevmanExtensions.com</a> - '.$extension_name;

// Heading
$_['heading_title']    = $extension_name_image.' (V.2.6.6)';
$_['heading_title_2']    = $extension_name;

//Generals
$_['text_module']  		= 'Modules';
$_['button_save']      		= 'Save';
$_['button_cancel']      	= 'Cancel';
$_['status']				= 'Status';
$_['active']				= 'Enabled';
$_['disabled']				= 'Disabled';
$_['text_success']			= 'Success: You have modified module '.$extension_name.'!';
$_['error_permission']    	= 'Warning: You do not have permission to modify module '.$extension_name.'!';
$_['apply_changes'] 		= 'Apply changes';
$_['text_image_manager']     = 'Image Manager';
$_['text_browse']            = 'Browse';
$_['text_clear']             = 'Clear';
$_['text_none_user'] = ' - None User - ';
$_['text_validate_license'] = 'Validate your license';
$_['text_license_id'] = 'Please, enter your Opencart order ID...';
$_['text_send'] = 'Send';
$_['choose_store'] = 'Choose store';

// Text
$_['text_buttom']      = 'Import / Export Basic';
$_['text_success']      = 'The import was successful!';
$_['error_permission']      = 'Not permission to import.';
$_['error_file_not_found']  = 'Not upload XLS file.';

//AJAX FILE PROCESS
    $_['ajax_checking_file_starting_import_process'] = 'Importing...';
    $_['ajax_checking_file_empty_modal_title'] = 'Checking your excel file...';
    $_['ajax_checking_file_empty_file'] = 'You didn\'t upload a <b>.xlsx</b> file or didn\'t put a spreadsheet name.';
    $_['ajax_checking_file_empty_type'] = 'Select what do you want import in <b>step 1</b>';
    $_['ajax_checking_file_wrong_extension']	= '<b>Error:</b> Please upload a <b>.xlsx</b> file. Old <b>.xls</b> format no valid';
    $_['ajax_checking_file_post_max_size'] = 'Filesize is overpassing your value "<b>post_max_size</b>".<br>post_max_size: <b>%s</b>MB<br>filesize: <b>%s</b>MB<br>Change this server value or upload a smaller file.';
    $_['ajax_checking_file_column_spaces'] = 'The next column numbers have only spaces in his names, delete these columns and import again: <b>%s</b>';
    $_['ajax_importing_validating_file'] = 'Validating file';
    $_['ajax_imported_element'] = '<b>%s</b> <b>%s</b> processed<br>';
    $_['ajax_created_element'] = '<b>%s</b> <b>%s</b> created<br>';
    $_['ajax_modified_element'] = '<b>%s</b> <b>%s</b> modified<br>';
    $_['ajax_deleted_element'] = '<b>%s</b> <b>%s</b> deleted<br>';
    $_['ajax_imported_successful'] = 'Import finished!';
    $_['ajax_importing_internal_error'] = 'Internal error';
    $_['ajax_importing_reading_datas'] = 'Importing elements...';
    $_['ajax_importing_aplying_changes'] = 'Applying changes safely...';
    $_['ajax_importing_downloading_images'] = 'Downloading images...';
    $_['ajax_importing_elements_name_products'] = 'Products';
    $_['ajax_importing_elements_name_categories'] = 'Categories';

    $_['ajax_importing_elements_name_attribute_groups'] = 'Attribute Groups';
    $_['ajax_importing_elements_name_attributes'] = 'Attributes';
    $_['ajax_importing_duplicate_attribute_group'] = 'Found more thant 1 attribute group with name <b>%s</b>';
    $_['ajax_importing_not_exist_attribute_group'] = 'Attribute Group <b>%s</b> doesn\'t exist';
    $_['ajax_importing_duplicate_attribute'] = 'Found more thant 1 attribute with name <b>%s</b>';

    $_['ajax_importing_elements_name_options'] = 'Options';
    $_['ajax_importing_elements_name_option_values'] = 'Option values';
    $_['ajax_importing_duplicate_option'] = 'Found more thant 1 Option with name <b>%s</b>';
    $_['ajax_importing_not_exist_option'] = 'Option <b>%s</b> doesn\'t exist';
    $_['ajax_importing_duplicate_option_value'] = 'Found more thant 1 option value with name <b>%s</b>';

    $_['ajax_importing_elements_name_filter_groups'] = 'Filter groups';
    $_['ajax_importing_elements_name_filters'] = 'Filters';
    $_['ajax_importing_duplicate_filter_group'] = 'Found more thant 1 filter group with name <b>%s</b>';
    $_['ajax_importing_not_exist_filter_group'] = 'Filter Group <b>%s</b> doesn\'t exist';
    $_['ajax_importing_duplicate_filter'] = 'Found more thant 1 filter with name <b>%s</b>';

    $_['ajax_importing_elements_name_customers'] = 'Customers';
    $_['ajax_importing_elements_name_customer_addresses'] = 'Customer Addresses';
    $_['ajax_importing_elements_name_customer_groups'] = 'Customer Groups';

    $_['ajax_importing_error_product_id_no_numeric'] = 'Found a Product ID no numeric: <b>%s</b>';
//END
//<editor-fold desc="New progress json import">
    $_['progress_import_starting'] = 'Starting import process...';
    $_['progress_import_error'] = 'Error';
    $_['progress_import_validating_file'] = 'Validating file...';
    $_['progress_import_validating_column_names'] = 'Validating column names...';
    $_['progress_import_validating_product_data'] = 'Validating product data...';
    $_['progress_import_xls_reading'] = 'Reading excel data...';
    $_['progress_import_xls_reading_rows'] = 'Excel rows processed <b>%s</b>';
    $_['progress_import_creating_categories'] = 'Creating categories...';
    $_['progress_import_creating_manufacturers'] = 'Creating manufacturers...';
    $_['progress_import_creating_options'] = 'Creating options...';
    $_['progress_import_creating_attributes'] = 'Creating attributes...';
    $_['progress_import_creating_filter'] = 'Creating filters...';
    $_['progress_import_creating_downloads'] = 'Creating downloads...';
    $_['progress_import_formatting_products'] = 'Formatting products...';
    $_['progress_import_formatting_products_to_import'] = 'Products to import: <b>%s</b>.';
    $_['progress_import_processing_product_images'] = 'Processing product images...';
    $_['progress_import_products_completed'] = 'Processed <b>%s</b> of <b>%s</b> products.';
    $_['progress_import_processing_related_products'] = 'Processing related products...';
    $_['progress_import_applying_changes'] = '<b>Applying changes safely...</b>';
    $_['progress_import_import_finished'] = 'Import finished!';
    $_['progress_import_import_finished_resume'] = '<b>Import finished!</b><br><ul><li>Elements deleted: <b>%s</b></li><li>Elements modified: <b>%s</b></li><li>Elements created: <b>%s</b></li></ul>';
//</editor-fold>

//<editor-fold desc="New progress json export">
    $_['progress_export_start_process'] = 'Exporting elements...';
    $_['progress_export_getting_column_names'] = 'Getting column names...';
    $_['progress_export_getting_elements_to_export'] = 'Getting elements to export...';
    $_['progress_export_aplying_filters'] = 'Applying export filters...';
    $_['progress_export_getting_elements'] = 'Getting elements from database...';
    $_['progress_export_aplying_styles_columns'] = 'Aplying column styles...';
    $_['progress_export_elements_formatted'] = 'Formatting elements <b>%s</b> of <b>%s</b>...';
    $_['progress_export_element_to_excel'] = 'Elements to insert in file <b>%s</b>.';
    $_['progress_export_element_to_excel_count'] = 'Elements inserted: <b>%s</b> of <b>%s</b>...';
    $_['progress_export_finished'] = 'Export finished, file downloaded.';

    $_['progress_export_google_spreadsheets_sending'] = 'Sending information to Google Spreadsheets';
//</editor-fold>

//ERRORS
	$_['error_column_name'] 			= '<b>Error columns:</b> incorrect column name "%s". Check tab rules.';
	$_['error_data_empty_name']			= '<b>Error data:</b> empty name in row %s.';
	$_['error_data_empty_model']		= '<b>Error data:</b> empty model and product ID in row %s. Fill one of both.';
	$_['error_data_repeat_category']	= '<b>Error data:</b> category "<b>%s</b>" repeated in row %s.';
	$_['error_data_empty_option']		= '<b>Error data:</b> option empty in row %s.';
	$_['error_data_empty_option_value']	= '<b>Error data:</b> option value empty in row %s.';
	$_['error_data_empty_option_type']	= '<b>Error data:</b> option type empty in row %s.';
	$_['error_data_wrong_options_type']		= '<b>Error data:</b> option type incorrect in row %s.';
	$_['error_data_wrong_options_prefix']		= '<b>Error data:</b> option prefix incorrect in row %s.';
	$_['error_data_model_repeat'] = '<b>Error data:</b> model <b>%s</b> repeat in row %s.';
	$_['error_repeat_category']	= '<b>Error:</b> found %s categories "<b>%s</b>" repeated in row %s.';

	$_['error_column_name_required']	= '<b>Error:</b> not found column required "Name"';
	$_['error_column_model_required']	= '<b>Error:</b> not found column required "Model"';

	$_['error_inno_db']	= 'Error while formatting to InnoDB motor';
	$_['success_inno_db']	= 'Success, your columns have now InnoDB motor!';

	$_['error_upload_file']	= '<b>Error:</b> Please upload a <b>.xlsx</b> file. Old <b>.xls</b> format no valid';
	$_['error_upload_twice'] = '<b>Error:</b> Only can do one import.';

	$_['error_downloading_image_main'] = 'The import was aborted, some errors downloading images:';
	$_['error_downloading_image'] = 'Can\'t get image from url <b>%s</b> for product with model <b>%s</b>.';

	$_['error_product_id_doesnt_exist'] = 'The product ID <b>%s</b> doesn\'t exist in your shop, if you are trying create this product, remove this ID, else, system will try edit it.';

//IMPORTING
	$_['import_success']	= 'The import was successful!';

	$_['image_upload_description']      = 'Upload images<br><span class="help">Can be a ZIP file.</span>';


//EXTENSION
	//TAB CONFIGURATION
		$_['tab_configuration'] = 'Configuration';

		$_['number_attributes'] = 'Attributes number';
		$_['number_filter_groups'] = 'Filter groups number';
		$_['number_filters'] = 'Filters number for each filter group';
		$_['number_categories'] = 'Categories number';
		$_['number_categories_help'] = 'Compatible with Category Tree disabled';
		$_['number_category_trees'] = 'Categories tree number';
		$_['number_category_trees_help'] = 'Compatible with Category Tree enabled';
		$_['number_category_tree_childrens'] = 'Categories number for each tree';
		$_['number_category_tree_childrens_help'] = 'Compatible with Category Tree enabled';
		$_['number_images'] = 'Images number';
		$_['number_discounts'] = 'Discounts number';
		$_['number_downloads'] = 'Downloads number';
	//END

	//TAB EXCEL COLUMNS
		$_['tab_configuration_column'] = 'Excel columns';
		$_['columns_configuration'] = 'Select columns that you want use';
		$_['select_unselect_all'] = 'SELECT/UNSELECT ALL';
	//END


    //<editor-fold desc="Tab Products">
        $_['tab_import'] = 'Import products';
		$_['tab_products'] = 'Import-Export Products';
		$_['step_recommended'] = '<b>Recommended </b> change your tables to InnoDB motor if hasn\'t.';
		$_['step_recommended_explain'] = 'If your database tables haven\'t InnoDB motor if while importing appear some unexpected error the previous datas that was inserted won\'t be deleted, however if you convert your tables to InnoDB motor the Rollback query will be compatible and if appear some unexpected error your datas inserted while import process will be deleted.<br><br><b>
 His shop won\'t be affected by this change motor</b>';
 		$_['convert_to_innodb'] = 'Convert to InnoDB';

 		$action_js = "$(this).find('i').first().toggleClass('fa-angle-down fa-angle-up')";

		$_['step_0'] = '<a onclick="$(\'.import_export_process_configuration\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-cog"></i></a> Configuration - Import/Export process';

		//Configuration
            $_['categories_tree'] = 'Category tree';
            $_['categories_tree_help'] = '';
            $_['categories_tree_legend'] = '* Category tree';
            $_['categories_tree_see_hide'] = 'Show/hide category tree';
            $_['rule_categories_tree_1'] = '<b>Enable:</b> If your products have <b>only 1 category tree</b>.';
            $_['rule_categories_tree_2'] = '<b>Enable:</b> The system creates category tree if not exist, also will create news childs if a part of this tree exist.';
            $_['rule_categories_tree_3'] = '<b>Disable:</b> If your products have <b>more than 1 category tree or haven\'t category tree</b>.';
            $_['rule_categories_tree_4'] = '<b>Disable:</b> The system will create all categories <b>LIKE PARENTS</b> only if not exist.';
            $_['rule_categories_tree_5'] = '<b>Disable:</b> <b>You haven\'t to have categories with same same</b> the system can\'t know what is the real category.';
            $_['rule_categories_tree_6'] = '<b>REMEMBER:</b> Always your categories names have to have <b>exactly</b> the same name of your existing categories in your shop, else the system will create new category.';

            $_['categories_last_tree'] = 'Last tree child assign';
            $_['categories_last_tree_help'] = 'If checked product will only be assigned to the last child of trees, else it will be assigned to all trees categories.';

            $_['strict_edit'] = 'Strict product edit';
            $_['strict_edit_help'] = 'IMPORTANT: Go to tab \'Import rules\' and search \'* Strict product edit\' section to know about this option.';
            $_['strict_edit_legend'] = '* Strict product edit';
            $_['strict_edit_see_hide'] = 'Show/hide strict product edit';
            $_['rule_strict_edit_1'] = '<b>Enable:</b> If you need delete datas of your products in news imports, for example images, options, attributes... Imagine that have a product in your shop with 1 option and 3 attributes, if you export excel, delete or leave in blank columns of options and attributes and import this excel, the options and attributes of this products will be deleted.';
            $_['rule_strict_edit_2'] = '<b>Disable:</b> If you don\'t need delete any of your products, only update his values.';
            $_['rule_strict_edit_3'] = '<b>Disable:</b> This is useful if you need update all prices of your products no need to import all values, you can export all products of your shop, delete all columns less prices and required columns (name and description) to change all prices and import, only will affected the prices.';

            $_['sum_tax'] = 'Sum tax to prices';
            $_['sum_tax_help'] = 'If checked the import system SUM tax to product in creation (if has)';

            $_['rest_tax'] = 'Rest tax to prices';
            $_['rest_tax_help'] = 'If checked the import system REST tax to product in creation (if has)';

            $_['save_configuration'] = 'Save configuration';
            $_['save_configuration_success'] = 'Configuration saved successfully!';
        //END

        //Excel columns
            $_['products_excel_column_legend'] = '<a onclick="$(\'.products_xls_columns_configuration\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-excel-o" aria-hidden="true"></i></a>Configuration - Excel columns';
        //END

        //Import process
            $_['products_import_process_legend'] = '<a onclick="$(\'.products_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import products';
            $_['step_1'] = '<b>1.-</b> Download empty XLS file and fill it or use exported file to bulk changes!';
            $_['step_1_button_download'] = 'Download xls file';

            $_['step_2'] = '<b>2.-</b> Modify your XLS file. (Optional)';
            $_['step_2_explain'] = 'You can delete unnecessary columns or change his order. <b>Never change column name or create new column</b> the system will detect this and give you error.<br>Visit <b>"Rules - Import products"</b> section to know default values to deleted or empty columns.';

            $_['step_3'] = '<b>3.-</b> Upload your filled XLS file or get it from Google SpreadSheets';
            $_['upload_file'] = 'Upload xls file';
            $_['upload_file_help'] = 'Remember visit Rules tab.';

            $_['upload_googlespreadsheets'] = 'Or get datas G. SpreadSheets';
            $_['upload_googlespreadsheets_help'] = 'Put exactly the name of your spreadsheet, don\'t forget share this sheet with your <b>Service account ID</b> before.';


            $_['step_4'] = '<b>4.-</b> Upload your images. (Optional)';
            $_['upload_images'] = 'Upload images';
            $_['upload_images_help'] = 'You can be upload all files once in <b>.zip</b> file.';

            $_['step_5'] = '<b>5.-</b> All ready? <b>Go to import!</b>';
            $_['import'] = 'Press button to start to import';
            $_['import_start'] = '<b>START IMPORT</b>';
            $_['import_help'] = '<b>IMPORTANT</b>: For your safety, make a backup before import.';

            $_['images_not_found']      = 'Images not found: <b>%s</b> of <b>%s</b>';
            $_['thead_number'] = 'Number';
            $_['thead_id'] = 'Id';
            $_['thead_model'] = 'Model';
            $_['thead_name'] = 'Name';
            $_['thead_image'] = 'Image';
        //END

        //Export process
            $_['products_export_process_legend'] = '<a onclick="$(\'.products_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export products';
            $_['tab_export'] = 'Export products';
            $_['export_legend'] = '<b>Export your product datas!</b> You can use this excel to bulk changes or Opencart migrations!';
            $_['export_range_to_help'] = 'Export products by ranges, you can put from <b>1</b> to <b>%s</b>.';
            $_['export_range_from_help'] = 'Export products by ranges, you can put from <b>1</b> to <b>%s</b>.';
            $_['export_range_from'] = 'Range from';
            $_['export_range_to'] = 'Range to';
            $_['export_price_between_from'] = 'Price between >';
            $_['export_price_between_from_help'] = 'Put the lowest price.';
            $_['export_price_between_to'] = 'Price between <';
            $_['export_price_between_to_help'] = 'Put the highest price.';
            $_['export_quantity_between_from'] = 'Quantity between >';
            $_['export_quantity_between_from_help'] = 'Put the lowest quantity.';
            $_['export_quantity_between_to'] = 'Quantity between <';
            $_['export_quantity_between_to_help'] = 'Put the highest quantity.';
            $_['export_categories'] = 'Categories';
            $_['export_manufacturers'] = 'Manufacturers';
            $_['export_button'] = 'Export xls file';
            $_['export_button_google_spreadsheet'] = 'Or send to G. Drive SpreadSheets';
            $_['export_filename_google_spread_sheet'] = 'SpreadSheet name';
            $_['products_export_filter_legend'] = 'Filters to apply to products';
            $_['export_range_error_number'] = 'Ranges have to be numbers';
            $_['export_range_error_more'] = '"From" is more than "To"';
            $_['export_products'] = 'Products by name';
            $_['export_products_help'] = 'Autocomplete by name';
            $_['export_product_models'] = 'Products by model';
            $_['export_product_models_help'] = 'Split models by "|"';
            $_['export_special'] = 'Special active';
            $_['export_special_help'] = 'ONLY export products that have a Special active';

            $_['export_tax_class_id'] = 'Tax class';
            $_['export_tax_class_id_help'] = 'ONLY export products that have the selected taxes';

            $_['export_data_products'] = 'Products';
        //END

        //Rules
            $_['products_import_rules_legend'] = '<a onclick="$(\'.products_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import products';

            $_['tab_rules'] = 'Import products rules';

            $_['default_values_legend'] = 'Importing new products - Default values (if column is deleted or cell is empty)';
            $_['default_values_see_hide'] = 'Show/hide default values';

                $_['thead_dv_number'] = '*';
                $_['thead_dv_name'] = 'Name';
                $_['thead_dv_default_value'] = 'Default value';
                $_['thead_dv_explain'] = 'Explain';
                $_['dv_required'] = '<b>Required</b>';
                $_['dv_autogenerate'] = '<b>Auto generated</b>';
                $_['dv_autocalculated'] = '<b>Auto calculated</b>';
                $_['dv_empty'] = 'Empty';
                $_['dv_will_default_store'] = 'Your default store';
                $_['dv_yes'] = 'Yes';
                $_['dv_will_be_yes'] = '%s will be "Yes"';
                $_['dv_enabled'] = 'Enabled';
                $_['dv_will_be_enabled'] = '%s will be "Enabled"';
                $_['dv_will_be_autogenerate_image'] = '%s will be auto generated basing in product model. Example: MOD1234.jpg';
                $_['dv_will_be_autocalculate_option_prefix'] = '%s will be auto calculated basing in product first product data with same name.';
                $_['dv_wont_have'] = 'The product won\'t have %s.';
                $_['dv_wont_be_deleted'] = 'The product won\'t be deleted.';
                $_['dv_will_be_empty'] = '%s will be empty.';
                $_['dv_will_be'] = '%s will be %s.';
                $_['dv_is_required'] = '%s is required.';
                $_['dv_will_be_autogenerate'] = '%s will be auto generated basing in product name.';
                $_['dv_will_be_autogenerate_available'] = '%s will be auto generated with current date.';
                $_['dv_will_be_autogenerate_meta_title'] = '%s will be auto generated with product name.';
                $_['dv_will_be_autogenerate_download_hash'] = '%s will be auto generated with token 32';
                $_['dv_will_be_autogenerate_download_mask'] = '%s will be the download name';

            $_['updating_products_legend'] = 'Updating existing products';
            $_['updating_products_see_hide'] = 'Show/hide updating existing products';

                $_['up_rule_1'] = 'If import system detects a product in your shop with <b>same model</b> this will be edited, else will be created.';
                $_['up_rule_2'] = 'You have 2 forms to edit product: <b>Strict edit enabled</b> OR <b>Strict edit disabled</b>. See section "<b>* Strict product edit</b>" to more information.';

            $_['creating_options_legend'] = 'Product with options';
            $_['creating_options_see_hide'] = 'Show/hide Product with options';
                $_['creating_options_explain'] = '
                    In this example will import a product called "<b>Shirt</b>".<br><br>
                    <b>The first row (in yellow) contain main product datas, you can see that hasn\'t any values in options columns</b>, the main datas of this product are:<br>
                    <ul>
                        <li>Price: 25.</li>
                        <li>Quantity: 50.</li>
                        <li>Points: 100.</li>
                        <li>Weight: 12,4.</li>
                    </ul>
                    The next 3 rows (in blue) with same <b>Model</b> are <b>options</b> of this product, there are:<br><br>
                    <ul>
                        <li><b>1º option (row 3) Size S</b>:
                            <ul>
                                <li>Price: 30 (the import system will autocalculate +5 in price, because the main price is 25).</li>
                                <li>Quantity: 10</li>
                                <li>Points: 125 (the import system will autocalculate +25 in points, because the main points are 100).</li>
                                <li>Weight: 13 (the import system will autocalculate +0.6 in weight, because the main weight is 12.4).</li>
                            </ul>
                        </li>
                        <li><b>2º option (row 4) Size M</b>:
                            <ul>
                                <li>Price: 32 (the import system will autocalculate +7 in price, because the main price is 25).</li>
                                <li>Quantity: 15</li>
                                <li>Points: 150 (the import system will autocalculate +50 in points, because the main points are 100).</li>
                                <li>Weight: 13,2 (the import system will autocalculate +0.8 in weight, because the main weight is 12.4).</li>
                            </ul>
                        </li>
                        <li><b>3º option (row 5) Size L</b>:
                            <ul>
                                <li>Price: 34 (the import system will autocalculate +9 in price, because the main price is 25).</li>
                                <li>Quantity: 25</li>
                                <li>Points: 175 (the import system will autocalculate +75 in points, because the main points are 100).</li>
                                <li>Weight: 13,4 (the import system will autocalculate +1 in weight, because the main weight is 12.4).</li>
                            </ul>
                        </li>
                    </ul>
                    <br>
                    If you don\'t want that system auto calculate prices, points or weights, you can specify the symbol of these in columns "<b>Option price prefix</b>", "<b>Option points prefix</b>" or "<b>Option weight prefix</b>" with symbols + or -.
                ';

            $_['possible_values_legend'] = 'Possible values (based in your store)';
            $_['possible_values_see_hide'] = 'Show/hide possible values';
                $_['possible_values_out_stock'] = 'Out stock status';
                $_['possible_values_option_types'] = 'Option type';
                $_['possible_values_option_prefixes'] = 'Option price prefix<br>Option points prefix<br>Option weight prefix';
                $_['possible_values_tax_class'] = 'Tax Class';
                $_['possible_values_store'] = 'Store';
                $_['possible_values_class_weight'] = 'Class weight';
                $_['possible_values_class_length'] = 'Class length';
                $_['possible_values_layouts'] = 'Layout';
                $_['possible_values_customer_groups'] = 'Customer groups';

            $_['general_rules_legend'] = '<b>GENERAL RULES - IMPORTANT</b>';
            $_['general_rules_see_hide'] = 'Show/hide general rules';
                $_['general_rules_model_name'] = 'Model or Product ID are required, you can\'t remove or leave in blank both columns.';
                $_['general_rules_product_edit'] = 'If import system detects a product in your shop with <b>same model or same product ID</b> this will be edited.';
                $_['general_rules_categories'] = '<b>Categories:</b> If a category doesn\'t exist the system will create it in appropriate level. <b>Case sensitive</b>.';
                $_['general_rules_related'] = '<b>Products related:</b> Put models separates by commas, example: Model1,Model2,Model3';
                $_['general_rules_date'] = '<b>Dates:</b> If you put a date (for example to special date start) is possible that excel auto put date format in this cell, change date format to text format before import.';
                $_['general_rules_manufactures'] = '<b>Manufacturer:</b> To related a product with a manufacturer the manufacturer name in xls file has to have the exactly same name that in your shop.';
                $_['general_rules_options'] = '<b>Option:</b> The system will group product by <b>Model</b> to construct product options.';
                $_['general_rules_images'] = '<b>Auto assign image:</b> If you didn\'t or deleted column "Main image" the system auto assign a image called "model_product.jpg" example MOD1234.jpg .';
                $_['general_rules_stores'] = '<b>Stores:</b> If a product has more than 1 store assigns you can slipt by symbol "|", for example: "0|1|2"';

            $_['downlod_demo_pack'] = 'Download demo pack';
                $_['downlod_demo_pack_text'] = '<a href="view/template/tool/import_xls_files/%s.zip">Download demo pack</a>, in this pack you can find an example filled xls file with options, categories, filter etc. Also images pack.<br><br>You can get the import result in this <a target="_new" href="http://opencartqualityextensions.com/opencart_demos/opencart_import_tool/">online demo shop</a>.';
        //END

        //IMAGES NOT FOUND
            $_['products_import_process_images_not_found'] = '<a onclick="$(\'.products_images_not_found\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Images not found';
        //END
    //</editor-fold>

    //<editor-fold desc="Tab extra exports">
        $_['tab_extra_exports'] = 'Extra exports';
        $_['extra_export_i_want'] = '1.- I want export...';
        $_['extra_export_categories'] = 'Categories';
        $_['extra_export_categories_help'] = 'First sheet Category datas, second sheet Category Tree only visual';
        $_['extra_export_attributes'] = 'Attributes';
        $_['extra_export_attributes_help'] = 'First sheet Attributes';
        $_['extra_export_attribute_groups'] = 'Attribute groups';
        $_['extra_export_attribute_groups_help'] = 'First sheet Attribute groups';
        $_['extra_export_options'] = 'Options';
        $_['extra_export_options_help'] = 'First sheet Options';
        $_['extra_export_option_values'] = 'Option values';
        $_['extra_export_option_values_help'] = 'First Option Values';
        $_['extra_export_filters'] = 'Filters';
        $_['extra_export_filters_help'] = 'First sheet Filters';
        $_['extra_export_filter_groups'] = 'Filter groups';
        $_['extra_export_filter_groups_help'] = 'First sheet Filter groups';
        $_['extra_export_customer_groups'] = 'Customer groups';
        $_['extra_export_customer_groups_help'] = 'First sheet Customer groups';
        $_['extra_export_addresses'] = 'Addresses';
        $_['extra_export_addresses_help'] = 'First sheet Addresses';
        $_['extra_export_customers'] = 'Customers';
        $_['extra_export_customers_help'] = 'First sheet Customers';
        $_['extra_export_filters_export'] = '2.- Filters to export';
        $_['extra_export_text_like'] = 'Contain';
        $_['extra_export_text_not_like'] = 'NOT contain';
        $_['extra_export_text_is'] = 'Is exactly';
        $_['extra_export_text_not_is'] = 'Is NOT exactly';
        $_['extra_export_filter_value'] = 'The value...';
        $_['extra_export_text_boolean_yes'] = 'Is yes';
        $_['extra_export_text_boolean_not'] = 'Is not';
        $_['extra_export_filter_delete'] = 'Delete filter';
        $_['extra_export_conditional'] = 'Conditional';
        $_['extra_export_conditional_or'] = 'OR';
        $_['extra_export_conditional_and'] = 'AND';
        $_['extra_export_filters_extra_export'] = '2.1.- Extra filters';
        $_['extra_export_export'] = '3.- Export!';
        $_['extra_export_button_export'] = 'Export!';
    //</editor-fold>

    //<editor-fold desc="Tab extra imports">
        $_['tab_extra_imports'] = 'Extra imports';
        $_['extra_import_i_want'] = '1.- I want import...';
        $_['extra_import_categories'] = 'Categories';
        $_['extra_import_attributes'] = 'Attributes';
        $_['extra_import_attribute_groups'] = 'Attribute groups';
        $_['extra_import_options'] = 'Options';
        $_['extra_import_option_values'] = 'Option values';
        $_['extra_import_filters'] = 'Filters';
        $_['extra_import_filter_groups'] = 'Filter groups';
        $_['extra_import_customer_groups'] = 'Customer groups';
        $_['extra_import_addresses'] = 'Addresses';
        $_['extra_import_customers'] = 'Customers';
        $_['extra_import_upload_file'] = '2.- Upload file';
        $_['extra_import_rules'] = '2.1.- Import rules';

        $_['extra_import_categories_rules'] = 'If you go to <b>create new categories</b> in your shop, you have to meet these rules to import will be successfully.
			<ol style="margin-top:15px;">
				<li><b>Respects in excel the order of your tree:</b> <b>First rows</b> have to be the <b>MAIN PARENTS</b>, the next rows the <b>childrens of these parents</b>, the next rows the <b>childrens of these childrens</b>....</b></li>
				<li>If your categories tree has <b>more than 2</b> levels, <b>you CAN\'T repeat category names</b>, example:<br><br>
					<img class="img-responsive" src="view/template/tool/import_xls_files/categories_tree.jpg">
				</li>
			</ol>
		';

        $_['extra_import_import'] = '3.- Import!';
        $_['extra_import_button_import'] = 'Import!';
    //</editor-fold>

    //TAB CATEGORIES
        $_['tab_categories'] = 'Categories';
        $_['categories_export_process_legend'] = '<a onclick="$(\'.categories_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export categories (First sheet Category datas, second sheet Category Tree only visual)';
        $_['categories_import_process_legend'] = '<a onclick="$(\'.categories_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import categories';
        $_['categories_import_rules'] = '<a onclick="$(\'.categories_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import categories';
    //END

    //TAB ATTRIBUTES
        $_['tab_attributes'] = 'Attributes';

        $_['attributes_export_only_assigned'] = 'Assigned';
        $_['attributes_export_only_assigned_help'] = 'Only export attributes assigned to some product.';
        $_['attributes_export_only_not_assigned'] = 'Not assigned';
        $_['attributes_export_only_not_assigned_help'] = 'Only export attributes NOT assigned to any product.';

        $_['attributes_export_process_legend'] = '<a onclick="$(\'.attributes_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export attributes (First sheet Attribute Groups, second sheet Attributes)';
        $_['attributes_import_only_attribute_groups'] = 'Only import Attribute Groups';
        $_['attributes_import_only_attribute_groups_help'] = 'Datas in first sheet';
        $_['attributes_import_only_attributes'] = 'Only import Attributes';
        $_['attributes_import_only_attributes_help'] = 'Datas in second sheet';

        $_['attributes_import_process_legend'] = '<a onclick="$(\'.attributes_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import attributes';
        $_['attributes_import_rules'] = '<a onclick="$(\'.attributes_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import attributes';
        $_['export_attributes_rules'] = 'RULES ATTRIBUTES';
        $_['export_button_attributes'] = 'Export attributes';
        $_['export_data_attributes'] = 'Attributes';
        $_['export_data_attribute_groups'] = 'Attribute groups';

        $_['ajax_importing_attributes_error_filter'] = 'Select some of 2 options "<b>'.$_['attributes_import_only_attribute_groups'].'</b>" or "<b>'.$_['attributes_import_only_attributes'].'</b>" (can be 2 options at once)';
    //END

    //TAB OPTIONS
        $_['tab_options'] = 'Options';

        $_['option_values_export_only_assigned'] = 'Assigned';
        $_['option_values_export_only_assigned_help'] = 'Only export options assigned to some product.';
        $_['option_values_export_only_not_assigned'] = 'Not assigned';
        $_['option_values_export_only_not_assigned_help'] = 'Only export options NOT assigned to any product.';

        $_['options_export_process_legend'] = '<a onclick="$(\'.options_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export options (First sheet Options, second sheet Option Values)';
        $_['options_import_only_options'] = 'Only import Options';
        $_['options_import_only_options_help'] = 'Datas in first sheet';
        $_['options_import_only_option_values'] = 'Only import Option values';
        $_['options_import_only_option_values_help'] = 'Datas in second sheet';

        $_['options_import_process_legend'] = '<a onclick="$(\'.options_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import options';
        $_['options_import_rules'] = '<a onclick="$(\'.options_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import options';
        $_['export_options_rules'] = 'RULES OPTIONS';
        $_['export_button_options'] = 'Export options';
        $_['export_data_option_values'] = 'Option values';
        $_['export_data_options'] = 'Options';

        $_['ajax_importing_options_error_filter'] = 'Select some of 2 options "<b>'.$_['options_import_only_options'].'</b>" or "<b>'.$_['options_import_only_options'].'</b>" (can be 2 options at once)';
    //END

    //TAB FILTERS
        $_['tab_filters'] = 'Filters';

        $_['filters_export_only_assigned'] = 'Assigned';
        $_['filters_export_only_assigned_help'] = 'Only export filters assigned to some product.';
        $_['filters_export_only_not_assigned'] = 'Not assigned';
        $_['filters_export_only_not_assigned_help'] = 'Only export filters NOT assigned to any product.';

        $_['filters_export_process_legend'] = '<a onclick="$(\'.filters_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export filters (First sheet Filter groups, second sheet Filters)';
        $_['filters_import_only_filter_groups'] = 'Only import Filter groups';
        $_['filters_import_only_filter_groups_help'] = 'Datas in first sheet';
        $_['filters_import_only_filters'] = 'Only import Filters';
        $_['filters_import_only_filters_help'] = 'Datas in second sheet';

        $_['filters_import_process_legend'] = '<a onclick="$(\'.filters_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import filters';
        $_['filters_import_rules'] = '<a onclick="$(\'.filters_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import filters';
        $_['export_filters_rules'] = 'RULES filters';
        $_['export_button_filters'] = 'Export filters';
        $_['export_data_filters'] = 'Filters';
        $_['export_data_filter_groups'] = 'Filter groups';
        $_['error_import_more_than_1_filter_name'] = 'Found more thant 1 filter with name <b>%s</b>';
        $_['error_import_filter_not_found'] = 'Filter <b>%s</b> not found.';
        $_['ajax_importing_filters_error_filter'] = 'Select some of 2 options "<b>'.$_['filters_import_only_filter_groups'].'</b>" or "<b>'.$_['filters_import_only_filters'].'</b>" (can be 2 options at once)';
    //END

    //TAB CUSTOMERS
        $_['tab_customers'] = 'Customers';

        $_['customers_export_process_legend'] = '<a onclick="$(\'.customers_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export customers (First sheet Customers, second sheet Customer Addresses, third sheet Customer Groups)';
        $_['customers_import_only_customer_groups'] = 'Only import Customer Groups';
        $_['customers_import_only_customer_groups_help'] = 'Datas in first sheet';
        $_['customers_import_only_customer_addresses'] = 'Only import Customer Addresses';
        $_['customers_import_only_customer_addresses_help'] = 'Datas in second sheet';
        $_['customers_import_only_customers'] = 'Only import Customers';
        $_['customers_import_only_customers_help'] = 'Datas in third sheet';


        $_['customers_import_process_legend'] = '<a onclick="$(\'.customers_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import customers';
        $_['customers_import_rules'] = '<a onclick="$(\'.customers_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import customers';
        $_['export_customers_rules'] = 'RULES customers';
        $_['export_button_customers'] = 'Export customers';
        $_['export_data_customers'] = 'Customers';
        $_['export_data_addresses'] = 'Addresses';
        $_['export_data_customer_groups'] = 'Customer groups';
        $_['error_import_more_than_1_customer_name'] = 'Found more thant 1 customer with name <b>%s</b>';
        $_['error_import_customer_not_found'] = 'Customer <b>%s</b> not found.';
        $_['ajax_importing_customers_error_customer'] = 'Select some of 3 options "<b>'.$_['customers_import_only_customers'].'</b>" or "<b>'.$_['customers_import_only_customer_addresses'].'</b>" or "<b>'.$_['customers_import_only_customer_groups'].'</b>" (can be 3 options at once)';

        $_['ajax_importing_duplicate_customer_group'] = 'Found more thant 1 customer group with name <b>%s</b>';
        $_['ajax_importing_not_exist_customer_group'] = 'Filter Group <b>%s</b> doesn\'t exist';
        $_['ajax_importing_duplicate_customer'] = 'Found more thant 1 customer with name <b>%s</b>';

        $_['ajax_importing_customers_empty_customer_id'] = 'Trying creating/edit address without Customer ID, on line <b>%s</b> sheet 2';
        $_['ajax_importing_addresses_country_not_found'] = 'Country <b>%s</b> not found.';
        $_['ajax_importing_addresses_zone_not_found'] = 'Zone <b>%s</b> not found to country ID <b>%s</b>.';
    //END

    //TAB ORDERS
        $_['tab_orders'] = 'Orders';

        $_['orders_export_process_legend'] = '<a onclick="$(\'.orders_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export orders (First sheet Order datas, second sheet Order Products, third sheet Order Totals)';
        $_['orders_import_only_orders'] = 'Only import Order Datas';
        $_['orders_import_only_orders_help'] = 'Datas in first sheet';
        $_['orders_import_only_order_products'] = 'Only import Order Products';
        $_['orders_import_only_order_products_help'] = 'Datas in second sheet';
        $_['orders_import_only_order_totals'] = 'Only import Order Totals';
        $_['orders_import_only_order_totals_help'] = 'Datas in third sheet';

        $_['orders_import_process_legend'] = '<a onclick="$(\'.orders_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import orders';
        $_['orders_import_rules'] = '<a onclick="$(\'.orders_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import orders';
        $_['export_orders_rules'] = 'RULES orders';
        $_['export_button_orders'] = 'Export orders';
        $_['export_data_orders'] = 'Orders';
        $_['export_data_order_totals'] = 'Totals';
        $_['export_data_order_products'] = 'Products';
        $_['error_import_more_than_1_order_name'] = 'Found more thant 1 order with name <b>%s</b>';
        $_['error_import_order_not_found'] = 'Order <b>%s</b> not found.';
        $_['ajax_importing_orders_error_order'] = 'Select some of 3 options "<b>'.$_['orders_import_only_orders'].'</b>" or "<b>'.$_['orders_import_only_order_totals'].'</b>" or "<b>'.$_['orders_import_only_order_products'].'</b>" (can be 3 options at once)';

        $_['ajax_importing_duplicate_order_product'] = 'Found more thant 1 order product with name <b>%s</b>';
        $_['ajax_importing_not_exist_order_product'] = 'Filter Product <b>%s</b> doesn\'t exist';
        $_['ajax_importing_duplicate_order'] = 'Found more thant 1 order with name <b>%s</b>';

        $_['ajax_importing_orders_empty_order_id'] = 'Trying creating/edit address without Order ID, on line <b>%s</b> sheet 2';
        $_['ajax_importing_totals_country_not_found'] = 'Country <b>%s</b> not found.';
        $_['ajax_importing_totals_zone_not_found'] = 'Zone <b>%s</b> not found to country ID <b>%s</b>.';
    //END

    //TAB BAKUPS
        $_['tab_backups'] = 'Backups or Migrations';

        $_['backups_export_process_legend'] = '<a onclick="$(\'.backups_export_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-download"></i></a>Export FULL shop datas for backups or Opencart version migrations';
        $_['backups_import_only_backups'] = 'Only import Backup Datas';
        $_['backups_import_only_backups_help'] = 'Datas in first sheet';
        $_['backups_import_only_backup_products'] = 'Only import Backup Products';
        $_['backups_import_only_backup_products_help'] = 'Datas in second sheet';
        $_['backups_import_only_backup_totals'] = 'Only import Backup Totals';
        $_['backups_import_only_backup_totals_help'] = 'Datas in third sheet';

        $_['backups_import_process_legend'] = '<a onclick="$(\'.backups_import_process\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-upload"></i></a>Import backups';
        $_['backups_import_rules'] = '<a onclick="$(\'.backups_import_rules\').toggle();'.$action_js.'" class="button"><i class="fa fa-angle-down" aria-hidden="true"></i><i class="fa fa-file-text"></i></a>Rules - Import backups';
        $_['export_backups_rules'] = 'RULES backups';
        $_['export_button_backups'] = 'Export datas selected';
        $_['export_data_backups'] = 'Backups';

        $_['ajax_importing_backups_total_elements'] = 'Elements';
        $_['ajax_importing_backups_table_elements'] = 'Table: <b>%s</b> - Elements inserted: <b>%s</b><br>';

        $_['backup_help_affiliates'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_attributes'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_banners'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_categories'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_countries'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_coupons'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_currencies'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_custom_fields'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_customers'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_downloads'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_filters'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_geo_zones'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_informations'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_languages'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_layouts'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_lengths'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_locations'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_manufacturers'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_marketings'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_modifications'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_options'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_orders'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_products'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_recurrings'] = 'New <b>profiles</b>. Will include all datas related with affiliates in another sheets';
        $_['backup_help_profiles'] = 'Old <b>recurrings</b>. Will include all datas related with affiliates in another sheets';
        $_['backup_help_returns'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_reviews'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_seo_urls'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_statistics'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_stock_statuses'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_stores'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_taxes'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_uploads'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_users'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_vouchers'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_weights'] = 'Will include all datas related with affiliates in another sheets';
        $_['backup_help_zones'] = 'Will include all datas related with affiliates in another sheets';

        $_['export_data_backups_error_group'] = 'Select 1 group of datas to export.';
        $_['backups_import_warning_message'] = '<b>WARNING:</b> Remember that backup that you try import in your shop, <b>will delete your current datas to regenerate all of these again</b>. Only will be <b>affected tables that are inside of your excel file</b>. By your safery, before import, recommended do a <a href="%s" target="_blank">database backup from your site in this link</a>. <b>We aren\'t the responsables of your actions!</b>';
        $_['backups_import_info_migration_language'] = '<b>Migrations and languages:</b> If you go to do a migration from <b>Opencart 1.5.x</b> to <b>Opencart 2.x or 3.x</b>, is possible that after do it, you need go to <b><a href="%s" target="_blank">settings > localisation > languages</a></b> and edit your languages to select correct value of field "<b>Code</b>".';
    //END

    //<editor-fold desc="Google SpreadSheets tab">
        $_['tab_google_spreadsheet_configuration'] = 'Google Sheets';
        $_['google_spreadsheet_configuration_legend'] = 'Google Spreadsheet configuration';
        $_['google_spreadsheet_configuration_create_api_legend'] = '1.- Create API and get JSON access file';
        $_['google_spreadsheet_configuration_create_api_text'] = '<p>By default, a new spreadsheet cannot be accessed via Google’s API. We’ll need to go to your Google APIs console and create a new project and set it up to expose your Spreadsheets’ data.</p>
            <ol>
                <li>Go to the <a href="https://console.developers.google.com/" taget="_blank">Google APIs Console</a>.</li>
                <li>Create a new project.</li>
                <li>Click Enable API. Search for and enable the Google Drive API.</li>
                <li>Create credentials for a Web Server to access Application Data.</li>
                <li>Name the service account and grant it a Project Role of Editor.</li>
                <li>A JSON file will be downloaded. Go to next section.</li>
            </ol>
            ';
        $_['google_spreadsheet_configuration_upload_json_legend'] = '2.- Upload JSON access file and save configuration';
        $_['google_spreadsheet_configuration_upload_json_button_upload'] = 'Upload JSON file';
        $_['google_spreadsheet_configuration_upload_json_button_save'] = 'Save configuration';
        $_['google_spreadsheet_configuration_upload_json_saved_successfully'] = 'JSON file uploaded successfully! Reloading page.';
        $_['google_spreadsheet_configuration_upload_json_error_extension'] = 'Upload .json file';
        $_['google_spreadsheet_configuration_account_id_not_found'] = 'Service account ID not found in your JSON file';
        $_['google_spreadsheet_configuration_upload_json_error_uploading'] = 'Error uploading JSON file, make sure that you gave 775 permiss to folder "<b>/admin/view/template/tool/import_xls_files</b>"';
        $_['google_spreadsheet_configuration_not_json_uploaded'] = 'JSON file didn\'t uploaded';
        $_['google_spreadsheet_configuration_not_access_token'] = 'Google Token accesss not found, JSON file didn\'t uploaded or credentials deleted from your Google Project.';

        $_['google_spreadsheet_configuration_share_sheet_legend'] = '3.- Share Sheets with your Service Account ID';
        $_['google_spreadsheet_configuration_share_sheet_explain'] = 'Finally, if you want <b>read datas</b> from some Google SpreadSheet, you need share this file with your "<b>Service account ID</b>", this is: <b>%s</b>';
        $_['google_spreadsheet_configuration_share_sheet_important'] = '<b>Important:</b> Your Google SpreadSheets have to have uniques names, the system will get the first occurrence by the searched name.';   //</editor-fold>
	    $_['google_spreadsheet_file_created_sucessfully'] = 'The SpreadSheet <b>%s</b> was updated successfully in your Google Drive';
	    $_['google_spreadsheet_file_not_found'] = 'The SpreadSheet <b>%s</b> was not found in your Google Drive. Did you share it with your "<b>Service account ID</b>"?';

    //Import categories
		$_['error_import_category_more_than_1_category_name'] = 'Found more thant 1 category with name <b>%s</b>';
		$_['error_import_category_parent_not_found'] = 'Category parent "<b>%s</b>" not found. Did you set this name in your main language name column?';
	//END

	//TAB EXPORT EXTRA
		$_['tab_export_extra'] = 'Extra Exports';
		$_['export_customers_legend'] = '<i class="fa fa-user"></i> Customers - Export compatibility';
		$_['export_data_customers'] = 'Customers';

		$_['export_orders_legend'] = '<i class="fa fa-shopping-cart"></i> Orders - Export compatibility';
		$_['export_data_orders'] = 'Orders';
		$_['export_data_order_totals'] = 'Order Totals';
		$_['export_data_order_products'] = 'Order Products';
		$_['export_button_customers'] = 'Export customers';
		$_['export_orders_include_order_products'] = 'Include order products';
		$_['export_orders_include_order_products_help'] = 'Will be include in new excel sheet';
		$_['export_orders_include_order_totals'] = 'Include order totals';
		$_['export_orders_include_order_totals_help'] = 'Will be include in new excel sheet';
		$_['export_button_orders'] = 'Export orders';

		$_['export_categories_legend'] = '<i class="fa fa-cube"></i> Categories - Export/Import compatibility';
		$_['export_categories_rules_button'] = 'RULES TO IMPORT NEW CATEGORIES';

		$_['export_button_categories'] = 'Export categories';
		$_['export_button_categories_help'] = '<b>First sheet</b>: category datas<br><b>Second sheet</b>: categories tree';
		$_['upload_file_categories_help'] = '<b>ONLY COMPATIBLE WITH FIRST SHEET - CATEGORY DATAS';
		$_['export_data_categories'] = 'Categories';
		$_['export_data_categories_sheet_datas'] = 'Category datas';
		$_['export_data_categories_sheet_tree'] = 'Categories tree';

	//END TAB EXPORT EXTRA

	//TAB RULES

	//END TAB RULES

	//TAB EXPORT HISTORY
		$_['tab_export_history'] = 'Export history';
		$_['tab_export_history_legend'] = 'Here you can download your export history';
		$_['export_history_file'] = 'File';
		$_['export_history_download'] = 'Download';
		$_['export_history_delete'] = 'Delete';
		$_['export_file_deleted_successful'] = 'File deleted successful';
		$_['export_file_deleted_error'] = 'Error deleting file';
	//END
//END EXTENSION

//Tab information
	$_['tab_help']		= 'Support';
	$_['tab_changelog']     = 'Changelog';
	$_['tab_faq']		= 'FAQ';
?>