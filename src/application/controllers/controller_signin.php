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
        $result = $this->check_user();
        if(mysqli_num_rows($result) > 0) {
            // преобразуем в норм массив
            $user = mysqli_fetch_assoc($result);

            $_SESSION['user'] = [
                "id" => $user['id'],
                "login" => $user['login']
            ];
            $this->view->generate('signin_view.php', 'template_view.php', $data);
            //header('Location: ../doctor');
        } else {
            $_SESSION['message'] = 'Не верный логин или пароль';
            //header('Location: ../doctor');
        }

    }

    function check_user()
    {
        $login = $_POST['login'];
        $password = $_POST['password'];

        $error_fields = [];

        if ($login === '') {
            $error_fields[] = 'login';
        }

        if ($password === '') {
            $error_fields[] = 'password';
        }

        if (!empty($error_fields)) {
            $_SESSION['message'] = 'Проверьте правильность полей ';
            die();
        }

        $password = md5($password);

        return $this->model->find_user($login, $password);
    }

}