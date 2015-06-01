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
public partial class WF_FIELD_DBTYPEManage2:BaseAdminPage
{

    TF_FIELD_DBTYPE valObj = new TF_FIELD_DBTYPE();
    TF_FIELD_DBTYPE condObj = new TF_FIELD_DBTYPE();
    List<TF_FIELD_DBTYPE> listObj = new List<TF_FIELD_DBTYPE>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(TF_FIELD_DBTYPE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(TF_FIELD_DBTYPE.Attribute.TYPE_ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_FIELD_DBTYPE.Attribute.EXP3);
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
            
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_FIELD_DBTYPE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new TF_FIELD_DBTYPE();

        
        
        if(txtTYPE_ID.Value !="" )
            condObj.Like(TF_FIELD_DBTYPE.Attribute.TYPE_ID, Convert.ToInt32(txtTYPE_ID.Value));
        
        
        if(txtTYPE_NAME.Value !="" )
            condObj.Like(TF_FIELD_DBTYPE.Attribute.TYPE_NAME, Convert.ToString(txtTYPE_NAME.Value));
        
        
        if(txtDB_TYPE.Value !="" )
            condObj.Like(TF_FIELD_DBTYPE.Attribute.DB_TYPE, Convert.ToString(txtDB_TYPE.Value));
        
        
        if(txtCTRL_TYPES.Value !="" )
            condObj.Like(TF_FIELD_DBTYPE.Attribute.CTRL_TYPES, Convert.ToString(txtCTRL_TYPES.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<TF_FIELD_DBTYPE>(hidCondition.Value);
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