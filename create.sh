#!bin/bash/

mkdir banner;
mkdir banner/assets;
mkdir banner/css;
mkdir banner/scripts;

#touch banner/css/screen.css;

cat << _EOF_ >banner/css/screen.css
body {
    background: #fff;
    margin: 0;
    padding: 0;
}

#banner {
    position: absolute;
    width: 180px; /* your width*/
    height: 500px; /* your height */
    -webkit-box-sizing: border-box;
    /* Safari/Chrome, other WebKit */
    -moz-box-sizing: border-box;
    /* Firefox, other Gecko */
    box-sizing: border-box;
    /* Opera/IE 8+ */
    background-image: url("../assets/bg.jpg");
    border: none;
    cursor: pointer;
}

/*-- banner styles here --*/

@keyframes text1 {
   /*-- animations here --*/
}
_EOF_

#touch banner/scripts/scripts.js;

cat << _EOF_>banner/scripts/scripts.js

var banner = document.getElementById('banner');

banner.style.width = dhtml.width + 'px';
banner.style.height = dhtml.height + 'px';

var closebutton = document.getElementById('closeButton');

var clickTAGvalue = dhtml.getVar('clickTAG', 'http://www.adform.com'); //dhtml.getVar() gets clickTAG variable from Adform, if it is not defined (e.g. banner is being tested locally) it will fallback to example.com
var landingpagetarget = dhtml.getVar('landingPageTarget', '_blank'); //same as above - landingPageTarget from Adform or falls back to _blank
	
banner.onclick = function() {
	window.open(clickTAGvalue,landingpagetarget);
}

document.addEventListener('touchstart', function(event) {
 deltax = 0;
 deltay = 0;
 x = event.touches[0].clientX;
 y = event.touches[0].clientY;
 l = event.touches.length;
}, false);

document.addEventListener('touchmove', function(event) {
  event.preventDefault();
  deltax = x - event.touches[0].clientX;
  deltay = y - event.touches[0].clientY;
  parent.window.scrollBy(0,deltay);  
}, false);
_EOF_
#touch banner/index.html;

cat << _EOF_ >banner/index.html
<!doctype html>
<html>

<head>
    <title>180x500</title>
    <script>
    document.write('<script src="' + (window.API_URL || 'https://s1.adform.net/banners/scripts/rmb/Adform.DHTML.js?bv=' + Math.random()) + '"><\/script>');
    </script>
</head>

<body>
    <div id="banner"></div>
</body>

</html>

_EOF_

#touch banner/manifest.json;

cat << _EOF_>banner/manifest.json
{

    "version": "1.0",

    "title": "930x180 standard html", 
    "description": "",  

    "width" : "930", 
    "height": "180", 

    "events": {
        "enabled": 1, 
        "list": { }
    },

    "clicktags": {
        "clickTAG": "http://www.adform.com"
    },

    "source": "930x180.html"
}
_EOF_