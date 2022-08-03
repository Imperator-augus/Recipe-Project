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
            <h1>LOGIN </h1>
            <div class="lo">아이디와 비밀번호를 입력해 주세요</div>
            <form action="login_proc.php" method="post">
                <div>
                    <i class="fa-solid fa-user"></i>
                    <input type="text" name="uid" placeholder="아이디">
                </div>
                <div>
                    <i class="fa-solid fa-lock"></i>
                    <input type="password" name="upw" placeholder="비밀번호">
                </div>
                <div><input type="submit" value="로그인"></div>
            </form>
            <div><a href="join.php"><button class="but">회원가입</button></a></div>
            <div><a href="master.php"><button class="but">관리자 로그인</button></a></div>

        </div>
    </div>
</body>
<?php
        include_once "footer.php";
        ?>
</html>