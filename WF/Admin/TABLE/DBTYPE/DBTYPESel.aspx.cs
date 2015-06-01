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
public partial class WF_FIELD_DBTYPESel2 : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("TF_FIELD_DBTYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("TF_FIELD_DBTYPESel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    TF_FIELD_DBTYPE valObj = new TF_FIELD_DBTYPE();
    TF_FIELD_DBTYPE condObj = new TF_FIELD_DBTYPE();
    List<TF_FIELD_DBTYPE> listObj = new List<TF_FIELD_DBTYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        condObj.af_PageBy(TF_FIELD_DBTYPE.Attribute.TYPE_ID, Order.Desc);
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP3);
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
                listObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_FIELD_DBTYPE>(hidCondition.Value);
            }
            listObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_FIELD_DBTYPE();

            
            
            if(txtTYPE_ID.Value !="" )
                condObj.Like(TF_FIELD_DBTYPE.Attribute.TYPE_ID, Convert.ToInt32(txtTYPE_ID.Value));
            
            
            if(txtTYPE_NAME.Value !="" )
                condObj.Like(TF_FIELD_DBTYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
            
            
            if(txtDB_TYPE.Value !="" )
                condObj.Like(TF_FIELD_DBTYPE.Attribute.DB_TYPE, Convert.ToString(txtDB_TYPE.Value));
            
            
            if(txtCTRL_TYPES.Value !="" )
                condObj.Like(TF_FIELD_DBTYPE.Attribute.CTRL_TYPES, Convert.ToString(txtCTRL_TYPES.Value));

            listObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //TF_FIELD_DBTYPE valObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).GetRowData(TF_FIELD_DBTYPE.Attribute.TYPE_ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("TF_FIELD_DBTYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
