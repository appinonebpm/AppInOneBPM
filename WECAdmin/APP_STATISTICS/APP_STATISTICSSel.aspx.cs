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

public partial class APP_STATISTICSSel : BaseAdminPage
{
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("APP_STATISTICSSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("APP_STATISTICSSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    APP_STATISTICS valObj = new APP_STATISTICS();
    APP_STATISTICS condObj = new APP_STATISTICS();
    List<APP_STATISTICS> listObj = new List<APP_STATISTICS>();
    int recount = -1;
    protected string title = "";
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
                listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<APP_STATISTICS>(hidCondition.Value);
            }
            listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new APP_STATISTICS();

            
            
            if(txtAPP_STATISTICS_ID.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.ID, Convert.ToInt32(txtAPP_STATISTICS_ID.Value));
            
            
            if(txtAPP_STATISTICS_AF_ADDTIME.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.AF_ADDTIME, Convert.ToDateTime(txtAPP_STATISTICS_AF_ADDTIME.Value));
            
            
            if(txtAPP_STATISTICS_IP.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.IP, Convert.ToString(txtAPP_STATISTICS_IP.Value));
            
            
            if(txtAPP_STATISTICS_LONG.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.LONG, Convert.ToString(txtAPP_STATISTICS_LONG.Value));
            
            
            if(txtAPP_STATISTICS_LAT.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.LAT, Convert.ToString(txtAPP_STATISTICS_LAT.Value));
            
            
            if(txtAPP_STATISTICS_DEVICE_SYS.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.DEVICE_SYS, Convert.ToString(txtAPP_STATISTICS_DEVICE_SYS.Value));
            
            
            if(txtAPP_STATISTICS_VER_CODE.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.VER_CODE, Convert.ToString(txtAPP_STATISTICS_VER_CODE.Value));
            
            
            if(txtAPP_STATISTICS_DEVICE_MODEL.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.DEVICE_MODEL, Convert.ToString(txtAPP_STATISTICS_DEVICE_MODEL.Value));
            
            
            if(txtAPP_STATISTICS_STAFF_ID.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.STAFF_ID, Convert.ToDecimal(txtAPP_STATISTICS_STAFF_ID.Value));
            
            
            if(txtAPP_STATISTICS_DEVICE_ID.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.DEVICE_ID, Convert.ToString(txtAPP_STATISTICS_DEVICE_ID.Value));
            
            
            if(txtAPP_STATISTICS_VER_NAME.Value !="" )
                condObj.Like(APP_STATISTICS.Attribute.VER_NAME, Convert.ToString(txtAPP_STATISTICS_VER_NAME.Value));

            listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //APP_STATISTICS valObj = BLLTable<APP_STATISTICS>.Factory(conn).GetRowData(APP_STATISTICS.Attribute.ID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("APP_STATISTICSSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<APP_STATISTICS>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
