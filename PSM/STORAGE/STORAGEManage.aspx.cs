using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class IM_STORAGEManage : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("STORAGEManage.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("STORAGEManage.aspx", path);
    }
    protected string pid="0";
    IM_STORAGE valObj = new IM_STORAGE();
    IM_STORAGE condObj = new IM_STORAGE();
    List<IM_STORAGE> listObj = new List<IM_STORAGE>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(IM_STORAGE condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(IM_STORAGE.Attribute.STOR_ID, Order.Desc);

        #region//����Ȩ������
        //string user_data_ids=UserHelper.GetUserDataIDS(userBase, HR_ORG.Attribute.ORG_ID);
        //if (!string.IsNullOrEmpty(user_data_ids)) {
        //    condObj.In(IM_STORAGE.Attribute.ORG_ID, user_data_ids);
        //}
        #endregion

        condObj.PID = decimal.Parse(pid);


        listObj = BLLTable<IM_STORAGE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //��ȡ���û���Ч�� AttributeItem ���ԡ���valObj���н�����

        title = valObj._ZhName + "����";
        Page.Title = title;

        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }

        #region//Ĭ�����ص���//zlg ���� ShowAttributeItemList��δ��������ڹ�ϵ����������� HideAttributeItemList
        hideTableColumnList = new List<AttributeItem>();
        hideTableColumnList.Add(IM_STORAGE.Attribute.EXP1);
        hideTableColumnList.Add(IM_STORAGE.Attribute.EXP2);
        hideTableColumnList.Add(IM_STORAGE.Attribute.EXP3);
        valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        valObj.Remove(hideTableColumnList);
        //��ʱ����������
        #endregion

        if (!IsPostBack)
        {
            #region//Ĭ�����Գ�ʼ��
            aspPager.CurrentPageIndex = 1;
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            #endregion
            #region//���ݳ�ʼ��
                                                                             
            txtSTATE.Items.AddRange(FormHelper.GetListItem(IM_STORAGE.Attribute.USE_FLAG));
            #endregion

            BindList(condObj, 1);


        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new IM_STORAGE();
        if(txtNAME.Value !="" )
            condObj.Like(IM_STORAGE.Attribute.NAME, Convert.ToString(txtNAME.Value));
        
        
        if(txtSNAME.Value !="" )
            condObj.Like(IM_STORAGE.Attribute.SNAME, Convert.ToString(txtSNAME.Value));
        
        
        if(txtRNAME.Value !="" )
            condObj.Like(IM_STORAGE.Attribute.RNAME, Convert.ToString(txtRNAME.Value));
        
        
        if(wucSelORG1.ORG_ID !="" )
            condObj.Like(IM_STORAGE.Attribute.ORG_ID, Convert.ToString(wucSelORG1.ORG_ID));
        
        
        if(txtSTATE.Value !="" )
            condObj.USE_FLAG =txtSTATE.Value;

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_STORAGE>(hidCondition.Value);
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