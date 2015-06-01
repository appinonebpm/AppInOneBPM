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

public partial class WEC_REQUEST_DETAILSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUEST_DETAILSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_REQUEST_DETAILSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_REQUEST_DETAIL valObj = new WEC_REQUEST_DETAIL();
    WEC_REQUEST_DETAIL condObj = new WEC_REQUEST_DETAIL();
    List<WEC_REQUEST_DETAIL> listObj = new List<WEC_REQUEST_DETAIL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
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
                listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_REQUEST_DETAIL>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_REQUEST_DETAIL();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtTID.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.TID, Convert.ToDecimal(txtTID.Value));
            
            
            if(txtTITLE.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
            
            
            if(txtSORT_ID.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.SORT_ID, Convert.ToDecimal(txtSORT_ID.Value));
            
            
            if(txtPICURL.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
            
            
            if(txtTYPE_ID.Value !="" )
                condObj.TYPE_ID = Convert.ToString(txtTYPE_ID.Value);
            
            
            if(txtTYPE_VALUE.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE, Convert.ToString(txtTYPE_VALUE.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_REQUEST_DETAIL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_REQUEST_DETAIL valObj = BLLTable<WEC_REQUEST_DETAIL>.GetRowData(WEC_REQUEST_DETAIL.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUEST_DETAILSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
