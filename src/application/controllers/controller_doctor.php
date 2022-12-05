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

        // получаем id авторизированного врачв
        $doctor_id = $this->model->get_doctorId_by_userId($_SESSION["user"]["id"]);
        $data1 = array($this->model->get_doctor($doctor_id));

        $data2 = $this->fill_selectors();
        $data = array($data1, $data2[0], $data2[1]);

        $this->view->generate('doctor_view.php', 'template_view.php', $data);
    }

    function fill_selectors()
    {
        $data1 = "";
        $result = $this->model->get_diagnoses();
        while ($row = mysqli_fetch_array($result))
        {
            $data1 = $data1."<option>$row[0]</option>";
        }

        $data2 = "";
        $result = $this->model->get_appointmentStatuses();
        while ($row = mysqli_fetch_array($result))
        {
            $data2 = $data2."<option>$row[0]</option>";
        }

        $data = array($data1, $data2);

        return $data;
    }


}