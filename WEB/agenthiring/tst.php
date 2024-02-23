<?php

try{
    $userAgent = $_SERVER['HTTP_USER_AGENT'];
    $query = "INSERT INTO user_agents (username, user_agents) VALUES ('$username', '' OR CONCAT(version()) AND 'RkMD'='RkMD";
    $insert = mysqli_query($dbs, $query);
} catch (PDOException $e) {
    die("Error executing the query: " . $e->getMessage());
}

?>