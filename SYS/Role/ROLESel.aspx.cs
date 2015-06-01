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

public partial class SYS_ROLE_Sel : AgileFrame.AppInOne.Common.BasePage
{
    SYS_ROLE valObj = new SYS_ROLE();
    SYS_ROLE condObj = new SYS_ROLE();
    List<SYS_ROLE> listObj = new List<SYS_ROLE>();
    /// <summary>��ѯ�ܼ�¼��</summary>
    int recount = -1;
    public string title = new SYS_ROLE()._ZhName;
    /// <summary>�����������</summary>
    public int count = 0;
        /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();

    private void BindList(SYS_ROLE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_ROLE.Attribute.ROLE_ID, Order.Desc);
        listObj = BLLTable<SYS_ROLE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }
    protected void Page_Load(object sender, EventArgs e)
    {        
        #region �ⲿ���� ����������
        
        #endregion
        
        if (!IsPostBack)
        {
            btnFind.Text = LanguageService.GetLanguageString("btnFind", "��ѯ");
            Page.Title = title + LanguageService.GetLanguageString("Choose", "ѡ��");
            aspPager.PageSize = 15;
   
            BindList(condObj, 1);            
            aspPager.CurrentPageIndex = 1;  

        }
  
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_ROLE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        condObj = new SYS_ROLE();

        if(txtROLE_NAME.Value !="" )
            condObj.Like_OR(SYS_ROLE.Attribute.ROLE_NAME, Convert.ToString(txtROLE_NAME.Value));
        
        
        if(txtCREATER.Value !="" )
            condObj.Like_OR(SYS_ROLE.Attribute.CREATER, Convert.ToString(txtCREATER.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }
    
    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {    
        }
        catch (Exception ex)
        {
            //PageHelper.Error(Page, ex);
        }
    }
}