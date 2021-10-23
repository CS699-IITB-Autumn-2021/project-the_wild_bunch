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
$category = parse_keyform($_POST["category"]);
$number = parse_keyform($_POST["number"]);

echo "<br>Keyword after processing: ".$keyword."<br>";
$command_exec ="./virt_env/bin/python ./manual_under_dev.py -k \"".$keyword."\""." -c \"".$category."\" -n \"".$number."\"";
echo $command_exec."<br>";
//$command = shell_exec($command_exec);
//echo "<br>".$keyword;
exec($command_exec, $output, $result);
echo "RESULT: ".$result."<br>";
echo "<br>Command Executed: ".var_dump($output)."<br>";
//$output = shell_exec($command);
//echo $output;
foreach($op as $output){
		    echo $op;
}
echo "</body>
</html>";
?>
