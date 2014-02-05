using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using System.IO;

public partial class ToPortrait : System.Web.UI.Page
{

    string dateStampNoID = DateTime.Now.Month.ToString() + DateTime.Now.Day.ToString() + DateTime.Now.Year.ToString() + DateTime.Now.Hour.ToString() + DateTime.Now.Minute.ToString() + DateTime.Now.Second.ToString();

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //gets dimensions

        int SetWidth = int.Parse(txtWidth.Text), SetHeight = int.Parse(txtHeight.Text);


        string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToUpper();
        
        System.Drawing.Image imgByte = System.Drawing.Image.FromStream(FileUpload1.PostedFile.InputStream);
        int W = int.Parse(imgByte.PhysicalDimension.Width.ToString());
        int H = int.Parse(imgByte.PhysicalDimension.Height.ToString());
        
        //first checks if the photo is landscape

        if (W > H)
        {

            //save paths defined here
            string tempStorageFile = Server.MapPath(@"~/portraits/raw_72DPI/" + dateStampNoID + fileExtension);
            string ConvertedSizeFile = Server.MapPath(@"~/portraits/ConvertedSize/" + dateStampNoID + fileExtension);
            string FinalFile = Server.MapPath(@"~/portraits/FinalOut/" + dateStampNoID + fileExtension);

            //makes sure na 72 DPI muna yung pic, then saves a temporary file on the portraits/raw_72DPI folder. 
            Bitmap temp = new Bitmap(FileUpload1.FileContent);
            temp.SetResolution(72, 72);
            temp.Save(tempStorageFile);
            temp.Dispose();

            //computes the new height to resize the image according to width set by user
            double newHTD = (SetWidth * H) / W;
            //then, Parses the double to int to remove decimals
            int newH = int.Parse(newHTD.ToString());
            
            //now, we resize the landscape image.... and saces to ConvertedSize Folder
            convertpic(SetWidth, newH, W, H, tempStorageFile, ConvertedSizeFile);

            //Then, We impose on a white background based on the portrait dimensions specified by the user
            ImposeToPortrait(ConvertedSizeFile, FinalFile, SetWidth, SetHeight);


            //displays file
            Response.Write("Image done processing. Check portraits/FinalOut/ folder for file.");
        }
        else
        {
            Response.Write("Image is already portrait!");
        }

    }

    private void convertpic(int _targetWidth, int _targetHeight, int _origWidth, int _origHeight, string _sourcepath, string _targetpath)
    {
        //Load the Image from the location
        System.Drawing.Image image = Bitmap.FromFile(_sourcepath);
        int imageH = (image.Height / 2) - (_targetHeight / 2);
        int imageW = (image.Width / 2) - (_targetWidth / 2);
        int imageH1 = (image.Height / 2);
        int imageW1 = (image.Width / 2);
        int oWidth = _targetWidth;
        int oHeight = _targetHeight;

        //Get the Cordinates
        int x1 = Convert.ToInt32(imageW1);
        int y1 = Convert.ToInt32(imageH1);
        int x = Convert.ToInt32(imageW);
        int y = Convert.ToInt32(imageH);
        int w = Convert.ToInt32(oWidth);
        int h = Convert.ToInt32(oHeight);

        //Create a new image from the specified location to specified height and width
        Bitmap bmp = new Bitmap(w, h, image.PixelFormat);
        bmp.SetResolution(72, 72);
        Graphics g = Graphics.FromImage(bmp);
        g.DrawImage(image, new Rectangle(0, 0, w, h),
            new Rectangle(0, 0, _origWidth, _origHeight), GraphicsUnit.Pixel);

        //Save the file and reload to the control
        bmp.Save(_targetpath, image.RawFormat);

        int Counter = 0;
        do
        {
            System.Threading.Thread.Sleep(1000);
            Counter++;

        } while (Counter <= 10);

        image.Dispose();
        g.Dispose();
        bmp.Dispose();
    }

    private void ImposeToPortrait(string _sourcepath, string _targetpath, int _setWidth, int _setHeight)
    {

        //Load the Image from the location
        System.Drawing.Image image = Bitmap.FromFile(_sourcepath);

        int imageH = image.Height;
        int startPosition;

        //gets center point to compute for start position
        double height_dividedbythreeD = _setHeight / 3;
        //converts the result to int, to remove decimals
        int height_dividedbythree = int.Parse(height_dividedbythreeD.ToString());



        if (imageH > height_dividedbythree)
        {
            startPosition = (height_dividedbythree) - ((imageH - height_dividedbythree) / 2);
        }
        else if (imageH < height_dividedbythree)
        {
            startPosition = ((height_dividedbythree - imageH) / 2) + (height_dividedbythree);
        }
        else
        {
            startPosition = height_dividedbythree;
        }



        //Create a new image from the specified location to specified height and width
        Bitmap bmp = new Bitmap(_setWidth, _setHeight, image.PixelFormat);
        bmp.SetResolution(72, 72);
        //bmp.Palette.Entries[1] = Color.White;
        Graphics g = Graphics.FromImage(bmp);
        g.Clear(Color.White);
        g.DrawImage(image, new Rectangle(0, startPosition, _setWidth, imageH),
            new Rectangle(0, 0, _setWidth, imageH), GraphicsUnit.Pixel);

        //Save the file and reload to the control
        bmp.Save(_targetpath, image.RawFormat);

        int Counter = 0;
        do
        {
            System.Threading.Thread.Sleep(1000);
            Counter++;

        } while (Counter <= 10);

        image.Dispose();
        g.Dispose();
        bmp.Dispose();
    }

    
}