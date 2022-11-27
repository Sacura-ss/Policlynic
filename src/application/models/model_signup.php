<?php

class Model_Signup extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
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
}