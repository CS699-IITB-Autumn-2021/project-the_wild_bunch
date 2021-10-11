<?php 

//create command on shell to run webscraping
$command = escapeshellcmd('python ./manual_under_dev.py');
//execute command on shell to run webscraping
$output = shell_exec($command);

//print output
echo $output;

?>
