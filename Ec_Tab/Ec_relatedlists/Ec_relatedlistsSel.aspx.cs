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

public partial class Ec_relatedlistsSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("Ec_relatedlistsSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("Ec_relatedlistsSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    Ec_relatedlists valObj = new Ec_relatedlists();
    Ec_relatedlists condObj = new Ec_relatedlists();
    List<Ec_relatedlists> listObj = new List<Ec_relatedlists>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_relatedlists.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_relatedlists.Attribute.EXP3);
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
                listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<Ec_relatedlists>(hidCondition.Value);
            }
            listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new Ec_relatedlists();

            
            
            if(txtRelation_id.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Relation_id, Convert.ToInt32(txtRelation_id.Value));
            
            
            if(txtTabid.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
            
            
            if(txtRelated_tabid.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Related_tabid, Convert.ToInt32(txtRelated_tabid.Value));
            
            
            if(txtName.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Name, Convert.ToString(txtName.Value));
            
            
            if(txtSequence.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Sequence, Convert.ToInt32(txtSequence.Value));
            
            
            if(txtLabel.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Label, Convert.ToString(txtLabel.Value));
            
            
            if(txtPresence.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Presence, Convert.ToInt32(txtPresence.Value));
            
            
            if(txtTabTableName.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.TabTableName, Convert.ToString(txtTabTableName.Value));
            
            
            if(txtColumnName_PK.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.ColumnName_PK, Convert.ToString(txtColumnName_PK.Value));
            
            
            if(txtColumnName_FK.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.ColumnName_FK, Convert.ToString(txtColumnName_FK.Value));
            
            
            if(txtRelated_tabTableName.Value !="" )
                condObj.Like(Ec_relatedlists.Attribute.Related_tabTableName, Convert.ToString(txtRelated_tabTableName.Value));

            listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //Ec_relatedlists valObj = BLLTable<Ec_relatedlists>.Factory(conn).GetRowData(Ec_relatedlists.Attribute.Relation_id, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("Ec_relatedlistsSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<Ec_relatedlists>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
