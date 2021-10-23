<?php

$url = "https://www.news18.com/cricketnext/news/mumbai-cricket-association-to-handover-hospitality-box-to-sunil-gavaskar-on-october-29-4275809.html";
$result = exec("python news18.py $url kamal");
// $result = system("python news18.py $url kamal", $retval);
// while($result == "") {
//     echo "";
// }
    echo $result."<br><br>"."python news18.py $url";
echo $result;
?>