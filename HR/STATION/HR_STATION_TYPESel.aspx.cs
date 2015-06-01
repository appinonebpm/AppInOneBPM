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
public partial class HR_STATION_TYPESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_TYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_STATION_TYPESel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_STATION_TYPE valObj = new HR_STATION_TYPE();
    HR_STATION_TYPE condObj = new HR_STATION_TYPE();
    List<HR_STATION_TYPE> listObj = new List<HR_STATION_TYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_STATION_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(HR_STATION_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(HR_STATION_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_STATION_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(HR_STATION_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(HR_STATION_TYPE.Attribute.EXP3);
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
                listObj = BLLTable<HR_STATION_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_STATION_TYPE>(hidCondition.Value);
            }
            listObj = BLLTable<HR_STATION_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_STATION_TYPE();

            
            
            if(txtTYPE_ID.Value !="" )
                condObj.Like(HR_STATION_TYPE.Attribute.TYPE_ID, Convert.ToDecimal(txtTYPE_ID.Value));
            
            
            if(txtTYPE_NAME.Value !="" )
                condObj.Like(HR_STATION_TYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(HR_STATION_TYPE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<HR_STATION_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_STATION_TYPE valObj = BLLTable<HR_STATION_TYPE>.GetRowData(HR_STATION_TYPE.Attribute.TYPE_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_STATION_TYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_STATION_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
