using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_EDIT_TB : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string theme = "";
    int count = 0;//������Ϣ���淵�ؽ��������0 �ɹ�
    decimal recid = 0;//����ID
    protected string title = "�ύ";//ҳ�����
    protected int wf_obj_id = 0;//����ID
    protected string wfcname = "";
    protected string backUrl = "";//���ص����ӵ�ַ
    /// <summary>
    /// ��ȡ�����õ�ǰ����ʹ�õı��Ƿ�����ϸ��
    /// </summary>
    protected bool hadDetail
    {
        get
        {
            return ViewState["HadDetail"] != null;
        }
        set
        {
            if (value == true)
            {
                ViewState["HadDetail"] = true;
            }
            else
            {
                ViewState["HadDetail"] = null;
            }
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        #region//����Ĳ�����Ϣ��ʼ��
        if (!string.IsNullOrEmpty(Request["RECID"]))
        {
            recid = decimal.Parse(Request["RECID"]);
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wf_obj_id = int.Parse(Request["WFID"]);
            if (wf_obj_id <= 0)
            {
                if (recid <= 0)
                {
                    Response.Redirect("SelWFID.aspx");
                }
                if (ViewState["WFID"] != null)
                {
                    wf_obj_id = Convert.ToInt32(ViewState["WFID"]);
                }
            }
            if (ViewState["WFCNAME"] == null)
            {
                wfcname = BLLTable<WF_WFOBJECT>.Factory(conn).GetOneValue(WF_WFOBJECT.Attribute.WF_OBJ_ID, wf_obj_id, WF_WFOBJECT.Attribute.WF_OBJ_NAME);
                ViewState["WFCNAME"] = wfcname;
            }
            else
            {
                wfcname = ViewState["WFCNAME"].ToString();
            }

        }
        else
        {
            if (recid <= 0)
            {
                Response.Redirect("SelWFID.aspx");
            }
            if (ViewState["WFID"] != null)
            {
                wf_obj_id = Convert.ToInt32(ViewState["WFID"]);
            }
        }
        #endregion

        theme = WebHelper.GetAppPath() + "Themes/" + BasePage._ThemeName;
        backUrl = WebHelper.GetAppPath() + "WF/FORMList.aspx?mime=1&WFID=" + wf_obj_id;
        if (preUrl != "")
        {
            backUrl = preUrl;
        }
        title = wfcname + title;
        if (!IsPostBack)
        {
            Form.Enctype = "multipart/form-data";
            UpFilesBfSubmit1.ShowPathPre = "../";
            UpFilesBfSubmit1.SavePath = "UploadFiles/WF/Rec/";

            txtDEPT_ID.ORG_ID = "7";

            #region//Ĭ����Ϣ��ʼ��
            HR_STAFF staff = userBase.GetStaff();

            //����˻�û��Ա����Ӧ
            if (staff != null && !staff.IsNull())
            {
                txtCSTAFF_ID.Value = staff.STAFF_ID.ToString();
                txtCSTAFF_NAME.Value = staff.STAFF_NAME;

                txtDEPT_ID.DEPT_ID = Convert.ToString(staff.GetValue(HR_DEPT_STAFF.Attribute.DEPT_ID));
                txtSTAFF_ID.Staff_NAME = staff.STAFF_NAME;
                txtSTAFF_ID.Staff_ID = staff.STAFF_ID;

                txtRECNO.Value = WFRecordInfo.GetRECNO(Convert.ToString(staff.GetValue(HR_DEPT_STAFF.Attribute.DEPT_ID)));

                HR_DEPT dept = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, Convert.ToString(staff.GetValue(HR_DEPT_STAFF.Attribute.DEPT_ID)));
                if (dept != null && !dept.IsNull())
                {
                    txtCDEPT_ID.Value = dept.DEPT_ID;
                    txtCDEPT_NAME.Value = dept.DEPT_NAME;
                }
                else
                {
                    litWarn.Text = "�����˻�δ������������";
                }
            }
            else
            {
                litWarn.Text = "�����˻�δ�ж�ӦԱ��";
            }
            #endregion

            ViewState["CHECK_INFO"] = "";

            WFOBJECT_BLL wfobj = new WFOBJECT_BLL(wf_obj_id);

            //WFINFO_EXD wfexd = new WFINFO_EXD(wfid,0);

            FORM_BLL formexd = wfobj.FORM_BLL;
            if (recid > 0)
            {
                #region//������Ϣ�༭
                WF_FORMBASE baseVal = BLLTable<WF_FORMBASE>.Factory(conn).GetRowData(WF_FORMBASE.Attribute.RECID, recid);
                WFRecordInfo recObj = new WFRecordInfo(baseVal, true);
                if (recObj.HadRecord == false)
                {
                    ScriptHelper.AlertAndGo(Page, "��Ҫ�༭�������¼�����ڣ�", backUrl);
                    return;
                }

                if (wf_obj_id <= 0)
                {
                    ViewState["WFID"] = baseVal.WFID;//��¼�µ�ǰ������ID
                    wf_obj_id = baseVal.WFID;
                }

                Dictionary<string, WFieldInfo> dicMore = recObj.ExdFields;
                //zlg�ؼ�-������
                litFormMore.Text = formexd.WF_HtmlEditForm(recObj);// WFHtml.ShowMoreFormHtml(wfid, dicMore, ref sbDetail);
                hadDetail = formexd.HadSubForm;

                ViewState["STATUS"] = baseVal.STATUS;
                if (!string.IsNullOrEmpty(baseVal.CHECK_INFO))
                {
                    ViewState["CHECK_INFO"] = baseVal.CHECK_INFO;
                }

                if (recObj.Base.STATUS == WFEnum.RecStatus.Checking.ToString("d")
                    || recObj.Base.STATUS == WFEnum.RecStatus.ReCheck.ToString("d")
                    || recObj.Base.STATUS == WFEnum.RecStatus.Accepted.ToString("d"))
                {
                    ScriptHelper.AlertAndGo(Page, "�ü�¼�Ѿ������������̣��������޸ģ�", backUrl);
                }
                else
                {
                    if (recObj.Base.STATUS == WFEnum.RecStatus.NoAccept.ToString("d"))
                    {
                        btnOK.Text = "�����ύ";
                    }

                    WF_FORMBASE valObj = recObj.Base;

                    #region

                    txtDEPT_ID.DEPT_NAME = Convert.ToString(valObj.DEPT_NAME);
                    txtDEPT_ID.DEPT_ID = Convert.ToString(valObj.DEPT_ID);//Convert.ToString                
                    txtSTAFF_ID.Staff_ID = valObj.STAFF_ID;

                    txtCSTAFF_ID.Value = Convert.ToString(valObj.CSTAFF_ID);//Convert.ToString                
                    txtCSTAFF_NAME.Value = Convert.ToString(valObj.CSTAFF_NAME);//Convert.ToString                
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString                
                    #endregion

                    if (valObj.STAFF_ID != userBase.StaffID
                        && valObj.CSTAFF_ID != userBase.StaffID)
                    {
                        //�����Լ��ύ�����벻���޸Ļ��ύ����
                        btnSave.Enabled = false;
                    }
                }
                UpFilesBfSubmit1.ShowOldFiles(baseVal.ANNEX_FILE);
                #endregion

            }
            else
            {
                litFormMore.Text = formexd.WF_HtmlEditForm();// WFHtml.ShowMoreFormHtml(wfid, null, ref sbDetail);
                hadDetail = formexd.HadSubForm;
            }
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        WFOBJECT_BLL wfobj = new WFOBJECT_BLL(wf_obj_id);
        Button btn = (Button)sender;//��ǰ�����İ�ť
        //WFINFO_EXD wfExd = new WFINFO_EXD(wfid,0);
        WFRecordInfo recInfo = new WFRecordInfo(wf_obj_id,recid);

        //FORM_BLL wform = wfobj.FORM_BLL;

        WF_FORMBASE valObj = new WF_FORMBASE();
        //WF_FORMDETAIL formDetail = null;
        #region//ͨ�û�����Ϣ��ֵ
        valObj.RECNO = txtRECNO.Value;//����Ψһ

        if (txtDEPT_ID.DEPT_ID != "")
        {
            valObj.DEPT_ID = Convert.ToString(txtDEPT_ID.DEPT_ID);

            HR_DEPT dept = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, valObj.DEPT_ID);
            HR_ORG org = BLLTable<HR_ORG>.Factory(conn).GetRowData(HR_ORG.Attribute.ORG_ID, dept.ORG_ID);
            valObj.ORG_ID = org.ORG_ID;
            valObj.ORG_NAME = org.ORG_NAME;
            valObj.DEPT_NAME = dept.DEPT_NAME;
        }

        if (txtSTAFF_ID.Staff_ID > 0)
        {
            valObj.STAFF_ID = txtSTAFF_ID.Staff_ID;
            valObj.STAFF_NAME = txtSTAFF_ID.Staff_NAME;
        }

        if (txtCSTAFF_ID.Value != "")
        {
            valObj.CSTAFF_ID = Convert.ToDecimal(txtCSTAFF_ID.Value);
            valObj.CDEPT_ID = txtCDEPT_ID.Value;
            valObj.CDEPT_NAME = txtCDEPT_NAME.Value;

            HR_DEPT_STAFF cond = new HR_DEPT_STAFF();
            cond.STAFF_ID = valObj.CSTAFF_ID;
            Relation reldep = new Relation(HR_DEPT_STAFF.Attribute.DEPT_ID, HR_DEPT.Attribute.DEPT_ID);
            Relation relorg = new Relation(HR_ORG.Attribute.ORG_ID, HR_DEPT.Attribute.ORG_ID);

            List<Relation> lstrel = new List<Relation>();
            lstrel.Add(reldep);
            lstrel.Add(relorg);

            List<ITableImplement> lstcond = new List<ITableImplement>();
            lstcond.Add(cond);

            List<HR_ORG> lstOrg = BLLTable<HR_ORG>.Select(new HR_ORG(), lstrel, null, lstcond);

            if (lstOrg.Count > 0)
            {
                valObj.CORG_ID = lstOrg[0].ORG_ID;
                valObj.CORG_NAME = lstOrg[0].ORG_NAME;
            }

        }
        if (txtCSTAFF_NAME.Value != "")
        {
            valObj.CSTAFF_NAME = Convert.ToString(txtCSTAFF_NAME.Value);
        }
        valObj.EDITIME = DateTime.Now;
        valObj.NOTE = txtNOTE.Value;
        valObj.ANNEX_FILE = UpFilesBfSubmit1.GetUpFilesString();

        //if (hadDetail)//������ϸ����������ϸ��ͨ����Ϣ���󲢸�ֵ
        //{
        //    formDetail = new WF_FORMDETAIL();
        //    formDetail.DEPT_ID = valObj.DEPT_ID;
        //    formDetail.DEPT_NAME = valObj.DEPT_NAME;
        //    formDetail.STAFF_ID = valObj.STAFF_ID;
        //    formDetail.STAFF_NAME = valObj.STAFF_NAME;
        //    formDetail.STATUS = "0";
        //    formDetail.DETAIL_NO = "0";
        //}
        #endregion
        if (recid > 0)
        {
            #region//�༭������Ϣ

            valObj.RECID = recid;
            valObj.WFID = wf_obj_id;
            valObj.FORM_PRI_ID = recInfo.Base.FORM_PRI_ID;//��չ���޸ı���ʹ�ô��ֶε�ֵ��*********

            count = wfobj.UpdateRecord(valObj);//��2��ͨ�õ�����Ϣ��ֵ����������չ��Ϣͬʱ���浽���ݿ⡣
            if (count < 0)
            {
                litWarn.Text = "���������Ϣʧ�ܡ�";//��2��������Ϣʧ�ܣ���ʾ����
                return;
            }
            if (hadDetail && hidDetailRows.Value != "")
            {
                int rows = int.Parse(hidDetailRows.Value);//��3���ж��Ƿ�����ϸ��Ϣ�����У�������ϸ��Ϣ�����ݿ⡣
                //formDetail.RECID = recid;
                wfobj.UpdateDetail(valObj, rows);
            }

            //jinsj  ��ȡҳ�澲̬����
            WFOBJECT_BLL wfbll = new WFOBJECT_BLL(wf_obj_id, recid);
            WFRecordInfo recObj = new WFRecordInfo(valObj, true);
            WF_FORMBASE objUp = new WF_FORMBASE();
            objUp.RECID = recid;
            objUp.HTML_TEXT = wfbll.FORM_BLL.WF_HtmlShowForm(recObj);
            BLLTable<WF_FORMBASE>.Factory(conn).Update(objUp, WF_FORMBASE.Attribute.RECID);

            if (btn.ID.IndexOf("btnOK") != -1)//�����ύ���ݣ�������������
            {
                backUrl = WebHelper.GetAppPath() + "WF/Checkers.aspx?Submit=1&WFID=" + wf_obj_id + "&PROCID=" + 0 + "&RECID=" + recid;
            }
            Response.Redirect(backUrl);

            #endregion
        }
        else
        {
            #region//�½�����
            valObj.ADDTIME = DateTime.Now;
            valObj.RECNAME = "[" + userBase.StaffName + "]" + wfcname + valObj.ADDTIME.ToString("yyyyMMddHHmm");
            valObj.WFID = wf_obj_id;
            valObj.PROCID = 0;
            valObj.CHECK_INFO = "";
            valObj.CHECKERS = "";
            valObj.STATUS = WFEnum.RecStatus.Submit.ToString("d");
            //AgileFrame.Orm.PersistenceLayer.DAL.Base.Runtime_PersistenceLayer.RefreshRuntime_PersistenceLayer();
            count = wfobj.InsertRecord(valObj);//��1��ͨ�õ�����Ϣ��ֵ����������չ��Ϣͬʱ���浽���ݿ�
            if (count <= 0)
            {
                litWarn.Text = "������Ϣ����ʧ�ܣ�����ϵ����Ա��";//��1��������Ϣʧ�ܣ���ʾ
                return;
            }
            recid = valObj.RECID;
            if (hadDetail && hidDetailRows.Value != "")//��2���ж��Ƿ�����ϸ��Ϣ�����У�������ϸ��Ϣ�����ݿ⡣
            {
                int rows = int.Parse(hidDetailRows.Value);
                //formDetail.RECID = recid;
                wfobj.InsertDetail(valObj, rows);
            }

            //jinsj  ��ȡҳ�澲̬����
            WFOBJECT_BLL wfbll = new WFOBJECT_BLL(wf_obj_id, recid);
            WFRecordInfo recObj = new WFRecordInfo(valObj, true);
            WF_FORMBASE objUp = new WF_FORMBASE();
            objUp.RECID = recid;
            objUp.HTML_TEXT = wfbll.FORM_BLL.WF_HtmlShowForm(recObj);
            BLLTable<WF_FORMBASE>.Factory(conn).Update(objUp, WF_FORMBASE.Attribute.RECID);

            if (btn.ID.IndexOf("btnOK") != -1)
            {
                string err = "";
                //bool ck = wfobj.WF_CheckStepChecker(recid, out err);
                bool ck = true;
                if (ck == false)
                {
                    ScriptHelper.AlertAndGo(Page, err + " �޷��ύ��", "FormList.aspx?mine=1&WFID=" + wf_obj_id);
                }
                else
                {
                    string chckerUrl = WebHelper.GetAppPath() + "WF/Checkers.aspx?Submit=1&WFID=" + wf_obj_id + "&RECID=" + recid;
                    Response.Redirect(chckerUrl, false);//��6��ת��������ѡ��ҳ��
                }
            }
            else
            {
                if (recid > 0)
                {
                    Response.Redirect(backUrl);//��3����ת��ԭ����ҳ�档
                }
                else
                {
                    AgileFrame.Core.ScriptHelper.Alert(Page, "����ʧ�ܣ�");
                }
            }
            #endregion
        }
    }
}
