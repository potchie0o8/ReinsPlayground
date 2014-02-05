using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class json : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        SampleObject Object1 = new SampleObject();
        Object1.Id = 1;
        Object1.Name = "Object1";
        Object1.Desc = "This is a sample object.";

        string json = new System.Web.Script.Serialization.JavaScriptSerializer().Serialize(Object1);

        Response.Write("<strong>Serialized Object:</strong> <br />" + json);

       
        

    }


    public class SampleObject
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Desc { get; set; }
    }



}