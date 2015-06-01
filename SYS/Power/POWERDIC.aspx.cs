using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;

public partial class Admin_AU_POWERDICManage : AgileFrame.AppInOne.Common.BasePage
{
    SYS_MDLPOWER_DIC valObj = new SYS_MDLPOWER_DIC();
    SYS_MDLPOWER_DIC condObj = new SYS_MDLPOWER_DIC();
    List<SYS_MDLPOWER_DIC> listObj = new List<SYS_MDLPOWER_DIC>();

    Dictionary<string, string> dicCtrl = EnumInfo.OprCtrlTypeDic;
    Dictionary<string, string> dicCtrlDeal = EnumInfo.OprCtrlDealTypeDic;

    protected string mdlID = "";
    protected string title = "";
    protected string mdldir = "";
    protected string GetCtrlTypeName(string ctrltype)
    {
        try
        {
            if (string.IsNullOrEmpty(ctrltype)) { return ""; }
            return dicCtrl[ctrltype];
        }
        catch {
            return "��ť[input/Button]"; 
        }
    }

    protected string GetDealTypeName(string dealtype)
    {
        try
        {
            if (string.IsNullOrEmpty(dealtype)) { return ""; }
            return dicCtrlDeal[dealtype];
        }
        catch
        {
            return "���ɲ���";
        }
    }

    private void BindList(SYS_MDLPOWER_DIC condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(SYS_MDLPOWER_DIC.Attribute.DIC_ID, Order.Desc);
        listObj = BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Select(valObj, condObj);        
        repList.DataSource = listObj;
        repList.DataBind();
    }

    protected void Page_Load(object sender, EventArgs e)
    {        
        #region �ⲿ���� ����������
        title = valObj._ZhName+"����";
        Page.Title = title;

        
        if (Request["MDL_ID"] != null)
        {
            mdlID = Request["MDL_ID"];
            hidMidId.Value = mdlID;
            //condObj.MDL_ID = Request["MDL_ID"];
            mdldir = BLLTable<SYS_MODULE>.Factory(conn).GetOneValue(SYS_MODULE.Attribute.MDL_ID, mdlID, SYS_MODULE.Attribute.PAGE_URL);
        }
        #endregion
        //ö�ٱ�����������ʼ��
        if (!IsPostBack)
        {
            Header.DataBind();
            if (mdldir != "")
            {
                condObj.PAGE_URL = mdldir;
                //condObj.In(SYS_MDLPOWER_DIC.Attribute.MDL_ID,ids);
                BindList(condObj, 1);
            }
        }
    }
}