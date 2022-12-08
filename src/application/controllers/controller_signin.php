<?php

class Controller_signin extends Controller
{
    function __construct()
    {
        $this->model = new Model_Signin();
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
        error_reporting(0);
        if ($_SESSION['user']) {
            $this->signin_user_by_type();
        }
        if (isset($_POST['signin_btn'])) {
            $login = $_POST['login'];
            $password = $_POST['password'];

            if(!$this->check_fields($login, $password)) {
                $_SESSION['message'] = 'Проверьте правильность полей ';
                //die();
            }
            else {
                $result = $this->model->find_user($login, $password);
                if (!$this->signin($result)) {
                    $_SESSION['message'] = 'Не верный логин или пароль';
                    //die();
                }
                else {
                    $this->signin_user_by_type();
                }
            }
        }
        $this->view->generate('signin_view.php', 'template_view.php', $data);

    }

    function check_fields($login, $password)
    {
        $error_fields = [];

        if ($login === '') {
            $error_fields[] = 'login';
        }

        if ($password === '') {
            $error_fields[] = 'password';
        }

        return empty($error_fields);
    }
    function signin($result)
    {
        if(mysqli_num_rows($result) > 0) {
            // преобразуем в норм массив
            $user = mysqli_fetch_assoc($result);

            $_SESSION['user'] = [
                "id" => $user['idUser'],
                "login" => $user['login'],
                "user_type" => $user['typeUser']
            ];
            //$this->signin_user_by_type();
            return true;
            //header('Location: ../doctor');
        } else {
            return false;
            //header('Location: ../signin');
        }
    }

    function signin_user_by_type()
    {
        if($_SESSION['user']['user_type'] == 'врач') {
            header('location: doctor');
        }
        else {
            header('location: patient');
        }
    }

}