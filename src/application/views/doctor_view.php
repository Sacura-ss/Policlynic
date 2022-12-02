<!-- Профиль -->
<header>
    <div class = "name">Поликлиника</div>
    <ul class = "menu">
        <li><a href = "./">Домой</a></li>
    </ul>
</header>


<div class="sign">
    <form>
        <h2><?= $_SESSION['user']['login'] ?>ggg</h2>
        <?php
        print_r(session_id());
        ?>
        <a href="./logout class="logout">Выход</a>
    </form>
</div>