<?php
    // $sql = "insert into emails(email) values (".$email.");"; 
    if(isset($_REQUEST['submit'])){
        // get form data
        $email = mysqli_real_escape_string($conn,$_POST['email']);
        //setting the query to insert data
        $query = "insert into emails(email) values('$email')";
        
        mysqli_query($conn,$query);
    }
?>