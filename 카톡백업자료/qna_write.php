<?php
    include_once "db/db_master.php";
    include_once "db/db_board.php";
    session_start();

    if(isset($_SESSION["master_user"])){
        $login_master = $_SESSION["master_user"];
        $m_no = $login_master["m_no"];
    
    $qust_no = $_GET["qust_no"];
    $param = [
        "qust_no" => $qust_no
    ];
    $item = qna_detail($param);
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>질문</title>
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<?php
include_once "header.php";
?>
<?php if(isset($_SESSION["master_user"])){?>
    <h1> 답변하기</h1>
    <div>질문 제목: <?=$item["qust_title"]?></div>
    <div>질문 내용: <?=$item["qust_ctnt"]?></div>
<?php } ?>

<?php if(isset($_SESSION["login_user"])){ ?>
    <div class="continer">
    <h1>하고 싶은 질문을 하세요~</h1>
    <a href="qna.php"><button>이전으로</button></a>
    <form action="qna_write_proc.php" method="post">
    <div><input type="text" name="qust_title" placeholder="제목"></div>
    <div><textarea name="qust_ctnt" placeholder="1000자 이내로 작성해 주세요 ^^"></textarea></div>
    <div>
        <input type="submit" value="등록">
        <input type="reset" value="초기화">
        <br>
    </div>
    </form>
    </div>
    <?php }?>
</body>
</html>