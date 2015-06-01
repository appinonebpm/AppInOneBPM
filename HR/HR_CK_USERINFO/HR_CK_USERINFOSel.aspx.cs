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
public partial class HR_CK_USERINFOSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("HR_CK_USERINFOSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("HR_CK_USERINFOSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    HR_CK_USERINFO valObj = new HR_CK_USERINFO();
    HR_CK_USERINFO condObj = new HR_CK_USERINFO();
    List<HR_CK_USERINFO> listObj = new List<HR_CK_USERINFO>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideTableColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP1);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP2);
        //hideFindColumnList.Add(HR_CK_USERINFO.Attribute.EXP3);
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
                listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_CK_USERINFO>(hidCondition.Value);
            }
            listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new HR_CK_USERINFO();

            
            
            if(txtUSERID.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.USERID, Convert.ToInt32(txtUSERID.Value));
            
            
            if(txtSTAFF_ID.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.STAFF_ID, Convert.ToDecimal(txtSTAFF_ID.Value));
            
            
            if(txtBADGENUMBER.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.BADGENUMBER, Convert.ToString(txtBADGENUMBER.Value));
            
            
            if(txtSSN.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.SSN, Convert.ToString(txtSSN.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtGENDER.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.GENDER, Convert.ToString(txtGENDER.Value));
            
            
            if(txtTITLE.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
            
            
            if(txtPAGER.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.PAGER, Convert.ToString(txtPAGER.Value));
            
            
            if(txtBIRTHDAY.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.BIRTHDAY, Convert.ToDateTime(txtBIRTHDAY.Value));
            
            
            if(txtHIREDDAY.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.HIREDDAY, Convert.ToDateTime(txtHIREDDAY.Value));
            
            
            if(txtSTREET.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.STREET, Convert.ToString(txtSTREET.Value));
            
            
            if(txtCITY.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.CITY, Convert.ToString(txtCITY.Value));
            
            
            if(txtSTATE.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.STATE, Convert.ToString(txtSTATE.Value));
            
            
            if(txtZIP.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.ZIP, Convert.ToString(txtZIP.Value));
            
            
            if(txtOPHONE.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.OPHONE, Convert.ToString(txtOPHONE.Value));
            
            
            if(txtFPHONE.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.FPHONE, Convert.ToString(txtFPHONE.Value));
            
            
            if(txtVERIFICATIONMETHOD.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD, Convert.ToInt16(txtVERIFICATIONMETHOD.Value));
            
            
            if(txtDEFAULTDEPTID.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.DEFAULTDEPTID, Convert.ToInt16(txtDEFAULTDEPTID.Value));
            
            
            if(txtSECURITYFLAGS.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.SECURITYFLAGS, Convert.ToInt16(txtSECURITYFLAGS.Value));
            
            
            if(txtATT.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.ATT, Convert.ToInt16(txtATT.Value));
            
            
            if(txtINLATE.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.INLATE, Convert.ToInt16(txtINLATE.Value));
            
            
            if(txtOUTEARLY.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.OUTEARLY, Convert.ToInt16(txtOUTEARLY.Value));
            
            
            if(txtOVERTIME.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.OVERTIME, Convert.ToInt16(txtOVERTIME.Value));
            
            
            if(txtSEP.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.SEP, Convert.ToInt16(txtSEP.Value));
            
            
            if(txtHOLIDAY.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.HOLIDAY, Convert.ToInt16(txtHOLIDAY.Value));
            
            
            if(txtMINZU.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.MINZU, Convert.ToString(txtMINZU.Value));
            
            
            if(txtPASSWORD.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.PASSWORD, Convert.ToString(txtPASSWORD.Value));
            
            
            if(txtLUNCHDURATION.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.LUNCHDURATION, Convert.ToInt16(txtLUNCHDURATION.Value));
            
            
            if(txtMVerifyPass.Value !="" )
                condObj.Like(HR_CK_USERINFO.Attribute.MVerifyPass, Convert.ToString(txtMVerifyPass.Value));
            

            listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //HR_CK_USERINFO valObj = BLLTable<HR_CK_USERINFO>.Factory(conn).GetRowData(HR_CK_USERINFO.Attribute.USERID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("HR_CK_USERINFOSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<HR_CK_USERINFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
