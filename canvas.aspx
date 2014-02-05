<%@ Page Language="C#" AutoEventWireup="true" CodeFile="canvas.aspx.cs" Inherits="canvas" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canvas Sample</title>

    <link href='styles/SyntaxHighlighter.css' rel='stylesheet' type='text/css'/>
<script type="text/javascript" src="js/shCore.js"></script>
<script type="text/javascript" src="js/shBrushJScript.js"></script>
<script type="text/javascript" src="js/shBrushXml.js"></script>
<script type="text/javascript" src="js/onload.js"></script>


<script src="js/base64.js"></script>
<script src="js/canvas2image.js"></script>

<link rel="stylesheet" type="text/css" href="styles/common.css">

<script type="text/javascript">

    // setup our test canvas
    // and a simple drawing function
    window.onload = function () {

        var bMouseIsDown = false;

        var oCanvas = document.getElementById("thecanvas");
        var oCtx = oCanvas.getContext("2d");


        var iWidth = oCanvas.width;
        var iHeight = oCanvas.height;

        oCtx.fillStyle = "rgb(255,255,255)";
        oCtx.fillRect(0, 0, iWidth, iHeight);

        oCtx.fillStyle = "rgb(255,0,0)";
        oCtx.fillRect(20, 20, 30, 30);

        oCtx.fillStyle = "rgb(0,255,0)";
        oCtx.fillRect(60, 60, 30, 30);

        oCtx.fillStyle = "rgb(0,0,255)";
        oCtx.fillRect(100, 100, 30, 30);

        oCtx.beginPath();
        oCtx.strokeStyle = "rgb(255,0,255)";
        oCtx.strokeWidth = "4px";

        oCanvas.onmousedown = function (e) {
            bMouseIsDown = true;
            iLastX = e.clientX - oCanvas.offsetLeft + document.body.scrollLeft;
            iLastY = e.clientY - oCanvas.offsetTop + document.body.scrollTop;
        }
        oCanvas.onmouseup = function () {
            bMouseIsDown = false;
            iLastX = -1;
            iLastY = -1;
        }
        oCanvas.onmousemove = function (e) {
            if (bMouseIsDown) {
                var iX = e.clientX - oCanvas.offsetLeft + document.body.scrollLeft;
                var iY = e.clientY - oCanvas.offsetTop + document.body.scrollTop;
                oCtx.moveTo(iLastX, iLastY);
                oCtx.lineTo(iX, iY);
                oCtx.stroke();
                iLastX = iX;
                iLastY = iY;
            }
        }

        function showDownloadText() {
            document.getElementById("buttoncontainer").style.display = "none";
            document.getElementById("textdownload").style.display = "block";
        }

        function hideDownloadText() {
            document.getElementById("buttoncontainer").style.display = "block";
            document.getElementById("textdownload").style.display = "none";
        }

        function convertCanvas(strType) {
            if (strType == "PNG")
                var oImg = Canvas2Image.saveAsPNG(oCanvas, true);
            if (strType == "BMP")
                var oImg = Canvas2Image.saveAsBMP(oCanvas, true);
            if (strType == "JPEG")
                var oImg = Canvas2Image.saveAsJPEG(oCanvas, true);

            if (!oImg) {
                alert("Sorry, this browser is not capable of saving " + strType + " files!");
                return false;
            }

            oImg.id = "canvasimage";

            oImg.style.border = oCanvas.style.border;
            document.body.replaceChild(oImg, oCanvas);

            showDownloadText();
        }

        function saveCanvas(pCanvas, strType) {
            var bRes = false;
            if (strType == "PNG")
                bRes = Canvas2Image.saveAsPNG(oCanvas);
            if (strType == "BMP")
                bRes = Canvas2Image.saveAsBMP(oCanvas);
            if (strType == "JPEG")
                bRes = Canvas2Image.saveAsJPEG(oCanvas);

            if (!bRes) {
                alert("Sorry, this browser is not capable of saving " + strType + " files!");
                return false;
            }
        }

        document.getElementById("savepngbtn").onclick = function () {
            saveCanvas(oCanvas, "PNG");
        }
        document.getElementById("savebmpbtn").onclick = function () {
            saveCanvas(oCanvas, "BMP");
        }
        document.getElementById("savejpegbtn").onclick = function () {
            saveCanvas(oCanvas, "JPEG");
        }

        document.getElementById("convertpngbtn").onclick = function () {
            convertCanvas("PNG");
        }
        document.getElementById("convertbmpbtn").onclick = function () {
            convertCanvas("BMP");
        }
        document.getElementById("convertjpegbtn").onclick = function () {
            convertCanvas("JPEG");
        }

        document.getElementById("resetbtn").onclick = function () {
            var oImg = document.getElementById("canvasimage");
            document.body.replaceChild(oCanvas, oImg);

            hideDownloadText();
        }

    }
</script>



</head>
<body>
    <form id="form1" runat="server">
Comments: <a href="http://blog.nihilogic.dk/2008/04/saving-canvas-data-to-image-file.html">go here</a>
<br/><br/>
<div class="textblob">
This is a small library that lets you easily save a WHATWG canvas element as an imagefile.<br/>
Files needed: <a href="canvas2image.js">canvas2image.js</a>, <a href="base64.js">base64.js</a><br/>
<br/>
Draw on the canvas with the pretty boxes below using the mouse, then click the "Convert" buttons to convert it to a downloadable image - or the "Save" buttons to download the image file directly.
</div>
<br/>

<canvas width="200" height="200" style="border:1px solid black;" id="thecanvas">

</canvas>

<br/><br/>
<div id="textdownload" style="display:none;font-style:italic;">Now you can right click and download the image<br/>
<input type="button" id="resetbtn" value="Reset">
</div>

<div id="buttoncontainer" style="display:block;">
<input type="button" id="savepngbtn" value="Save PNG">
<input type="button" id="convertpngbtn" value="Convert to PNG">
<br/>
<input type="button" id="savebmpbtn" value="Save BMP">
<input type="button" id="convertbmpbtn" value="Convert to BMP">
<br/>
<input type="button" id="savejpegbtn" value="Save JPEG">
<input type="button" id="convertjpegbtn" value="Convert to JPEG">

</div>
<br/>
<div class="textblob">
Using the WHATWG canvas element, you can create all sorts of cool graphics client-side on the fly using Javascript.
However, the canvas image cannot simply be saved to disk as any other image.
<br/>
Luckily there is a neat function on the the canvas object called toDataURL().
This functions encodes the image data as a base64 encoded PNG file and returns 
it as a <a href="http://en.wikipedia.org/wiki/Data:_URI_scheme" target="_blank">data: URI</a>.
<br/>

<pre name="code" class="javascript">
var strDataURI = oCanvas.toDataURL();
// returns "data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAMgAAADICAYAAACt..."
</pre>

Other formats than PNG are supported by some browsers by adding an argument to the toDataURL() call containing the mime type of the format you want.

<pre name="code" class="javascript">
var strDataURI = oCanvas.toDataURL("image/jpeg");
// returns "data:image/jpeg;base64,/9j/4AAQSkZJRgABAQAAAQABAA..."
</pre>

It looks like Opera and Safari only supports PNG, while Firefox supports at least PNG and JPEG.<br/>
<br/>
Now, Using that data string, we can stick it in an &lt;img&gt; element or we can serve it directly to the 
browser and force it to download the image by replacing the mimetype.
<br/>
That is basically what this little library does. The following functions are provided:
<pre name="code" class="javascript">

/*
 * Canvas2Image.saveAsXXXX = function(oCanvasElement, bReturnImgElement, iWidth, iHeight) { ... }
 */

var oCanvas = document.getElementById("thecanvas");

Canvas2Image.saveAsPNG(oCanvas);  // will prompt the user to save the image as PNG.

Canvas2Image.saveAsJPEG(oCanvas); // will prompt the user to save the image as JPEG. 
                                  // Only supported by Firefox.

Canvas2Image.saveAsBMP(oCanvas);  // will prompt the user to save the image as BMP.


// returns an <img> element containing the converted PNG image
var oImgPNG = Canvas2Image.saveAsPNG(oCanvas, true);   

// returns an <img> element containing the converted JPEG image (Only supported by Firefox)
var oImgJPEG = Canvas2Image.saveAsJPEG(oCanvas, true); 
                                                       
// returns an <img> element containing the converted BMP image
var oImgBMP = Canvas2Image.saveAsBMP(oCanvas, true); 


// all the functions also takes width and height arguments. 
// These can be used to scale the resulting image:

// saves a PNG image scaled to 100x100
Canvas2Image.saveAsPNG(oCanvas, false, 100, 100);

</pre>

So, you may have noticed the saveAsBMP function. Since BMP is not supported by any of the browsers (and I felt like wasting an afternoon), 
BMP support has been added by utilizing the getImageData() method, which enabled us to read raw pixel data from the canvas.<br/>
<br/>
Using this data, we can set up a BMP file structure (which is really simple compared to most other image formats), base64 encode everything and create our own data: URI.
<br/><br/>
The getImageData() method is only available in Firefox, <a href="http://snapshot.opera.com/">Opera beta</a> and Safari using the latest <a href="http://nightly.webkit.org/">WebKit nightly</a>.
For larger images, it can take several seconds to encode the image to BMP, but for smaller canvases, it seems fine and fast.
</div>
<br/><br/>

Issues and compatibility
<ul>
	<li>Only works in canvas-enabled browsers. Safari only with the latest WebKit nightly).
	<li>I'm not very good with Safari and I can't get it to correctly download the file. Seems like a filename problem? Right-click + save-as on the converted image seems to work fine.
	<li>It would be really neat if somehow a filename could be attached to the data, but I've found no way to do that. For now, you have to specify the filename yourself.
	<li>Since btoa() is only supported in Firefox, we implement base64 encoding using <a href="base64.js">these functions</a> made by Masanao Izumo
</ul>
<br/>
<a href="http://www.stoodio.org/gmail-archive-canvas-image">Ukrainian translation</a> courtesy of Mario Pozner.<br/>
<br/>


<br />
Comments: <a href="http://blog.nihilogic.dk/2008/04/saving-canvas-data-to-image-file.html">go here</a>
<br />
<br />

<br/>
<br/>

<hr>
<span class="footer">(c) 2007-2008 Jacob Seidelin</span>


<script type="text/javascript">
    var gaJsHost = (("https:" == document.location.protocol) ? "https://ssl." : "http://www.");
    document.write(unescape("%3Cscript src='" + gaJsHost + "google-analytics.com/ga.js' type='text/javascript'%3E%3C/script%3E"));
</script>
<script type="text/javascript">
    var pageTracker = _gat._getTracker("UA-3940914-2");
    pageTracker._initData();
    pageTracker._trackPageview();
</script>
    </form>
</body>
</html>




