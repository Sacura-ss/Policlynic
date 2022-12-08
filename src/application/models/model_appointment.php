<?php

class Model_Appointment extends Model
{

    // метод для отладки
    function cl_print_r ($var, $label = '')
    {
        $str = json_encode(print_r ($var, true));
        echo "<script>console.group('".$label."');console.log('".$str."');console.groupEnd();</script>";
    }

    public function get_doctorId_by_userId($user_id) {

        $query = $this->mysqli->query("SELECT `idDoctor` 
                        FROM Doctors
                        WHERE `idUser` = '$user_id'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idDoctor"]);
    }

    public function get_doctorId_by_doctorName($FIO) {
        $query = $this->mysqli->query("SELECT `idDoctor` 
                        FROM Doctors
                        WHERE `surname` = '$FIO[0]' 
                        AND `name` = '$FIO[1]' 
                        AND `middleName` = '$FIO[2]'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idDoctor"]);
    }

    public function get_patientId_by_userId($user_id) {

        $query = $this->mysqli->query("SELECT `idPatient` 
                        FROM Patients
                        WHERE `idUser` = '$user_id'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idPatient"]);
    }

    public function get_diagnoseId_by_diagnoseName($name_diagnosis)
    {
        $query = $this->mysqli->query("SELECT `idDiagnosis` 
                        FROM Diagnoses where 
                        `nameDiagnosis` = '$name_diagnosis'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idDiagnosis"]);
    }

    public function get_appointmentStatusId_byName($name){
        $query = $this->mysqli->query("SELECT `idAppointmentStatus` 
                        FROM AppointmentStatuses where 
                        `nameAppointmentStatus` = '$name'");

        return intval($query->fetch_array(MYSQLI_ASSOC)["idAppointmentStatus"]);
    }

    public function get_appointments_for_doctor($doctor_id) {
        $query = $this->mysqli->query("SELECT a.`idAppointment`,p.`surname`, p.`name`, p.`middleName`,
       a.`appointmentType`, a.`shortDate`, a.`time`, a.`cabinet`, d.`nameDiagnosis`, a.`symptoms`, a.`prescribedDrugs`, s.`nameAppointmentStatus`
                        FROM Appointment a, Patients p, Diagnoses d, AppointmentStatuses s
                        WHERE `idDoctor` = '$doctor_id'
                        AND a.`idPatient` = p.`idPatient`
                        AND d.`idDiagnosis` = a.`idDiagnosis`
                        AND a.`idAppointmentStatus` = s.`idAppointmentStatus`");

        return $query;
    }

    public function get_appointments_for_patient($patient_id) {
        $query = $this->mysqli->query("SELECT a.`idAppointment`, do.`surname`, do.`name`, do.`middleName`,
       a.`appointmentType`, a.`shortDate`, a.`time`, a.`cabinet`, d.`nameDiagnosis`, a.`symptoms`, a.`prescribedDrugs`, s.`nameAppointmentStatus`
                        FROM Appointment a, Doctors do, Diagnoses d, AppointmentStatuses s
                        WHERE a.`idPatient` = '$patient_id'
                        AND a.`idDoctor` = do.`idDoctor`
                        AND d.`idDiagnosis` = a.`idDiagnosis`
                        AND a.`idAppointmentStatus` = s.`idAppointmentStatus`");

        return $query;
    }

    public function get_appointment_for_doctor($doctor_id, $appointment_id) {
        $query = $this->mysqli->query("SELECT a.`idAppointment`,p.`surname`, p.`name`, p.`middleName`,
       a.`appointmentType`, a.`shortDate`, a.`time`, a.`cabinet`, d.`nameDiagnosis`, a.`symptoms`, a.`prescribedDrugs`, s.`nameAppointmentStatus`
                        FROM Appointment a, Patients p, Diagnoses d, AppointmentStatuses s
                        WHERE `idDoctor` = '$doctor_id'
                        AND a.`idPatient` = p.`idPatient`
                        AND d.`idDiagnosis` = a.`idDiagnosis`
                        AND a.`idAppointmentStatus` = s.`idAppointmentStatus`
                        AND a.`idAppointment` = '$appointment_id'");

        return $query;
    }

    public function get_appointment_for_patient($patient_id, $appointment_id) {
        $query = $this->mysqli->query("SELECT a.`idAppointment`,do.`surname`, do.`name`, do.`middleName`,
       a.`appointmentType`, a.`shortDate`, a.`time`, a.`cabinet`, d.`nameDiagnosis`, a.`symptoms`, a.`prescribedDrugs`, s.`nameAppointmentStatus`
                        FROM Appointment a, Doctors do, Diagnoses d, AppointmentStatuses s
                        WHERE a.`idPatient` = '$patient_id'
                        AND a.`idDoctor` = do.`idDoctor`
                        AND d.`idDiagnosis` = a.`idDiagnosis`
                        AND a.`idAppointmentStatus` = s.`idAppointmentStatus`
                        AND a.`idAppointment` = '$appointment_id'");

        return $query;
    }

    public function add_appointment($idDoctor, $idPatient, $appointmentType, $shortDate, $time, $cabinet, $idAppointmentStatus)
    {
        $this->mysqli->query("INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idAppointmentStatus`) 
                                                                    VALUES (DEFAULT, '$idDoctor', '$idPatient', '$appointmentType', '$shortDate', '$time', '$cabinet', '$idAppointmentStatus')");
    }

    public function updateAppointment($id, $idDiagnosis, $symptoms, $prescribedDrugs, $idAppointmentStatus)
    {
        $this->mysqli->query("UPDATE `Appointment` 
                        SET  `idDiagnosis` = '$idDiagnosis', `symptoms` = '$symptoms', `prescribedDrugs` = '$prescribedDrugs', `idAppointmentStatus` = '$idAppointmentStatus'
                        WHERE `idAppointment` = '$id'");

    }

    public function deleteAppointment($id)
    {
        $this->mysqli->query("DELETE FROM `Appointment` WHERE `idAppointment` = '$id'");
    }




}