<?php
if (session_id()) {
    session_start();
}

if ($_SESSION['user']) {
    header('Location: doctor');
}
?>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="utf-8">
    <title>Поликлиника</title>
    <link rel="stylesheet" type="text/css" href="./css/style.css" />
    <script src="./js/js.js"></script>
</head>
<body>
    <?php include 'application/views/'.$content_view; ?>
</body>
</html>