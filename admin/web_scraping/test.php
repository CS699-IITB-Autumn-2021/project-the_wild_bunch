<?php

$url = "https://www.news18.com/cricketnext/news/mumbai-cricket-association-to-handover-hospitality-box-to-sunil-gavaskar-on-october-29-4275809.html";
$result = json_decode(shell_exec("python news18.py $url kamal"), true);
// $result = system("python news18.py $url kamal", $retval);
echo $result."<br><br>"."python news18.py $url";
?>