<?php

class Model_Signin extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    function find_user($login, $password) {
        return mysqli_query($this->mysqli, "SELECT * FROM `Users` WHERE `login` = '$login' AND `password` = '$password'");
    }
}