<?php include_once 'header.php';?>
<?php include_once 'db.php';?>

<?php

$err = $uname = $uemail = $upass = $cpass = "";
if($_GET["eid"]) {
  $sql = "SELECT * FROM ".$adminTable." WHERE ".$admin_id." = ".$_GET["eid"];
  $result = mysqli_query($conn, $sql);
  // $row = mysqli_fetch_row($result);
  while($row = mysqli_fetch_array($result)) {
    $uname = $row[$admin_name];
    $uemail = $row[$admin_email];
    $upass = $row[$admin_pass];
    $cpass = $row[$admin_pass];
  }
}


if (isset($_POST['submit'])) {
    $uname = trim($_POST['userName']);
    $uemail = trim($_POST['userEmail']);
    $upass = trim($_POST['passwd']);
    $cpass = trim($_POST['confirm']);

    if($uname == "") {
      $err = "Please Enter User Name.";
    } else if(strpos($uname, " ")) {
      $err = "Username doesn't contain space.";
    } else if(!valid_email($uemail)) {
      $err = "Please Enter Valid Email Id.";
    } else if($upass == "") {
      $err = "Please Enter Valid Password.";
    } else if(strlen($upass) < 8) {
      $err = "Password Must Contain At Least 8 Characters!"; 
    } else if($cpass == "") {
      $err = "Please Enter Confirm Password.";
    }  else if($cpass != $upass) {
      $err = "Password & Confirm Password doesn't match.";
    } else {
      if($_GET["eid"]) {
        $sql = "UPDATE ".$adminTable." SET ".$admin_name." = '".$uname."', ".$admin_email." = '".$uemail."', ".$admin_pass." = '".$upass."' WHERE ".$admin_id." = ".$_GET["eid"];
      } else {
        $sql = "INSERT INTO ".$adminTable." (`".$admin_name."`, `".$admin_email."`, `".$admin_pass."`) VALUES ('".$uname."','".$uemail."','".$upass."')";
      }
      // $err =  $sql;
      if (mysqli_query($conn, $sql)) {
        ?> <script type="text/javascript">window.location="index.php"</script> <?php
      } else {
        $err = "Something Goes Wrong. Please Try Agian.";
      }
    }
}

?>

<div class="container-fluid">
    <div class="row" style="justify-content: space-around;">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="./add_admin.php<?php if($_GET["eid"]) echo "?eid=".$_GET["eid"]; ?>">
                    <div class="card-body">
                    <h3 class="card-title">Personal Info</h3>
                    <div class="form-group row">
                      <label
                        for="uname"
                        class="col-sm-4 control-label col-form-label"
                        >User Name</label
                      >
                      <div class="col-sm-6">
                        <input
                          name="userName"
                          type="text"
                          class="required form-control"
                          id="userName"
                          <?php if($uname != "") { ?>
                            value = "<?php echo $uname; ?>"
                          <?php } ?>
                          placeholder="Enter User Name Here"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                      <label
                        for="uemail"
                        class="col-sm-4 control-label col-form-label"
                        >Email Id</label
                      >
                      <div class="col-sm-6">
                        <input
                          name="userEmail"
                          type="email"
                          class="required form-control"
                          id="userEmail"
                          <?php if($uemail != "") { ?>
                            value = "<?php echo $uemail; ?>"
                          <?php } ?>
                          placeholder="Enter User Email Id Here"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                      <label for="passwd" class="col-sm-4 control-label col-form-label">Password</label>
                      <div class="col-sm-6">
                        <input
                          name="passwd"
                          type="password"
                          class="required form-control"
                          id="passwd"
                          <?php if($upass != "") { ?>
                            value = "<?php echo $upass; ?>"
                          <?php } ?>
                          placeholder="Enter Password Here"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                      <label
                        for="confirm"
                        class="col-sm-4 control-label col-form-label"
                        >Confirm Password</label
                      >
                      <div class="col-sm-6">
                        <input
                          name="confirm"
                          type="password"
                          class="required form-control"
                          id="confirm"
                          <?php if($cpass != "") { ?>
                            value = "<?php echo $cpass; ?>"
                          <?php } ?>
                          placeholder="Enter Confirm Password Here"
                        />
                      </div>
                    </div>
                    <div style="height:15px"> </div>
                    <?php
                        if($err != "") { 
                    ?>
                        <center>
                            <p style="color: red;"><?php echo $err; ?></p>
                        </center>
                    <?php
                        }
                    ?>
                    <div class="border-top" style="margin-bottom: -23px;">
                        <div class="card-body">
                            <center>
                              <?php if($_GET["eid"] || $_SESSION['id'] == 1) { ?>
                                <input type="submit" name="submit" value="Submit" class="btn btn-primary">
                              <?php } else { ?>
                                
                              <?php } ?>
                            </center>
                        </div>
                    </div>
                  </div>
                    </form>
                </div>    
            </div>
        </div>
    </div>
</div>


<?php include_once 'footer.php'; ?>