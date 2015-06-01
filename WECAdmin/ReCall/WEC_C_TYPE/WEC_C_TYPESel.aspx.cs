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

public partial class WEC_C_TYPESel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_C_TYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_C_TYPESel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_C_TYPE valObj = new WEC_C_TYPE();
    WEC_C_TYPE condObj = new WEC_C_TYPE();
    List<WEC_C_TYPE> listObj = new List<WEC_C_TYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_C_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_C_TYPE.Attribute.EXP3);
        #endregion
        //�༶���ݱ�ҳ����õ�
        if (Request["PID"] != null)
        {
            pid = Request["PID"];
        }
        title = valObj._ZhName + "ѡ��";
        Page.Title = title;
        if (!IsPostBack)
        {
            aspPager.CurrentPageIndex = 1;
            aspPager.PageSize = 20;
            try
            {
                listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
                repCus.DataSource = listObj;
                repCus.DataBind();
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
            aspPager.RecordCount = recount;
        }
    }
    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        try
        {
            if (hidCondition.Value != "")
            {
                condObj = JsonServiceBase.FromJson<WEC_C_TYPE>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {
        try
        {
            condObj = new WEC_C_TYPE();

            
            
            if(txtID.Value !="" )
                condObj.Like(WEC_C_TYPE.Attribute.ID, Convert.ToDecimal(txtID.Value));
            
            
            if(txtAID.Value !="" )
                condObj.Like(WEC_C_TYPE.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            if(txtSTATUS.Value !="" )
                condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtADDTIME.Value !="" )
                condObj.Like(WEC_C_TYPE.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));
            
            
            if(txtNAME.Value !="" )
                condObj.Like(WEC_C_TYPE.Attribute.NAME, Convert.ToString(txtNAME.Value));
            
            
            if(txtSORT.Value !="" )
                condObj.Like(WEC_C_TYPE.Attribute.SORT, Convert.ToInt32(txtSORT.Value));

            listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
            repCus.DataSource = listObj;
            repCus.DataBind();
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
        aspPager.RecordCount = recount;
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        #region//�༶���ݱ�ҳ����õ���ȡ��ע��
        //pid = Request[hidSelID.Name];
        //WEC_C_TYPE valObj = BLLTable<WEC_C_TYPE>.GetRowData(WEC_C_TYPE.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_C_TYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_C_TYPE>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
