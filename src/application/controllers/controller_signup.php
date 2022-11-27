<?php

class Controller_signup extends Controller
{
    function __construct()
    {
        $this->model = new Model_Signup();
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
        $this->view->generate('signup_view.php', 'template_view.php', $data);
    }

}