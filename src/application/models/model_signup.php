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
        $query = mysqli_query($this->mysqli,"SELECT * FROM `Users` WHERE `login` = '$login'");
        $this->cl_print_r($query, "query");
        return $query;
    }

    public function post_user($user_type, $login, $password)
    {
        return $this->mysqli->query("INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) 
            VALUES (DEFAULT, '$user_type', '$login', '$password')");
    }

    public function post_doctor($user_id, $F, $I, $O, $phone, $speciality, $category)
    {
        return $this->mysqli->query("INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) 
            VALUES (DEFAULT, '$user_id', '$F', '$I', '$O', '$phone', '$speciality', '$category');");

    }

    public function post_patient($user_id, $F, $I, $O, $date, $phone, $address, $policy)
    {
        return $this->mysqli->query("INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) 
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

    public function get_specialities()
    {
        $query = $this->mysqli->query("SELECT `nameSpeciality` FROM Speciality");
        return $query;
    }

    public function get_categories()
    {
        $query = $this->mysqli->query("SELECT `nameCategory` FROM Categories");
        return $query;
    }

    public function get_categoriesID_byName($name){
        $query = $this->mysqli->query("SELECT `idCategory` 
                        FROM Categories where 
                        `nameCategory` = '$name'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idCategory"]);
    }

    public function get_specialityID_byName($name){
        $query = $this->mysqli->query("SELECT `idSpeciality` 
                        FROM Speciality where 
                        `nameSpeciality` = '$name'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idSpeciality"]);
    }
}