using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;

public partial class DEPT_MoveTo : AgileFrame.AppInOne.Common.BasePage
{
    string keyid = "";
    protected string title = LanguageService.GetLanguageString("SystemMenuEdit", "����ת��");
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                HR_DEPT valObj = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, keyid);
                if (valObj == null)
                {
                    this.btnOK.Enabled = false;
                }
                else
                {
                    txtDeptName.Value = valObj.DEPT_NAME;
                    
                    wucSelDept1.DEPT_ID = valObj.P_DEPT_ID; 
                    //wucSelDept1.Enabled = false;
                }
            }
           
        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        #region//���ñ�������
        string gotoUrl = "../../OK.aspx?p=0";
        int re = 0;
        string msg ="������¼";
        HR_DEPT valObj = new HR_DEPT();
        #endregion

        valObj.DEPT_NAME = txtDeptName.Value;
        
        //���ṹ����
        if (keyid !="")
        {
            valObj.P_DEPT_ID = wucSelDept1.DEPT_ID;
            valObj.DEPT_ID = keyid;
            re = DeptHelper.EditDept(valObj);// BLLTable<HR_DEPT>.Factory(conn).Update(valObj, HR_DEPT.Attribute.DEPT_ID);
        }

        #region//ִ�н������
        if (re > 0)
        {

            if (Request["tree"] != null)
            {
                StringBuilder sb = new StringBuilder("");
                if (Request["toEdit"] == null)
                {

                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes(true);location.href='" + gotoUrl + "';", false);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.reShowSubNodes(true);location.href='" + gotoUrl + "';", false);
                }
            }
            else
            {
                ScriptHelper.AlertAndGo(Page, msg + "�ɹ���", gotoUrl);
            }
        }
        else
        {
            ScriptHelper.AlertAndGo(Page, msg + "ʧ�ܣ�", gotoUrl);
        }
        #endregion
    }
}

