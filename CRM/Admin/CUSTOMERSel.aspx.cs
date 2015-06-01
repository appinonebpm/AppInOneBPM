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
public partial class CRM_CUSTOMERSel : AgileFrame.AppInOne.Common.BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("CRM_CUSTOMERSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("CRM_CUSTOMERSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    CRM_CUSTOMER valObj = new CRM_CUSTOMER();
    CRM_CUSTOMER condObj = new CRM_CUSTOMER();
    List<CRM_CUSTOMER> listObj = new List<CRM_CUSTOMER>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (valObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            valObj.af_PageBy(CRM_CUSTOMER.Attribute.Cus_Id, Order.Desc);
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP1);
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP2);
        //hideTableColumnList.Add(CRM_CUSTOMER.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP1);
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP2);
        //hideFindColumnList.Add(CRM_CUSTOMER.Attribute.EXP3);
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
                listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<CRM_CUSTOMER>(hidCondition.Value);
            }
            listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new CRM_CUSTOMER();

            
            
            if(txtCompanyName.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.CompanyName, Convert.ToString(txtCompanyName.Value));
            
            
            if(txtCompanyAddress.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.CompanyAddress, Convert.ToString(txtCompanyAddress.Value));
            
            
            if(txtShopName.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.ShopName, Convert.ToString(txtShopName.Value));
            
            
            if(txtShopNameURL.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.ShopNameURL, Convert.ToString(txtShopNameURL.Value));
            
            
            if(txtCustSex.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.CustSex, Convert.ToInt32(txtCustSex.Value));
            
            
            if(txtBirthday.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.Birthday, Convert.ToDateTime(txtBirthday.Value));
            
            
            if(txtWangWangId.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.WangWangId, Convert.ToString(txtWangWangId.Value));
            
            
            if(txtCustQQ.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.CustQQ, Convert.ToString(txtCustQQ.Value));
            
            
            if(txtLastEditors.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.LastEditors, Convert.ToString(txtLastEditors.Value));
            
            
            if(txtLoadHighSeasTime.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.LoadHighSeasTime, Convert.ToDateTime(txtLoadHighSeasTime.Value));
            
            
            if(txtCus_Id.Value !="" )
                condObj.Like(CRM_CUSTOMER.Attribute.Cus_Id, Convert.ToInt32(txtCus_Id.Value));

            listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //CRM_CUSTOMER valObj = BLLTable<CRM_CUSTOMER>.Factory(conn).GetRowData(CRM_CUSTOMER.Attribute.Cus_Id, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("CRM_CUSTOMERSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<CRM_CUSTOMER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
