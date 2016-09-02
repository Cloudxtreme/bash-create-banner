#!bin/bash/

css_height=100
css_width=100
project=banner
unit=px
connect=x
unscr=_bg

while [ "$#" -gt 0 ]; do
  case "$1" in
		-h) css_height="$2"; shift 2;;
		-w) css_width="$2"; shift 2;;
		-n) project="$2"; shift 2;;

		-*) echo "uknown option: $1" >&2; exit 1;;
		-*) handle_argument "$1"; shift 1;;
	esac
done

mkdir $css_width$connect$css_height;
mkdir $css_width$connect$css_height/assets;
mkdir $css_width$connect$css_height/css;
mkdir $css_width$connect$css_height/scripts;

#touch project/css/screen.css;

cat << _EOF_ >$css_width$connect$css_height/css/screen.css
html,
body {
    width: $css_width$unit;
    height: $css_height$unit;
    padding: 0;
    margin: 0;
    overflow: hidden;
    /*margin: 50px auto 0 auto;*/
    background: #efefef;
}

body {
    -webkit-touch-callout: none;
    -webkit-user-select: none;
    -khtml-user-select: none;
    -moz-user-select: none;
    -ms-user-select: none;
    user-select: none;
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
}

body,
body * {
    box-sizing: border-box;
}

#banner {
    width: 100%;
    height: 100%;
    background: #fff url($css_width$connect$css_height$unscr.jpg) top center no-repeat;
    position: relative;
    cursor: pointer;
}


/*-- banner styles here --*/


@keyframes example {

   /*-- animations here --*/

}
_EOF_

#touch project/scripts/scripts.js;

cat << _EOF_>$css_width$connect$css_height/scripts/scripts.js

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
#touch project/index.html;

cat << _EOF_ >$css_width$connect$css_height/index.html
<!doctype html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>$css_width$connect$css_height $project</title>
    <script>
    document.write('<script src="' + (window.API_URL || 'https://s1.adform.net/banners/scripts/rmb/Adform.DHTML.js?bv=' + Math.random()) + '"><\/script>');
    </script>
    <link type="text/css" rel="stylesheet" href="css/screen.css" />
</head>

<body>
    <div id="banner"></div>
    <script src="scripts/scripts.js"></script>
</body>

</html>

_EOF_

#touch project/manifest.json;

cat << _EOF_>$css_width$connect$css_height/manifest.json
{

    "version": "1.0",

    "title": "$css_width$connect$css_height", 
    "description": "",  

    "width" : "$css_width", 
    "height": "$css_height", 

    "events": {
        "enabled": 1, 
        "list": { }
    },

    "clicktags": {
        "clickTAG": "http://www.$project.com"
    },

    "source": "index.html"
}
_EOF_