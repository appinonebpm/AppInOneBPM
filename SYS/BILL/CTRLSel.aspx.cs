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
public partial class SYS_BILL_CTRLSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_CTRLSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_BILL_CTRLSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    SYS_BILL_CTRL valObj = new SYS_BILL_CTRL();
    SYS_BILL_CTRL condObj = new SYS_BILL_CTRL();
    List<SYS_BILL_CTRL> listObj = new List<SYS_BILL_CTRL>();
    int recount = -1;
    protected string title = "";
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
        //�༶���ݱ�ҳ����õ�
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "ѡ��";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<SYS_BILL_CTRL>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
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

            listObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        #region//�༶���ݱ�ҳ����õ���ȡ��ע��
        //pid = Request[hidSelID.Name];
        //SYS_BILL_CTRL valObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).GetRowData(SYS_BILL_CTRL.Attribute.CTRL_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_BILL_CTRLSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_BILL_CTRL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
