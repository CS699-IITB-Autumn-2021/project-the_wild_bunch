<?php 

function parse_keyform($str) {
    // echo "Hello world!";
    $chars = str_split($str);
    $big = "";
    foreach ($chars as $char) {
        // echo $char;
        if ($char == " "){
            $big = $big."\ ";
        }
        $big = $big.$char;
        // echo "<br>";
    }
    return $big;
}

echo "<html>
<body>";
//echo "Keyword Searched for: ".$_POST["keyword"];
//$keyword = parse_keyform($_POST["keyword"]);
$keyword = escapeshellarg($_POST["keyword"]);
echo "<br>Keyword after processing: ".$keyword;

$command = escapeshellcmd('./virt_env/bin/python ./manual_under_dev.py -k '.$keyword);
//echo "<br>".$keyword;
echo "<br>Command Executed: ".$command;
$output = shell_exec($command);
echo $output;
echo "</body>
</html>";
?>
