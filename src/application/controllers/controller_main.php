<?php

class Controller_Main extends Controller
{
    function __construct()
    {
        $this->model = new Model_Main();
        $this->view = new View();
    }

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    function action_index()
    {
        if(isset($_POST['search_doctor'])) {
            $search1 = $_POST['search1'];
            $data1 = $this->model->get_doctor($this->parse_FIO($search1));
            $data = array($data1);
        }

        if(isset($_POST['search_diagnosis'])) {
            $search2 = $_POST['search2'];
            $data2 = $this->model->get_diagnose($search2);
            $data = array($data2);
        }

        $this->view->generate('main_view.php', 'template_view.php', $data);
    }

    function parse_FIO($string_from_search)
    {
        return explode(" ", $string_from_search);
    }
}