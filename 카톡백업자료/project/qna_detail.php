<?php
    include_once "db/db_board.php";
    include_once "db/db_master.php";
    session_start();
    if(isset($_SESSION["login_user"])) {
        $login_user = $_SESSION["login_user"];
    }
    if(isset($_SESSION["master_user"])){
        $login_user = $_SESSION["master_user"];
    }
    $qust_no = $_GET["qust_no"];
    $param = [
        "qust_no" => $qust_no
    ];

    $item = qna_detail($param);
    $next_board = sel_next_board($param);
    $prev_board = sel_prev_board($param);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?=$item["qust_title"]?></title>
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
<?php
include_once "header.php";
?>
    <?php if(isset($_SESSION["login_user"]) && $login_user["user_no"] === $item["user_no"]) { ?>
        <div>
            <a href="qna_mod.php?qust_no=<?=$qust_no?>"><button>수정</button></a>
            <button onclick="isDel();">삭제</button>
        </div>
    <?php } ?>
    <?php if(isset($_SESSION["master_user"])) {?>
        <div>
            <a href="mqna_delete.php?qust_no=<?=$qust_no?>"><button>삭제</button></a>
        </div>
    <?php } ?>
    <div>
        <?php if($prev_board !== 0) { ?>
            <a href="qna_detail.php?qust_no=<?=$prev_board?>"><button>이전글</button></a>
        <?php } ?>

        <?php if($next_board !== 0) { ?>
            <a href="qna_detail.php?qust_no=<?=$next_board?>"><button>다음글</button></a>
        <?php } ?>
    </div>
    <div><a href="qna.php">QnA</a></div>
    <div>제목 : <?=$item["qust_title"]?></div>
    <div>글쓴이 : <?=$item["nm"]?></div>
    <div>등록일시 : <?=$item["created_at"]?></div>
    <div>내용 :<?=$item["qust_ctnt"]?></div>
    <script>
        function isDel() {            
            console.log('isDel 실행 됨!!');            
            if(confirm('삭제하시겠습니까?')) {
                location.href = "qna_del.php?qust_no=<?=$qust_no?>";
            } 
        }
    </script>
</body>
</html>