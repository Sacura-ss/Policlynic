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
        session_start();
        if (isset($_POST['signup_btn'])) {
            register();
        }

        $this->view->generate('signup_view.php', 'template_view.php', $data);
    }

    function register() {
        # название ключей в post совпадают с name в form
        $full_name = $_POST['full_name'];
        $login = $_POST['login'];
        $phone = $_POST['phone'];
        $password = $_POST['password'];
        $password_confirm = $_POST['password_confirm'];
        $user_type = $_POST['user_type'];
        $speciality = $_POST['s_speciality'];
        $category = $_POST['s_category'];
        $date = $_POST['i_date'];
        $address = $_POST['i_address'];
        $policy = $_POST['i_policy'];

        $check_login = $this->model->check_login($login);
        if (mysqli_num_rows($check_login) > 0) {
            $_SESSION['message'] = 'Такой логин уже существует';
            die();
        }

        $this->check_fields($full_name, $login, $phone, $password, $password_confirm,
        $user_type, $speciality, $category, $date, $address, $policy);

        if ($password === $password_confirm) {
            $this->model->post_user($user_type, $login, $password);
            $user_id = $this->model->get_user_id($user_type, $login, $password);
            $this->cl_print_r($user_id, "user_id");
            $FIO = $this->parse_FIO($full_name);
            if($user_type == 'doctor') {
                $this->model->post_doctor($user_id, $FIO[0], $FIO[1], $FIO[3], $phone, $speciality, $category);
            }
            elseif ($user_type == 'patient') {
                $this->model->post_patient($user_id, $FIO[0], $FIO[1], $FIO[3], $date, $phone, $address, $policy);
            }
            header('location: signin');
        }
    }

    function check_fields($full_name, $login, $phone, $password, $password_confirm,
                          $user_type, $speciality, $category, $date, $address, $policy)
    {
        $error_fields = [];

        if ($login == '') {
            $error_fields[] = 'login';
        }

        if ($password == '') {
            $error_fields[] = 'password';
        }

        if ($full_name == '') {
            $error_fields[] = 'full_name';
        }

        if ($phone == '') {
            $error_fields[] = 'phone';
        }

        if ($password_confirm === '') {
            $error_fields[] = 'password_confirm';
        }

        if (empty($user_type)) {
            $error_fields[] = 'user_type';
        }
        elseif ($user_type == 'doctor') {
            if ($speciality == '') {
                $error_fields[] = 'speciality';
            }

            if ($category == '') {
                $error_fields[] = 'category';
            }
        }
        elseif ($user_type == 'patient') {
            if ($date == '') {
                $error_fields[] = 'date';
            }

            if ($address == '') {
                $error_fields[] = 'address';
            }

            if ($policy == '') {
                $error_fields[] = 'policy';
            }
        }

        if (!empty($error_fields)) {
            $_SESSION['message'] = 'Проверьте правильность полей ';
            die();
        }
    }

    function parse_FIO($string_from_search)
    {
        return explode(" ", $string_from_search);
    }
}