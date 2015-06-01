using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Text;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using AgileFrame.Core;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
public partial class sys_MenuInfoEdit : AgileFrame.AppInOne.Common.BasePage
{
    string keyid = "";
    string pid = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (!string.IsNullOrEmpty(Request["id"]))
        {
            if (Request["edit"] != null)
            {
                keyid = Request["id"];
            }
            else
            {
                pid = Request["id"];
            }
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                #region//�޸�ʱ��Ϣ��ʼ��
                SYS_MODULE valObj = BLLTable<SYS_MODULE>.Factory(conn).GetRowData(SYS_MODULE.Attribute.MDL_ID, keyid);
                if (valObj == null)
                {
                    this.btnOK.Enabled = false;
                }
                else
                {
                    txtModuleName.Value = valObj.MDL_NAME;
                    txtSortNum.Value = valObj.SORT_NO.ToString();

                    selState.Value = valObj.USE_FLAG;

                    txtPageUrl.Value = valObj.PAGE_URL;
                    hidPageUrl.Value = valObj.PAGE_URL;

                    rblNeedPower.SelectedValue = valObj.NEED_POWER.ToString();
                    txtREALPAGES.Value = valObj.REAL_PAGES;
                    //txtEN.Value = valObj.EN;
                    int subcount = BLLTable<SYS_MODULE>.Factory(conn).Select(SYS_MODULE.Attribute.P_MDL_ID, valObj.MDL_ID).Count;

                    if (subcount > 0)
                    {
                        rblNeedPower.Enabled = false;
                    }
                }
                #endregion
            }

        }
    }
    protected void btnOK_Click(object sender, EventArgs e)
    {
        #region//���ñ�������
        string gotoUrl = "../../OK.aspx?p=0";//&preUrl=
        if (pid != "")
        {
            gotoUrl += "&PID=" + pid;
        }
        int re = 0;
        string msg ="������¼";
        SYS_MODULE valObj = new SYS_MODULE();
        #endregion

        #region//ʵ������ֵ
        valObj.PAGE_URL = txtPageUrl.Value.ToLower();
        if (keyid == "" && !string.IsNullOrEmpty(valObj.PAGE_URL))
        {
            SYS_MODULE hadObj = BLLTable<SYS_MODULE>.Factory(conn).GetRowData(new SYS_MODULE(), valObj);

            if (hadObj != null) {
                litWarn.Text = "ģ�顰"+hadObj.MDL_NAME + "���Ѿ�ʹ�ô����ӵ�ַ�������븽�Ӳ������硰aaa.aspx?p=1����֤һ��ҳ���ַ��ӦΨһ��ģ�顣";
                return;
            }
        }
        valObj.MDL_NAME = txtModuleName.Value;

        valObj.SORT_NO =Convert.ToInt32(txtSortNum.Value);
        valObj.USE_FLAG = selState.Value;

        valObj.NEED_POWER =rblNeedPower.SelectedValue;
        valObj.REAL_PAGES = txtREALPAGES.Value.ToLower();
        //valObj.EN = txtEN.Value;
        #endregion
                
        #region//ִ���޸Ļ�����
        if (keyid != "")
        {
            valObj.MDL_ID = keyid;
            re = BLLTable<SYS_MODULE>.Factory(conn).Update(valObj, SYS_MODULE.Attribute.MDL_ID);
            if (re > 0)
            {
                if (hidPageUrl.Value != txtPageUrl.Value.ToLower())
                {
                    SYS_MODULE hadCond = new SYS_MODULE();
                    hadCond.PAGE_URL = hidPageUrl.Value;
                    if (!BLLTable<SYS_MODULE>.Exists(hadCond))
                    {
                        SYS_MDLPOWER_DIC dicVal = new SYS_MDLPOWER_DIC();
                        dicVal.PAGE_URL = txtPageUrl.Value.ToLower();

                        SYS_MDLPOWER_DIC dicCond = new SYS_MDLPOWER_DIC();
                        dicCond.PAGE_URL = hidPageUrl.Value;

                        BLLTable<SYS_MDLPOWER_DIC>.Factory(conn).Update(dicVal, dicCond);
                    }
                }
            }
        }
        else
        {

            valObj.P_MDL_ID = pid;

            keyid = new ModuleHelper(conn).GetNewMenuID(pid);
            valObj.MDL_ID = keyid;
            re = BLLTable<SYS_MODULE>.Factory(conn).Insert(valObj);
            if (re > 0 && pid != "")
            {
                SYS_MODULE cond = new SYS_MODULE();
                cond.MDL_ID = pid;
            }
        }
        if (re > 0)
        {
            if (valObj.NEED_POWER == "1")
            {
                //���ĳ���Ӳ˵���Ҫ����Ȩ�ޣ����������и��˵�Ҳ��Ҫ����Ȩ�ޣ������Ӳ˵��޷����ã����BUG
                string pids = "";//01020304
                for (int i = 0; i < keyid.Length - 2; i += 2)
                {
                    if (pids != "")
                    {
                        pids += ",";
                    }
                    pids += keyid.Substring(0, i + 2);
                }
                if (pids != "")
                {
                    SYS_MODULE condUPParent = new SYS_MODULE();
                    SYS_MODULE valUPParent = new SYS_MODULE();
                    valUPParent.NEED_POWER = "1";
                    condUPParent.In(SYS_MODULE.Attribute.MDL_ID, pids);
                    BLLTable<SYS_MODULE>.Factory(conn).Update(valUPParent, condUPParent);
                }
            }
            else {
                //�����ǰ�˵�����Ҫ����Ȩ�ޣ�������������ֵܽڵ��Ƿ���Ҫ����Ȩ�ޣ����������Ҫ���򽫸��˵�����Ϊ����Ҫ����Ȩ��
                string pmenuid = "";//01020304
                SYS_MODULE condhad;
                for (int i = keyid.Length - 2; i>0; i -= 2)
                {
                    pmenuid = keyid.Substring(0, i);
                    condhad = new SYS_MODULE();
                   
                    condhad.Where("MDL_ID like '" + pmenuid + "%' and MDL_ID<>'" + pmenuid + "' and NEED_POWER=1");
                    if (!BLLTable<SYS_MODULE>.Exists(condhad)) {
                        BLLTable<SYS_MODULE>.Factory(conn).Update(SYS_MODULE.Attribute.MDL_ID, pmenuid, SYS_MODULE.Attribute.NEED_POWER, 0);
                    }
                }
            }
        }
        #endregion

        #region//ִ�н������
        if (re > 0)
        {

            if (Request["tree"] != null)
            {
                StringBuilder sb = new StringBuilder("{");
                sb.Append("rid:'").Append(pid).Append("',id:'");
                sb.Append(keyid).Append("',pid:'").Append(pid).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");
                sb.Append(valObj.MDL_NAME).Append("',ntype:'mdl'}");
                if (Request["edit"] == null)
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");", false);
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");", false);
                }
                //if (Request["toEdit"] == null)
                //{

                //    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.addSubNodeForOprPage(\"" + sb.ToString() + "\");location.href='" + gotoUrl + "';", false);
                //}
                //else
                //{
                //    AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.editNodeForOprPage(\"" + sb.ToString() + "\");location.href='" + gotoUrl + "';", false);
                //}
            }
            else
            {
                ScriptHelper.AlertAndGo(Page, msg + "�ɹ���", gotoUrl);
            }
        }
        else
        {
            ScriptHelper.AlertAndGo(Page, msg + "ʧ�ܣ�", gotoUrl);
        }
        #endregion
    }
}

