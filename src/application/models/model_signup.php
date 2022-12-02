<?php

class Model_Signup extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }


    public function check_login($login)
    {
        $query = $this->mysqli->query("SELECT * FROM `users` WHERE `login` = '$login'");
        return $query;
    }

    public function post_user($user_type, $login, $password)
    {
        $this->mysqli->query("INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) 
            VALUES (DEFAULT, '$user_type', '$login', '$password')");
    }

    public function post_doctor($user_id, $F, $I, $O, $phone, $speciality, $category)
    {
        $this->mysqli->query("INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) 
            VALUES (DEFAULT, '$user_id', '$F', '$I', '$O', '$phone', '$speciality', '$category');");

    }

    public function post_patient($user_id, $F, $I, $O, $date, $phone, $address, $policy)
    {
        $this->mysqli->query("INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) 
            VALUES (DEFAULT, '$user_id', '$F', '$I', '$O', '$date', '$phone', '$address', '$policy');");
    }

    public function get_user_id($user_type, $login, $password)
    {
        $query = $this->mysqli->query("SELECT `idUser` 
                        FROM Users where 
                        `typeUser` = '$user_type'
                        AND `login` = '$login'
                        AND `password` = '$password'");

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