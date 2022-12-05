<!-- Профиль -->
<header>
    <div class="name">Поликлиника</div>
    <div class="menu">
        <li><a href="./">Домой</a></li>
    </div>
</header>

<br>
<div class="uppper">
    <div class="user_type">Врач</div>
    <ul class="exit">
        <li><a href="./logout" class="logout">Выход</a></li>
    </ul>
</div>
<div class="result">
    <table>
        <tr>
            <th>ФИО</th>
            <th>Специальность</th>
            <th>Категория</th>
        </tr>
        <?php
        if (empty(!$data)) {
            foreach ($data[0] as $row) {
                echo '<tr>
                <td>' . $row['surname'] .' '. $row['name'] .' '. $row['middleName'] .'</td>
                <td>' . $row['nameSpeciality'] . '</td>
                <td>' . $row['nameCategory'] . '</td></tr>';
            }
        }

        ?>
    </table>
</div>
<div class="wrapper2">
    <div class="header">Приемы</div>
    <div class="cards_wrap"></div>
    <div class="form">
        <h1>Добавить информацию о приеме</h1>
        <form>
            <label>Диагноз</label>
            <div class="inputbox">
                <select id="diagnosis-edit" name="diagnosis-edit"><?php echo $data[1];?></select>
            </div>
            <div class="inputbox">
                <input type="text" id="symptoms-edit" required="required">
                <span>Симптомы</span>
            </div>
            <div class="inputbox">
                <input type="text" id="prescribedDrugs-edit" required="required">
                <span>Препараты</span>
            </div>
            <label>Статус</label>
            <div class="inputbox">
                <select id="status-edit" name="status-edit"><?php echo $data[2];?></select>
            </div>
            <div class="inputbox">
                <input type="button" onclick="updateAppointment()" value="Обновить">
            </div>

        </form>
    </div>
</div>
<script src="./js/appointment_doctor.js"></script>




