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
        $this->cl_print_r($_SESSION, "session");
        $doctor_id = $this->model->get_doctorId_by_userId($_SESSION["user"]["id"]);
        $this->cl_print_r($doctor_id, "doctor_id");
        $data1 = array($this->model->get_doctor($doctor_id));
        $data2 = array($this->model->get_appointments_for_doctor($doctor_id));
        $data = array($data1, $data2);
        $this->cl_print_r($data, "data");
        $this->view->generate('doctor_view.php', 'template_view.php', $data);
    }

}