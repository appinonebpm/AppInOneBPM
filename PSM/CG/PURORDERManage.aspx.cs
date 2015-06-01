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
public partial class IM_PURORDERManage:BaseAdminPage
{
     protected string showLeftLinks(string path, string pname)
    {   
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("PURORDERManage.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("PURORDERManage.aspx", path);
    }
    protected string pid="0";

    IM_PURORDER valObj = new IM_PURORDER();
    IM_PURORDER condObj = new IM_PURORDER();
    List<IM_PURORDER> listObj = new List<IM_PURORDER>();
    int recount = -1;//��ѯ�ܼ�¼��
    protected string title = "";
    private void BindList(IM_PURORDER condObj, int curPage)
    {
        if (condObj.af_PageByAttributeItem == null)//����������û�����ķ�ҳ�������ԣ�����������������
            condObj.af_PageBy(IM_PURORDER.Attribute.PORD_ID, Order.Desc);
        
        #region//����Ȩ������
       
        #endregion
        //condObj.PID = decimal.Parse(pid);

        listObj = BLLTable<IM_PURORDER>.Factory(conn).SelectByPage(valObj, condObj, aspPager.PageSize, curPage, ref recount);        
        repList.DataSource = listObj;
        repList.DataBind();
        aspPager.RecordCount = recount;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���//zlg ���� ShowAttributeItemList��δ��������ڹ�ϵ����������� HideAttributeItemList
        hideTableColumnList = new List<AttributeItem>();
        hideTableColumnList.Add(IM_PURORDER.Attribute.EXP1);
        hideTableColumnList.Add(IM_PURORDER.Attribute.EXP2);
        hideTableColumnList.Add(IM_PURORDER.Attribute.EXP3);
        valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        valObj.Remove(hideTableColumnList.ToArray());

        //��ʱ����������
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
            aspPager.ShowInputBox = AgileFrame.Core.WebSystem.ShowInputBox.Auto;//WebCtrls.
            txtPageNum.Value = "30";
            aspPager.PageSize = 30;
            if (pid == "" || pid == "0")
            {
                a_top.Visible = false;
            }
            #endregion
            #region//���ݳ�ʼ��
                                
            txtC_DATE.Value = "";//Convert.ToDateTime(DateTime.Now);                    
            txtARRIVAL_DATE.Value = "";//Convert.ToDateTime(DateTime.Now);
            #endregion

            BindList(condObj, 1);            

        }
    }

    protected void aspPager_PageChanged(object sender, EventArgs e)
    {
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_PURORDER>(hidCondition.Value);
        }
        BindList(condObj, aspPager.CurrentPageIndex);
    }
    protected void btnFind_Click(object sender, EventArgs e)
    {                      
        condObj = new IM_PURORDER();

        
        
        if(txtPORD_ID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.PORD_ID, Convert.ToDecimal(txtPORD_ID.Value));
        
        
        if(txtPORD_NO.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.PORD_NO, Convert.ToString(txtPORD_NO.Value));
        
        
        if(txtC_DATE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.C_DATE, Convert.ToDateTime(txtC_DATE.Value));
        
        
        if(txtORG_ID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.ORG_ID, Convert.ToString(txtORG_ID.Value));
        
        
        if(txtDEPT_ID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.DEPT_ID, Convert.ToString(txtDEPT_ID.Value));
        
        
        if(txtSUP_ID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.SUP_ID, Convert.ToDecimal(txtSUP_ID.Value));
        
        
        if(txtPERSON_HID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.PERSON_HID, Convert.ToDecimal(txtPERSON_HID.Value));
        
        
        if(txtTS_NO.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.TS_NO, Convert.ToString(txtTS_NO.Value));
        
        
        if(txtGOODES_NUM.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.GOODES_NUM, Convert.ToDecimal(txtGOODES_NUM.Value));
        
        
        if(txtARRIVAL_DATE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.ARRIVAL_DATE, Convert.ToDateTime(txtARRIVAL_DATE.Value));
        
        
        if(txtPACKAGE_TYPE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.PACKAGE_TYPE, Convert.ToString(txtPACKAGE_TYPE.Value));
        
        
        if(txtTS_DEPT.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.TS_DEPT, Convert.ToString(txtTS_DEPT.Value));
        
        
        if(txtPHONE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.PHONE, Convert.ToString(txtPHONE.Value));
        
        
        if(txtCOST_PEICE_FLAG.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.COST_PEICE_FLAG, Convert.ToString(txtCOST_PEICE_FLAG.Value));
        
        
        if(txtSTOR_ID.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.STOR_ID, Convert.ToDecimal(txtSTOR_ID.Value));
        
        
        if(txtDEDUCTION_RATE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.DEDUCTION_RATE, Convert.ToDecimal(txtDEDUCTION_RATE.Value));
        
        
        if(txtTAX_RATE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.TAX_RATE, Convert.ToDecimal(txtTAX_RATE.Value));
        
        
        if(txtCREATER.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.CREATER, Convert.ToString(txtCREATER.Value));
        
        
        if(txtCHECKER.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.CHECKER, Convert.ToString(txtCHECKER.Value));
        
        
        if(txtNOTE.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.NOTE, Convert.ToString(txtNOTE.Value));
        
        
        if(txtREMARK.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.REMARK, Convert.ToString(txtREMARK.Value));
        
        
        if(txtEXP1.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.EXP1, Convert.ToString(txtEXP1.Value));
        
        
        if(txtEXP2.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.EXP2, Convert.ToString(txtEXP2.Value));
        
        
        if(txtEXP3.Value !="" )
            condObj.Like(IM_PURORDER.Attribute.EXP3, Convert.ToString(txtEXP3.Value));

        hidCondition.Value = condObj.ToJson(20);

        BindList(condObj, 1);
    }

    protected void btnSetPageNum_Click(object sender, EventArgs e)
    {
        aspPager.PageSize = int.Parse(txtPageNum.Value);
        if (hidCondition.Value != "")
        {
            condObj = JsonServiceBase.FromJson<IM_PURORDER>(hidCondition.Value);
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