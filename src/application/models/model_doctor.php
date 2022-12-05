<?php

class Model_Doctor extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    public function get_doctor($id)
    {
        $query = $this->mysqli->query("SELECT d.`surname`, d.`name`, d.`middleName`, s.`nameSpeciality`, c.`nameCategory` 
                        FROM Doctors d, Speciality s, Categories c
                        WHERE d.`idDoctor` = '$id' 
                        AND d.`idSpeciality` = s.`idSpeciality`
                        AND d.`idCategory` = c.`idCategory`");

        return $query->fetch_array(MYSQLI_ASSOC);
    }

    public function get_doctorId_by_userId($user_id) {

        $query = $this->mysqli->query("SELECT `idDoctor` 
                        FROM Doctors
                        WHERE `idUser` = '$user_id'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idDoctor"]);
    }

    public function get_diagnoses()
    {
        $query = $this->mysqli->query("SELECT `nameDiagnosis` FROM Diagnoses");
        return $query;
    }

    public function get_appointmentStatuses()
    {
        $query = $this->mysqli->query("SELECT `nameAppointmentStatus` FROM AppointmentStatuses");
        return $query;
    }



}