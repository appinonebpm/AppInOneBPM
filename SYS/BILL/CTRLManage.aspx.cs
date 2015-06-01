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
public partial class SYS_BILL_CTRLManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_CTRLManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("SYS_BILL_CTRLManage.aspx", path);
    }
    protected string pid="0";

    SYS_BILL_CTRL valObj = new SYS_BILL_CTRL();
    SYS_BILL_CTRL condObj = new SYS_BILL_CTRL();
    List<SYS_BILL_CTRL> listObj = new List<SYS_BILL_CTRL>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(SYS_BILL_CTRL condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_BILL_CTRL.Attribute.CTRL_ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_BILL_CTRL.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_BILL_CTRL.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_BILL_CTRL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_BILL_CTRL.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_BILL_CTRL.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_BILL_CTRL.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "����";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//���ݳ�ʼ��
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL_CTRL>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_BILL_CTRL();

        
        
        if(txtCTRL_ID.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.CTRL_ID, Convert.ToInt32(txtCTRL_ID.Value));
        
        
        if(txtCTRL_NAME.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.CTRL_NAME, Convert.ToString(txtCTRL_NAME.Value));
        
        
        if(txtCTRL_CODE.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.CTRL_CODE, Convert.ToString(txtCTRL_CODE.Value));
        
        
        if(txtP_CTRL_ID.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.P_CTRL_ID, Convert.ToString(txtP_CTRL_ID.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtEL_HTML.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.EL_HTML, Convert.ToString(txtEL_HTML.Value));
        
        
        if(txtJS_CODE.Value !="" )
            condObj.Like(SYS_BILL_CTRL.Attribute.JS_CODE, Convert.ToString(txtJS_CODE.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_BILL_CTRL>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
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