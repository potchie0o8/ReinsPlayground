using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AjaxControlToolkit;

public partial class ajax : System.Web.UI.Page
{


    protected void Page_Load(object sender, EventArgs e)
    {
        SetPieChart();

        
    }

    private void SetPieChart()
    {

        PieChartValue val1 = new PieChartValue();
        val1.Category = "Watching Other Men";
        val1.Data = 50;
        val1.PieChartValueColor="#6C1E83";
        val1.PieChartValueStrokeColor="black";

        PieChartValue val2 = new PieChartValue();
        val2.Category = "Reading Cosmopolitan";
        val2.Data = 25;
        val2.PieChartValueColor="#D08AD9";
        val2.PieChartValueStrokeColor="black";


        PieChartValue val3 = new PieChartValue();
        val3.Category = "Watching Girly Talk Shows";
        val3.Data = 25;
        val3.PieChartValueColor = "#000000";
        val3.PieChartValueStrokeColor = "black";


        PieChartValue [] values = {
                               val1, val2, val3
                           };

        //pieChart1.PieChartValues.Add(val1);
        //pieChart1.PieChartValues.Add(val2);
        //pieChart1.PieChartValues.Add(val3);

        pieChart1.PieChartValues.AddRange(values);


        pieChart1.ChartTitle = "How Brian Spends His Time";

        pieChart1.DataBind();

        


    }




    public void FileIsUploaded()
    {
        Response.Write("<script>alert('File is uploaded successfully');</script>");
    }
    public void FileIsNotUploaded()
    {
        Response.Write("<script>alert('File is not uploaded successfully');</script>");
    }

    protected void btnSimulateLoading_Click(object sender, EventArgs e)
    {
        InvokeLoading();
    }
    protected void btnInvoke_Click(object sender, EventArgs e)
    {
        InvokeLoading();
    }

    private void InvokeLoading()
    {
        int Counter = 0;
        do
        {
            System.Threading.Thread.Sleep(1000);
            Counter++;

        } while (Counter <= 10);
    }

}