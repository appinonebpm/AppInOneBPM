using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class WF_NOTIFIER_TPLBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["SetToStep"] != null)
        {
            string ids = Request["SetToStep"];
            int stepid = int.Parse(Request["StepID"]);

            WF_STEP_TPL step= BLLTable<WF_STEP_TPL>.Factory(conn).GetRowData(WF_STEP_TPL.Attribute.STEP_ID,stepid);

           

            HR_STAFF cond = new HR_STAFF();
            cond.In(HR_STAFF.Attribute.STAFF_ID,ids);
            List<HR_STAFF> lst = BLLTable<HR_STAFF>.Factory(conn).Select(new HR_STAFF(), cond);
            for (int i = 0; i < lst.Count; i++) {
                WF_NOTIFIER_TPL val = new WF_NOTIFIER_TPL();
                val.WFID = step.WFID;
                val.PROCID = step.PROCID;
                val.STEP_ID = stepid;
                val.STAFF_ID = lst[i].STAFF_ID.ToString();
                if (!BLLTable<WF_NOTIFIER_TPL>.Exists(val))
                {
                    val.NOTIFIER_TYPE = "1";

                    val.CONDITION = "";
                    val.FORMULAR = "";
                    val.STAFF_NAME = lst[i].STAFF_NAME;
                    val.STATUS = "1";
                    BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Insert(val, WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID);
                }
            }
            WF_NOTIFIER_TPL delObj1=new WF_NOTIFIER_TPL();
             delObj1.WFID = step.WFID;
                delObj1.PROCID = step.PROCID;
                delObj1.STEP_ID = stepid;
            delObj1.STEP_ID=stepid;
            if (BLLTable<WF_NOTIFIER_TPL>.Count(delObj1) > lst.Count)
            {
                WF_NOTIFIER_TPL delOld = new WF_NOTIFIER_TPL();
                delOld.WFID = step.WFID;
                delOld.PROCID = step.PROCID;
                delOld.STEP_ID = stepid;
                delOld.NOTIFIER_TYPE = "1";
                delOld.Where("STAFF_ID not in(" + ids + ")");
                BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Delete(delOld);
            }
        }
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelNOTIFIER_ID"] != null)
        {
            int re = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Delete(WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID, Request["DelNOTIFIER_ID"]);
            if (re > 0)
            {
                Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
            }
            else
            {
                Response.Write("ɾ��ʧ�ܣ�");
            }
        }

        //���б������ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��������¼
        if (Request["DelKeyIDS"] != null)
        {
            WF_NOTIFIER_TPL cond = new WF_NOTIFIER_TPL();
            cond.In(WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID, Request["DelKeyIDS"]);
            int re = BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
            }
            else
            {
                Response.Write("ɾ��ʧ�ܣ�");
            }
        }

        //���û���ϸ��Ϣ�鿴�༭ҳ�棬�㱣��ʱ��ͨ��AJAXִ������ĺ�̨���룬ʵ�ֲ����ֶεĸ���
        if (Request["saveInfo"] != null)
        {
            WF_NOTIFIER_TPL val = new WF_NOTIFIER_TPL();
            val.NOTIFIER_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_NOTIFIER_TPL>.Factory(conn).Update(val, WF_NOTIFIER_TPL.Attribute.NOTIFIER_ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}