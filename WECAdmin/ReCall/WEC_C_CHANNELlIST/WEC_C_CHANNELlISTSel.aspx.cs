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

public partial class WEC_C_CHANNELlISTSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_C_CHANNELlISTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_C_CHANNELlISTSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_C_CHANNELlIST valObj = new WEC_C_CHANNELlIST();
    WEC_C_CHANNELlIST condObj = new WEC_C_CHANNELlIST();
    List<WEC_C_CHANNELlIST> listObj = new List<WEC_C_CHANNELlIST>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_C_CHANNELlIST.Attribute.EXP3);
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
                listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_C_CHANNELlIST>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_C_CHANNELlIST();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtURL.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.URL, Convert.ToString(txtURL.Value));
            
            
            if(txtREMARK.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.REMARK, Convert.ToString(txtREMARK.Value));
            
            
            if(txtCATEGORY_ID.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.CATEGORY_ID, Convert.ToInt32(txtCATEGORY_ID.Value));
            
            
            if(txtQRCODE.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.QRCODE, Convert.ToString(txtQRCODE.Value));
            
            
            if(txtNOTE.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
            
            
            if(txtADDRESS.Value !="" )
                condObj.Like(WEC_C_CHANNELlIST.Attribute.ADDRESS, Convert.ToString(txtADDRESS.Value));
            
            
            if(txtTYPE.Value !="" )
                condObj.TYPE = Convert.ToInt32(txtTYPE.Value);

            listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_C_CHANNELlIST valObj = BLLTable<WEC_C_CHANNELlIST>.GetRowData(WEC_C_CHANNELlIST.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_C_CHANNELlISTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_C_CHANNELlIST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
