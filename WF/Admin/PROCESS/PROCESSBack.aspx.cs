using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_PROCESS_TPLBack : AgileFrame.AppInOne.Common.BasePage
{

    int DelPROC(int wfid,int procid,ref string msg)
    {
        WF_STEP_TPL condStep = new WF_STEP_TPL();
        condStep.WFID = wfid;
        condStep.PROCID = procid;
        condStep.STEP_TYPE = 1;
        if (BLLTable<WF_STEP_TPL>.Exists(condStep))
        {
            msg = "{re:0,msg:'���ڲ��裬����ɾ��!'}";
            return 0;
        }
        else {
            WF_PROCESS_TPL delCond = new WF_PROCESS_TPL();
            delCond.WFID = wfid;
            delCond.PROCID = procid;
            msg = "{re:1,msg:'ɾ���ɹ�!'}";
            int re= BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(delCond);
            if (re > 0) {
                WF_STEP_TPL ccc = new WF_STEP_TPL();
                ccc.WFID = wfid;
                ccc.PROCID = procid;
                BLLTable<WF_STEP_TPL>.Factory(conn).Delete(ccc);

                WF_CHECKER_TPL ccc1 = new WF_CHECKER_TPL();
                ccc1.WFID = wfid;
                ccc1.PROCID = procid;
                BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(ccc1);
            }
            return re;
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelPROCID"] != null)
        {
            if (BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.PROCID, Request["DelPROCID"]) == null)
            {

                int re = BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(WF_PROCESS_TPL.Attribute.PROCID, Request["DelPROCID"]);
                if (re > 0)
                {
                    Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
                }
                else
                {
                    Response.Write("ɾ��ʧ�ܣ�");
                }
            }
            else {
                Response.Write("����ɾ����");
            }
        }
        if (Request["DelByKeyID"] != null)
        {
            string msg = "";
            DelPROC(int.Parse(Request["WFID"]), int.Parse(Request["DelByKeyID"]), ref msg);
            Response.Write(msg);
        }

        //���б������ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��������¼
        if (Request["DelKeyIDS"] != null)
        {
            WF_STEP_TPL cond1 = new WF_STEP_TPL();
            cond1.In(WF_STEP_TPL.Attribute.PROCID, Request["DelKeyIDS"]);
            if (!BLLTable<WF_STEP_TPL>.Exists(cond1))
            {

                WF_PROCESS_TPL cond = new WF_PROCESS_TPL();
                cond.In(WF_PROCESS_TPL.Attribute.PROCID, Request["DelKeyIDS"]);
                int re = BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(cond);
                if (re > 0)
                {
                    Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
                }
                else
                {
                    Response.Write("ɾ��ʧ�ܣ�");
                }
            }
            else
            {
                Response.Write("����ɾ����");
            }
        }

        //���û���ϸ��Ϣ�鿴�༭ҳ�棬�㱣��ʱ��ͨ��AJAXִ������ĺ�̨���룬ʵ�ֲ����ֶεĸ���
        if (Request["saveInfo"] != null)
        {
            WF_PROCESS_TPL val = new WF_PROCESS_TPL();
            val.PROCID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_PROCESS_TPL>.Factory(conn).Update(val, WF_PROCESS_TPL.Attribute.PROCID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}