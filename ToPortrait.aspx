<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ToPortrait.aspx.cs" Inherits="ToPortrait" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:FileUpload ID="FileUpload1" runat="server" />
        <br />
        <br />
        Enter Dimensions for Portrait in px (eg. 184 x 248) :<br />
        <br />
        W: 
        <asp:TextBox ID="txtWidth" runat="server"></asp:TextBox>
        H:
        <asp:TextBox ID="txtHeight" runat="server"></asp:TextBox>
        <br />
        <br />
       <%--Output Image:<br />--%>
        <br />
        <%--<asp:Image ID="Image1" runat="server" BorderStyle="Dotted" />--%>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    </div>
    </form>
</body>
</html>
