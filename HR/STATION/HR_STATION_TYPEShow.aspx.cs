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

public partial class HR_STATION_TYPEShow : System.Web.UI.Page
{
    HR_STATION_TYPE valObj=new HR_STATION_TYPE();
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "��ϸ";
        Page.Title = title;
        if (!IsPostBack)
        {
            try
            {
                if (!string.IsNullOrEmpty(Request["TYPE_ID"]))
                {

                    valObj = BLLTable<HR_STATION_TYPE>.GetRowData(HR_STATION_TYPE.Attribute.TYPE_ID, Request["TYPE_ID"]);
                    if(valObj==null) return ;
                    
                    
                    txtTYPE_ID.Text = Convert.ToString(valObj.TYPE_ID);//Convert.ToDecimal
                    
                    
                    txtTYPE_NAME.Text = Convert.ToString(valObj.TYPE_NAME);//Convert.ToString
                    
                    
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
