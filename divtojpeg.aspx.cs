using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Text;
using System.Drawing.Imaging;

public partial class divtojpeg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string[] value = painter.Style.Value.Split(';');
        string hw = painter.InnerHtml;
        hw = hw.Replace("<br />", Environment.NewLine);

        string width = value[3];
        string height = value[4];
        string bgcolor = value[5];

        string[] widthArray = width.Split(':');
        string[] heightArray = height.Split(':');
        string[] bgcolorArray = bgcolor.Split(':');

        int w = int.Parse(widthArray[1].Replace("px", ""));
        int h = int.Parse(heightArray[1].Replace("px", ""));

        string color = bgcolorArray[1];


        System.Drawing.Color c = System.Drawing.Color.Cyan;//.FromName("#ccccff");

        System.Drawing.Bitmap bt = new System.Drawing.Bitmap(w, h);
        System.Drawing.Graphics oGraphics = System.Drawing.Graphics.FromImage(bt);
        System.Drawing.Brush brush = new System.Drawing.SolidBrush(c);
        oGraphics.FillRectangle(brush, 0, 0, w, h);
        oGraphics.DrawString(hw, new Font("Arial", 12, FontStyle.Italic), SystemBrushes.WindowText, new PointF(50, 50));
        bt.Save(Server.MapPath(@"~\images\sample.jpg"), System.Drawing.Imaging.ImageFormat.Jpeg);

    }
}