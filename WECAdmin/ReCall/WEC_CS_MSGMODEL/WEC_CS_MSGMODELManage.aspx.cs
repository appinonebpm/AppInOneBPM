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

public partial class WEC_CS_MSGMODELManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_CS_MSGMODELManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_CS_MSGMODELManage.aspx", path);
    }
    protected string pid="0";

    WEC_CS_MSGMODEL valObj = new WEC_CS_MSGMODEL();
    WEC_CS_MSGMODEL condObj = new WEC_CS_MSGMODEL();
    List<WEC_CS_MSGMODEL> listObj = new List<WEC_CS_MSGMODEL>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(WEC_CS_MSGMODEL condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WEC_CS_MSGMODEL.Attribute.ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<WEC_CS_MSGMODEL>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        //zlg �����ģ�飬��������
        valObj.setConn(conn).setModule(ModuleName);

        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_CS_MSGMODEL.Attribute.EXP3);
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
            //aspPager.ShowInputBox = AgileFrame.Core.WebSystem.WebCtrls.ShowInputBox.Auto;
            txtPageSize.Value = "30";
            aspPager.PageSize = 30;
            //if (pid == "" || pid == "0")
            //{
            //    a_top.Visible = false;
            //}
            #endregion
            #region//���ݳ�ʼ��
                                
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_CS_MSGMODEL.Attribute.STATUS));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_CS_MSGMODEL>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_CS_MSGMODEL();

        
        
        if(txtID.Value != "" )
            condObj.Like(WEC_CS_MSGMODEL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value != "" )
            condObj.Like(WEC_CS_MSGMODEL.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtADDTIME.Value != "" )
            condObj.Like(WEC_CS_MSGMODEL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtSTATUS.Value != "" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtMODELCONTENT.Value != "" )
            condObj.Like(WEC_CS_MSGMODEL.Attribute.MODELCONTENT, Convert.ToString(txtMODELCONTENT.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_CS_MSGMODEL>(hidCondition.Value);
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