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

public partial class SYS_USERDATAManage : AgileFrame.AppInOne.Common.BasePage
{
    SYS_USERDATA valObj = new SYS_USERDATA();
    SYS_USERDATA condObj = new SYS_USERDATA();
    List<SYS_USERDATA> listObj = new List<SYS_USERDATA>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(SYS_USERDATA condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_USERDATA.Attribute.USER_ID, Order.Desc);
        listObj = BLLTable<SYS_USERDATA>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
            
            #endregion

            BindList(condObj, 1);
        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_USERDATA>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_USERDATA();

        
        
        if(txtUSER_ID.Value !="" )
            condObj.Like(SYS_USERDATA.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));
        
        
        if(txtDATA_TYPE.Value !="" )
            condObj.Like(SYS_USERDATA.Attribute.DATA_TYPE, Convert.ToString(txtDATA_TYPE.Value));
        
        
        if(txtDATA_ID.Value !="" )
            condObj.Like(SYS_USERDATA.Attribute.DATA_ID, Convert.ToString(txtDATA_ID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_USERDATA>(hidCondition.Value);
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