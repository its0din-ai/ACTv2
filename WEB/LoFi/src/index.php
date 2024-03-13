<?php     include("header.php");   ?>

<form action="/lofi-enjoyer/index.php" method="GET">
    <input type="text" name="page">
</form>

<?php
include($_GET["page"]);
?>