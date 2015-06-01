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

public partial class SYS_TEMPUSERSels : BaseAdminPage
{
    public string title = new SYS_TEMPUSER()._ZhName;

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
    SYS_TEMPUSER valObj = new SYS_TEMPUSER();
    SYS_TEMPUSER condObj = new SYS_TEMPUSER();
    List<SYS_TEMPUSER> listObj = new List<SYS_TEMPUSER>();
    int recount = -1;
   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
        #endregion
        condObj.OrderBy(SYS_TEMPUSER.Attribute.ID, Order.Desc);

        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            aspPager.PageSize = 10;
            aspPager.CurrentPageIndex = 1;

            if (!string.IsNullOrEmpty(Request["ids"]))
            {
                SYS_TEMPUSER roleOld = new SYS_TEMPUSER();
                roleOld.Where(SYS_TEMPUSER.Attribute.ID, Request["ids"].ToString());
                listObj = BLLTable<SYS_TEMPUSER>.Select(valObj, roleOld);
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

                listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        condObj = new SYS_TEMPUSER();
        
        
        if(txtID.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtCONAME.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.CONAME, Convert.ToString(txtCONAME.Value));
        
        
        if(txtPHONE.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
        
        
        if(txtIP.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.IP, Convert.ToString(txtIP.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtLOGINNAME.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.LOGINNAME, Convert.ToString(txtLOGINNAME.Value));
        
        
        if(txtPWD.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.PWD, Convert.ToString(txtPWD.Value));
        
        
        if(txtUSER_ID.Value !="" )
            condObj.Like_OR(SYS_TEMPUSER.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));

        try
        {
            hidCondition.Value = condObj.ToJson(20);

            listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<SYS_TEMPUSER>(hidCondition.Value);
            }
            List<SYS_TEMPUSER> listVal = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);
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