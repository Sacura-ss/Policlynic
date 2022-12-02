<header>
    <div class = "name">Поликлиника</div>
    <ul class = "menu">
        <li><a href = "./">Домой</a></li>
    </ul>
</header>

<!-- Форма регистрации -->
<div class="sign">
    <form method="post">
        <label>ФИО</label>
        <input type="text" name="full_name" placeholder="Введите свое полное имя">
        <label>Логин</label>
        <input type="text" name="login" placeholder="Введите свой логин">
        <label>Телефон</label>
        <input type="tel" name="phone" pattern="(\+?\d[- .]*){7,13}" placeholder="Введите номер телефона">
        <label>Пароль</label>
        <input type="password" name="password" placeholder="Введите пароль">
        <label>Подтверждение пароля</label>
        <input type="password" name="password_confirm" placeholder="Подтвердите пароль">
        <label>Врач или пациент?</label>
        <select id="user_type" name="user_type" onchange="parse_input()">
            <option value="none" disabled selected>Не выбрано</option>
            <option value="doctor">Доктор</option>
            <option value="patient">Пациент</option>
        </select>
        <div id="inputArea" style="display: none">
            <label id="l_speciality"  name="l_speciality">Специальность</label>
            <select id="s_speciality" name="s_speciality"><?php echo $data[0];?></select>
            <label id="l_category" name="l_category">Категория</label>
            <select id="s_category" name="s_category"><?php echo $data[1];?></select>

            <label id="l_date"  name="l_date">Дата рождения ГГГГ-ММ-ДД</label>
            <input type="text" id="i_date"  name="i_date" placeholder="Введите дату рождения">
            <label id="l_address"  name="l_address">Адрес</label>
            <input type="text" id="i_address" name="i_address" placeholder="Введите адрес">
            <label id="l_policy"  name="l_policy">Медицинский полис</label>
            <input type="text" id="i_policy"  name="i_policy" placeholder="Введите номер медицинского полиса">
        </div>
        <button type="submit" name="signup_btn">Зарегистрироваться</button>
        <p>
            У вас уже есть аккаунт? - <a href="signin">авторизируйтесь</a>!
        </p>
        <?php
        if ($_SESSION['message']) {
            echo '<p class="msg"> ' . $_SESSION['message'] . ' </p>';
        }
        unset($_SESSION['message']);
        ?>
    </form>
</div>

<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js">
</script>