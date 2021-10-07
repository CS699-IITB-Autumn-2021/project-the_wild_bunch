<?php
    // session_start();
    // if(!isset($_SESSION['id'])) {
    // ?> <!-- <script type="text/javascript">window.location="login.php"</script> ---> <?php
    // }

    $dbhost = "localhost";
    $dbuser = "root";
    $dbpass = "";
    $db = "cs699proj";

    $conn = mysqli_connect($dbhost, $dbuser, $dbpass,$db);

    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    }
    // echo "Connected successfully";
    extract($_POST);
    ob_start(); 

    $adminTable = "admins";
    $admin_id = "admin_id";
    $admin_name = "admin_name";
    $admin_email = "admin_email";
    $admin_pass = "admin_password";
    $admin_status = "admin_status";

    $articleTable = "article";
    $article_id = "article_id";
    $article_title_img = "article_title_img";
    $article_title = "article_title";
    $article_category = "article_category";
    $article_desc = "article_desc";
    $article_img1 = "article_img1";
    $article_img2 = "article_img2";
    $article_img3 = "article_img3";
    $article_status = "article_status";

    $commentTable = "comment";
    $comment_id = "comment_id";
    $comment_auther = "comment_auther";
    $comment_desc = "comment_desc";
    $comment_status = "comment_status";

    function valid_email($str) {
        return (!preg_match("/^([a-z0-9\+_\-]+)(\.[a-z0-9\+_\-]+)*@([a-z0-9\-]+\.)+[a-z]{2,6}$/ix", $str)) ? FALSE : TRUE;
    }
?>