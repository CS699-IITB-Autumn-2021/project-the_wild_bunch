<?php include_once 'header.php';?>
<?php include_once 'db.php';?>

<?php
    $errEconomictimes = $errNews18 = $errHindu = $errIndia = "";
    $urlNews18 = $categoryNews18 = $urlEconomictimes = $categoryEconomictimes = "";
    $urlHindu = $categoryHindu = $urlIndia = $categoryIndia = "";
    session_start();
    $auther_id = $_SESSION['id'];

    if (isset($_POST['submitNews18'])) {
        $urlNews18 = trim($_POST['urlNews18']);
        $categoryNews18 = trim($_POST['categoryNews18']);
       

        if($urlNews18 == "" || !filter_var($urlNews18, FILTER_VALIDATE_URL)) {
            $errNews18 = "Enter valid News18 url";
        } else if($categoryNews18 == "0") {
            $errNews18 = "Please select article category";
        } else {
            $command_exec = "python3 ./web_scraping/news18.py $urlNews18 $categoryNews18 $auther_id";
            $output = null;
            $retValue = null;
            exec($command_exec,$output,$retValue);
            if($retValue==0) 
            	echo '<script>alert("News article scrapped successfully")</script>';
            else
            	echo '<script>alert("Something went wrong")</script>';
        }
        
    } else if (isset($_POST['submitEconomictimes'])) {
        $urlEconomictimes = trim($_POST['urlEconomictimes']);
        $categoryEconomictimes = trim($_POST['categoryEconomictimes']);

        if($urlEconomictimes == "" || !filter_var($urlEconomictimes, FILTER_VALIDATE_URL)) {
            $errEconomictimes = "Enter valid Economic Times url";
        } else if($categoryEconomictimes == "0") {
            $errEconomictimes = "Please select article category";
        } else {  
            // scrap code calling & show popup to indicate status
            $command_exec = "python3 ./web_scraping/economictimes.py $urlEconomictimes $categoryEconomictimes $auther_id";
            $output = null;
            $retValue = null;
            exec($command_exec,$output,$retValue);
            if($retValue==0) 
            	echo '<script>alert("News article scrapped successfully")</script>';
            else
            	echo '<script>alert("Something went wrong")</script>';
        }
    } else if (isset($_POST['submitHindu'])) {
        $urlHindu = trim($_POST['urlHindu']);
        $categoryHindu = trim($_POST['categoryHindu']);

        if($urlHindu == "" || !filter_var($urlHindu, FILTER_VALIDATE_URL)) {
            $errHindu = "Enter valid The Hindu url";
        } else if($categoryHindu == "0") {
            $errHindu = "Please select article category";
        } else {
            // scrap code calling & show popup to indicate status
            $command_exec = "python3 ./web_scraping/thehindu.py $urlHindu $categoryHindu $auther_id";
            $output = null;
            $retValue = null;
            exec($command_exec,$output,$retValue);
            if($retValue==0) 
            	echo '<script>alert("News article scrapped successfully")</script>';
            else
            	echo '<script>alert("Something went wrong")</script>';

        }
    } else if (isset($_POST['submitIndia'])) {
        $urlIndia = trim($_POST['urlIndia']);
        $categoryIndia = trim($_POST['categoryIndia']);

        if($urlIndia == "" || !filter_var($urlIndia, FILTER_VALIDATE_URL)) {
            $errIndia = "Enter valid India.com url";
        } else if($categoryIndia == "0") {
            $errIndia = "Please select article category";
        } else {
            // scrap code calling & show popup to indicate status
            $command_exec = "python3 ./web_scraping/india_com.py $urlIndia $categoryIndia $auther_id";
            $output = null;
            $retValue = null;
            exec($command_exec,$output,$retValue);
            if($retValue==0) 
            	echo '<script>alert("News article scrapped successfully")</script>';
            else
            	echo '<script>alert("Something went wrong")</script>';
        }
    }
?>

<div class="container-fluid">
    <div class="row">
        <!-- News18 -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                  <!-- Form -->
                    <form class="form-horizontal" method="post" action="./index.php" enctype="multipart/form-data">
                    <div class="card-body">
                    <h3 class="card-title">Add News18 Article</h3>

                    <div style="height:15px"> </div>

                    <!-- Article URL -->
                    <div class="form-group row">
                      <label
                        for="urlNews18"
                        class="col-sm-4 control-label col-form-label"
                        >Article Url</label
                      >
                      <div class="col-sm-8">
                        <input
                          name="urlNews18"
                          type="text"
                          class="required form-control"
                          id="title"
                          <?php if($urlNews18 != "") { ?>
                            value = "<?php echo ($urlNews18); ?>"
                          <?php } ?>
                          placeholder="Enter News18 Article URL"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <!-- Article Category -->
                    <div class="form-group row">
                      <label
                        for="categoryNews18"
                        class="col-sm-4 control-label col-form-label"
                        >Article Category</label
                      >
                      <div class="col-sm-8">
                        <select class="form-select" name="categoryNews18" aria-label="Default select example">
                            <option selected value="0">Please Select Article Category</option>
                            <option value="India" <?php if($categoryNews18 == "India") echo "selected"; ?> >India</option>
                            <option value="World" <?php if($categoryNews18 == "World") echo "selected"; ?> >World</option>
                            <option value="Tech" <?php if($categoryNews18 == "Tech") echo "selected"; ?> >Tech</option>
                            <option value="Sports" <?php if($categoryNews18 == "Sports") echo "selected"; ?> >Sports</option>
                            <option value="Entertainment" <?php if($categoryNews18 == "Entertainment") echo "selected"; ?> >Entertainment</option>
                            <option value="Education" <?php if($categoryNews18 == "Education") echo "selected"; ?> >Education</option>
                            <option value="Health" <?php if($categoryNews18 == "Health") echo "selected"; ?> >Health</option>
                            <option value="Life & Style" <?php if($categoryNews18 == "Life & Style") echo "selected"; ?> >Life & Style</option>
                        </select>
                      </div>
                    </div>

                    <div style="height:15px"> </div>
                    
                    <!-- Error message -->
                    <?php
                        if($errNews18 != "") { 
                    ?>
                        <center>
                            <p style="color: red;"><?php echo $errNews18; ?></p>
                        </center>
                    <?php
                        }
                    ?>
                    <!-- Submit button -->
                    <div class="border-top" style="margin-bottom: -23px;">
                        <div class="card-body">
                            <center><input type="submit" name="submitNews18" value="Submit" class="btn btn-primary"></center>
                        </div>
                    </div>
                  </div>
                    </form>
                </div>    
            </div>
        </div>

        <!-- Economic Times -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                  <!-- Form -->
                    <form class="form-horizontal" method="post" action="./index.php" enctype="multipart/form-data">
                    <div class="card-body">
                    <h3 class="card-title">Add The Economic Times Article</h3>

                    <div style="height:15px"> </div>

                    <!-- Article URL -->
                    <div class="form-group row">
                      <label
                        for="urlEconomictimes"
                        class="col-sm-4 control-label col-form-label"
                        >Article Url</label
                      >
                      <div class="col-sm-8">
                        <input
                          name="urlEconomictimes"
                          type="text"
                          class="required form-control"
                          id="title"
                          <?php if($urlEconomictimes != "") { ?>
                            value = "<?php echo ($urlEconomictimes); ?>"
                          <?php } ?>
                          placeholder="Enter The Economic Times Article URL"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <!-- Article Category -->
                    <div class="form-group row">
                      <label
                        for="categoryEconomictimes"
                        class="col-sm-4 control-label col-form-label"
                        >Article Category</label
                      >
                      <div class="col-sm-8">
                        <select class="form-select" name="categoryEconomictimes" aria-label="Default select example">
                            <option selected value="0">Please Select Article Category</option>
                            <option value="India" <?php if($categoryEconomictimes == "India") echo "selected"; ?> >India</option>
                            <option value="World" <?php if($categoryEconomictimes == "World") echo "selected"; ?> >World</option>
                            <option value="Tech" <?php if($categoryEconomictimes == "Tech") echo "selected"; ?> >Tech</option>
                            <option value="Sports" <?php if($categoryEconomictimes == "Sports") echo "selected"; ?> >Sports</option>
                            <option value="Entertainment" <?php if($categoryEconomictimes == "Entertainment") echo "selected"; ?> >Entertainment</option>
                            <option value="Education" <?php if($categoryEconomictimes == "Education") echo "selected"; ?> >Education</option>
                            <option value="Health" <?php if($categoryEconomictimes == "Health") echo "selected"; ?> >Health</option>
                            <option value="Life & Style" <?php if($categoryEconomictimes == "Life & Style") echo "selected"; ?> >Life & Style</option>
                        </select>
                      </div>
                    </div>

                    <div style="height:15px"> </div>
                    
                    <!-- Error message -->
                    <?php
                        if($errEconomictimes != "") { 
                    ?>
                        <center>
                            <p style="color: red;"><?php echo $errEconomictimes; ?></p>
                        </center>
                    <?php
                        }
                    ?>
                    <!-- Submit button -->
                    <div class="border-top" style="margin-bottom: -23px;">
                        <div class="card-body">
                            <center><input type="submit" name="submitEconomictimes" value="Submit" class="btn btn-primary"></center>
                        </div>
                    </div>
                  </div>
                    </form>
                </div>    
            </div>
        </div>

        <div style="height:35px"> </div>

        <!-- The Hindu -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                  <!-- Form -->
                    <form class="form-horizontal" method="post" action="./index.php" enctype="multipart/form-data">
                    <div class="card-body">
                    <h3 class="card-title">Add The Hindu Article</h3>

                    <div style="height:15px"> </div>

                    <!-- Article URL -->
                    <div class="form-group row">
                      <label
                        for="urlHindu"
                        class="col-sm-4 control-label col-form-label"
                        >Article Url</label
                      >
                      <div class="col-sm-8">
                        <input
                          name="urlHindu"
                          type="text"
                          class="required form-control"
                          id="title"
                          <?php if($urlHindu != "") { ?>
                            value = "<?php echo ($urlHindu); ?>"
                          <?php } ?>
                          placeholder="Enter The Hindu Article URL"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <!-- Article Category -->
                    <div class="form-group row">
                      <label
                        for="categoryHindu"
                        class="col-sm-4 control-label col-form-label"
                        >Article Category</label
                      >
                      <div class="col-sm-8">
                        <select class="form-select" name="categoryHindu" aria-label="Default select example">
                            <option selected value="0">Please Select Article Category</option>
                            <option value="India" <?php if($categoryHindu == "India") echo "selected"; ?> >India</option>
                            <option value="World" <?php if($categoryHindu == "World") echo "selected"; ?> >World</option>
                            <option value="Tech" <?php if($categoryHindu == "Tech") echo "selected"; ?> >Tech</option>
                            <option value="Sports" <?php if($categoryHindu == "Sports") echo "selected"; ?> >Sports</option>
                            <option value="Entertainment" <?php if($categoryHindu == "Entertainment") echo "selected"; ?> >Entertainment</option>
                            <option value="Education" <?php if($categoryHindu == "Education") echo "selected"; ?> >Education</option>
                            <option value="Health" <?php if($categoryHindu == "Health") echo "selected"; ?> >Health</option>
                            <option value="Life & Style" <?php if($categoryHindu == "Life & Style") echo "selected"; ?> >Life & Style</option>
                        </select>
                      </div>
                    </div>

                    <div style="height:15px"> </div>
                    
                    <!-- Error message -->
                    <?php
                        if($errHindu != "") { 
                    ?>
                        <center>
                            <p style="color: red;"><?php echo $errHindu; ?></p>
                        </center>
                    <?php
                        }
                    ?>
                    <!-- Submit button -->
                    <div class="border-top" style="margin-bottom: -23px;">
                        <div class="card-body">
                            <center><input type="submit" name="submitHindu" value="Submit" class="btn btn-primary"></center>
                        </div>
                    </div>
                  </div>
                    </form>
                </div>    
            </div>
        </div>

        <!-- India.com -->
        <div class="col-md-6">
            <div class="card">
                <div class="card-body">
                  <!-- Form -->
                    <form class="form-horizontal" method="post" action="./index.php" enctype="multipart/form-data">
                    <div class="card-body">
                    <h3 class="card-title">Add India.com Article</h3>

                    <div style="height:15px"> </div>

                    <!-- Article URL -->
                    <div class="form-group row">
                      <label
                        for="urlIndia"
                        class="col-sm-4 control-label col-form-label"
                        >Article Url</label
                      >
                      <div class="col-sm-8">
                        <input
                          name="urlIndia"
                          type="text"
                          class="required form-control"
                          id="title"
                          <?php if($urlIndia != "") { ?>
                            value = "<?php echo ($urlIndia); ?>"
                          <?php } ?>
                          placeholder="Enter The Economic Times Article URL"
                        />
                      </div>
                    </div>

                    <div style="height:15px"> </div>

                    <!-- Article Category -->
                    <div class="form-group row">
                      <label
                        for="categoryIndia"
                        class="col-sm-4 control-label col-form-label"
                        >Article Category</label
                      >
                      <div class="col-sm-8">
                        <select class="form-select" name="categoryIndia" aria-label="Default select example">
                            <option selected value="0">Please Select Article Category</option>
                            <option value="India" <?php if($categoryIndia == "India") echo "selected"; ?> >India</option>
                            <option value="World" <?php if($categoryIndia == "World") echo "selected"; ?> >World</option>
                            <option value="Tech" <?php if($categoryIndia == "Tech") echo "selected"; ?> >Tech</option>
                            <option value="Sports" <?php if($categoryIndia == "Sports") echo "selected"; ?> >Sports</option>
                            <option value="Entertainment" <?php if($categoryIndia == "Entertainment") echo "selected"; ?> >Entertainment</option>
                            <option value="Education" <?php if($categoryIndia == "Education") echo "selected"; ?> >Education</option>
                            <option value="Health" <?php if($categoryIndia == "Health") echo "selected"; ?> >Health</option>
                            <option value="Life & Style" <?php if($categoryIndia == "Life & Style") echo "selected"; ?> >Life & Style</option>
                        </select>
                      </div>
                    </div>

                    <div style="height:15px"> </div>
                    
                    <!-- Error message -->
                    <?php
                        if($errIndia != "") { 
                    ?>
                        <center>
                            <p style="color: red;"><?php echo $errIndia; ?></p>
                        </center>
                    <?php
                        }
                    ?>
                    <!-- Submit button -->
                    <div class="border-top" style="margin-bottom: -23px;">
                        <div class="card-body">
                            <center><input type="submit" name="submitIndia" value="Submit" class="btn btn-primary"></center>
                        </div>
                    </div>
                  </div>
                    </form>
                </div>    
            </div>
        </div>
    </div>
</div>
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Add Admin</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        You are not authorised to add admin.
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
      </div>
    </div>
  </div>
</div>
<?php include_once 'footer.php'; ?>
