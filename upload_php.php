<?php
	$target_dir = "uploads/";
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	$uploadOk = 1;
	$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
	// Check if image file is a actual image or fake image
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		if($check !== false) {
			echo "File is an image - " . $check["mime"] . ".";
			echo "<img src=".$_FILES["fileToUpload"]["tmp_name"]." height=200 width=300 />";
			$uploadOk = 1;

			$host ="localhost:3306"; 
			$username ="root";
			$password ="ani";
			$database ="news_proj";

			$x=mysqli_connect($host, $username, $password, $database);
			$result=mysqli_query($x,"select tags from all_tags");
			while($row=mysqli_fetch_row($result)){
				$y=$y."<tr><td>".$row[0]."</td></tr>";

				echo "<table border='2'>
				<tr><th>tags</th></tr>". $y."</table>";
			}
			mysqli_close($connect);
	  	} 
	  	else {
			echo "File is not an image.";
			$uploadOk = 0;
	  	}
	}
?>
