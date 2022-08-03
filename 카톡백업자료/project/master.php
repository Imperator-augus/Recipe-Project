<?php
include_once "header.php";
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="css/login.css">
    <link rel="stylesheet" href="css/header.css">
    <script src="https://kit.fontawesome.com/73209118d1.js" crossorigin="anonymous"></script>
</head>

<body>
    <div class="container">
        <div class="login_board">
            <h2><a href="#">LOGO</a></h2>
            <form action="master_proc.php" method="post">
                <div>
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="mid" placeholder="아이디">
                </div>
                <div>
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" name="mpw" placeholder="비밀번호">
                </div>
                <div><input type="submit" value="로그인"></div>
            </form>
            관리자
        </div>
    </div>
</body>

</html>