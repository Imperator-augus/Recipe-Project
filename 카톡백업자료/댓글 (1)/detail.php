<?php
    include_once "db/db_board.php";
    $food_no = $_GET["food_no"];
    session_start();
    $nm = "";
    if(isset($_SESSION["login_user"]))
    {
        $login_user = $_SESSION["login_user"];
        $nm = $login_user["nm"];
    }
    $param = [
        "food_no" => $food_no
    ];
    $item = sel_board($param);
    $youtube_url = $item["food_url"];
    $last_index = mb_strrpos($youtube_url, "/");
    $url = mb_substr($youtube_url, $last_index);

    $com = comment($param);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>recipe</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/detail.css">
</head>
<body>
    <?php include_once "header.php";?>
    <main>
        <div class="main1">
            <div class="box1">
                <?php
                    $session_img = $_SESSION["login_user"]["profile_img"];
                    $profile_img = $session_img == null ? "profile.png" : "profile/" . $_SESSION["login_user"]["user_no"] . "/" .$session_img; 
                ?>
                    <img class="profile" src="/project/img/<?=$profile_img?>">
            </div>
            <div class="box2"><?=$nm?></div>
            <div class="box3"><?=$item["created_at"]?></div>
            <div class="box4"><?="<img class='food_img' src=img/"."board/".$item['food_img'].">"?></div>
        </div>
        <div><iframe width="560" height="315" src="https://www.youtube.com/embed/<?=$url?>" allowfullscreen></iframe></div>
        <div class="food_ctnt"><?=$item["food_ctnt"]?></div>    
        <hr>

        <div class="com1"><h1>댓글</h1>
                <?php
                    foreach($com as $row) {?>
                            <div class="comm">
                                <div class="co1">
                                    <div><a href="profile.php"><img src="/project/img/profile/<?=$row["user_no"]?>/<?=$row['profile_img']?>"></a></div>
                                    <div class="nm"><?=$row["nm"]?></div>
                                    <div><?=$row["created_at"]?></div>
                                    <?php if(isset($_SESSION["login_user"]) && $login_user["user_no"] === $item["user_no"]) { ?>
                                        <div class="btn2 mod"><a href="#">수정</a></div>
                                        <div class="btn2 del" onclick="isDel();"><a href="del_com.php?reply_no=<?=$row["reply_no"]?>">삭제</a></div>
                                    <?php } ?>
                                </div>
                                <input type="hidden" name="reply_no" value="<?=$row["reply_no"]?>">
                                <div class="co2"><?=$row["reply_ctnt"]?></div>
                            </div>  
                <?php } ?>  
                
        </div>       
                    <form action="com_proc.php" method="post" id="com_f">
                        <div class="c cn">
                            <div class="profile_nm"><img src="/project/img/profile/<?=$row["user_no"]?>/<?=$row['profile_img']?>"><br><?=$nm?></div>
                            <div><input type="hidden" name="food_no" value=<?=$food_no?>></div>
                            <div><textarea id="ctnt" name="reply_ctnt" placeholder=""></textarea></div>
                            <div><input id="sub" type="submit" value="댓글등록"></div>
                        </div>
                    </form>
        
    </main> 
    
    <script>
        function isDel()//소괄호 있으면 함수일 확률 높음 
        {
            console.log('isDel 실행 됨!!');
            //const -> 상수 
            if(confirm('삭제하시겠습니까?')){
                location.href= "detail.php?food_no=<?=$item['food_no']?>";
            } // confirm 삭제하시겠습니까?는 trun return , false return 
        }
    </script>
</body>
</html>