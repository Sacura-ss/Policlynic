<?php

class Controller_Doctor extends Controller
{
    function __construct()
    {
        $this->model = new Model_Doctor();
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
        session_start();
        $this->view->generate('doctor_view.php', 'template_view.php', $data);
    }

}