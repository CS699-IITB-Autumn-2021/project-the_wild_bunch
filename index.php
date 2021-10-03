<?php
    require('./config/db.php');
    //get page number
    if (!isset ($_GET['page']) ) {  
        $page = 1;  
    } else {  
        $page = $_GET['page'];  
    }
    //defining page variables
    $posts_per_page = 8;

    $page_first_result = ($page-1) * $posts_per_page;

    //Create query
    $query_allPosts = 'select count(*) from Posts';
    $query_paginatedPosts = 'select * from Posts limit '.$page_first_result.','.$posts_per_page;

    //get results
    $results_all = mysqli_query($conn,$query_allPosts);
    $results_paginated = mysqli_query($conn,$query_paginatedPosts);

    //finding number of pages
    $num_posts = mysqli_fetch_assoc($results_all);
    $num_pages = ceil($num_posts["count(*)"] / $posts_per_page);
    // var_dump($num_pages);
    //fetch data
    $posts = mysqli_fetch_all($results_paginated,MYSQLI_ASSOC);
    //free results
    mysqli_free_result($results_all);
    mysqli_free_result($results_paginated);

    //close connection
    // mysqli_close($conn);
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
                <div class="text-center py-3">
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
                    <a class="nav-link dropdown-toggle" data-bs-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="true">Extras</a>
                    <div class="dropdown-menu">
                        <a class="dropdown-item" href="#">Social Media</a>
                        <a class="dropdown-item" href="#">Technology</a>
                    </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="main-content container-lg-12 mx-0">
        <h1 class="mx-2 pt-3">Latest News articles</h1>
        <div class="container-lg-12 main-container mx-0">
            <div class="row mx-0 my-3">
                <!-- Div for News articles display -->
                <div class="col-lg-8 my-2">
                    <div class="row my-3 mx-auto">
                        <?php $N = 0;?>
                        <?php foreach($posts as $post) : ?>
                        <?php $N++; ?> 
                        <?php if($N % 2 == 0) : ?>   
                        <a href="post.php?id=<?php echo $post['id']; ?>" class="news-card">
                            <div class="col-lg-12 my-2">
                                <div class="card text-white bg-primary">
                                        <div class="card-header">
                                            Post Header
                                            <span class="badge rounded-pill bg-light" style="float:right;"><?php echo $post['category'];?></span>
                                        </div>
                                        <div class="card-body">
                                            <h3 class="card-title"><?php echo $post['title']; ?></h3>
                                            <h5 class="card-subtitle text-white"><?php echo $post['created_at']; ?></h5>
                                            <p class="card-text"><?php echo $post['body']; ?></p>
                                            <p class="text-muted">Author : <?php echo $post['author']; ?></p>
                                        </div>
                                </div>
                            </div>
                        </a>
                        <?php endif; ?>
                        <?php if($N % 2) : ?>   
                        <a href="post.php?id=<?php echo $post['id']; ?>" class="news-card">
                            <div class="col-lg-12 my-2">
                                <div class="card bg-secondary">
                                        <div class="card-header">
                                            Post Header
                                            <span class="badge rounded-pill bg-dark" style="float:right;"><?php echo $post['category'];?></span>
                                        </div>
                                        <div class="card-body">
                                            <h3 class="card-title"><?php echo $post['title']; ?></h3>
                                            <h5 class="card-subtitle text-primary"><?php echo $post['created_at']; ?></h5>
                                            <p class="card-text"><?php echo $post['body']; ?></p>
                                            <p class="text-muted">Author : <?php echo $post['author']; ?></p>
                                        </div>
                                </div>
                            </div>
                        </a>
                        <?php endif; ?>
                        <?php endforeach; ?>    
                    </div>
                </div>
                <!-- Side panel -->
                <div class="col-lg-4 mx-auto">
                    <div class=" border border-secondary search-box p-2">
                        <h4 class="text-center">Search for news articles</h4>
                        <form class="form-group mx-5" method="post">
                            <div class="input-group mb-3">
                            <span class="bg-primary text-white input-group-text"><i class="fas fa-search"></i></span>
                            <input type="text" class="form-control" aria-label="Search box" name='search' placeholder="Search term...">
                            </div>
                        </form>
                        <!-- Search Results -->
                        <div class="list-group mx-5">
                        <?php 
                            // if nothing is in the search box then show no news articles titles
                            if(!isset($_POST['search']))
                                $search_query = "Select * from Posts where title like 'xxxx'";
                            // if search box is filled then use that value to match the news articles titles
                            else{
                                $search_query = "Select * from Posts where (title like '%".$_POST['search']."%' or category like '%".$_POST['search']."%')";   
                            }
                            $search_result = mysqli_query($conn,$search_query);
                            $matched_news = mysqli_fetch_all($search_result,MYSQLI_ASSOC);
                            foreach($matched_news as $match){
                                echo '<a href="post.php?id='.$match['id'].'" class="list-group-item list-group-item-action" style="text-decoration:none;">'.$match['title'].'</a>';
                            }
                        ?>
                        </div>
                    </div>
                </div>
                <!-- Pagination -->
                <div>
                    <ul class="pagination">
                        <?php 
                        $prev = $page - 1;
                            if($page == 1)
                                echo '<li class="page-item disabled"><a class="page-link" href="?page='.$prev.'">&laquo;</a></li>';
                            else
                                echo '<li class="page-item"><a class="page-link" href="?page='.$prev.'">&laquo;</a></li>';

                            for($i=1;$i<=$num_pages;$i++){
                                if($i == $page){
                                    echo '<li class="page-item active"><a class="page-link" href="?page='.$i.'">'.$i.'</a></li>';
                                }
                                else{
                                    echo '<li class="page-item"><a class="page-link" href="?page='.$i.'">'.$i.'</a></li>';
                                }
                            }
                            $next = $page + 1;
                            if($page == $num_pages)
                                echo '<li class="page-item disabled"><a class="page-link" href="?page='.$next.'">&raquo;</a></li>';
                            else
                                echo '<li class="page-item"><a class="page-link" href="?page='.$next.'">&raquo;</a></li>';

                        ?>
                    </ul>
                </div>

            </div>
        </div> 
    </div>
</body>
</html>