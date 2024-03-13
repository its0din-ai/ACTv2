<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<script type="text/javascript">

function displayPara(fieldID, displayBol) {

  var paraObj = document.getElementById(fieldID);
  var showObj = document.getElementById(fieldID+'_show');
  var hideObj = document.getElementById(fieldID+'_hide');

  paraObj.style.display = (displayBol)? '' : 'none' ;
  showObj.style.display = (!displayBol)? '' : 'none' ;
  hideObj.style.display = (displayBol)? '' : 'none' ;

}

</script>

<title>Lo-fi</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0e6e6;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .lofi-container {
            text-align: center;
            padding: 20px;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .lofi-heading {
            font-size: 36px;
            color: #333;
            margin-bottom: 20px;
        }
        .lofi-description {
            font-size: 18px;
            color: #666;
            margin-bottom: 20px;
        }
        .lofi-link {
            color: #007bff;
            text-decoration: none;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="lofi-container">
        <h1 class="lofi-heading">Selamat Datang di Halaman Lo-fi!</h1>
        <p class="lofi-description">Nikmati suasana santai dengan musik Lo-fi yang menenangkan.</p>
        <p class="lofi-description">Kunjungi <a class="lofi-link" href="Music/Lo-fi/Mp3/cupid-gustixa.mp3">sini</a> untuk mendengarkan musik Lo-fi.</p>
        <p class="lofi-description">Atau duduk santai sambil menikmati secangkir kopi di samping jendela.</p>

<?php
  function hint($value) {
    echo "<a href=\"#\" onclick=\"displayPara('para1', false);\" id=\"para1_hide\" style=\"display:none;\">Hide Hint</a>";
    echo "<a href=\"#\" onclick=\"displayPara('para1', true);\" id=\"para1_show\" style=\"\">Show Hint</a>";
    echo "<div id=\"para1\" style=\"display:none;\">$value</div>";
}
?>

</body>
</html>