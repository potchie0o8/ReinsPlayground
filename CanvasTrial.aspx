<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CanvasTrial.aspx.cs" Inherits="CanvasTrial" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reins Experiment on HTML 5 Canvas</title>

    <link href='styles/canvas.css' rel='stylesheet' type='text/css'/>


    <script src="js/base64.js"></script>
    <script src="js/canvas2image.js"></script>

    <script type="text/javascript">

            // setup our test canvas
            // and a simple drawing function
            window.onload = function () {

                var bMouseIsDown = false;

                var oCanvas = document.getElementById("thecanvas");
                var oCtx = oCanvas.getContext("2d");


                var iWidth = oCanvas.width;
                var iHeight = oCanvas.height;

              

               

              

                

                //for movement

                //oCanvas.onmousedown = function (e) {
                //    bMouseIsDown = true;
                //    iLastX = e.clientX - oCanvas.offsetLeft + document.body.scrollLeft;
                //    iLastY = e.clientY - oCanvas.offsetTop + document.body.scrollTop;
                //}
                //oCanvas.onmouseup = function () {
                //    bMouseIsDown = false;
                //    iLastX = -1;
                //    iLastY = -1;
                //}
                //oCanvas.onmousemove = function (e) {
                //    if (bMouseIsDown) {
                //        var iX = e.clientX - oCanvas.offsetLeft + document.body.scrollLeft;
                //        var iY = e.clientY - oCanvas.offsetTop + document.body.scrollTop;
                //        oCtx.moveTo(iLastX, iLastY);
                //        oCtx.lineTo(iX, iY);
                //        oCtx.stroke();
                //        iLastX = iX;
                //        iLastY = iY;
                //    }
                //}

                function showDownloadText() {
                    document.getElementById("buttoncontainer").style.display = "none";
                    document.getElementById("textdownload").style.display = "block";
                }

                function hideDownloadText() {
                    document.getElementById("buttoncontainer").style.display = "block";
                    document.getElementById("textdownload").style.display = "none";
                }

                function convertCanvas(strType) {
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



                document.getElementById("savejpegbtn").onclick = function ()
                {
                    saveCanvas(oCanvas, "JPEG");
                }



            }
    </script>

<%--    <script type="text/javascript">
        window.onload = function () {

            var tCtx = document.getElementById('textCanvas').getContext('2d'),
            imageElem = document.getElementById('image');

            document.getElementById('text').addEventListener('keyup', function () {
                tCtx.canvas.width = tCtx.measureText(this.value).width;
                tCtx.fillText(this.value, 0, 10);
                imageElem.src = tCtx.canvas.toDataURL();
                console.log(imageElem.src);
            }, false);

        }
    </script>--%>






</head>
<body>
    <form id="form1" runat="server">
    <div>
    


        <div id="buttoncontainer" style="display:block;">
            <input type="button" id="savejpegbtn" value="Save JPEG">
        </div>


        

        <canvas width="200" height="200" style="border:1px solid black;" id="thecanvas">
        </canvas>


        <%--<canvas id='textCanvas' height="20"></canvas>
        <asp:Image ID="image" runat="server" />
        <br>
        <textarea id='text'></textarea>--%>
        

    </div>
    </form>
</body>
</html>
