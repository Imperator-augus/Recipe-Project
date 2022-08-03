<?php
    include 'db/db_board.php';

    
    $list = recipe_jfood();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Recipe</title>
    <link rel="stylesheet" href="css/allfood.css">
    <link rel="stylesheet" href="css/header.css">
</head>
<body>
    <?php include('recipe.php') ?>          
        <div class="main">
      
           <?php
                foreach($list as $item){
            ?>
            <ul>
               <li><img src="/project/img/board/<?=$item['food_img']?>"></li>
               <div class="title">
               <li class="profile"><img src="/project/img/profile/<?=$item["user_no"]?>/<?=$item['profile_img']?>"></li>
               <li><?=$item['food_title']?></li>
               <li><?=$item['nm']?></li>
           </ul>
            <?php    
                }
            ?>

        </div>
</body>
</html>