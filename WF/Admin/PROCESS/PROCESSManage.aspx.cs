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
public partial class WF_PROCESS_TPLManage:BaseAdminPage
{

    WF_PROCESS_TPL valObj = new WF_PROCESS_TPL();
    WF_PROCESS_TPL condObj = new WF_PROCESS_TPL();
    List<WF_PROCESS_TPL> listObj = new List<WF_PROCESS_TPL>();
    protected string title = "";
    protected int wfid = 0;
    private void BindList(WF_PROCESS_TPL condObj)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WF_PROCESS_TPL.Attribute.PROCID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        condObj.WFID = wfid;

        listObj = BLLTable<WF_PROCESS_TPL>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        

        title = valObj._ZhName + "����";
        Page.Title = title;
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

            BindList(condObj);            

        }
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