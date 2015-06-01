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
public partial class HR_SchClassSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_SchClassSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_SchClassSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_SchClass valObj = new HR_SchClass();
    HR_SchClass condObj = new HR_SchClass();
    List<HR_SchClass> listObj = new List<HR_SchClass>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP1);
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP2);
        //hideTableColumnList.Add(HR_SchClass.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP1);
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP2);
        //hideFindColumnList.Add(HR_SchClass.Attribute.EXP3);
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
                listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_SchClass>(hidCondition.Value);
            }
            listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_SchClass();

            
            
            if(txtSchClassid.Value !="" )
                condObj.Like(HR_SchClass.Attribute.SchClassid, Convert.ToInt32(txtSchClassid.Value));
            
            
            if(txtSchName.Value !="" )
                condObj.Like(HR_SchClass.Attribute.SchName, Convert.ToString(txtSchName.Value));
            
            
            if(txtStartHour.Value !="" )
                condObj.Like(HR_SchClass.Attribute.StartHour, Convert.ToInt32(txtStartHour.Value));
            
            
            if(txtStartMin.Value !="" )
                condObj.Like(HR_SchClass.Attribute.StartMin, Convert.ToInt32(txtStartMin.Value));
            
            
            if(txtEndHour.Value !="" )
                condObj.Like(HR_SchClass.Attribute.EndHour, Convert.ToInt32(txtEndHour.Value));
            
            
            if(txtEndMin.Value !="" )
                condObj.Like(HR_SchClass.Attribute.EndMin, Convert.ToInt32(txtEndMin.Value));
            
            
            if(txtLateMinutes.Value !="" )
                condObj.Like(HR_SchClass.Attribute.LateMinutes, Convert.ToInt32(txtLateMinutes.Value));
            
            
            if(txtEarlyMinutes.Value !="" )
                condObj.Like(HR_SchClass.Attribute.EarlyMinutes, Convert.ToInt32(txtEarlyMinutes.Value));
            
            
            if(txtCheckIn.Value !="" )
                condObj.CheckIn = Convert.ToBoolean(txtCheckIn.Checked);
            
            
            if(txtCheckOut.Value !="" )
                condObj.CheckOut = Convert.ToBoolean(txtCheckOut.Checked);
            
            
            if(txtCheckInHour1.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckInHour1, Convert.ToInt32(txtCheckInHour1.Value));
            
            
            if(txtCheckInMin1.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckInMin1, Convert.ToInt32(txtCheckInMin1.Value));
            
            
            if(txtCheckInHour2.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckInHour2, Convert.ToInt32(txtCheckInHour2.Value));
            
            
            if(txtCheckInMin2.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckInMin2, Convert.ToInt32(txtCheckInMin2.Value));
            
            
            if(txtCheckOutHour1.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckOutHour1, Convert.ToInt32(txtCheckOutHour1.Value));
            
            
            if(txtCheckOutMin1.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckOutMin1, Convert.ToInt32(txtCheckOutMin1.Value));
            
            
            if(txtCheckOutHour2.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckOutHour2, Convert.ToInt32(txtCheckOutHour2.Value));
            
            
            if(txtCheckOutMin2.Value !="" )
                condObj.Like(HR_SchClass.Attribute.CheckOutMin2, Convert.ToInt32(txtCheckOutMin2.Value));
            
            
            if(txtColor.Value !="" )
                condObj.Like(HR_SchClass.Attribute.Color, Convert.ToInt32(txtColor.Value));
            
            
            if(txtIsOvertime.Value !="" )
                condObj.IsOverTime = Convert.ToBoolean(txtIsOvertime.Checked);

            listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_SchClass valObj = BLLTable<HR_SchClass>.Factory(conn).GetRowData(HR_SchClass.Attribute.SchClassid, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_SchClassSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_SchClass>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
