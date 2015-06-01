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
public partial class HR_CHECKINOUTSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKINOUTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_CHECKINOUTSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_CHECKINOUT valObj = new HR_CHECKINOUT();
    HR_CHECKINOUT condObj = new HR_CHECKINOUT();
    List<HR_CHECKINOUT> listObj = new List<HR_CHECKINOUT>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CHECKINOUT.Attribute.EXP3);
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
                listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CHECKINOUT>(hidCondition.Value);
            }
            listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_CHECKINOUT();

            
            
            if(txtUSERID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
            
            
            if(txtCHECKTIME.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.CHECKTIME, Convert.ToDateTime(txtCHECKTIME.Value));
            
            
            if(txtSTAFF_ID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
            
            
            if(txtCHECKTYPE.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.CHECKTYPE, Convert.ToString(txtCHECKTYPE.Value));
            
            
            if(txtVERIFYCODE.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.VERIFYCODE, Convert.ToInt32(txtVERIFYCODE.Value));
            
            
            if(txtSENSORID.Value !="" )
                condObj.Like(HR_CHECKINOUT.Attribute.SENSORID, Convert.ToString(txtSENSORID.Value));

            listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_CHECKINOUT valObj = BLLTable<HR_CHECKINOUT>.Factory(conn).GetRowData(HR_CHECKINOUT.Attribute.CHECKTIME, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_CHECKINOUTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_CHECKINOUT>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
