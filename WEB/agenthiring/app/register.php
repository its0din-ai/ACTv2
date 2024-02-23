<?php
include 'db.php';
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $username = $_POST["username"];
    $password = $_POST["password"];
    $fullname = $_POST["fullname"];
    $deviceUsed = $_SERVER['HTTP_USER_AGENT'];
    $roles = $_POST["roles"];
    $hashedPassword = md5($password);
    try {
        $checkUsername = $pdo->prepare("SELECT * FROM accounts WHERE username = :username");
        $checkUsername->bindParam(':username', $username);
        $checkUsername->execute();
        if ($checkUsername->rowCount() > 0) {
            echo "Username already taken. Please choose another.";
        } else {
            $insertUser = $pdo->prepare("INSERT INTO accounts (username, password, fullname, device_used, roles) VALUES (:username, :password, :fullname, :device_used, :roles)");
            $insertUser->bindParam(':username', $username);
            $insertUser->bindParam(':password', $hashedPassword);
            $insertUser->bindParam(':fullname', $fullname);
            $insertUser->bindParam(':device_used', $deviceUsed);
            $insertUser->bindParam(':roles', $roles);
            $insertUser->execute();
            header("Location: login.php");
            exit();
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
    <title>Register - Agent Hiring System</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css">
</head>
<body>
<div class="container mt-5">
    <h2>Register for Agent Hiring System</h2>
    <form action="register.php" method="POST">
        <div class="form-group mb-2">
            <input type="text" placeholder="Username" class="form-control" id="username" name="username" required>
        </div>
        <div class="form-group mb-2">
            <input type="password" placeholder="Password" class="form-control" id="password" name="password" required>
        </div>
        <div class="form-group mb-2">
            <input type="text" placeholder="Full Name" class="form-control" id="fullname" name="fullname" required>
        </div>
        <div class="form-group mb-2">
            <select class="form-control" id="roles" name="roles">
                <option value="user">User</option>
                <option value="admin">Admin</option>
            </select>
        </div>
        <button type="submit" class="btn btn-sm btn-outline-primary mt-2">Register</button>
    </form>
    <div class="mt-1">
        <p>Already have an account? <a href="login.php">Login here</a></p>
    </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>