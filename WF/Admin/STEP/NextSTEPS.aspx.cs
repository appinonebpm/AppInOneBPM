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
using AgileFrame.AppInOne.WF;
public partial class WF_NEXTSTEP_TPLSel : AgileFrame.AppInOne.Common.BaseAdminPage
{

    WF_STEPATH_TPL valObj = new WF_STEPATH_TPL();
    WF_STEPATH_TPL condObj = new WF_STEPATH_TPL();
    //���ڽڵ�
    List<WF_STEPATH_TPL> listObj = new List<WF_STEPATH_TPL>();
    List<WF_STEPATH_TPL> listObj1 = new List<WF_STEPATH_TPL>();
    List<WF_STEPATH_TPL> listObj2 = new List<WF_STEPATH_TPL>();
    List<WF_STEPATH_TPL> listObj3 = new List<WF_STEPATH_TPL>();
    //��ڽڵ�
    List<WF_STEPATH_TPL> listObj0 = new List<WF_STEPATH_TPL>();

    protected string title = "";
    protected int procid = 0;
    protected int stepid = 362;
    protected int wfid = 0;

    WF_STEP_TPL step1 = new WF_STEP_TPL();
    //
    protected string getUrl(int PreID, int NextID)
    {
        return "PROCID=" + procid + "&WFID=" + wfid + "&setpSetting=" + DateTime.Now.Ticks + "&NextID="
            + NextID + "&STEP_ID=" + PreID + "&from=2&PATH_TYPE=1";
    }
    //
    protected string getUrl(int NextID)
    {
        return "PROCID=" + procid + "&WFID=" + wfid + "&setpSetting=" + DateTime.Now.Ticks + "&NextID="
            + NextID + "&STEP_ID=" + stepid + "&from=2&PATH_TYPE=1";
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            procid = int.Parse(Request["PROCID"]);
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
        }
        if (Request["STEP_ID"] != null)
        {
            stepid = int.Parse(Request["STEP_ID"]);
        }
        title = "��̽ڵ�";
        Page.Title = title;
        if (!IsPostBack)
        {

            MemCacheSerivce.SetVersion(WF_PROCESS_EXD_TPL.getTableName(procid));

            WFSTEP_EXD_TPL step = WF_PROCESS_EXD_TPL.GetWFSTEP_EXD(procid, stepid);

            //����
            listObj = step.WF_STEPATH_Out;

            foreach (WF_STEPATH_TPL tp1 in listObj)
            {
                //�����-ͨ����
                if (tp1.PATH_TYPE == 1)
                    listObj1.Add(tp1);
                else if (tp1.PATH_TYPE == 2)//��ת��
                    listObj2.Add(tp1);
                else if (tp1.PATH_TYPE == 3)//�ٳ���-�˻���
                    listObj3.Add(tp1);
            }

            rep1.DataSource = listObj1;
            rep1.DataBind();
            rep2.DataSource = listObj2;
            rep2.DataBind();
            rep3.DataSource = listObj3;
            rep3.DataBind();

            rep0.DataSource = step.WF_STEPATH_In;
            rep0.DataBind();

            //·�� �� �������� //zlg
            step1 = BLLTable<WF_STEP_TPL>.GetRowData(WF_STEP_TPL.Attribute.STEP_ID, stepid);
            {
                txtCONDITION.Value = step1.CONDITION;// ����:[{0:��},{1:��},{2:ͨ������},{3:�Զ��幫ʽ(&&||)}]
                txtFORMULAR.Value = step1.FORMULAR;// ��ʽ
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        WF_STEP_TPL cond1 = new WF_STEP_TPL();
        step1.WFID = wfid;
        step1.PROCID = procid;
        step1.STEP_ID = stepid;
        WF_STEP_TPL vvv1 = new WF_STEP_TPL();
        vvv1.CONDITION = txtCONDITION.Value;
        //zlg ����������ʽ
        //if (vvv.NEXT_REAL == "2")
        vvv1.FORMULAR = txtFORMULAR.Value;
        int ret = BLLTable<WF_STEP_TPL>.Factory(conn).Update(vvv1, cond1);
        if (ret > 0)
        {
            litWarn.Text = "������������ɹ���" + DateTime.Now.ShowTime();
        }
        else
        {
            litWarn.Text = "�����������ʧ�ܣ�" + DateTime.Now.ShowTime();
        }

        ////û�б�Ҫ��
        //WF_STEPATH_TPL cond = new WF_STEPATH_TPL();
        //cond.WFID = wfid;
        //cond.PROCID = procid;
        //cond.STEP_ID = stepid;
        //WF_STEPATH_TPL vvv = new WF_STEPATH_TPL();
        //vvv.NEXT_REAL = txtCONDITION.Value;
        ////zlg ����������ʽ
        ////if (vvv.NEXT_REAL == "2")
        //    vvv.CONDITION = txtFORMULAR.Value;
        //int ret1 = BLLTable<WF_STEPATH_TPL>.Factory(conn).Update(vvv, cond);
        //if (ret1 > 0)
        //{
        //    litWarn.Text = "������������ɹ���" + DateTime.Now.ShowTime();
        //}
        //else
        //{
        //    litWarn.Text = "�����������ʧ�ܣ�" + DateTime.Now.ShowTime();
        //}
    }
}
