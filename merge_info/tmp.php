<?php 
echo "<html>
<body>";
echo "Keyword Searched for: ".$_POST["keyword"];
$command = escapeshellcmd('./virt_env/bin/python ./manual_under_dev.py '.$_POST["keyword"]);
$output = shell_exec($command);
echo $output;
echo "</body>
</html>";
?>
