<?php 

function parse_keyform($str) {
    //This function just replaces the special characters to avoid attacks
    $chars = str_split($str);
    $keyword = "";
    foreach ($chars as $char) {
        if ($char == '"'){
            $keyword = $keyword.'\"';
        }
        else{
        	$keyword = $keyword.$char;
        }
    }
    return $keyword;
}

echo "<html>
    <body>";

$keyword = parse_keyform($_POST["keyword"]);
$number = parse_keyform($_POST["number"]);
echo "<br>Keyword after processing: ".$keyword."<br>";
$command_exec ="./virt_env/bin/python ./manual_under_dev.py -k \"".$keyword."\""." -s"." \"a\""." -n ".$number;
echo $command_exec."<br>";
$output = shell_exec($command_exec);
echo "<br>".$output;
// exec($command_exec, $output, $result);
// echo "RESULT: ".$result."<br>";
// echo "<br>Command Executed: ".var_dump($output)."<br>";
//$output = shell_exec($command);
//echo $output;
echo "</body>
</html>";
?>
