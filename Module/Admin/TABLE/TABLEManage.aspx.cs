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
using AgileFrame.AppInOne.SYS;

public partial class TF_TABLEManage2:BaseAdminPage
{
    TF_TABLE valObj = new TF_TABLE();
    TF_TABLE condObj = new TF_TABLE();
    List<TF_TABLE> listObj = new List<TF_TABLE>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(TF_TABLE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(TF_TABLE.Attribute.TB_ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<TF_TABLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;

        head_TB_ID.Visible = false;

        foreach (RepeaterItem item in repList.Items)
        {
            Label lblid = item.FindControl("lid") as Label;
            Repeater rp = item.FindControl("repx") as Repeater;
            //rp.DataSource = listObj;
            //rp.DataBind();
            //DataTable dt2 = bll.GetList(0, "Classid=" + lblid.Text + "", "SortId asc").Tables[0];
            //if (dt2.Rows.Count != 0)
            //{
            //    rp.DataSource = dt2;
            //    rp.DataBind();
            //}

        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_TABLE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_TABLE.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "����";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;

            #endregion

            #region//���ݳ�ʼ��
            
            txtTB_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TABLE.Attribute.TB_TYPE));
            #endregion

            BindList(condObj, 1);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_TABLE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_TABLE();

        
        
        if(txtTB_ID.Value !="" )
            condObj.Like(TF_TABLE.Attribute.TB_ID, Convert.ToInt32(txtTB_ID.Value));
        
        
        if(txtTB_NAME.Value !="" )
            condObj.Like(TF_TABLE.Attribute.TB_NAME, Convert.ToString(txtTB_NAME.Value));
        
        
        if(txtCH_NAME.Value !="" )
            condObj.Like(TF_TABLE.Attribute.CH_NAME, Convert.ToString(txtCH_NAME.Value));
        
        
        if(txtM_TB_ID.Value !="" )
            condObj.Like(TF_TABLE.Attribute.M_TB_ID, Convert.ToInt32(txtM_TB_ID.Value));
        
        
        if(txtSORT_NO.Value !="" )
            condObj.Like(TF_TABLE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
        
        
        if(txtTB_TYPE.Value !="" )
            condObj.TB_TYPE = Convert.ToInt32(txtTB_TYPE.Value);
        
        
        if(txtNOTE.Value !="" )
            condObj.Like(TF_TABLE.Attribute.NOTE, Convert.ToString(txtNOTE.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_TABLE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            int j = 1;
            foreach (RepeaterItem i in repList.Items)
            {
                i.FindControl("TB_ID").Visible = false;

                //Label lab = (Label)i.FindControl("abc");
                //lab.Text = (aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + j).ToString();
                //j++;
                //Label lab2 = (Label)i.FindControl("Label1");
                //lab2.Visible = false;
            }
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}