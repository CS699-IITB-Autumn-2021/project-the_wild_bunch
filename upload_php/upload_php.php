<?php
	
	//Define a target directory
	$target_dir = "uploads/";
	
	//target file name
	$target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
	
	//initialize a variable to check upload status
	$uploadOk = 1;
	
	//get the extension of the uploaded file
	$imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
	
	//check if submit field is set
	if(isset($_POST["submit"])) {
		$check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
		//check if the image is appropriate
		if($check !== false) {
			echo "File is an image - " . $check["mime"] . ".";
			echo "<img src=".$_FILES["fileToUpload"]["tmp_name"]." height=200 width=300 />";
			$uploadOk = 1;

			//connect to sql server
			$host ="localhost:3306"; 
			$username ="root";
			$password ="ani";
			$database ="news_proj";

			$x=mysqli_connect($host, $username, $password, $database);

			//execute query on sql server
			$result=mysqli_query($x,"select tags from all_tags");
			while($row=mysqli_fetch_row($result)){
				$y=$y."<tr><td>".$row[0]."</td></tr>";

				echo "<table border='2'>
				<tr><th>tags</th></tr>". $y."</table>";
			}
			//close sql connection
			mysqli_close($connect);
	  	} 
	  	else {
			echo "File is not an image.";
			$uploadOk = 0;
	  	}
	}
?>
