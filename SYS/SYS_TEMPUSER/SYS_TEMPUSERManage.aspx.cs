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

public partial class SYS_TEMPUSERManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("SYS_TEMPUSERManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("SYS_TEMPUSERManage.aspx", path);
    }
    protected string pid="0";

    SYS_TEMPUSER valObj = new SYS_TEMPUSER();
    SYS_TEMPUSER condObj = new SYS_TEMPUSER();
    List<SYS_TEMPUSER> listObj = new List<SYS_TEMPUSER>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(SYS_TEMPUSER condObj, int curPage)
    {
        if (valObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            valObj.af_PageBy(SYS_TEMPUSER.Attribute.ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<SYS_TEMPUSER>.SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideTableColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP1);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP2);
        //hideFindColumnList.Add(SYS_TEMPUSER.Attribute.EXP3);
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
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_TEMPUSER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new SYS_TEMPUSER();

        
        
        if(txtID.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.ID, Convert.ToDecimal(txtID.Value));
        
        
        if(txtNAME.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtCONAME.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.CONAME, Convert.ToString(txtCONAME.Value));
        
        
        if(txtPHONE.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
        
        
        if(txtIP.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.IP, Convert.ToString(txtIP.Value));
        
        
        if(txtADDTIME.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
        
        
        if(txtLOGINNAME.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.LOGINNAME, Convert.ToString(txtLOGINNAME.Value));
        
        
        if(txtPWD.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.PWD, Convert.ToString(txtPWD.Value));
        
        
        if(txtUSER_ID.Value !="" )
            condObj.Like(SYS_TEMPUSER.Attribute.USER_ID, Convert.ToDecimal(txtUSER_ID.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<SYS_TEMPUSER>(hidCondition.Value);
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