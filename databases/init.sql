CREATE DATABASE IF NOT EXISTS Polyclinic;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT ALL PRIVILEGES ON Polyclinic.* TO 'user'@'%';
FLUSH PRIVILEGES;

use Polyclinic;

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Speciality` (
    `idSpeciality` INT NOT NULL AUTO_INCREMENT,
    `nameSpeciality` VARCHAR(45) NULL,
    PRIMARY KEY (`idSpeciality`));

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Categories` (
    `idCategory` INT NOT NULL AUTO_INCREMENT,
    `nameCategory` VARCHAR(45) NULL,
    PRIMARY KEY (`idCategory`));
Со
CREATE TABLE IF NOT EXISTS `Polyclinic`.`Diagnoses` (
    `idDiagnosis` INT NOT NULL AUTO_INCREMENT,
    `nameDiagnosis` VARCHAR(45) NULL,
    `descriptionDiagnosis` VARCHAR(1000) NULL,
    PRIMARY KEY (`idDiagnosis`));

CREATE TABLE IF NOT EXISTS `Polyclinic`.`AppointmentStatuses` (
    `idAppointmentStatus` INT NOT NULL AUTO_INCREMENT,
    `nameAppointmentStatus` VARCHAR(45) NULL,
    PRIMARY KEY (`idAppointmentStatus`));

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Users` (
    `idUser` INT NOT NULL AUTO_INCREMENT,
    `typeUser` VARCHAR(45) NOT NULL,
    `login` VARCHAR(255) NOT NULL,
    `password` VARCHAR(32) NOT NULL,
    PRIMARY KEY (`idUser`));

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Doctors` (
    `idDoctor` INT NOT NULL AUTO_INCREMENT,
    `idUser` INT NOT NULL,
    `surname` VARCHAR(45) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `middleName` VARCHAR(45) NULL,
    `phoneNumber` VARCHAR(20) NULL,
    `idSpeciality` INT NULL,
    `idCategory` INT NULL,
    PRIMARY KEY (`idDoctor`, `idUser`),
    INDEX `fk_Doctors_Users1_idx` (`idUser` ASC) VISIBLE,
    INDEX `fk_Doctors_Categories1_idx` (`idCategory` ASC) VISIBLE,
    INDEX `fk_Doctors_Speciality1_idx` (`idSpeciality` ASC) VISIBLE,
    CONSTRAINT `fk_Doctors_Users1`
    FOREIGN KEY (`idUser`)
    REFERENCES `Polyclinic`.`Users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Doctors_Categories1`
    FOREIGN KEY (`idCategory`)
    REFERENCES `Polyclinic`.`Categories` (`idCategory`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Doctors_Speciality1`
    FOREIGN KEY (`idSpeciality`)
    REFERENCES `Polyclinic`.`Speciality` (`idSpeciality`)
    ON DELETE SET NULL
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Patients` (
    `idPatient` INT NOT NULL AUTO_INCREMENT,
    `idUser` INT NOT NULL,
    `surname` VARCHAR(45) NOT NULL,
    `name` VARCHAR(45) NOT NULL,
    `middleName` VARCHAR(45) NULL,
    `shortDateBirth` DATE NULL,
    `phoneNumber` VARCHAR(20) NULL,
    `address` VARCHAR(1000) NULL,
    `numberMedicalPolicy` VARCHAR(20) NOT NULL,
    PRIMARY KEY (`idPatient`, `idUser`),
    INDEX `fk_Patients_Users1_idx` (`idUser` ASC) VISIBLE,
    CONSTRAINT `fk_Patients_Users1`
    FOREIGN KEY (`idUser`)
    REFERENCES `Polyclinic`.`Users` (`idUser`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Appointment` (
    `idAppointment` INT NOT NULL AUTO_INCREMENT,
    `idDoctor` INT NOT NULL,
    `idPatient` INT NOT NULL,
    `appointmentType` VARCHAR(45) NULL,
    `shortDate` DATE NULL,
    `time` TIME NULL,
    `cabinet` INT NULL,
    `idDiagnosis` INT NULL,
    `symptoms` VARCHAR(200) NULL,
    `prescribedDrugs` VARCHAR(100) NULL,
    `idAppointmentStatus` INT NULL,
    PRIMARY KEY (`idAppointment`),
    INDEX `fk_Appointment_Diagnoses1_idx` (`idDiagnosis` ASC) VISIBLE,
    INDEX `fk_Appointment_AppointmentStatuses1_idx` (`idAppointmentStatus` ASC) VISIBLE,
    INDEX `fk_Appointment_Doctors2_idx` (`idDoctor` ASC) VISIBLE,
    INDEX `fk_Appointment_Patients1_idx` (`idPatient` ASC) VISIBLE,
    CONSTRAINT `fk_Appointment_Diagnoses1`
    FOREIGN KEY (`idDiagnosis`)
    REFERENCES `Polyclinic`.`Diagnoses` (`idDiagnosis`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Appointment_AppointmentStatuses1`
    FOREIGN KEY (`idAppointmentStatus`)
    REFERENCES `Polyclinic`.`AppointmentStatuses` (`idAppointmentStatus`)
    ON DELETE SET NULL
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Appointment_Doctors2`
    FOREIGN KEY (`idDoctor`)
    REFERENCES `Polyclinic`.`Doctors` (`idDoctor`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
    CONSTRAINT `fk_Appointment_Patients1`
    FOREIGN KEY (`idPatient`)
    REFERENCES `Polyclinic`.`Patients` (`idPatient`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE);

