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

public partial class WEC_A_VOTEManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_A_VOTEManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("WEC_A_VOTEManage.aspx", path);
    }
    protected string pid="0";

    WEC_A_VOTE valObj = new WEC_A_VOTE();
    WEC_A_VOTE condObj = new WEC_A_VOTE();
    List<WEC_A_VOTE> listObj = new List<WEC_A_VOTE>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(WEC_A_VOTE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(WEC_A_VOTE.Attribute.ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<WEC_A_VOTE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_A_VOTE.Attribute.EXP3);
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
            
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.STATUS));
            txtPIC_SHOW.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.PIC_SHOW));
            txtIS_RADIO.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.IS_RADIO));
            txtSHARE.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.SHARE));
            txtKIND.Items.AddRange(FormHelper.GetListItem(WEC_A_VOTE.Attribute.KIND));
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_A_VOTE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new WEC_A_VOTE();

        
        
        if(txtID.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtAID.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
        
        
        if(txtSTATUS.Value != "" )
            condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
        
        
        if(txtADDTIME.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtKEYWORD.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
        
        
        if(txtTITLE.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.TITLE, Convert.ToString(txtTITLE.Value));
        
        
        if(txtPICURL.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.PICURL, Convert.ToString(txtPICURL.Value));
        
        
        if(txtINSTRUCTION.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.INSTRUCTION, Convert.ToString(txtINSTRUCTION.Value));
        
        
        if(txtPIC_SHOW.Value != "" )
            condObj.PIC_SHOW = Convert.ToInt32(txtPIC_SHOW.Value);
        
        
        if(txtIS_RADIO.Value != "" )
            condObj.IS_RADIO = Convert.ToInt32(txtIS_RADIO.Value);
        
        
        if(txtSELECT_NUM.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.SELECT_NUM, Convert.ToInt32(txtSELECT_NUM.Value));
        
        
        if(txtTIME.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.TIME, Convert.ToString(txtTIME.Value));
        
        
        if(txtRESULT.Value != "" )
            condObj.Like(WEC_A_VOTE.Attribute.RESULT, Convert.ToInt32(txtRESULT.Value));
        
        
        if(txtSHARE.Value != "" )
            condObj.SHARE = Convert.ToInt32(txtSHARE.Value);
        
        
        if(txtKIND.Value != "" )
            condObj.KIND = Convert.ToInt32(txtKIND.Value);

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<WEC_A_VOTE>(hidCondition.Value);
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