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
public partial class SYS_DATASOURCEManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_DATASOURCEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("SYS_DATASOURCEManage.aspx", path);
    }
    protected string pid="0";

    SYS_DATASOURCE valObj = new SYS_DATASOURCE();
    SYS_DATASOURCE condObj = new SYS_DATASOURCE();
    List<SYS_DATASOURCE> listObj = new List<SYS_DATASOURCE>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(SYS_DATASOURCE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_DATASOURCE.Attribute.ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<SYS_DATASOURCE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_DATASOURCE.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "����";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
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
            condObj = JsonServiceBase.FromJson<SYS_DATASOURCE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_DATASOURCE();

        
        
        if(txtID.Value !="" )
            condObj.Like(SYS_DATASOURCE.Attribute.ID, Convert.ToString(txtID.Value));
        
        
        if(txtSourceConnectString.Value !="" )
            condObj.Like(SYS_DATASOURCE.Attribute.SourceConnectString, Convert.ToString(txtSourceConnectString.Value));
        
        
        if(txtSourceType.Value !="" )
            condObj.Like(SYS_DATASOURCE.Attribute.SourceType, Convert.ToString(txtSourceType.Value));
        
        
        if(txtSourceName.Value !="" )
            condObj.Like(SYS_DATASOURCE.Attribute.SourceName, Convert.ToString(txtSourceName.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_DATASOURCE>(hidCondition.Value);
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