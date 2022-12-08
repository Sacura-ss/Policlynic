<?php

class Controller_Appointment extends Controller
{
    function __construct()
    {
        $this->model = new Model_Appointment();
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
        // for CORS
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Headers: *');
        header('Access-Control-Allow-Methods: *');
        header('Access-Control-Allow-Credentials: true');
        // добавляем в заголовок, что страница возвращает json
        header('Content-type: application/json');

        session_start();
        if($_SESSION['user']['user_type'] == 'врач') {
            $is_doctor = true;
        }
        else {
            $is_doctor = false;
        }

        // из глобальной переменной достаем тип метода put, post, ...
        $method = $_SERVER['REQUEST_METHOD'];

        // получаем путь из строки запроса
        $q = $_GET['q'];
        $params = explode('/', $q); // разбиваем строку по /
        $type = $params[0];
        $id = $params[1];

        // определяем функциональность в зависимости от запроса
        switch ($method) {
            case 'GET':
                if ($type == 'appointment') {
                    // существует ли id
                    if (isset($id)) {
                        $this->getAppointment($is_doctor,$id);
                    } else {
                        $this->getAppointments($is_doctor);
                    }
                }
                break;
            case 'POST':
                if ($type === 'appointment' && !$is_doctor) {
                    $this->addAppointment($_POST);
                }
                break;
            case 'PATCH':
                if ($type === 'appointment' && $is_doctor) {
                    // существует ли id
                    if (isset($id)) {
                        // получаем данные с метода patch
                        $data = file_get_contents('php://input');
                        // запрос пишется raw в формате json => преобразуем в массив
                        $data = json_decode($data, true);
                        $this->updateAppointment($id, $data);
                    }
                }
                break;
            case 'DELETE':
                if ($type === 'appointment' && $is_doctor) {
                    // существует ли id
                    if (isset($id)) {
                        $this->deleteAppointment($id);
                    }
                }
        }



    }

    function getAppointments($is_doctor)
    {
        if($is_doctor) {
            $u_id = $this->model->get_doctorId_by_userId( $_SESSION['user']['id']);
            $results = $this->model->get_appointments_for_doctor($u_id);
        } else {
            $u_id = $this->model->get_patientId_by_userId($_SESSION['user']['id']);
            $results = $this->model->get_appointments_for_patient($u_id);
        }
        $resultsList = [];
        // перебираем список результатов и заносим в массив
        while ($result = mysqli_fetch_assoc($results)) {
            $resultsList[] = $result;
        }
        // переводим  json
        echo json_encode($resultsList, $flags = JSON_UNESCAPED_UNICODE);
    }

    function getAppointment($is_doctor, $id)
    {
        if($is_doctor){
            $u_id = $this->model->get_doctorId_by_userId( $_SESSION['user']['id']);
            $result = $this->model->get_appointment_for_doctor($u_id, $id);
        } else {
            $u_id = $this->model->get_patientId_by_userId($_SESSION['user']['id']);
            $result = $this->model->get_appointment_for_patient($u_id, $id);
        }

        if (mysqli_num_rows($result) === 0) {
            // выводим ошибку 404 если не найден элемент
            http_response_code(404);
            // выводим ответ об ошибке
            $answer = [
                "status" => false,
                "message" => "Appointment not found"
            ];
            echo json_encode($answer);
        } else {
            // преобразуем в массив
            $result = mysqli_fetch_assoc($result);
            echo json_encode($result);
        }
    }

    function parse_FIO($string_from_search)
    {
        return explode(" ", $string_from_search);
    }

    function addAppointment($data)
    {
        $idDoctor = $this->model->get_doctorId_by_doctorName($data['doctor']);
        $idPatient = $this->model->get_patientId_by_userId($_SESSION['user']['id']);
        $appointmentType = $data['type'];
        $t=time();
        $shortDate = date("yy-m-d",$t);
        $time = date("H:i:s",$t);
        $cabinet = rand(100, 300);
        $idAppointmentStatus = 2;

        $this->model->add_appointment($idDoctor, $idPatient, $appointmentType, $shortDate, $time, $cabinet, $idAppointmentStatus);

        // код 201 - создано
        http_response_code(201);

        // выводим ответ о создании и id созданной сущности
        $answer = [
            "status" => true,
            "appointment_id" => mysqli_insert_id($this->model->get_connection())
        ];

        echo json_encode($answer);
    }

    function updateAppointment($id, $data)
    {
        $idDiagnosis = $this->model->get_diagnoseId_by_diagnoseName($data['diagnosis']);
        $symptoms = $data['symptoms'];
        $prescribedDrugs = $data['drugs'];
        $idAppointmentStatus = $this->model->get_appointmentStatusId_byName($data['status']);

        $this->model->updateAppointment($id, $idDiagnosis, $symptoms, $prescribedDrugs, $idAppointmentStatus);

        // код 200 - успешно
        http_response_code(200);

        // выводим ответ о создании и id созданной сущности
        $answer = [
            "status" => true,
            "message" => "Appointment is updated"
        ];

        echo json_encode($answer);
    }

    function deleteAppointment($id)
    {
        $this->model->deleteAppointment($id);

        // код 200 - успешно
        http_response_code(200);

        // выводим ответ о создании и id созданной сущности
        $answer = [
            "status" => true,
            "message" => "Appointment is deleted"
        ];

        echo json_encode($answer);
    }



}