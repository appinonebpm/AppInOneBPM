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

public partial class Ec_entitynameSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_entitynameSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("Ec_entitynameSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    Ec_entityname valObj = new Ec_entityname();
    Ec_entityname condObj = new Ec_entityname();
    List<Ec_entityname> listObj = new List<Ec_entityname>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_entityname.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_entityname.Attribute.EXP3);
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
                listObj = BLLTable<Ec_entityname>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_entityname>(hidCondition.Value);
            }
            listObj = BLLTable<Ec_entityname>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new Ec_entityname();

            
            
            if(txtTabid.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
            
            
            if(txtModulename.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Modulename, Convert.ToString(txtModulename.Value));
            
            
            if(txtTablename.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Tablename, Convert.ToString(txtTablename.Value));
            
            
            if(txtFieldname.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Fieldname, Convert.ToString(txtFieldname.Value));
            
            
            if(txtEntityidfield.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Entityidfield, Convert.ToString(txtEntityidfield.Value));
            
            
            if(txtRemarks.Value !="" )
                condObj.Like(Ec_entityname.Attribute.Remarks, Convert.ToString(txtRemarks.Value));

            listObj = BLLTable<Ec_entityname>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //Ec_entityname valObj = BLLTable<Ec_entityname>.Factory(conn).GetRowData(Ec_entityname.Attribute.Tabid, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("Ec_entitynameSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<Ec_entityname>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
