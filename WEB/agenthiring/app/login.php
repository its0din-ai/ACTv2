<?php
include 'db.php';
session_start();
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];

    try {
        $stmt = $pdo->prepare("SELECT * FROM accounts WHERE username = :username AND password = :password");
        $stmt->bindParam(':username', $username);
        $hashedPassword = md5($password);
        $stmt->bindParam(':password', $hashedPassword);
        $stmt->execute();

        if ($stmt->rowCount() > 0) {
            $update = $pdo->prepare("UPDATE accounts SET last_login = NOW() WHERE username = :username");
            $update->bindParam(':username', $username);
            $update->execute();

            $userAgent = $_SERVER['HTTP_USER_AGENT'];
            $query = "INSERT INTO user_agents (username, user_agents) VALUES ('$username', '$userAgent')";
            $insert = mysqli_query($dbs, $query);
            $_SESSION['username'] = $username;
            $_SESSION['roles'] = $stmt->fetch(PDO::FETCH_ASSOC)['roles'];
            header("Location: dashboard.php");
            exit();
        } else {
            echo "Incorrect username or password. Please try again.";
        }
    } catch (PDOException $e) {
        die("Error executing the query: " . $e->getMessage());
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Hire an Agent</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container d-flex align-items-center justify-content-center" style="height: 100vh;">
    <div class="row justify-content-center">
        <div class="col-auto">
            <div class="card border-danger">
                <div class="card-header">
                    <h5 class="fw-bold text-danger text-center">LOGIN PORTAL</h5>
                </div>
                <div class="card-body">
                    <form action="login.php" method="post">
                        <div class="form-group mb-2">
                            <input type="text" placeholder="Username" class="form-control" id="username" name="username" required>
                        </div>
                        <div class="form-group mb-2">
                            <input type="password" placeholder="Password" class="form-control" id="password" name="password" required>
                        </div>
                        <div class="d-grid">
                        <button type="submit" class="btn btn-outline-danger btn-sm">Login</button>
                        </div>
                    </form>
                </div>
            </div>
            <div class="mt-4">
                <a href="register.php"><p class="text-primary text-center">Register</p></a>
            </div>
        </div>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>