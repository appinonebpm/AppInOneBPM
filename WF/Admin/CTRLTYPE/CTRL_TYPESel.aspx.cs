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
public partial class WF_CTRL_TYPESel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("TF_CTRL_TYPESel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("TF_CTRL_TYPESel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    TF_CTRL_TYPE valObj = new TF_CTRL_TYPE();
    TF_CTRL_TYPE condObj = new TF_CTRL_TYPE();
    List<TF_CTRL_TYPE> listObj = new List<TF_CTRL_TYPE>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        valObj.af_PageBy(TF_CTRL_TYPE.Attribute.SEL_KEY, Order.Desc);
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideTableColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP1);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP2);
        //hideFindColumnList.Add(TF_CTRL_TYPE.Attribute.EXP3);
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
                listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<TF_CTRL_TYPE>(hidCondition.Value);
            }
            listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new TF_CTRL_TYPE();

            
            
            if(txtCTRL_TYPE.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.CTRL_TYPE, Convert.ToString(txtCTRL_TYPE.Value));
            
            
            if(txtP_CTRL_TYPE.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.P_CTRL_TYPE, Convert.ToString(txtP_CTRL_TYPE.Value));
            
            
            if(txtCTRL_NAME.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.CTRL_NAME, Convert.ToString(txtCTRL_NAME.Value));
            
            
            if(txtEL_HTML.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.EL_HTML, Convert.ToString(txtEL_HTML.Value));
            
            
            if(txtSORT_NO.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.SORT_NO, Convert.ToInt32(txtSORT_NO.Value));
            
            
            if(txtJS_CODE.Value !="" )
                condObj.Like(TF_CTRL_TYPE.Attribute.JS_CODE, Convert.ToString(txtJS_CODE.Value));

            listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //TF_CTRL_TYPE valObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).GetRowData(TF_CTRL_TYPE.Attribute.CTRL_TYPE, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("TF_CTRL_TYPESel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<TF_CTRL_TYPE>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
