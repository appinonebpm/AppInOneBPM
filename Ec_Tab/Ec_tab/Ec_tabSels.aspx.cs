using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class Ec_tabSels : BaseAdminPage
{
    public string title = new Ec_tab()._ZhName;

    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    Ec_tab valObj = new Ec_tab();
    Ec_tab condObj = new Ec_tab();
    List<Ec_tab> listObj = new List<Ec_tab>();
    int recount = -1;
   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP1);
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP2);
        //hideTableColumnList.Add(Ec_tab.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP1);
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP2);
        //hideFindColumnList.Add(Ec_tab.Attribute.EXP3);
        #endregion
        condObj.OrderBy(Ec_tab.Attribute.Tabid, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                Ec_tab roleOld = new Ec_tab();
                roleOld.Where(Ec_tab.Attribute.Tabid, Request["ids"].ToString());
                listObj = BLLTable<Ec_tab>.Factory(conn).Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].Tabid + "',Name:'" + listObj[i].Tabid + "'}";//�����Name������ʾ���б��У��������ض��塣
                    hidInitIDS.Value += listObj[i].Tabid;
                }
            }
            try
            {

                listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repList.DataSource = listObj;
                repList.DataBind();
                aspPager.RecordCount = recount;
            }
            catch (Exception ex)
            {
                 litWarn.Text = ex.Message;
            }



        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new Ec_tab();
        
        
        if(txtTabid.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Tabid, Convert.ToInt32(txtTabid.Value));
        
        
        if(txtName.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Name, Convert.ToString(txtName.Value));
        
        
        if(txtPresence.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Presence, Convert.ToInt32(txtPresence.Value));
        
        
        if(txtTabsequence.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Tabsequence, Convert.ToInt32(txtTabsequence.Value));
        
        
        if(txtTablabel.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Tablabel, Convert.ToString(txtTablabel.Value));
        
        
        if(txtModifiedby.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Modifiedby, Convert.ToInt32(txtModifiedby.Value));
        
        
        if(txtModifiedtime.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Modifiedtime, Convert.ToInt32(txtModifiedtime.Value));
        
        
        if(txtCustomized.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Customized, Convert.ToInt32(txtCustomized.Value));
        
        
        if(txtReportable.Value !="" )
            condObj.Like_OR(Ec_tab.Attribute.Reportable, Convert.ToInt32(txtReportable.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repList.DataSource = listObj;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }

    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            recount = aspPager.RecordCount;
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<Ec_tab>(hidCondition.Value);
            }
            List<Ec_tab> listVal = BLLTable<Ec_tab>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
            repList.DataSource = listVal;
            repList.DataBind();
        }
        catch (Exception ex)
        {
             litWarn.Text = ex.Message;
        }
    }
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (hidOld.Value != "")
        {
            HtmlInputCheckBox ck = (HtmlInputCheckBox)e.Item.FindControl("chkSel");
            string id = ck.Attributes["value"];

            if (IsInOld(hidInitIDS.Value, id, ','))
            {
                ck.Checked = true;
            }
        }
    }
}