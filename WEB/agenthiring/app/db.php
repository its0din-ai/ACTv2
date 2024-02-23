<?php
$HOST = 'agentdb';
$USER = 'root';
$PASS = 'infected';
$DB = 'agentless';
try {
    $dbs = mysqli_connect($HOST, $USER, $PASS, $DB);
    $pdo = new PDO("mysql:host=$HOST; dbname=$DB", $USER, $PASS);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    die("Error connecting to the database: " . $e->getMessage());
}
?>