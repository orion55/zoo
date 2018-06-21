<?php 
class ModelExtensionDevmanextensionsToolsTrial extends Model {

    public function __construct($registry) {
        parent::__construct($registry);

        $loader = new Loader($registry);
        $loader->language('devmanextensions/tools_trial');

        $loader->model('localisation/language');

        //Devman Extensons - info@devmanextensions.com - 2016-10-09 19:39:52 - Load languages
            $languages = $this->model_localisation_language->getLanguages();
            $this->langs = $this->formatLanguages($languages);
        //END

        $this->oc_2 = version_compare(VERSION, '2.0.0.0', '>=');        
    }


    public function _get_form($form_data)
    {
        $data = array(
            'domain' => HTTP_CATALOG,
            'form' => json_encode($form_data),
            'form_basic_datas' => json_encode($this->form_basic_datas),
        );

        $result = $this->curl_call($data, $this->api_url.'opencart_trial/generate_form');
        //echo '<pre>'; print_r($result);  echo '</pre>'; die;
        $result = json_decode($result, true);
        if(array_key_exists('error', $result) && !empty($result['error'])) {
            $this->session->data['error'] = $result['error'];
        }
        else
            return $result['form'];
    }

    public function curl_call($data, $url)
    {
        if (!function_exists('curl_init')){
            $result = json_encode(array(
                'error' => true,
                'message' => '<b>cURL PHP library</b> is not installed in your server!'
            ));
        }
        else
        {
            $ch = curl_init();
            curl_setopt($ch, CURLOPT_URL, $url);
            curl_setopt($ch, CURLOPT_POST, true);
            curl_setopt($ch, CURLOPT_POSTFIELDS, $data);
            curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
            curl_setopt($ch, CURLOPT_HEADER, false);
            curl_setopt($ch, CURLOPT_TIMEOUT, 30);
            curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, false);
            $result = curl_exec($ch);
            if (curl_errno($ch)) {
               $result = json_encode(array(
                    'error' => true,
                    'message' => '<b>cURL error number '.curl_errno($ch).'</b>'
                ));
            }
            curl_close($ch);
        }
        return $result;
    }

    public function formatLanguages($languages)
    {
        $final_languages = array();

        foreach ($languages as $key => $lang) {
            $final_languages[$lang['language_id']] = $lang;
        }

        return $final_languages;
    }

    public function getCustomerGroups()
    {
        if(version_compare(VERSION, '2.0.3.1', '<='))
        {
            $model_path = 'sale/customer_group';
            $model_loaded = 'model_sale_customer_group';
        }else
        {
            $model_path = 'customer/customer_group';
            $model_loaded = 'model_customer_customer_group';
        }

        $this->load->model($model_path);
        $customer_groups = $this->{$model_loaded}->getCustomerGroups();

        return $customer_groups;
    }
    public function aasort ($array, $key) {
        $sorter=array();
        $ret=array();
        reset($array);
        foreach ($array as $ii => $va) {
            $sorter[$ii]=$va[$key];
        }
        asort($sorter);
        foreach ($sorter as $ii => $va) {
            $ret[$ii]=$array[$ii];
        }
        return $ret;
    }
}
?>