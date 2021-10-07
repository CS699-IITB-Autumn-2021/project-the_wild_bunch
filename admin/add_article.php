<?php include_once 'header.php';?>
<?php include_once 'db.php';?>

<?php

$err = $title = $category = $title_img = $description = $img1 = $img2 = $img3 = "";
$path="assets/upload/article/";

if(!isset($_POST['submit']) && $_GET['eid']) {
  $sql = "SELECT * FROM ".$articleTable." WHERE ".$article_id." = ".$_GET["eid"];
  $result = mysqli_query($conn, $sql);

  while($row = mysqli_fetch_array($result)) {
    $title = $row[$article_title];
    $category = $row[$article_category];
    $old_title_img = $row[$article_title_img];
    $description = $row[$article_desc];
    $old_img1 = $row[$article_img1];
    $old_img2 = $row[$article_img2];
    $old_img3 = $row[$article_img3];
  }
}

if (isset($_POST['submit'])) {
  // $err = "Please select article category";
  // echo trim($_POST['category']) == "0";
  
  $title = trim($_POST['title']);
  $category = trim($_POST['category']);
  $title_img = $_FILES['title_img']['name'];
  $description = $_POST['description'];
  $img1 = $_FILES['img1']['name'];
  $img2 = $_FILES['img2']['name'];
  $img3 = $_FILES['img3']['name'];
  $old_title_img = $_POST['old_title_img'];
  $old_img1 = $_POST['old_img1'];
  $old_img2 = $_POST['old_img2'];
  $old_img3 = $_POST['old_img3'];

  if($title == "") {
    $err = "Please enter article title";
  } else if(!$_GET['eid'] && $title_img == "") {
    $err = "Plese select title image";
  } else if($category == "0") {
    $err = "Please select article category";
  } else if($description == "") {
    $err = "Please enter article description";
  } else {
    $milliseconds = round(microtime(true) * 1000);
    $description = str_replace('"', '\"', $description);
    if(!$_GET['eid']) {
      $title_img = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $title_img);
      $img1 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img1);
      $img2 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img2);
      $img3 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img3);

      if (move_uploaded_file($_FILES['title_img']['tmp_name'], $path.$title_img))  {
        if($_FILES['img1']['name'] != "") {
          if(!move_uploaded_file($_FILES['img1']['tmp_name'], $path.$img1)) {
            $img1 = "";
          }
        } else { $img1 = "";}
  
        if($_FILES['img2']['name'] != "") {
          if(!move_uploaded_file($_FILES['img2']['tmp_name'], $path.$img2)) {
            $img2 = "";
          }
        } else { $img2 = ""; }
  
        if($_FILES['img3']['name'] != "") {
          if(!move_uploaded_file($_FILES['img3']['tmp_name'], $path.$img3)) {
            $img3 = "";
          }
        } else { $img3 = ""; }
  
        // $msg = "Image uploaded successfully";
        // echo $description."<br>";
        $sql = 'INSERT INTO '.$articleTable.' (`'.$article_title_img.'`,`'.$article_title.'`,`'.$article_category.'`,`'.$article_desc.'`,`'.$article_img1.'`,`'.$article_img2.'`,`'.$article_img3.'`,`'.$admin_id.'`) VALUES ("'.$title_img.'","'.$title.'","'.$category.'","'.$description.'","'.$img1.'","'.$img2.'","'.$img3.'","'.$_SESSION['id'].'")';
        if (mysqli_query($conn, $sql)) {
          ?> <script type="text/javascript">window.location="index.php"</script> <?php
        } else {
          $err = "Something Goes Wrong. Please Try Agian.";
        }
      }else{
        $err = "Something goes wrong. Please try again!";
      }

    } else {

      if($title_img != "") {
        $title_img = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $title_img);
        if(move_uploaded_file($_FILES['title_img']['tmp_name'], $path.$title_img) && $old_title_img) {
          unlink($path.$old_title_img);
        }
      } else {
        $title_img = $old_title_img;
      }

      if($img1 != "") {
        $img1 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img1);
        if(move_uploaded_file($_FILES['img1']['tmp_name'], $path.$img1) && $old_img1) {
          unlink($path.$old_img1);
        }
      } else {
        $img1 = $old_img1;
      }

      if($img2 != "") {
        $img2 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img2);
        if(move_uploaded_file($_FILES['img2']['tmp_name'], $path.$img2) && $old_img2) {
          unlink($path.$old_img2);
        }
      } else {
        $img2 = $old_img2;
      }

      if($img3 != "") {
        $img3 = $milliseconds."_".rand(10,100)."_".str_replace(' ', '_', $img3);
        if(move_uploaded_file($_FILES['img3']['tmp_name'], $path.$img3) && $old_img3) {
          unlink($path.$old_img3);
        }
      } else {
        $img3 = $old_img3;
      }

      $sql = 'UPDATE '.$articleTable.' SET `'.$article_title.'` = "'.$title.'", `'.$article_title_img.'` = "'.$title_img.'", `'.$article_category.'` = "'.$category.'", `'.$article_desc.'` = "'.$description.'", `'.$article_img1.'` = "'.$img1.'", `'.$article_img2.'` = "'.$img2.'", `'.$article_img3.'` = "'.$img3.'" WHERE `'.$article_id.'` = "'.$_GET["eid"].'"';
      if (mysqli_query($conn, $sql)) {
        ?> <script type="text/javascript">window.location="index.php"</script> <?php
      } else {
        $err = "Something Goes Wrong. Please Try Agian.";
      }
    }
  }
}
?>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                    <form class="form-horizontal" method="post" action="./add_article.php<?php if($_GET["eid"]) echo "?eid=".$_GET["eid"]; ?>" enctype="multipart/form-data">
                    <div class="card-body">
                    <h3 class="card-title">Add News Article</h3>
                    <div class="form-group row">
                      <label
                        for="title"
                        class="col-sm-4 control-label col-form-label"
                        >Article Title</label
                      >
                      <div class="col-sm-8">
                        <input
                          name="title"
                          type="text"
                          class="required form-control"
                          id="title"
                          <?php if($title != "") { ?>
                            value = "<?php echo ($title); ?>"
                          <?php } ?>
                          placeholder="Enter Article Title Here"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                        <label
                            for="title_img"
                            class="col-sm-4 control-label col-form-label"
                            >Article Image</label
                        >
                        <div class="col-sm-8">
                            <input type="file" class="custom-file-input" id="validatedCustomFile" name="title_img" accept="image/*">
                            <?php if($old_title_img) { ?> <img src ="<?php echo $path.$old_title_img; ?>" height="60px" width="60px"> <?php } ?>
                            <input type='hidden' name='old_title_img' value="<?php echo $old_title_img; ?>">
                        </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                      <label
                        for="category"
                        class="col-sm-4 control-label col-form-label"
                        >Article Category</label
                      >
                      <div class="col-sm-8">
                        <select class="form-select" name="category" aria-label="Default select example">
                            <option selected value="0">Please Select Article Category</option>
                            <option value="India" <?php if($category == "India") echo "selected"; ?> >India</option>
                            <option value="World" <?php if($category == "World") echo "selected"; ?> >World</option>
                            <option value="Tech" <?php if($category == "Tech") echo "selected"; ?> >Tech</option>
                            <option value="Sports" <?php if($category == "Sports") echo "selected"; ?> >Sports</option>
                            <option value="Entertainment" <?php if($category == "Entertainment") echo "selected"; ?> >Entertainment</option>
                            <option value="Education" <?php if($category == "Education") echo "selected"; ?> >Education</option>
                            <option value="Health" <?php if($category == "Health") echo "selected"; ?> >Health</option>
                            <option value="Life & Style" <?php if($category == "Life & Style") echo "selected"; ?> >Life & Style</option>
                        </select>
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                      <label
                        for="description"
                        class="col-sm-4 control-label col-form-label"
                        >Article Description</label
                      >
                      <div class="col-sm-8">
                        <textarea 
                            class="required form-control" 
                            id="description" 
                            name="description"
                            placeholder="Enter Article Description Here(in preformatted text i.e. use \n, \r)"
                            rows="5"><?php if($description != "") echo "$description"; ?></textarea>
                      </div>
                    </div>
                    
                    <div style="height:15px"> </div>

                    <div class="form-group row">
                        <label for="title_img1"class="col-sm-4 control-label col-form-label">Article Image 1</label>
                        <div class="col-sm-8">
                            <input type="file" class="custom-file-input" id="validatedCustomFile" name="img1" accept="image/*">
                            <?php if($old_img1) { ?> <img src ="<?php echo $path.$old_img1; ?>" height="60px" width="60px"> <?php } ?>
                            <input type='hidden' name='old_img1' value="<?php echo $old_img1; ?>">
                        </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                        <label for="title_img2"class="col-sm-4 control-label col-form-label">Article Image 2</label>
                        <div class="col-sm-8">
                            <input type="file" class="custom-file-input" id="validatedCustomFile" name="img2" accept="image/*">
                            <?php if($old_img2) { ?> <img src ="<?php echo $path.$old_img2; ?>" height="60px" width="60px"> <?php } ?>
                            <input type='hidden' name='old_img2' value="<?php echo $old_img2; ?>">
                        </div>
                    </div>

                    <div style="height:15px"> </div>

                    <div class="form-group row">
                        <label for="title_img3"class="col-sm-4 control-label col-form-label">Article Image 3</label>
                        <div class="col-sm-8">
                            <input type="file" class="custom-file-input" id="validatedCustomFile" name="img3" accept="image/*">
                            <?php if($old_img3) { ?> <img src ="<?php echo $path.$old_img3; ?>" height="60px" width="60px"> <?php } ?>
                            <input type='hidden' name='old_img3' value="<?php echo $old_img3; ?>">
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
                            <center><input type="submit" name="submit" value="Submit" class="btn btn-primary"></center>
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