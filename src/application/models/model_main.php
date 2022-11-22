<?php

class Model_Main extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    public function get_doctor($FIO)
    {
        $query = $this->mysqli->query("SELECT s.`nameSpeciality`, c.`nameCategory` 
                        FROM Doctors d, Speciality s, Categories c
                        WHERE d.`surname` = '$FIO[0]' 
                        AND d.`name` = '$FIO[1]' 
                        AND d.`middleName` = '$FIO[2]'
                        AND d.`idSpeciality` = s.`idSpeciality`
                        AND d.`idCategory` = c.`idCategory`");

        return $query->fetch_array(MYSQLI_ASSOC);
    }

    public function get_diagnose($name_diagnosis)
    {
        $query = $this->mysqli->query("SELECT `descriptionDiagnosis` 
                        FROM Diagnoses where 
                        `nameDiagnosis` = '$name_diagnosis'");

        return $query->fetch_array(MYSQLI_ASSOC);
    }
}