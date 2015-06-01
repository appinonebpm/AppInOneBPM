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

public partial class SYS_TEMPUSERSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_TEMPUSERSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_TEMPUSERSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    SYS_TEMPUSER valObj = new SYS_TEMPUSER();
    SYS_TEMPUSER condObj = new SYS_TEMPUSER();
    List<SYS_TEMPUSER> listObj = new List<SYS_TEMPUSER>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
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
                listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_TEMPUSER>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_TEMPUSER();

            
            
            if(txtID.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtCONAME.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.CONAME, Convert.ToString(txtCONAME.Value));
            
            
            if(txtPHONE.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
            
            
            if(txtIP.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.IP, Convert.ToString(txtIP.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtLOGINNAME.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.LOGINNAME, Convert.ToString(txtLOGINNAME.Value));
            
            
            if(txtPWD.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.PWD, Convert.ToString(txtPWD.Value));
            
            
            if(txtUSER_ID.Value !="" )
                condObj.Like(SYS_TEMPUSER.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));

            listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_TEMPUSER valObj = BLLTable<SYS_TEMPUSER>.GetRowData(SYS_TEMPUSER.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_TEMPUSERSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
