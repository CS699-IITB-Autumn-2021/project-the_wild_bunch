<?php 

$command = escapeshellcmd('python ./manual_under_dev.py');
$output = shell_exec($command);
echo $output;

?>
