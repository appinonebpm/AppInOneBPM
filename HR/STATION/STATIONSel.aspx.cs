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
public partial class HR_STATIONSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_STATIONSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_STATIONSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_STATION valObj = new HR_STATION();
    HR_STATION condObj = new HR_STATION();
    List<HR_STATION> listObj = new List<HR_STATION>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_STATION.Attribute.EXP1);
        //hideTableColumnList.Add(HR_STATION.Attribute.EXP2);
        //hideTableColumnList.Add(HR_STATION.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_STATION.Attribute.EXP1);
        //hideFindColumnList.Add(HR_STATION.Attribute.EXP2);
        //hideFindColumnList.Add(HR_STATION.Attribute.EXP3);
        #endregion
        //�༶���ݱ�ҳ����õ�
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title =  "��λ��Ϣѡ��";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<HR_STATION>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_STATION>(hidCondition.Value);
            }
            listObj = BLLTable<HR_STATION>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_STATION();

            
            
            if(txtSTATION_ID.Value !="" )
                condObj.Like(HR_STATION.Attribute.STATION_ID, Convert.ToDecimal(txtSTATION_ID.Value));
            
            
            if(txtSTATION_NAME.Value !="" )
                condObj.Like(HR_STATION.Attribute.STATION_NAME, Convert.ToString(txtSTATION_NAME.Value));
            
            
            if(txtPID.Value !="" )
                condObj.Like(HR_STATION.Attribute.PID, Convert.ToDecimal(txtPID.Value));
            
            
            if(txtPATH.Value !="" )
                condObj.Like(HR_STATION.Attribute.PATH, Convert.ToString(txtPATH.Value));
            
            
            if(txtSUB_NUM.Value !="" )
                condObj.Like(HR_STATION.Attribute.SUB_NUM, Convert.ToDecimal(txtSUB_NUM.Value));
            
            
            if(txtSORT_NO.Value !="" )
                condObj.Like(HR_STATION.Attribute.SORT_NO, Convert.ToDecimal(txtSORT_NO.Value));
            
            
            if(txtORG_ID.Value !="" )
                condObj.Like(HR_STATION.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
            
            
            if(txtDEPT_ID.Value !="" )
                condObj.Like(HR_STATION.Attribute.DEPT_ID, Convert.ToString(txtDEPT_ID.Value));

            listObj = BLLTable<HR_STATION>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_STATION valObj = BLLTable<HR_STATION>.Factory(conn).GetRowData(HR_STATION.Attribute.STATION_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_STATIONSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_STATION>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
