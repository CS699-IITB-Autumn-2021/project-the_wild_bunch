<?php include_once 'header.php';?>
<?php include_once 'db.php'; ?>

<?php
  $path="assets/upload/article/";

  if($_GET["aid"]) {
    $sql = "UPDATE ".$articleTable." SET ".$article_status." = 1 WHERE ".$article_id." = ".$_GET["aid"];
    mysqli_query($conn, $sql);
  }
  if($_GET["did"]) {
    $sql = "UPDATE ".$articleTable." SET ".$article_status." = 0 WHERE ".$article_id." = ".$_GET["did"];
    mysqli_query($conn, $sql);
  }
  if($_GET["ddid"]) {
    $sql = "DELETE FROM ".$articleTable." WHERE ".$article_id." = ".$_GET["ddid"];
    mysqli_query($conn, $sql);
  }
  $sql = "SELECT * FROM ".$articleTable;
  if($_SESSION['id'] != "1")
    $sql = $sql." WHERE `".$admin_id."` = '".$_SESSION['id']."'";
  $result = mysqli_query($conn, $sql);
//   echo $sql;
//   exit();
?>

<div class="container-fluid">
  <div class="row">
    <div class="col-12">
      <!-- <div class="card">
        <div class="card-body"> -->
          <h3 class="card-title">View Article</h3>
          <table id="dataTable" class="table table-striped table-bordered table-sm" cellspacing="0" width="100%">
            <thead>
              <tr>
                <th class="col th-sm">Article ID</th>
                <th class="col th-sm">Article Title</th>
                <th class="col th-sm">Article Image</th>
                <th class="col th-sm">Article category</th>
                <th class="col th-sm">Article Description</th>
                <th class="col th-sm">Auther ID</th>
                <th class="col th-sm">Edit Article</th>
                <th class="col th-sm">Delete Article</th>
                <th class="col th-sm">Status</th>
              </tr>
            </thead>
            <tbody>
              <?php while($row = mysqli_fetch_assoc($result)) { ?>
                <tr>
                  <td><?php echo $row[$article_id]; ?></td>
                  <td><?php 
                    if(strlen($row[$article_title]) < 25)
                       echo  $row[$article_title];
                    else
                      echo substr($row[$article_title], 0, 25)."..."; 
                  ?></td>
                  <td><img src ="<?php echo $path.$row[$article_title_img]; ?>" height="60px" width="60px"></td>
                  <td><?php echo $row[$article_category]; ?></td>
                  <td><?php 
                    if(strlen($row[$article_desc]) < 75)
                       echo  $row[$article_desc];
                    else
                      echo substr($row[$article_desc], 0, 75)."..."; 
                    ?></td>
                  <td><?php echo $row[$admin_id]; ?></td>
                  <td>
                    <a href="./add_article.php?eid=<?php echo $row[$article_id]; ?>">
                      <button type="button" class="btn btn-primary" ><i class="fa fa-edit"></i> Edit </button>
                    </a>
                  </td>
                  <td> 
                    <a href="./view_article.php?ddid=<?php echo $row[$article_id]; ?>">
                        <button type="button" class="btn btn-danger text-white"><i class="fa fa-trash"></i> Delete</button>
                    </a>
                  </td>
                  <td>
                    <?php if($row[$article_status] != 1) { ?>
                      <a href="./view_article.php?aid=<?php echo $row[$article_id]; ?>">
                        <button type="button" class="btn btn-primary" > Active </button>
                      </a>
                    <?php } else { ?>
                      <a href="./view_article.php?did=<?php echo $row[$article_id]; ?>">
                        <button type="button" class="btn btn-danger" > De-Active </button>
                      </a>
                    <?php } ?>
                  </td>
                </tr>
              <?php } ?>
            </tbody>
            <tfoot>
              <tr>
                <th class="col th-sm">Article ID</th>
                <th class="col th-sm">Article Title</th>
                <th class="col th-sm">Article Image</th>
                <th class="col th-sm">Article category</th>
                <th class="col th-sm">Article Description</th>
                <th class="col th-sm">Auther ID</th>
                <th class="col th-sm">Edit Article</th>
                <th class="col th-sm">Delete Article</th>
                <th class="col th-sm">Status</th>
              </tr>
            </tfoot>
          </table>
        <!-- </div>
      </div> -->
    </div>
  </div>
</div>

<?php include_once 'footer.php'; ?>