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

public partial class WEC_C_TYPESels : BaseAdminPage
{
    public string title = new WEC_C_TYPE()._ZhName;

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
    WEC_C_TYPE valObj = new WEC_C_TYPE();
    WEC_C_TYPE condObj = new WEC_C_TYPE();
    List<WEC_C_TYPE> listObj = new List<WEC_C_TYPE>();
    int recount = -1;
   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP3);
        #endregion
        condObj.OrderBy(WEC_C_TYPE.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                WEC_C_TYPE roleOld = new WEC_C_TYPE();
                roleOld.Where(WEC_C_TYPE.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<WEC_C_TYPE>.Select(valObj, roleOld);
                for (int i = 0; i < listObj.Count; i++)
                {
                    if (i > 0)
                    {
                        hidOld.Value += ",";
                        hidInitIDS.Value += ",";
                    }
                    hidOld.Value += "{ID:'" + listObj[i].ID + "',Name:'" + listObj[i].ID + "'}";//�����Name������ʾ���б��У��������ض��塣
                    hidInitIDS.Value += listObj[i].ID;
                }
            }
            try
            {

                listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new WEC_C_TYPE();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(WEC_C_TYPE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value !="" )
            condObj.Like_OR(WEC_C_TYPE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(WEC_C_TYPE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like_OR(WEC_C_TYPE.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtSORT.Value !="" )
            condObj.Like_OR(WEC_C_TYPE.Attribute.SORT, Convert.ToInt32(txtSORT.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_C_TYPE>(hidCondition.Value);
            }
            List<WEC_C_TYPE> listVal = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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