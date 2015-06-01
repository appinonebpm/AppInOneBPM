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
public partial class SYS_DATASOURCESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_DATASOURCESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("SYS_DATASOURCESel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    SYS_DATASOURCE valObj = new SYS_DATASOURCE();
    SYS_DATASOURCE condObj = new SYS_DATASOURCE();
    List<SYS_DATASOURCE> listObj = new List<SYS_DATASOURCE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
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
                listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_DATASOURCE>(hidCondition.Value);
            }
            listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new SYS_DATASOURCE();

            
            
            if(txtID.Value !="" )
                condObj.Like(SYS_DATASOURCE.Attribute.ID, Convert.ToString(txtID.Value));
            
            
            if(txtSourceConnectString.Value !="" )
                condObj.Like(SYS_DATASOURCE.Attribute.SourceConnectString, Convert.ToString(txtSourceConnectString.Value));
            
            
            if(txtSourceType.Value !="" )
                condObj.Like(SYS_DATASOURCE.Attribute.SourceType, Convert.ToString(txtSourceType.Value));
            
            
            if(txtSourceName.Value !="" )
                condObj.Like(SYS_DATASOURCE.Attribute.SourceName, Convert.ToString(txtSourceName.Value));

            listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //SYS_DATASOURCE valObj = BLLTable<SYS_DATASOURCE>.Factory(conn).GetRowData(SYS_DATASOURCE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("SYS_DATASOURCESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
