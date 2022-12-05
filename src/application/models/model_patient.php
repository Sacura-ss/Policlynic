<?php

class Model_Patient extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    public function get_patient($id)
    {
        $query = $this->mysqli->query("SELECT `surname`, `name`, `middleName`, `shortDateBirth`, `numberMedicalPolicy` 
                        FROM Patients
                        WHERE `idPatient` = '$id' ");

        return $query->fetch_array(MYSQLI_ASSOC);
    }

    public function get_patientId_by_userId($user_id) {

        $query = $this->mysqli->query("SELECT `idPatient` 
                        FROM Patients
                        WHERE `idUser` = '$user_id'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idPatient"]);
    }

    public function get_doctors()
    {
        $query = $this->mysqli->query("SELECT concat(`surname`, ' ', `name`, ' ', `middleName`) 
                                        FROM Doctors");
        return $query;
    }

}