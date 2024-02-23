<?php
include 'db.php';
session_start();
$query = "
SELECT 
accounts.username,
DATE_FORMAT(accounts.date_created, '%Y-%m-%d %H:%i:%s') AS formatted_date_created,
DATE_FORMAT(accounts.last_login, '%Y-%m-%d %H:%i:%s') AS formatted_last_login,
accounts.device_used AS registered_device,
(SELECT user_agents FROM user_agents WHERE username = accounts.username ORDER BY timestamp DESC LIMIT 1) AS recent_user_agent
FROM 
accounts
ORDER BY 
accounts.date_created ASC;
";

if(!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}
if($_SESSION['roles'] !== 'admin') {
    header("Location: dashboard.php");
    exit();
}

try {
    $stmt = $pdo->query($query);
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error executing the query: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <a href="dashboard.php" class="btn btn-secondary btn-sm">Back</a>
    <hr>
    <h3 class="fw-bold">USER LOG</h3>
    <p class="text-danger fw-bold">***Méfiez-vous de l'espionnage par des agents d'autres pays.</p>

    <table class="table table-sm table-info table-hover table-bordered mt-4">
        <thead class="table-primary">
        <tr>
            <th>Username</th>
            <th>Date Created</th>
            <th>Last Login</th>
            <th>Registered Device</th>
            <th>User Visited The Dashboard</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($users as $user): ?>
            <tr>
                <td><?php echo $user['username']; ?></td>
                <td><?php echo $user['formatted_date_created']; ?></td>
                <td><?php echo $user['formatted_last_login']; ?></td>
                <td><?php echo $user['registered_device']; ?></td>
                <td><?php echo $user['recent_user_agent']; ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>
