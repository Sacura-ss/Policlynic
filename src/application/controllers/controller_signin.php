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
        $this->cl_print_r($_SESSION, "session");
        $this->view->generate('signin_view.php', 'template_view.php', $data);
        if (isset($_POST['signin_btn'])) {
            $this->cl_print_r($_POST, "post");
            $login = $_POST['login'];
            $password = $_POST['password'];
            $this->check_fields($login, $password);
            $this->cl_print_r($_SESSION, "session1");
            $result = $this->model->find_user($login, $password);
            $this->signin($result);
            $this->cl_print_r($_SESSION, "session2");
        }
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

        if (!empty($error_fields)) {
            $_SESSION['message'] = 'Проверьте правильность полей ';
            $this->cl_print_r($_SESSION, "sessionINcheck");
            die();
        }
    }
    function signin($result)
    {
        if(mysqli_num_rows($result) > 0) {
            // преобразуем в норм массив
            $user = mysqli_fetch_assoc($result);

            $_SESSION['user'] = [
                "id" => $user['idUser'],
                "login" => $user['login']
            ];
            //header('Location: ../doctor');
        } else {
            $_SESSION['message'] = 'Не верный логин или пароль';
            die();
            //header('Location: ../signin');
        }
        $this->cl_print_r($_SESSION, "sessionINsign");
    }

}