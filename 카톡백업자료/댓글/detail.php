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

        <div class="com1">댓글</div>
                <?php
                    foreach($com as $row) {?>
                        <div class="comm">
                            <div><?=$row["reply_ctnt"]?></div>
                            <div id="comment">
                                <div><?=$row["nm"]?></div>
                                <div><?=$row["created_at"]?></div>
                            </div>
                        </div>
                    <?php }  ?>  
                </div>
                
                    <form action="com_proc.php" method="post">
                        <div class="c cn">
                            <div class="nm"><div class="i_nm"><?=$nm?></div>
                            <div><input type="hidden" name="food_no" value=<?=$food_no?>></div>
                            <div><textarea id="ctnt" name="reply_ctnt" placeholder="내용"></textarea></div></div>
                            <div><input id="sub" type="submit" value="댓글등록"></div>
                        </div>
                    </form>
    </main>    
</body>
</html>