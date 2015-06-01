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
public partial class HR_STATION_LEVELSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_LEVELSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_STATION_LEVELSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_STATION_LEVEL valObj = new HR_STATION_LEVEL();
    HR_STATION_LEVEL condObj = new HR_STATION_LEVEL();
    List<HR_STATION_LEVEL> listObj = new List<HR_STATION_LEVEL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
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
                listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_STATION_LEVEL>(hidCondition.Value);
            }
            listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_STATION_LEVEL();

            
            
            if(txtLEVEL_ID.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.LEVEL_ID, Convert.ToDecimal(txtLEVEL_ID.Value));
            
            
            if(txtLEVEL_NAME.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.LEVEL_NAME, Convert.ToString(txtLEVEL_NAME.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(HR_STATION_LEVEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_STATION_LEVEL valObj = BLLTable<HR_STATION_LEVEL>.GetRowData(HR_STATION_LEVEL.Attribute.LEVEL_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_LEVELSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
