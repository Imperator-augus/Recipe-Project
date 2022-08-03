<?php
    include 'db/db_board.php';
    session_start();

    $list = main_recipe($param);
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Recipe</title>
    <link rel="stylesheet" href="css/css.css">
    <script src='https://code.jquery.com/jquery-3.2.1.min.js'></script>
</head>
<body>
    <div class="scroll-top">
        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7l4-4m0 0l4 4m-4-4v18" />
        </svg>
    </div>
    <div class="container">
        <div class="img">
            <img src="img/img_1.jpg">
        </div>
        <header>
            <div class="header-box">
                    <div class="nav">
                        <ul>
                            <li><a href="allfood.php">Recipe</a></li>
                            <li><a href="#">QnA</a></li>
                        </ul>
                    </div>
                    <div class="logo">
                    <h1><a href="#">꾸꾸네 레시피</a></h1>
                    <div id="round"></div>
                    </div>
                
                    <div class="join">
                        <span><a href="login.php">로그인</a></span>
                        <span><a href="join.php">회원가입</a></span>
                    </div>
            </div>
        </header>

        <div class="content">
            <p class="det">Food Recipe</p>
            <p class="de"><a href="allfood.php">MORE <img src="img/plus.svg"></a></p>
        </div>
    </div>

    <div class="page">
            <h1 class="text1">레시피</h1>
            <a href="allfood.php" id="mor"><h3>더보기</h3></a>
        <div class="pg">
            <?php
                foreach($list as $item){
            ?>
            <a href="detail.php?food_no=<?=$item['food_no']?>">
                <ul>
                    <li><img src="/project/img/board/<?=$item['food_img']?>"></li>
                    <div class="title">
                        <li class="profile"><img src="/project/img/profile/<?=$item["user_no"]?>/<?=$item['profile_img']?>"></li>
                        <li><?=$item['food_title']?><br><?=$item['nm']?></li>
                    </div>   
                </ul>
            </a>
            <?php    
                }
            ?>
        </div> 
    </div>

    <div class="board">
        <h1>QnA</h1>
    </div>
    <div class="footer">
        <h4>Copyright &copy; 2022 꾸꾸네 레시피 Inc. All rights reserved.<br> 김예찬 이경식 신혜미 김동휘</h4>
    </div>
    <script src="./app.js"></script>
</body>
</html>