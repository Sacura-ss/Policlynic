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
        $data1 = "";
        $result = $this->model->get_specialities();
        while ($row = mysqli_fetch_array($result))
        {
            $data1 = $data1."<option>$row[0]</option>";
        }

        $data2 = "";
        $result = $this->model->get_categories();
        while ($row = mysqli_fetch_array($result))
        {
            $data2 = $data2."<option>$row[0]</option>";
        }

        $data = array($data1, $data2);
        $this->cl_print_r($data, 'data');

        $this->view->generate('signup_view.php', 'template_view.php', $data);
    }

}