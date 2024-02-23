<?php
include 'db.php';
session_start();

if (!isset($_SESSION['username'])) {
    header("Location: login.php");
    exit();
}

$username = $_SESSION['username'];
try{
    $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username = :username");
    $stmt->bindParam(':username', $username);
    $stmt->execute();
    $user = $stmt->fetch(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error executing the query: " . $e->getMessage());

}

try{
    $userAgent = $_SERVER['HTTP_USER_AGENT'];
    $query = "INSERT INTO user_agents (username, user_agents) VALUES ('$username', '$userAgent')";
    $insert = mysqli_query($dbs, $query);
} catch (PDOException $e) {
    die("Error executing the query: " . $e->getMessage());
}

try {
    $stmt = $pdo->query("SELECT * FROM agents");
    $agents = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    die("Error executing the query: " . $e->getMessage());
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Dashboard</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>

<div class="container mt-5">
    <a href="logout.php" class="btn btn-danger btn-sm">Logout</a>
    <?php if ($user['roles'] === 'admin'): ?>
        <a href="admin.php" class="btn btn-secondary btn-sm">Admin Dashboard</a>
    <?php endif; ?>
    <h3 class="text-capitalize">Welcome, <?php echo $user['fullname']; ?>!</h3>
    <table class="table table-hover table-bordered table-sm mt-4">
        <thead>
        <tr>
            <th>Name</th>
            <th>Ability</th>
            <th>Available</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($agents as $agent): ?>
            <tr>
                <td style="width: 15%;"><?php echo $agent['name']; ?></td>
                <td style="width: 75%;">
                    <?php
                    $ability = json_decode($agent['ability'], true);
                    foreach ($ability as $key => $value) {
                        if ($key === 'weapon') {
                            echo "<strong>Weapon: </strong>" . implode(', ', $value);
                        } else {
                            $normalizedValue = $value * 10;
                            echo "<div class='mb-2 text-capitalize'>$key: $normalizedValue";?>
                            <div class="progress mb-3" style="height: 10px;" role="progressbar" aria-label="Ability" aria-valuenow="<?= $normalizedValue ?>" aria-valuemin="0" aria-valuemax="100">
                                <div class="progress-bar progress-bar-striped progress-bar-animated bg-success" style="width: <?= $normalizedValue ?>%"></div>
                            </div>
                        <?php
                        }
                    }
                    ?>
                </td>
                <td><?php echo $agent['free'] ? 'Yes' : 'No'; ?></td>
            </tr>
        <?php endforeach; ?>
        </tbody>
    </table>
    </table>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>