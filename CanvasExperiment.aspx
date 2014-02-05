<%@ Page Language="C#" AutoEventWireup="true" CodeFile="CanvasExperiment.aspx.cs" Inherits="CanvasExperiment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Canvas Experiment - 2/3/2013</title>
    <script src="//code.jquery.com/jquery-1.10.2.min.js"></script>
    <script src="js/sketch.js"></script>

</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <%--<canvas id="mycanvas"></canvas>--%>

        <div class="tools">
            <a href="#tools_sketch" data-download="png" style="float: right; width: 100px;">Download</a>

      <a href="#tools_sketch" data-tool="marker">Marker</a>
      <a href="#tools_sketch" data-tool="eraser">Eraser</a>
        </div>
        <canvas id="tools_sketch" width="800" height="300" style="background: url(http://farm1.static.flickr.com/91/239595759_3c3626b24a_b.jpg) no-repeat center center;"></canvas>
        <script type="text/javascript">
            $(function () {
                $('#tools_sketch').sketch({ defaultColor: "#ff0" });
            });
        </script>



    </div>
    </form>
</body>
</html>
