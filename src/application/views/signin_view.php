<header>
    <div class = "name">Поликлиника</div>
    <ul class = "menu">
        <li><a href = "./">Домой</a></li>
    </ul>
</header>

<!-- Форма авторизации -->
<div class="body">
    <form method="post">
        <label>Логин</label>
        <input type="text" name="login" placeholder="Введите свой логин">
        <label>Пароль</label>
        <input type="password" name="password" placeholder="Введите пароль">
        <button type="submit">Войти</button>
        <p>
            У вас нет аккаунта? - <a href="signup">зарегистрируйтесь</a>!
        </p>
        <?php
        if ($_SESSION['message']) {
            echo '<p class="msg"> ' . $_SESSION['message'] . ' </p>';
        }
        unset($_SESSION['message']);
        ?>
    </form>
</div>