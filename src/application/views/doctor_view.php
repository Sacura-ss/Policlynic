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
    <div class="cards_wrap">
        <?php
        if (empty(!$data)) {
            foreach ($data[1] as $row) {
                echo '<div class="card_item"> 
            <div class="card_inner"> 
                <div class="sea_name">' . $row['surname'] .' '. $row['name'] .' '. $row['middleName'] . '</div> 
                <div class="date">' . $row['appointmentType'] . '</div> 
                <div class="date">' . $row['shortDate'] . '</div> 
                <div class="date">' . $row['time'] . '</div> 
                <div class="date">' . $row['cabinet'] . '</div> 
                <div class="date">' . $row['nameDiagnosis'] . '</div> 
                <div class="date">' . $row['symptoms'] . '</div>
                <a href="#" ">Удалить</a>
                <a href="#" ">Редактировать</a>
            </div> 
        </div>`';
            }
        }
        ?>
    </div>
</div>



