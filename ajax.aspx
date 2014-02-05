<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ajax.aspx.cs" Inherits="ajax" %>

<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reins' AJAX Control Toolkit and JQuery Samples</title>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
    </script>
    <script>
        $(document).ready(function ()
        {

            $("jcode").click(function ()
            {
                $(this).hide();
            });

            $("button").click(function () {
                $("jcode2").animate({ left: '250px' });
            });

        });
    </script>


</head>
<body>
    <form id="form1" runat="server">
    <asp:ToolkitScriptManager runat="Server" />
    <div>
        <h1>Reins' AJAX Control Toolkit Samples</h1>
        <hr>
        <h5>Masked Date Picker</h5>
        <asp:TextBox ID="TextBox1" runat="server" Placeholder="-Click to pick date.-"></asp:TextBox>
        <asp:CalendarExtender ID="CalendarExtender1" runat="server" TargetControlID="TextBox1">
        </asp:CalendarExtender>
        <asp:MaskedEditExtender Mask="99/99/9999" TargetControlID="TextBox1" MaskType="Date" ID="MaskedEditExtender1" runat="server">
        </asp:MaskedEditExtender>
        <hr>
        <h5>Modal Popup Extender</h5>
        <asp:Button ID="btnShowPopup" runat="server" Text="Show Popup" />
        <asp:ModalPopupExtender TargetControlID="btnShowPopup" CancelControlID="lnkbtnOk" DropShadow="true" PopupControlID="Panel1" ID="ModalPopupExtender1" runat="server"></asp:ModalPopupExtender>


        <asp:Panel ID="Panel1" runat="server">
            <h1>Hey, this is a modal popup!</h1>
            <img src="images/derp.jpg" />
            <asp:LinkButton ID="lnkbtnok" runat="server">Ok</asp:LinkButton>
        </asp:Panel>

        <hr>
        <h5>HTML Editor</h5>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Columns="50" Rows="10"  ></asp:TextBox>
        <asp:HtmlEditorExtender ID="HtmlEditorExtender1" 
            TargetControlID="TextBox2" DisplaySourceTab="true" 
            runat="server"/>
            <Toolbar> 
                <asp:Undo />
                <asp:Redo />
                <asp:Bold />
                <asp:Italic />
                <asp:Underline />
                <asp:StrikeThrough />
                <asp:Subscript />
                <asp:Superscript />
                <asp:JustifyLeft />
                <asp:JustifyCenter />
                <asp:JustifyRight />
                <asp:JustifyFull />
                <asp:InsertOrderedList />
                <asp:InsertUnorderedList />
                <asp:CreateLink />
                <asp:UnLink />
                <asp:RemoveFormat />
                <asp:SelectAll />
                <asp:UnSelect />
                <asp:Delete />
                <asp:Cut />
                <asp:Copy />
                <asp:Paste />
                <asp:BackgroundColorSelector />
                <asp:ForeColorSelector />
                <asp:FontNameSelector />
                <asp:FontSizeSelector />
                <asp:Indent />
                <asp:Outdent />
                <asp:InsertHorizontalRule />
                <asp:HorizontalSeparator />
                <asp:InsertImage />
            </Toolbar>
        </asp:HtmlEditorExtender>

        <hr>
        <h5>BalloonPopupExtender</h5>

        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <asp:BalloonPopupExtender BalloonPopupControlID="Panel2" ID="BalloonPopupExtender1" TargetControlID="TextBox3" BalloonStyle="Cloud" BalloonSize="Medium" UseShadow="true" ScrollBars="Auto" DisplayOnMouseOver="true" DisplayOnFocus="true" DisplayOnClick="true" runat="server"></asp:BalloonPopupExtender>
        <asp:Panel ID="Panel2" runat="server">
            <h1>BOOM!</h1>
        </asp:Panel>
        <hr>
       <%-- <h5>JQuery Hide</h5>
        <p>Are you?</p>

        Yes
        <jcode>No</jcode>

        <hr>
        <h5>JQuery Animate</h5>

        <button>Start Animation</button>

        <jcode2>
        <div style="background:#98bf21;height:100px;width:100px;position:absolute;">
        </div>
        </jcode2>
        <br>--%>
        <hr>
        <h5>Bubble Chart</h5>

        <asp:BubbleChart ID="BubbleChart1" runat="server" 
            ChartHeight="300" ChartWidth="450" 
            ChartTitle="Industry share in Market" 
            ChartTitleColor="#0E426C" XAxisLineColor="#D08AD9" 
            YAxisLineColor="#D08AD9" BaseLineColor="#A156AB" 
            YAxisLines="6" XAxisLines="6" BubbleSizes="5"
            XAxisLabel="Market share of Industry" 
            YAxisLabel="Revenue of Industry" BubbleLabel=" (Growth in %)">
            <BubbleChartValues>
                <asp:BubbleChartValue Category="Software" 
                X="25" Y="90000" Data="7" BubbleColor="#6C1E83" />
                <asp:BubbleChartValue Category="Foods" 
                X="35" Y="150000" Data="5" BubbleColor="#D08AD9" />
                <asp:BubbleChartValue Category="Health" 
                X="32" Y="140000" Data="6" BubbleColor="#990033" />
                <asp:BubbleChartValue Category="Manufacuring" 
                X="22" Y="84000" Data="4" BubbleColor="#6586A7" />
                <asp:BubbleChartValue Category="Travel" 
                X="8" Y="26000" Data="7" BubbleColor="#0E426C" />
                <asp:BubbleChartValue Category="Entertainment" 
                X="28" Y="97000" Data="9" BubbleColor="#A156AB" />
                <asp:BubbleChartValue Category="Construction" 
                X="15" Y="58000" Data="5" BubbleColor="#A156AB" />
            </BubbleChartValues>
        </asp:BubbleChart>

        <hr>
        <h5>Line Chart</h5>


        <asp:LineChart ID="LineChart1" runat="server" 
            ChartWidth="450" ChartHeight="300" ChartType="Basic" 
            ChartTitle="Cy VS Brian VS Reins in Gayness" 
            CategoriesAxis="2007,2008,2009,2010,2011,2012" 
            ChartTitleColor="#0E426C" CategoryAxisLineColor="#D08AD9" 
            ValueAxisLineColor="#D08AD9" BaseLineColor="#A156AB">
            <Series>
                <asp:LineChartSeries Name="Reins" 
                LineColor="#6C1E83" Data="0, 0, 0, 0, 0, 0" />
                <asp:LineChartSeries Name="Brian"  
                LineColor="#D08AD9" Data="200, 250, 300, 350, 400, 540" />
                <asp:LineChartSeries Name="Cy"  
                LineColor="#000000" Data="630, 630, 630, 630, 630, 630" />
            </Series>
        </asp:LineChart>

        <hr>
        <h5>Pie Chart</h5>


        <asp:PieChart ID="pieChart1" runat="server" ChartHeight="300" 
        ChartWidth="450"
        ChartTitleColor="#0E426C"> 
        </asp:PieChart >
        
        <hr>
        <h5>Preloader</h5>

         <asp:UpdateProgress ID="updProgress" AssociatedUpdatePanelID="UpdatePanel1" runat="server">
            <ProgressTemplate>
                Loading. Please wait...<img src="images/ajax-loader.gif" />
            </ProgressTemplate>
          </asp:UpdateProgress>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnSimulateLoading" runat="server" Text="Simulate Loading" onclick="btnSimulateLoading_Click" />
                <%--<asp:ModalPopupExtender ID="ModalPopupExtender2" PopupControlID="Panel3" TargetControlID="btnSimulateLoading" runat="server">
                </asp:ModalPopupExtender>    
                <asp:Panel ID="Panel3" runat="server">
                    Loading. Please wait...<img src="images/ajax-loader.gif" />
                </asp:Panel>--%>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <hr>
        <h5>Button is disabled on loading</h5>

        <asp:Button ID="btnInvoke" runat="server" Text="Invoke Loading" onclick="btnInvoke_Click" OnClientClick="this.disabled = true; this.value = 'Loading...';" UseSubmitBehavior="false" />
        <%--<asp:Button ID="btnInvoke" runat="server" Text="Invoke Loading" onclick="btnInvoke_Click" OnClientClick="if(Page_ClientValidate()){ this.disabled = true; this.value = 'Loading...';}" UseSubmitBehavior="false" />--%>
         
        <hr>
        <h5>ModalPopup inside UpdatePanel</h5>    
       
        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
            <ContentTemplate>
                <asp:Button ID="btnShowPopup2" runat="server" Text="Show Popup" />
                <asp:ModalPopupExtender TargetControlID="btnShowPopup2" CancelControlID="lnkbtnOk2" DropShadow="true" PopupControlID="Panel4" ID="ModalPopupExtender3" runat="server"></asp:ModalPopupExtender>
      
                <asp:Panel ID="Panel4" runat="server">      
                    <h1>Hey, this is a modal popup inside an update panel!</h1>
                    <img src="images/derp.jpg" />
                    <asp:Button ID="btnInvoke2" runat="server" Text="Invoke Loading" onclick="btnInvoke_Click" OnClientClick="this.disabled = true; this.value = 'Loading...';" UseSubmitBehavior="false" />
                    <asp:LinkButton ID="lnkbtnok2" runat="server">Ok</asp:LinkButton>
                </asp:Panel>

            </ContentTemplate>
        </asp:UpdatePanel>

    </div>
    </form>



</body>
</html>
