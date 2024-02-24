<?php
function gather($url){
	$curl = curl_init();
	curl_setopt_array($curl, array(
	    CURLOPT_RETURNTRANSFER => 1,
	    CURLOPT_URL => $url,
	));
	$resp = curl_exec($curl);
	curl_close($curl);
	return $resp;
}

function save($data){
    $filename = 'cloned/' . randstr(10) . '.html';
    $fp = fopen($filename, 'w');
    fwrite($fp, $data);
    fclose($fp);
    return $filename;
}

function randstr($length) {
    $str = random_bytes($length);
    $str = base64_encode($str);
    $str = str_replace(["+", "/", "="], "", $str);
    $str = substr($str, 0, $length);
    return $str;
}

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $url = $_POST["url"];
    $data = gather($url);
    header('Location: ' . save($data));
} else {
    echo "Invalid request method";
}
?>