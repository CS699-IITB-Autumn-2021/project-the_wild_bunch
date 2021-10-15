<?php 

function parse_keyform($str) {
    // echo "Hello world!";
    $chars = str_split($str);
    $big = "";
    foreach ($chars as $char) {
        // echo $char;
        if ($char == '"'){
            $big = $big.'\"';
        }
        else{
        	$big = $big.$char;
        }
        // echo "<br>";
    }
    return $big;
}

echo "<html>
<body>";
//$output=null;
//$retval=null;
//echo shell_exec("whoami");
//echo "Keyword Searched for: ".$_POST["keyword"];
//$keyword = parse_keyform($_POST["keyword"]);
$keyword = parse_keyform($_POST["keyword"]);
echo "<br>Keyword after processing: ".$keyword."<br>";
$command_exec ="./virt_env/bin/python ./manual_under_dev.py -k \"".$keyword."\"";
echo $command_exec;
$command = shell_exec($command_exec);
//echo "<br>".$keyword;
echo "<br>Command Executed: ".$command."<br>";
//$output = shell_exec($command);
//echo $output;
echo "</body>
</html>";
?>
