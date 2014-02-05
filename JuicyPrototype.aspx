<%@ Page Language="C#" AutoEventWireup="true" CodeFile="JuicyPrototype.aspx.cs" Inherits="JuicyPrototype" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Juicy Prototype</title>
    <script src="http://html2canvas.hertzen.com/build/html2canvas.js"></script>

    


</head>
<body>
    <form id="form1" runat="server">
    <div>
    


        <div id="mydiv">
        <img src="images/postcard1.jpg" />
        <p>text!</p>
        </div>
        <br />
        <br />




        <div id="canvas">
        <p>Canvas:</p>
        </div>
    
        <div id="image">
        <p>Image:</p>
        </div>


        <script type="text/javascript">
            window onload = function () {
                html2canvas([document.getElementById('mydiv')], {
                    onrendered: function (canvas) {
                        document.getElementById('canvas').appendChild(canvas);
                        var data = canvas.toDataURL('image/png');
                        // AJAX call to send `data` to a PHP file that creates an image from the dataURI string and saves it to a directory on the server

                        var image = new Image();
                        image.src = data;
                        document.getElementById('image').appendChild(image);
                    }
                });
            }

    </script>



        
       <%-- <asp:FileUpload ID="FileUpload1" runat="server" />
        <asp:Button ID="btnUpload" runat="server" Text="Upload" />
        <br />


        <div id="card" style="background: url(images/postcard1.png) no-repeat center center; width: 640px; height: 426px">

            <img src="images/derp.jpg" width="184px" height="248px" />

        </div>--%>



    </div>
    </form>
</body>
</html>
