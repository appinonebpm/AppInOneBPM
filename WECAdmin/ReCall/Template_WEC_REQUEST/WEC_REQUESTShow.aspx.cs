using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WEC_REQUESTShow : System.Web.UI.Page
{
    private string Shower = @"
<!--Switch-->
                    <!--Case InputString-->
                    <asp:Label id='{�ֶοؼ���}' runat='server'></asp:Label>
                    <!--Case SmallText-->
                    <asp:Label id='{�ֶοؼ���}' runat='server'></asp:Label>
                    <!--Case Text-->
                    <asp:Label id='{�ֶοؼ���}' runat='server'></asp:Label>
                    <!--Case HTML-->
                    <asp:Label ID='{�ֶοؼ���}' runat='server'></asp:Label>
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <asp:Label id='{�ֶοؼ���}' runat='server'></asp:Label>
                    <!--Case Select_RelationUser--><!--Case Select_RelationFK-->
                      <asp:Label id='{�ֶοؼ���}'  runat='server'></asp:Label>
                     <a class='hide'><input name='{�ֶοؼ���}' type='hidden' /><input name='{�ֶοؼ���}_Name' type='text' /><input id='btnSelDept' class='sel' type='button' onclick='selDept(this);' value='' /></a>
                    <!--Case CheckBoxList--> 
                    <asp:Label id='{�ֶοؼ���}' runat='server' ></asp:Label>
                    <!--Case RadioBoxList--> 
                    <asp:Label id='{�ֶοؼ���}' runat='server' ></asp:Label>
                    <!--Case InputDateTime-->
                    <asp:Label id='{�ֶοؼ���}' runat='server' ></asp:Label>
                    <!--Case InputDate-->
                    <asp:Label id='{�ֶοؼ���}' runat='server' ></asp:Label>
                    <!--Case FileUpUpDoc-->
                    <uc1:UpFile ID='UpFile{����ĸ��д�ֶ���}' runat='server' />
                    <!--Case InputPassWord--> 
                    <asp:Label id='{�ֶοؼ���}' runat='server' ></asp:Label>
                <!--EndSwitch-->
";
    WEC_REQUEST valObj=new WEC_REQUEST();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "��ϸ";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["TID"]))
                {

                    valObj = BLLTable<WEC_REQUEST>.GetRowData(WEC_REQUEST.Attribute.TID, Request["TID"]);
                    if(valObj==null) return ;
                    
                    
                    txtTID.Text = Convert.ToString(valObj.TID);//Convert.ToDecimal
                    
                    
                    txtAID.Text = Convert.ToString(valObj.AID);//Convert.ToDecimal
                    
                    
                    txtKEYWORD.Text = Convert.ToString(valObj.KEYWORD);//Convert.ToString
                    
                    
                    txtMATCH_TYPE.Text=valObj.MATCH_TYPE.ToString();
                    
                    
                    txtMEMO.Text = Convert.ToString(valObj.MEMO);//Convert.ToString
                    
                    
                    txtKIND.Text=valObj.KIND.ToString();
                    
                    
                    txtSTATUS.Text=valObj.STATUS.ToString();
                    
                    
                    txtADDTIME.Text = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd HH:mm");

                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }

            if (Request["ajax"] != null)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.Charset = "utf-8";
                Response.ContentEncoding = System.Text.Encoding.GetEncoding("utf-8");//���������Ϊ��������
                //Response.ContentType = "html/text";

                this.EnableViewState = false;
                System.Globalization.CultureInfo myCItrad = new System.Globalization.CultureInfo("ZH-CN", true);
                System.IO.StringWriter oStringWriter = new System.IO.StringWriter(myCItrad);
                System.Web.UI.HtmlTextWriter oHtmlTextWriter = new System.Web.UI.HtmlTextWriter(oStringWriter);
                divC.RenderControl(oHtmlTextWriter);

                Response.Write(oStringWriter.ToString());
                Response.End();
            }
        }
    }

}
