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
public partial class SYS_USERManage:BaseAdminPage
{
    SYS_USER valObj = new SYS_USER();
    SYS_USER condObj = new SYS_USER();
    List<SYS_USER> listObj = new List<SYS_USER>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(SYS_USER condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_USER.Attribute.USER_ID, Order.Desc);
        listObj = BLLTable<SYS_USER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }


    protected void Page_Load(object sender, EventArgs e)
    {        
        title = valObj._ZhName + "����";
        Page.Title = title;
        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;
            
            #endregion
            #region//���ݳ�ʼ��

            txtSTATE_FLAG.Items.AddRange(FormHelper.GetListItem(SYS_USER.Attribute.USE_FLAG));                                 
            txtUSER_TYPE.Items.AddRange(FormHelper.GetListItem(SYS_USER.Attribute.USER_TYPE));
            #endregion

            BindList(condObj, 1);
        }

    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_USER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_USER();
        if(txtUSER_NAME.Value !="" )
            condObj.Like(SYS_USER.Attribute.USER_NAME, Convert.ToString(txtUSER_NAME.Value));

        if(txtSTATE_FLAG.Value !="" )
            condObj.USE_FLAG = Convert.ToString(txtSTATE_FLAG.Value);

        if(txtUSER_TYPE.Value !="" )
            condObj.USER_TYPE = Convert.ToString(txtUSER_TYPE.Value);

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_USER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
   
}