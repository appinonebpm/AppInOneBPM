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

public partial class WEC_CUSTOM_MODELSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_MODELSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CUSTOM_MODELSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_CUSTOM_MODEL valObj = new WEC_CUSTOM_MODEL();
    WEC_CUSTOM_MODEL condObj = new WEC_CUSTOM_MODEL();
    List<WEC_CUSTOM_MODEL> listObj = new List<WEC_CUSTOM_MODEL>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CUSTOM_MODEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CUSTOM_MODEL>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CUSTOM_MODEL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CUSTOM_MODEL();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtTYPE.Value !="" )
                condObj.TYPE = Convert.ToInt32(txtTYPE.Value);
            
            
            if(txtPIC_URL.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
            
            
            if(txtPATH.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL.Attribute.PATH, Convert.ToString(txtPATH.Value));
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtNAME.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL.Attribute.NAME, Convert.ToString(txtNAME.Value));

            listObj = BLLTable<WEC_CUSTOM_MODEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CUSTOM_MODEL valObj = BLLTable<WEC_CUSTOM_MODEL>.GetRowData(WEC_CUSTOM_MODEL.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_MODELSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CUSTOM_MODEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
