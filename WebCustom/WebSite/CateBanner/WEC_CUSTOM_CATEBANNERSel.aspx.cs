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

public partial class WEC_CUSTOM_CATEBANNERSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_CATEBANNERSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CUSTOM_CATEBANNERSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_CUSTOM_CATEBANNER valObj = new WEC_CUSTOM_CATEBANNER();
    WEC_CUSTOM_CATEBANNER condObj = new WEC_CUSTOM_CATEBANNER();
    List<WEC_CUSTOM_CATEBANNER> listObj = new List<WEC_CUSTOM_CATEBANNER>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CUSTOM_CATEBANNER.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CUSTOM_CATEBANNER>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CUSTOM_CATEBANNER();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtPIC_URL.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
            
            
            if(txtOUT_URL.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.OUT_URL, Convert.ToString(txtOUT_URL.Value));
            
            
            if(txtSORT_ID.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.SORT_ID, Convert.ToInt32(txtSORT_ID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_CUSTOM_CATEBANNER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CUSTOM_CATEBANNER valObj = BLLTable<WEC_CUSTOM_CATEBANNER>.GetRowData(WEC_CUSTOM_CATEBANNER.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_CATEBANNERSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CUSTOM_CATEBANNER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
