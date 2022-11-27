<header>
    <div class="name">Поликлиника</div>
    <ul class="menu">
        <li><a href="./signin">Профиль</a></li>
    </ul>
</header>

<div class="wrapper">
    <br>
    <div class="header">Найти врача по ФИО</div>
    <div class="search">
        <form method="post">
            <input type="text" name="search1" placeholder="Введите ФИО врача...">
            <button type="submit" name="search_doctor">Найти</button>
        </form>
    </div>
    <div class="result">
        <table>
            <tr>
                <th>ФИО</th>
                <th>Специальность</th>
                <th>Категория</th>
            </tr>
            <?php
            foreach ($data as $row) {
                echo '<tr><td>' . $_POST['search1'] . '</td><td>' . $row['nameSpeciality'] . '</td><td>' . $row['nameCategory'] . '</td></tr>';
            }

            ?>
        </table>
    </div>

    <br>
    <div class="header">Найти диагноз</div>
    <div class="search">
        <form method="post">
            <input type="text" name="search2" placeholder="Введите название диагноза...">
            <button type="submit" name="search_diagnosis">Найти</button>
        </form>
    </div>
    <div class="result">
        <table>
            <tr>
                <th>Диагноз</th>
                <th>Описание</th>
            </tr>
            <?php
            foreach ($data as $row) {
                echo '<tr><td>' . $_POST['search2'] . '</td><td>' . $row['descriptionDiagnosis'] . '</td></tr>';
            }
            ?>
        </table>
    </div>
</div>






