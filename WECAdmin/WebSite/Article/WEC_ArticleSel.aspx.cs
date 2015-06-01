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

public partial class WEC_ArticleSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_ArticleSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_ArticleSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_Article valObj = new WEC_Article();
    WEC_Article condObj = new WEC_Article();
    List<WEC_Article> listObj = new List<WEC_Article>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_Article.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_Article.Attribute.EXP3);
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
                listObj = BLLTable<WEC_Article>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_Article>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_Article>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_Article();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_Article.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtCID.Value !="" )
                condObj.Like(WEC_Article.Attribute.CID, Convert.ToString(txtCID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_Article.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtTITLE.Value !="" )
                condObj.Like(WEC_Article.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
            
            
            if(txtDES.Value !="" )
                condObj.Like(WEC_Article.Attribute.DES, Convert.ToString(txtDES.Value));
            
            
            if(txtCONTENT.Value !="" )
                condObj.Like(WEC_Article.Attribute.CONTENT, Convert.ToString(txtCONTENT.Value));
            
            
            if(txtURL.Value !="" )
                condObj.Like(WEC_Article.Attribute.URL, Convert.ToString(txtURL.Value));
            
            
            if(txtPIC_URL.Value !="" )
                condObj.Like(WEC_Article.Attribute.PIC_URL, Convert.ToString(txtPIC_URL.Value));
            
            
            if(txtMODEL_ID.Value !="" )
                condObj.Like(WEC_Article.Attribute.MODEL_ID, Convert.ToDecimal(txtMODEL_ID.Value));

            listObj = BLLTable<WEC_Article>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_Article valObj = BLLTable<WEC_Article>.GetRowData(WEC_Article.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_ArticleSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_Article>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
