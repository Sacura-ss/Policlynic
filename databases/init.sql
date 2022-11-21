REATE DATABASE IF NOT EXISTS Polyclinic;
CREATE USER IF NOT EXISTS 'user'@'%' IDENTIFIED WITH mysql_native_password BY 'password';
GRANT SELECT,UPDATE,INSERT,DELETE ON Polyclinic.* TO 'user'@'%';
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

CREATE TABLE IF NOT EXISTS `Polyclinic`.`Diagnoses` (
    `idDiagnosis` INT NOT NULL AUTO_INCREMENT,
    `nameDiagnosis` VARCHAR(45) NULL,
    `descriptionDiagnosis` VARCHAR(200) NULL,
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
    `address` VARCHAR(100) NULL,
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

INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Акушер');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Аллерголог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Венеролог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Гастроэнтеролог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Гинеколог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Дерматолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Иммунолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Кардиолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Логопед');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Оториноларинголог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Невролог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Окулист');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Ортопед');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Остеопат');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Педиатр');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Психиатр');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Психолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Рентгенолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Сексолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Стоматолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Терапевт');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Травматолог');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Физиотерапевт');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Хирург');
INSERT INTO `Polyclinic`.`Speciality` (`idSpeciality`, `nameSpeciality`) VALUES (DEFAULT, 'Эндокринолог');

INSERT INTO `Polyclinic`.`Categories` (`nameCategory`) VALUES ('первая');
INSERT INTO `Polyclinic`.`Categories` (`nameCategory`) VALUES ('вторая');
INSERT INTO `Polyclinic`.`Categories` (`nameCategory`) VALUES ('высшая');

INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Фарингит', 'Воспаление задней стенки горла, сопровождаемое болью, которая усиливается при глотании');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Пневмония', 'Воспаление нижних отделов дыхательных путей, преимущественно ткани легких. ');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Астигматизм', 'Нарушение зрения, при котором человек видит размыто с любого расстояния: и вблизи, и вдали. Главный симптом — размытое зрение, головная боль и напряжение в глазах.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Бронхит', 'оспаление слизистой оболочки бронхов, которое проявляется кашлем. Как правило, причиной бронхита являются вирусные инфекции, и чаще всего он возникает в зимнее время.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Дерматит', 'Хроническое заболевание кожи. Его сопровождают зуд, покраснение и шелушение с периодами обострения и ремиссий. Заболевание связано с повышенной реакцией иммунной системы на раздражители и изменения окружающей обстановки.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Гипертензия', 'Состояние, при котором артерии постоянно подвергаются чрезмерно высокому давлению крови. Факторы риска — лишний вес, малоподвижный образ жизни, хронический стресс, курение.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Миопия', 'Снижение остроты зрения на дальнем расстоянии. Глаз неправильно преломляет свет: глазное яблоко слишком вытянуто либо чересчур изогнута роговица. В итоге фокус смещается: в норме он должен быть на сетчатке, а при близорукости оказывается перед ней.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Ларингит', 'Воспаление гортани из-за нарушения работы голосовых связок. Причиной заболевания становятся вирусные или бактериальные инфекции или перенапряжение голосовых связок.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Гемангиома', 'Скопление кровеносных сосудов на коже или внутренних органах, похожее на большую родинку. Ребенок может родиться с гемангиомой, но чаще она появляется в первые месяцы жизни');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Хронический тонзиллит', 'Воспаление небных миндалин — подушечки на задней стенке глотки, — поэтому горло болит, краснеет, становится трудно глотать. Основные причины — вирусы и бактерия гемолитический Стрептококк.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Гиперметропия', 'Снижение остроты зрения на ближнем расстоянии. Причина может быть в коротком глазном яблоке или в неправильной форме хрусталика или роговицы. Из-за этого фокус попадает не на сетчатку, а за нее.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Трахеит', 'Воспаление трахеи, это заболевание нижних дыхательных путей. Трахеит вызывают стафилококки и стрептококки. Они же становятся причиной ринита, фарингита, ларингита. При их недостаточном лечении воспаление распространяется на трахею и вызывает трахеит.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Назофарингит', 'Самое распространенное в развитых странах заболевание. Назофарингит объединяет целую группу болезней с похожими симптомами, главные из которых — насморк и заложенность носа');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Цервикалгия', 'В большинстве случаев боль в шее проходит в течение нескольких недель. Мышцы шеи могут болеть из-за неправильной осанки — будь то наклон над компьютером или сутулость над рабочей поверхностью.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Остеохондроз', 'Под остеохондрозом в нашей стране часто понимают «износ» межпозвонковых дисков. Диски — это «подушечки» между позвонками, которые смягчают их трение друг о друга. С возрастом они меняют свою форму практически у каждого человека.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Боль в суставе', 'Сильная боль в суставе может быть признаком травмы.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Простуда', 'Неуточненная острая инфекция верхних дыхательных путей — это медицинский термин, за которым скрываются привычные нам симптомы простуды. Инфекцию вызывают вирусы — они распространяются, когда зараженный человек кашляет или чихает.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Поражения сосудов в мозге', 'Поражение сосудов связано с ограничением кровотока в мозге. Оно может быть вызвано сужением сосудов, образованием тромбов, закупоркой или разрывом кровеносных сосудов.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Неправильный прикус', 'Если зубы расположены правильно, то они плотно прилегают друг к другу, а верхний ряд перекрывает нижний. Когда верхние передние зубы находятся прямо над нижними, верхняя челюсть слишком сильно выпирает над нижней или наоборот — это неправильный прикус.');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Острый бронхит', 'Бронхит – это воспаление слизистой оболочки дыхательных путей (бронхов).');
INSERT INTO `Polyclinic`.`Diagnoses` (`idDiagnosis`, `nameDiagnosis`, `descriptionDiagnosis`) VALUES (DEFAULT, 'Фиброзно-кистозная мастопатия', 'Фиброзно-кистозная мастопатия — это безопасные изменения в тканях молочной железы. Фиброзная ткань более плотная. Из такой ткани состоят, например, шрамы. А кисты — это наполненные жидкостью мешочки, похожие на опухоль.');

INSERT INTO `Polyclinic`.`AppointmentStatuses` (`idAppointmentStatus`, `nameAppointmentStatus`) VALUES (DEFAULT, 'завершен');
INSERT INTO `Polyclinic`.`AppointmentStatuses` (`idAppointmentStatus`, `nameAppointmentStatus`) VALUES (DEFAULT, 'создан');
INSERT INTO `Polyclinic`.`AppointmentStatuses` (`idAppointmentStatus`, `nameAppointmentStatus`) VALUES (DEFAULT, 'отменен');
INSERT INTO `Polyclinic`.`AppointmentStatuses` (`idAppointmentStatus`, `nameAppointmentStatus`) VALUES (DEFAULT, '');

INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login1', 'password1');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login2', 'password2');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login3', 'password3');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login4', 'password4');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login5', 'password5');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login6', 'password6');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login7', 'password7');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login8', 'password8');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login9', 'password9');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login10', 'password10');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login11', 'password11');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login12', 'password12');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login13', 'password13');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login14', 'password14');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login15', 'password15');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login16', 'password16');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login17', 'password17');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login18', 'password18');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login19', 'password19');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'пациент', 'login20', 'password20');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login21', 'password21');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login22', 'password22');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login23', 'password23');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login24', 'password24');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login25', 'password25');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login26', 'password26');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login27', 'password27');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login28', 'password28');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login29', 'password29');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login30', 'password30');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login31', 'password31');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login32', 'password32');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login33', 'password33');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login34', 'password34');
INSERT INTO `Polyclinic`.`Users` (`idUser`, `typeUser`, `login`, `password`) VALUES (DEFAULT, 'врач', 'login35', 'password35');


INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 2, 'Коробков', 'Михаил', 'Анатольевич', '2002-04-14', '+79032449802', 'Бабушкинский проезд, д. 25, кв. 44', '1234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 3, 'Мальцев', 'Артур', 'Андреевич', '2000-03-28', '+79032549803', 'Барабанный переулок, д. 5, кв. 34', '2234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 4, 'Фролова', 'Елизавета', 'Игнатьевна', '1998-02-03', '+79032549804', 'Одинцовская улица, д. 50, кв. 9 ', '3234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 5, 'Ельцин', 'Андрей', 'Андреевич', '2001-08-17', '+79032549805', 'Озерная улица, д. 5, кв. 60', '4234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 6, 'Савина', 'Анастасия', 'Игоревна', '2003-10-22', '+79032569806', 'Окская улица, д. 40, кв. 3', '5234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 11, 'Кочергина', 'Екатерина', 'Дмитриевна', '2001-12-07', '+79032568807', 'улица Ломоносова, д. 30, кв. 30', '6234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 12, 'Хозяинова', 'Любовь', 'Борисовна', '2002-03-13', '+79032569808', 'Полевой пер., д. 12 кв. 175', '7234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 18, 'Балановский', 'Алексей', 'Власович', '2000-07-03', '+79253757073', 'Южная ул., д. 20 кв.185', '8234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 19, 'Северинов', 'Федор', 'Семенович', '1991-09-15', '+79615124076', 'Новая ул., д. 25 кв. 129', '4220200476702303');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 20, 'Кулибина', 'Жанна', 'Дмитриевна', '1981-08-02', '+79421043931', 'Новоселов ул., д. 18 кв. 15', '4240200476702303');


INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 2, 'Коробков', 'Михаил', 'Анатольевич', '2002-04-14', '+79032449802', 'Бабушкинский проезд, д. 25, кв. 44', '1234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 3, 'Мальцев', 'Артур', 'Андреевич', '2000-03-28', '+79032549803', 'Барабанный переулок, д. 5, кв. 34', '2234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 4, 'Фролова', 'Елизавета', 'Игнатьевна', '1998-02-03', '+79032549804', 'Одинцовская улица, д. 50, кв. 9 ', '3234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 5, 'Ельцин', 'Андрей', 'Андреевич', '2001-08-17', '+79032549805', 'Озерная улица, д. 5, кв. 60', '4234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 6, 'Савина', 'Анастасия', 'Игоревна', '2003-10-22', '+79032569806', 'Окская улица, д. 40, кв. 3', '5234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 11, 'Кочергина', 'Екатерина', 'Дмитриевна', '2001-12-07', '+79032568807', 'улица Ломоносова, д. 30, кв. 30', '6234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 12, 'Хозяинова', 'Любовь', 'Борисовна', '2002-03-13', '+79032569808', 'Полевой пер., д. 12 кв. 175', '7234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 18, 'Балановский', 'Алексей', 'Власович', '2000-07-03', '+79253757073', 'Южная ул., д. 20 кв.185', '8234567891123456');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 19, 'Северинов', 'Федор', 'Семенович', '1991-09-15', '+79615124076', 'Новая ул., д. 25 кв. 129', '4220200476702303');
INSERT INTO `Polyclinic`.`Patients` (`idPatient`, `idUser`, `surname`, `name`, `middleName`, `shortDateBirth`, `phoneNumber`, `address`, `numberMedicalPolicy`) VALUES (DEFAULT, 20, 'Кулибина', 'Жанна', 'Дмитриевна', '1981-08-02', '+79421043931', 'Новоселов ул., д. 18 кв. 15', '4240200476702303');

INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 1, 'Грибков', 'Герман', 'Прокопьевич', '+79692796113', 1, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 7, 'Евлентьева', 'Раиса', 'Семеновна', '+79293111339', 2, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 8, 'Дубиновский', 'Игнатий', 'Власович', '+79374106656', 3, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 9, 'Яременко', 'Константин', 'Григорьевич', '+79961802889', 4, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 10, 'Клим', 'Аполлинария', 'Ильишна', '+79422542656', 5, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 13, 'Родикова', 'Ярослава', 'Никифоровна', '+79627849295', 6, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 14, 'Куратник', 'Клавдия', 'Никандровна', '+79692796114', 7, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 15, 'Сунгатулина', 'Варвара', 'Григорьевна', '+79692796115', 8, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 16, 'Москвитина', 'Валентина', 'Васильевна', '+79692796116', 9, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 17, 'Никашин', 'Николай', 'Елизарович', '+79692796117', 10, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 21, 'Ретюнских', 'Альбина', 'Ефремовна', '+79692796118', 11, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 22, 'Сучков', 'Леонтий', 'Лукьевич', '+79692796119', 12, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 23, 'Яхненко', 'Милана', 'Даниловна', '+79293111338', 13, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 24, 'Яценко', 'Евгения', 'Степановна', '+79293111337', 14, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 25, 'Янина', 'Зинаида', 'Алексеевна', '+79293111336', 15, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 26, 'Хвостовский', 'Венедикт', 'Климентович', '+79293111335', 16, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 27, 'Кондратенко', 'Юлия', 'Наумовна', '+79293111334', 17, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 28, 'Должикова', 'Клара', 'Артемова', '+79293111333', 18, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 29, 'Шишкова', 'Клара', 'Константиновна', '+79293111332', 19, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 30, 'Цаплина', 'Ирина', 'Севастьяновна', '+79293111331', 20, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 31, 'Зверева', 'Жанна', 'Якововна', '+79293111330', 21, 3);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 32, 'Бармыкин', 'Венедикт', 'Саввеевич', '+79293111300', 22, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 33, 'Летов', 'Алексей', 'Филиппович', '+79374106655', 23, 1);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 34, 'Журова', 'Ольга', 'Аркадьевна', '+79374106654', 24, 2);
INSERT INTO `Polyclinic`.`Doctors` (`idDoctor`, `idUser`, `surname`, `name`, `middleName`, `phoneNumber`, `idSpeciality`, `idCategory`) VALUES (DEFAULT, 35, 'Касаткин', 'Роман', 'Георгиевич', '+79374106653', 25, 3);

INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 1, 1, 'вызов', '2022-08-15', '16:40:00', 101, 1, 'кашель, насморк', 'Фарингосепт', 1);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 2, 1, 'стандартный', '2022-08-20', '16:50:00', 202, 2, 'кашель, больное горло', 'Полоскание кора дуба, Амбробене', 1);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 3, 1, 'стандартный', '2022-08-22', '17:00:00', 203, 3, 'плохое зрение', 'капли для глаз', 1);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 4, 2, 'стандартный', '2022-10-15', '16:40:00', 204, , '', NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 5, 3, 'стандартный', '2022-10-15', '16:50:00', 100, NULL, NULL, NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 6, 4, 'стандартный', '2022-11-16', '14:40:00', 130, NULL, NULL, NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 7, 4, 'стандартный', '2022-11-16', '15:00:00', 120, NULL, NULL, NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 8, 5, 'стандартный', '2022-11-17', '15:15:00', 122, NULL, NULL, NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 9, 5, 'вызов', '2022-11-17', '15:40:00', 233, NULL, NULL, NULL, 2);
INSERT INTO `Polyclinic`.`Appointment` (`idAppointment`, `idDoctor`, `idPatient`, `appointmentType`, `shortDate`, `time`, `cabinet`, `idDiagnosis`, `symptoms`, `prescribedDrugs`, `idAppointmentStatus`) VALUES (DEFAULT, 10, 5, 'стандартный', '2022-11-20', '16:00:00', 236, NULL, NULL, NULL, 2);




