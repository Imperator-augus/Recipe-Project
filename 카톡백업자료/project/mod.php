<?php

include_once "db/db_board.php";

$food_no = $_GET["food_no"];
$param = [
    "food_no" => $food_no
];

$item = sel_recipe($param);

?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피 수정</title>
    <link rel="stylesheet" href="css/header.css">
    <link rel="stylesheet" href="css/write.css">
</head>

<body>
    <?php
    include_once "header.php";
    ?>
    <main>
        <div class="main">
            <form action="mod_proc.php" method="post" enctype="multipart/form-data">
                <input type="hidden" name="food_no" value="<?= $food_no ?>" readonly>
                <div>
                    <label>
                        <img class='food_img' src="/project/img/board/<?= $item['food_img'] ?>" width="160" height="160" style="cursor:pointer">
                        <div class="hidden"><input onchange="readURL(this);" type="file" name="img" accept="image/*"></div>
                    </label>
                </div>

                <div>
                    <div>
                        <label for="title">레시피 제목</label>
                        <input type="text" name="title" id="title" value="<?= $item['food_title'] ?>">
                    </div>

                    <div>
                        <label for="video">동영상 URL</label>
                        <input type="url" name="video" id="video" value="<?= $item['food_url'] ?>">
                    </div>

                    <div>
                        <label for="category">카테고리</label>
                        <select name="category" id="category">
                            <?php
                            $param = [
                                '0' => '음식종류',
                                '1' => '한식',
                                '2' => '양식',
                                '3' => '일식',
                                '4' => '중식'
                            ];
                            $num = $item['ctgr_no'];
                            for ($i = 1; $i <= count($param); $i++) {
                                if ($i == $num) {
                                    print "<option value='$i' selected>$param[$i]</option>";
                                } else {
                                    print "<option value='$i'>$param[$i]</option>";
                                }
                            }
                            ?>

                        </select>
                    </div>

                    <div>
                        <label for="ctnt">내용</label>
                        <textarea name="ctnt" cols="30" rows="20"><?= $item['food_ctnt'] ?></textarea>
                    </div>

                    <div>
                        <input type="submit" value="등록">
                        <input type="submit" value="취소" formaction="main.php">
                    </div>
                </div>
            </form>
        </div>
    </main>

    <script>
        function readURL(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function(e) {
                    document.getElementById('preview').src = e.target.result;
                };
                reader.readAsDataURL(input.files[0]);
            } else {
                document.getElementById('preview').src = "";
            }
        }
    </script>
</body>

</html>