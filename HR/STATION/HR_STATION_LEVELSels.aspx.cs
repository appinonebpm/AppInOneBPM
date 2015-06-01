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
public partial class HR_STATION_LEVELSels : BaseAdminPage
{
    public string title = new HR_STATION_LEVEL()._ZhName;

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
    HR_STATION_LEVEL valObj = new HR_STATION_LEVEL();
    HR_STATION_LEVEL condObj = new HR_STATION_LEVEL();
    List<HR_STATION_LEVEL> listObj = new List<HR_STATION_LEVEL>();
    int recount = -1;
   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideTableColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP1);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP2);
        //hideFindColumnList.Add(HR_STATION_LEVEL.Attribute.EXP3);
        #endregion
        condObj.OrderBy(HR_STATION_LEVEL.Attribute.LEVEL_ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                HR_STATION_LEVEL roleOld = new HR_STATION_LEVEL();
                roleOld.Where(HR_STATION_LEVEL.Attribute.LEVEL_ID, Request["ids"].ToString());
                listObj = BLLTable<HR_STATION_LEVEL>.Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].LEVEL_ID + "',Name:'" + listObj[i].LEVEL_ID + "'}";//�����Name������ʾ���б��У��������ض��塣
                    hidInitIDS.Value += listObj[i].LEVEL_ID;
                }
            }
            try
            {

                listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new HR_STATION_LEVEL();
        
        
        if(txtLEVEL_ID.Value !="" )
            condObj.Like_OR(HR_STATION_LEVEL.Attribute.LEVEL_ID, Convert.ToDecimal(txtLEVEL_ID.Value));
        
        
        if(txtLEVEL_NAME.Value !="" )
            condObj.Like_OR(HR_STATION_LEVEL.Attribute.LEVEL_NAME, Convert.ToString(txtLEVEL_NAME.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(HR_STATION_LEVEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<HR_STATION_LEVEL>(hidCondition.Value);
            }
            List<HR_STATION_LEVEL> listVal = BLLTable<HR_STATION_LEVEL>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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