<!-- Профиль -->
<header>
    <div class="name">Поликлиника</div>
    <div class="menu">
        <li><a href="./">Домой</a></li>
    </div>
</header>

<br>
<div class="uppper">
    <div class="user_type">Пациент</div>
    <ul class="exit">
        <li><a href="./logout" class="logout">Выход</a></li>
    </ul>
</div>
<div class="result">
    <table>
        <tr>
            <th>ФИО</th>
            <th>Дата рождения</th>
            <th>Полис</th>
        </tr>
        <?php
        if (empty(!$data)) {
            foreach ($data[0] as $row) {
                echo '<tr>
                <td>' . $row['surname'] . ' ' . $row['name'] . ' ' . $row['middleName'] . '</td>
                <td>' . $row['shortDateBirth'] . '</td>
                <td>' . $row['numberMedicalPolicy'] . '</td></tr>';
            }
        }

        ?>
    </table>
</div>
<div class="wrapper2">
    <div class="header">Приемы</div>
    <div class="cards_wrap"></div>
    <div class="form">
        <h1>Запишись на прием</h1>
        <form>
            <label>Врач</label>
            <div class="inputbox">
                <select id="doctors-edit" name="doctors-edit"><?php echo $data[1]; ?></select>
            </div>
            <label>Тип</label>
            <div class="inputbox">
                <select id="type-edit" name="type-edit">
                    <option>стандартный</option>
                    <option>вызов</option>
                </select>
            </div>
            <div class="inputbox">
                <input type="button" onclick="addAppointment()" value="Записаться">
            </div>
        </form>
    </div>
</div>
<script src="./js/appointment_patient.js"></script>




