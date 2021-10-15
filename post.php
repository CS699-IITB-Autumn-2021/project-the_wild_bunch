<?php
    require('./config/db.php');
    
    //get id
    $id = mysqli_real_escape_string($conn, $_GET['id']);
    //Create query
    $query = 'select * from article where article_id='.$id;
    // for all posts titles(for side panel)
    $query_titles = "SELECT * FROM article WHERE article_status = 1 ORDER BY article_id DESC LIMIT 10";
    //for all categories
    $query_allCategories = "select distinct article_category from article order by article_category";

    //get results
    $results = mysqli_query($conn,$query);
    $results_titles = mysqli_query($conn,$query_titles);
    $results_allCategories = mysqli_query($conn,$query_allCategories);

    //fetch data
    $post = mysqli_fetch_assoc($results);
    $titles = mysqli_fetch_all($results_titles,MYSQLI_ASSOC);
    $allCategories = mysqli_fetch_all($results_allCategories,MYSQLI_ASSOC);
    
    //increasing the post view count
    mysqli_query($conn,"update article set article_visit = article_visit + 1 where article_id=$id");
    //free results
    mysqli_free_result($results);
    mysqli_free_result($results_allCategories);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/main.css">
    <script src="https://kit.fontawesome.com/dce8876dde.js" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://bootswatch.com/5/lux/bootstrap.css">

    <title>XYZ News Portal</title>
</head>
<body>
    <div class="header">
        <div class="container-fluid">
            <a href="index.php" id="banner">
                <div id="banner" class="text-center py-3">
                    <h1>XYZ News Portal</h1>
                    <h4 class="text-muted">For those who read</h4>
                </div>
            </a>

            <div class="container-md">
                <ul class="nav nav-pills justify-content-center">
                    <li class="nav-item">
                    <a class="nav-link" href="index.php">Latest</a>
                    </li>
                    <?php foreach($allCategories as $cat): ?>
                        <li class="nav-item">
                        <a class="nav-link" href="categorizedPosts.php?category=<?php echo $cat['article_category']; ?>"><?php echo $cat['article_category']; ?></a>
                        </li>
                    <?php endforeach; ?> 
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content container-lg-12 mx-0">
        <h1 class="mx-2 pt-3"> <?php echo $post['article_title']; ?></h1>
        <div class="container-lg-12 main-container mx-0">
            <div class="row my-3">
                <div class="col-sm-6">
                    <span class="mx-2 badge bg-success">News story added on : dd/mm/yyyy</span>
                </div>
                <div class="col-sm-6">
                    <span style="float:right;" class="mx -2 badge bg-warning">Views : <?php echo $post['article_visit'];?></span>
                </div>
            </div>
            <div class="row mx-0 my-3">
                <!-- Div for News articles display -->
                <div class="col-lg-8 my-2">
                    <!-- News Article Image -->
                    <div class="text-center mb-5"><img src="../project_kamal/assets/upload/article/<?php echo $post['article_title_img']?>" alt="" class="img-fluid"></div>
                    <!-- News article full text -->
                    <p><?php echo $post['article_desc'] ; ?></p>
                </div>
                <!-- Side panel -->
                <div class="col-lg-4 mx-auto">
                    <div class=" border border-secondary search-box p-2">
                        <h4 class="text-center">Fresh News headlines</h4>
                        <!-- Recent news links -->
                        <div class="list-group mx-2">
                        <?php foreach($titles as $title) : ?>
                        <a href="post.php?id=<?php echo $title['article_id']; ?>" class="list-group-item list-group-item-action news-headline-links"><?php echo $title['article_title'];?></a>
                        <?php endforeach; ?>
                        </div>
                    </div>
                </div>

            </div>
        </div> 
    </div>
    <script src="scripts/post.js"></script>
</body>
</html>