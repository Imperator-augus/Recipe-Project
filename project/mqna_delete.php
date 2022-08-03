<?php
    include_once "db/db_board.php";

    $qust_no = $_GET["qust_no"];
    $sql1 = "DELETE FROM a_board 
    WHERE qust_no=$qust_no";
    $sql=
    "DELETE FROM q_board 
    WHERE qust_no=$qust_no";

    $conn=get_conn();
    mysqli_query($conn,$sql1);
    $result=mysqli_query($conn,$sql);
    mysqli_close($conn);
     header("location: qna.php");
     echo "$result";
?>