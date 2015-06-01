using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
public partial class WF_CHECKER_TPLManage:BaseAdminPage
{

    WF_CHECKER_TPL valObj = new WF_CHECKER_TPL();
    WF_CHECKER_TPL condObj = new WF_CHECKER_TPL();
    List<WF_CHECKER_TPL> listObj = new List<WF_CHECKER_TPL>();
    protected int stepid = 0;
    protected int wfid=0;
    protected string title = "";
    private void BindList(WF_CHECKER_TPL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WF_CHECKER_TPL.Attribute.CHECKER_ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WF_CHECKER_TPL>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "����";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["STEP_ID"]))
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��


            #endregion
            #region//���ݳ�ʼ��

 
            #endregion
            condObj.STEP_ID = stepid;
            BindList(condObj);            

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        condObj.STEP_ID = stepid;
        BindList(condObj);   
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}