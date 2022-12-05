<?php

class Controller_Patient extends Controller
{
    function __construct()
    {
        $this->model = new Model_Patient();
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

        // получаем id авторизированного пациента
        $patient_id = $this->model->get_patientId_by_userId($_SESSION["user"]["id"]);
        $data1 = array($this->model->get_patient($patient_id));

        $data2 = $this->fill_selectors();
        $data = array($data1, $data2);

        $this->view->generate('patient_view.php', 'template_view.php', $data);
    }

    function fill_selectors()
    {
        $data = "";
        $result = $this->model->get_doctors();
        $this->cl_print_r($result, "eeeee");
        while ($row = $result["surname"] . ' ' . $result["name"] . ' ' . $result["middleName"]) {
            $data = $data . "<option>$row[0]</option>";
        }

        return $data;
    }


}