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

public partial class APP_STATISTICSManage:BaseAdminPage
{
    protected string showLeftLinks(string path, string pname,int rowIndex)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("APP_STATISTICSManage.aspx", pid, path, pname);
        }
        int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex+1;
        return "<b>" + numStr + "</b>" +CommonHelper.ShowLinkByPath("APP_STATISTICSManage.aspx", path);
    }
    protected string pid="0";

    APP_STATISTICS valObj = new APP_STATISTICS();
    APP_STATISTICS condObj = new APP_STATISTICS();
    List<APP_STATISTICS> listObj = new List<APP_STATISTICS>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(APP_STATISTICS condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(APP_STATISTICS.Attribute.ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);
                
        listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
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
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP1);
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP2);
        //hideTableColumnList.Add(APP_STATISTICS.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP1);
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP2);
        //hideFindColumnList.Add(APP_STATISTICS.Attribute.EXP3);
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
                                
            txtAPP_STATISTICS_AF_ADDTIME.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<APP_STATISTICS>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new APP_STATISTICS();

        
        
        if(txtAPP_STATISTICS_ID.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.ID, Convert.ToInt32(txtAPP_STATISTICS_ID.Value));
        
        
        if(txtAPP_STATISTICS_AF_ADDTIME.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.AF_ADDTIME, Convert.ToDateTime(txtAPP_STATISTICS_AF_ADDTIME.Value));
        
        
        if(txtAPP_STATISTICS_IP.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.IP, Convert.ToString(txtAPP_STATISTICS_IP.Value));
        
        
        if(txtAPP_STATISTICS_LONG.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.LONG, Convert.ToString(txtAPP_STATISTICS_LONG.Value));
        
        
        if(txtAPP_STATISTICS_LAT.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.LAT, Convert.ToString(txtAPP_STATISTICS_LAT.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_SYS.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_SYS, Convert.ToString(txtAPP_STATISTICS_DEVICE_SYS.Value));
        
        
        if(txtAPP_STATISTICS_VER_CODE.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.VER_CODE, Convert.ToString(txtAPP_STATISTICS_VER_CODE.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_MODEL.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_MODEL, Convert.ToString(txtAPP_STATISTICS_DEVICE_MODEL.Value));
        
        
        if(txtAPP_STATISTICS_STAFF_ID.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.STAFF_ID, Convert.ToDecimal(txtAPP_STATISTICS_STAFF_ID.Value));
        
        
        if(txtAPP_STATISTICS_DEVICE_ID.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.DEVICE_ID, Convert.ToString(txtAPP_STATISTICS_DEVICE_ID.Value));
        
        
        if(txtAPP_STATISTICS_VER_NAME.Value != "" )
            condObj.Like(APP_STATISTICS.Attribute.VER_NAME, Convert.ToString(txtAPP_STATISTICS_VER_NAME.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageSize_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageSize.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<APP_STATISTICS>(hidCondition.Value);
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