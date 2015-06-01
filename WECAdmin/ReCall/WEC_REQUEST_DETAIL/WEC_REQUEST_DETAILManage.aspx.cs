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

public partial class WEC_REQUEST_DETAILManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUEST_DETAILManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_REQUEST_DETAILManage.aspx", path);
    }
     public string pid = "0", tid = "0";

    WEC_REQUEST_DETAIL valObj = new WEC_REQUEST_DETAIL();
    WEC_REQUEST_DETAIL condObj = new WEC_REQUEST_DETAIL();
    List<WEC_REQUEST_DETAIL> listObj = new List<WEC_REQUEST_DETAIL>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(WEC_REQUEST_DETAIL condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WEC_REQUEST_DETAIL.Attribute.ID, Order.Desc);

        if (!string.IsNullOrEmpty(tid))
        {
            condObj.TID = Convert.ToInt32(tid);
        }

        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<WEC_REQUEST_DETAIL>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST_DETAIL.Attribute.EXP3);
        #endregion
        title = valObj._ZhName + "����";
        Page.Title = title;
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        if (Request["tid"] != null)
        {
            tid = Request["tid"];
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
            
            txtTYPE_ID.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST_DETAIL.Attribute.TYPE_ID));
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_REQUEST_DETAIL.Attribute.STATUS));                    
            txtADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST_DETAIL>(hidCondition.Value);
        }
        if (!string.IsNullOrEmpty(tid))
        {
            condObj.TID = Convert.ToInt32(tid);
        }

        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_REQUEST_DETAIL();

        
        
        if(txtID.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtTID.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.TID, Convert.ToDecimal(txtTID.Value));
        
        
        if(txtTITLE.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtSORT_ID.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.SORT_ID, Convert.ToDecimal(txtSORT_ID.Value));
        
        
        if(txtPICURL.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
        
        
        if(txtTYPE_ID.Value !="" )
            condObj.TYPE_ID = Convert.ToString(txtTYPE_ID.Value);
        
        
        if(txtTYPE_VALUE.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE, Convert.ToString(txtTYPE_VALUE.Value));
        
        
        if(txtSTATUS.Value !="" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(WEC_REQUEST_DETAIL.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_REQUEST_DETAIL>(hidCondition.Value);
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