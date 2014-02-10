using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BCryptEncryption;

public partial class Encryption : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string salt = BCrypt.GenerateSalt(12);

        string hashedstring = BCrypt.HashPassword("12345", salt);

        Response.Write(hashedstring);

        //bool isGood = BCrypt.CheckPassword("12345", hashedstring);

        //if (isGood)
        //{
        //    Response.Write("Match!");
        //}
        //else
        //{
        //    Response.Write("Mismatch!");
        //}



    }
}