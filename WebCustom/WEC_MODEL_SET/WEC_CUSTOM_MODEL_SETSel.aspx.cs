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

public partial class WEC_CUSTOM_MODEL_SETSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_MODEL_SETSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_CUSTOM_MODEL_SETSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_CUSTOM_MODEL_SET valObj = new WEC_CUSTOM_MODEL_SET();
    WEC_CUSTOM_MODEL_SET condObj = new WEC_CUSTOM_MODEL_SET();
    List<WEC_CUSTOM_MODEL_SET> listObj = new List<WEC_CUSTOM_MODEL_SET>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        //zlg �����ģ�飬��������
        valObj.setConn(conn).setModule(ModuleName);

        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CUSTOM_MODEL_SET.Attribute.EXP3);
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
                listObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_CUSTOM_MODEL_SET>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_CUSTOM_MODEL_SET();

            
            
            if(txtWEC_CUSTOM_MODEL_SET_ID.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL_SET.Attribute.ID, Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_ID.Value));
            
            
            if(txtWEC_CUSTOM_MODEL_SET_A_ID.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL_SET.Attribute.A_ID, Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_A_ID.Value));
            
            
            if(txtWEC_CUSTOM_MODEL_SET_M_ID.Value !="" )
                condObj.Like(WEC_CUSTOM_MODEL_SET.Attribute.M_ID, Convert.ToDecimal(txtWEC_CUSTOM_MODEL_SET_M_ID.Value));

            listObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_CUSTOM_MODEL_SET valObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).GetRowData(WEC_CUSTOM_MODEL_SET.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_CUSTOM_MODEL_SETSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_CUSTOM_MODEL_SET>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
