<?php
class ModelExtensionModuleImportExportXls extends Model {
    function update_process($data, $replace_last_line = false) {
        $continue = array_key_exists('continue', $data) ? $data['continue'] : true;

        $status = array_key_exists('status', $data) ? $data['status'] : '';
        $message = array_key_exists('message', $data) ? $data['message'] : $this->language->get($status);
        $title = array_key_exists('title', $data) ? $data['title'] : '';
        $redirect = array_key_exists('redirect', $data) ? $data['redirect'] : '';

        switch ($status) {
            case 'progress_import_import_finished':
                $continue = false;
                $title = empty($title) ? $message : $title;
                $message = '<div class="alert alert-success">'.$message.'</div>';
            break;
            case 'progress_export_finished':
                $continue = false;
                $title = empty($title) ? $message : $title;
                $message = '<div class="alert alert-success">'.$message.'</div>';
            break;
            case 'error':
                $title = $this->language->get('progress_import_error');
                $continue = false;
                $message = '<div class="alert alert-danger">'.$message.'</div>';
            break;
            default:
                $message = date('Y-m-d H:i:s').' - '.$message;
            break;
        }

        $content = file_get_contents($this->progress_path);
        $content_array = json_decode($content, true);

        $content_array['continue'] = $continue;
        $content_array['status'] = $status;
        $content_array['redirect'] = $redirect;

        if(!array_key_exists('message', $content_array))
            $content_array['message'] = array();

        if($replace_last_line)
            array_pop($content_array['message']);

        $content_array['message'][] = $message;

        $content_array['title'] = $title;

        file_put_contents($this->progress_path, json_encode($content_array));

        if(in_array($status, array('progress_import_import_finished', 'error'))) {
            echo json_encode($content_array); die;
        }

        return true;
    }

    function clean_process() {
        file_put_contents($this->progress_path, '[]');
    }
} ?>