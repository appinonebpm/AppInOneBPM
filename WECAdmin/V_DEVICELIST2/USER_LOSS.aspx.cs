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
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class USER_LOSS : AgileFrame.AppInOne.Common.BaseAdminPage
{
    APP_DEVICELIST valObj =new APP_DEVICELIST();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //if (hidFORM_ID.Value.Trim() == "")
        //{
        //    litWarn.Text = "��ѡ���Ӧ�ı�"; //AgileFrame.Core.ScriptHelper.Alert(Page, "��ѡ���Ӧ�ı���");
        //    return;
        //}
        //else {
        //    TF_F_COLUMN ccc = new TF_F_COLUMN();
        //    ccc.FORM_ID = int.Parse(hidFORM_ID.Value);
        //    if (BLLTable<TF_F_COLUMN>.Count(ccc) <= 0)
        //    {
        //        litWarn.Text = "��ѡ��ı���δ������Ŀ�ֶΣ�����������Ŀ��"; //AgileFrame.Core.ScriptHelper.Alert(Page, "��ѡ���Ӧ�ı���");
        //        return;
        //    }
        //}
        try
        {
            APP_DEVICELIST valObj = new APP_DEVICELIST();
            valObj.STATUS = 1;
            APP_DEVICELIST conObj = new APP_DEVICELIST();
            conObj.USER_ID = Convert.ToInt32(txtSTAFFID.Value);
            BLLTable<APP_DEVICELIST>.Update(valObj, conObj);
            
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}
