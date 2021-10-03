<?php
    require('./config/db.php');
    
    //get id
    $id = mysqli_real_escape_string($conn, $_GET['id']);
    //Create query
    $query = 'select * from Posts where id='.$id;
    // for all posts titles(for side panel)
    $query_titles = "SELECT * FROM Posts ORDER BY id DESC LIMIT 10";
    //get results
    $results = mysqli_query($conn,$query);
    $results_titles = mysqli_query($conn,$query_titles);
    //fetch data
    $post = mysqli_fetch_assoc($results);
    $titles = mysqli_fetch_all($results_titles,MYSQLI_ASSOC);
    //free results
    mysqli_free_result($results);

    //close connection
    mysqli_close($conn);
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
                    <a class="nav-link active" href="#">Latest</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">National</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">World</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Business</a>
                    </li>
                    <li class="nav-item">
                    <a class="nav-link" href="#">Sports</a>
                    </li>     
                    <li class="nav-item">
                    <a class="nav-link" href="#">Entertainment</a>
                    </li>                  
                    <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Extras</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Action</a>
                        <a class="dropdown-item" href="#">Another action</a>
                        <a class="dropdown-item" href="#">Something else here</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item" href="#">Separated link</a>
                    </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content container-lg-12 mx-0">
        <h1 class="mx-2 pt-3"> <?php echo $post['title']; ?></h1>
        <div class="container-lg-12 main-container mx-0">
            <div class="row mx-0 my-3">
                <!-- Div for News articles display -->
                <div class="col-lg-8 my-2">
                    <p><?php echo $post['body'] ; ?></p>
                </div>
                <!-- Side panel -->
                <div class="col-lg-4 mx-auto">
                    <div class=" border border-secondary search-box p-2">
                        <h4 class="text-center">Fresh News headlines</h4>
                        <!-- Recent news links -->
                        <div class="list-group mx-5">
                        <?php foreach($titles as $title) : ?>
                        <a href="post.php?id=<?php echo $title['id']; ?>" class="list-group-item list-group-item-action news-headline-links"><?php echo $title['title'];?></a>
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