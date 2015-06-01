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
using System.Text;
using AgileFrame.Common;
using AgileFrame.Orm.TemplateEngine;

public partial class WEC_REQUESTSel : BaseAdminPage
{
    #region ģ�弯
    string Finder = @"<!--Switch-->
                    <!--Case InputString-->
                       <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' ck='{len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}' />
                    <!--Case SmallText-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case Text-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <select name='{�ֶοؼ���}' id='{�ֶοؼ���}'>
                        {�ֶ�ֵ}
                    </select>
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                        <input class='sel' onclick='sel(""{����ĸ��д��������}"");' value='{�ֶ�ֵ}' type='button' />
                        <!--���Ӹýű��� /Lib/JScript/Seljs.js,���Ӹ�ҳ /SelectObj/Sel/{����ĸ��д��������}_Sel.aspx-->
                    <!--Case CheckBoxList-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='checkbox' value='{�ֶ�ֵ}' class='ckb' />
                    <!--Case RadioBoxList-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='radio' value='{�ֶ�ֵ}' class='ckb' />
                    <!--Case InputDateTime-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)' value='{�ֶ�ֵ}' />
                    <!--Case InputDate-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)' value='{�ֶ�ֵ}' />
                    <!--Case FileUpUpDoc-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case InputPassWord--> 
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='password' value='{�ֶ�ֵ}'>
                <!--EndSwitch-->";

    #endregion ģ�弯
    /// <summary>
    /// ����html
    /// </summary>
    /// <returns></returns>
    protected string getFinder()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
            {
                //���������и�ֵ
                if (finderObj.IsNotNull())
                {
                    AttributeItem attr1 = new AttributeItem(f1);
                    if (finderObj.GetInitialized(attr1))
                        f1.Value = Convert.ToString(finderObj.GetValue(attr1));
                }
                string attrHtml = Finder;
                BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                b1.ParseForSwitch��ǩ(ref attrHtml, f1);
                sb.Append("<dl><dt>").Append(f1.Desc.ZhName).Append("��</dt><!--").Append(f1.FieldName)
                    .Append("--><dd><span>");
                sb.Append(attrHtml);
                sb.Append("</span></dd></dl>");
            }
        }
        catch (Exception ex)
        {
            Cs.Error("34" + ex.ToString());
        }
        return sb.ToString();
    }
    protected string showLeftLinks(string path, string pname)
    {
        //�༶���ݱ�ҳ����õ�
        if (litPathLink.Text == "")
        {
            litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTSel.aspx", pid, path, pname);
        }
        return CommonHelper.ShowLinkByPath("WEC_REQUESTSel.aspx", path);
    }
    protected string pid = "0";//�༶���ݱ�ҳ����õ��˱���

    WEC_REQUEST valObj = new WEC_REQUEST();
    WEC_REQUEST condObj = new WEC_REQUEST();
    //��������
    protected WEC_REQUEST finderObj = new WEC_REQUEST();
    List<WEC_REQUEST> listObj = new List<WEC_REQUEST>();
    int recount = -1;
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        #region//Ĭ�����ص���
        //hideTableColumnList = new List<AttributeItem>();
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideTableColumnList.Add(WEC_REQUEST.Attribute.EXP3);
        //valObj.LoadAllAttributes(true);//��ʱ�Ӵ˴��룬�Ժ��ܸ��½�����Ҫ
        //valObj.Remove(hideTableColumnList);

        //hideFindColumnList = new List<AttributeItem>();
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP1);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP2);
        //hideFindColumnList.Add(WEC_REQUEST.Attribute.EXP3);
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
                listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
                condObj = JsonServiceBase.FromJson<WEC_REQUEST>(hidCondition.Value);
            }
            listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, aspPager.CurrentPageIndex, ref recount);

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
            condObj = new WEC_REQUEST();

            
            
            //if(txtTID.Value !="" )
            //    condObj.Like(WEC_REQUEST.Attribute.TID, Convert.ToDecimal(txtTID.Value));
            
            
            //if(txtAID.Value !="" )
            //    condObj.Like(WEC_REQUEST.Attribute.AID, Convert.ToDecimal(txtAID.Value));
            
            
            //if(txtKEYWORD.Value !="" )
            //    condObj.Like(WEC_REQUEST.Attribute.KEYWORD, Convert.ToString(txtKEYWORD.Value));
            
            
            //if(txtMATCH_TYPE.Value !="" )
            //    condObj.MATCH_TYPE = Convert.ToInt32(txtMATCH_TYPE.Value);
            
            
            //if(txtMEMO.Value !="" )
            //    condObj.Like(WEC_REQUEST.Attribute.MEMO, Convert.ToString(txtMEMO.Value));
            
            
            //if(txtKIND.Value !="" )
            //    condObj.KIND = Convert.ToInt32(txtKIND.Value);
            
            
            //if(txtSTATUS.Value !="" )
            //    condObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            //if(txtADDTIME.Value !="" )
            //    condObj.Like(WEC_REQUEST.Attribute.ADDTIME, Convert.ToDateTime(txtADDTIME.Value));

            listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
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
        //WEC_REQUEST valObj = BLLTable<WEC_REQUEST>.GetRowData(WEC_REQUEST.Attribute.TID, pid);
        //litPathLink.Text = CommonHelper.GetPathLinks("WEC_REQUESTSel.aspx", pid, valObj.PATH, valObj.PNAME);
        //a_top.Visible = true;
        //condObj.PID = decimal.Parse(pid);
        #endregion

        listObj = BLLTable<WEC_REQUEST>.SelectByPage(valObj, condObj, aspPager.PageSize, 1, ref recount);
        repCus.DataSource = listObj;
        repCus.DataBind();
    }
}
