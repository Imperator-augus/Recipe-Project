<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>레시피작성</title>
    <link rel="stylesheet" href="header.css">
    <link rel="stylesheet" href="write.css">
</head>
<body>
<?php
    include_once "header.php";
?>
    <main>
        <div class="main">
            <form action="write_proc.php" method="post" enctype="multipart/form-data">
                <div>
                    <label>
                        <img id="preview" src="https://recipe1.ezmember.co.kr/img/pic_none2.gif" width="160" height="160" style="cursor:pointer">
                        <div class="hidden"><input  onchange="readURL(this);" type="file" name="img" accept="image/*"></div>
                    </label>
                </div>

                <div>
                    <div>
                        <label for="title">레시피 제목</label>
                        <input type="text" name="title" id="title">
                    </div>

                    <div>
                        <label for="video">동영상 URL</label>
                        <input type="url" name="video" id="video">
                    </div>

                    <div>
                        <label for="category">카테고리</label>
                        <select name="category" id="category">
                            <option value="0">음식종류</option>
                            <option value="0">한식</option>
                            <option value="0">양식</option>
                            <option value="0">일식</option>
                            <option value="0">중식</option>
                        </select>
                    </div>

                    <div>
                        <label for="ctnt">내용 </label>
                        <textarea name="ctnt" id="ctnt" cols="30" rows="20"></textarea>
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