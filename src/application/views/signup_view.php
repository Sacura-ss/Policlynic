<header>
    <div class = "name">Поликлиника</div>
    <ul class = "menu">
        <li><a href = "./">Домой</a></li>
    </ul>
</header>

<!-- Форма регистрации -->
<div class="body">
    <!--enctype - позволяет передавать файлы через форму-->
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
            <option value="none">Не выбрано</option>
            <option value="doctor">Доктор</option>
            <option value="patient">Пациент</option>
        </select>
        <div id="inputArea"></div>
        <button type="submit">Зарегистрироваться</button>
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