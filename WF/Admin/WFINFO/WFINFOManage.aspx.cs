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
using AgileFrame.AppInOne.WF;
public partial class WFINFOManage : AgileFrame.AppInOne.Common.BaseAdminPage
{

    WF_INFO valObj = new WF_INFO();
    WF_INFO condObj = new WF_INFO();
    List<WF_INFO> listObj = new List<WF_INFO>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(WF_INFO condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WF_INFO.Attribute.WFID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion

        
        listObj = BLLTable<WF_INFO>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //Response.Write("����ά����...");
        //Response.End();
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP1);
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP2);
        //hideTableColumnList.Add(WF_INFO.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP1);
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP2);
        //hideFindColumnList.Add(WF_INFO.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "����";
        Page.Title = title;

        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            aspPager.PageSize = 15;

            #endregion
            #region//���ݳ�ʼ��

            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.STATUS));
            txtUSE_LIMIT.Items.AddRange(FormHelper.GetListItem(WF_INFO.Attribute.USE_LIMIT));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WF_INFO>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WF_INFO();

        if(txtWFCNAME.Value !="" )
            condObj.Like(WF_INFO.Attribute.WFCNAME, Convert.ToString(txtWFCNAME.Value));
        

        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToString(txtSTATUS.Value);
        
        
        if(txtUSE_LIMIT.Value !="" )
            condObj.USE_LIMIT = Convert.ToString(txtUSE_LIMIT.Value);


        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        try
        {
            WF_INFO wf = (WF_INFO)e.Item.DataItem;

            List<WF_WFOBJECT> lst = BLLTable<WF_WFOBJECT>.Factory(conn).Select(WF_WFOBJECT.Attribute.WFID_SRC, wf.WFID);
            if (lst != null&&lst.Count>0)
            {
                Repeater rrr = (Repeater)e.Item.FindControl("repObject");
                rrr.DataSource = lst;
                rrr.DataBind();
            }
        }
        catch (Exception ex)
        {
           litWarn.Text = ex.Message;
        }
    }
}