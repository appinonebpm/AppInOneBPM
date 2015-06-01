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
using AgileFrame.AppInOne.WF;
using AgileFrame.AppInOne.SYS;
public partial class WF_INFOBack : AgileFrame.AppInOne.Common.BasePage
{
    int delWFINFO(string wfid,out string msg)
    {
        msg = "";
        WF_STEP_TPL ccc1 = new WF_STEP_TPL();
        ccc1.WFID = int.Parse(wfid);
        ccc1.STEP_TYPE = 1;
        if (BLLTable<WF_STEP_TPL>.Exists(ccc1))
        {
            msg = "���ڲ��裬����ɾ����";
            return 0;
        }
        WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, wfid);

        int re = BLLTable<WF_INFO>.Factory(conn).Delete(WF_INFO.Attribute.WFID, wfid);
        if (re > 0)
        {
            BLLTable<WF_PROCESS>.Factory(conn).Delete(WF_PROCESS.Attribute.WFID, wfid);
            BLLTable<WF_PROCESS_TPL>.Factory(conn).Delete(WF_PROCESS_TPL.Attribute.WFID, wfid);

            BLLTable<WF_STEP>.Factory(conn).Delete(WF_STEP.Attribute.WFID, wfid);
            BLLTable<WF_STEP_TPL>.Factory(conn).Delete(WF_STEP_TPL.Attribute.WFID, wfid);

            BLLTable<WF_CHECKER>.Factory(conn).Delete(WF_CHECKER.Attribute.WFID, wfid);
            BLLTable<WF_CHECKER_TPL>.Factory(conn).Delete(WF_CHECKER_TPL.Attribute.WFID, wfid);

            BLLTable<WF_PROCVAR>.Factory(conn).Delete(WF_PROCVAR.Attribute.WFID, wfid);
            BLLTable<WF_PROCVAR_TPL>.Factory(conn).Delete(WF_PROCVAR_TPL.Attribute.WFID, wfid);

            BLLTable<WF_STEPATH>.Factory(conn).Delete(WF_STEPATH.Attribute.WFID, wfid);
            BLLTable<WF_STEPATH_TPL>.Factory(conn).Delete(WF_STEPATH_TPL.Attribute.WFID, wfid);

            //jinshenjian 
            BLLTable<WF_WFOBJECT>.Factory(conn).Delete(WF_WFOBJECT.Attribute.WFID_SRC, wfid);
            //jinshenjian 
    
            WFCOMMON_DAL.DelWFTable(wf.WFID);
        }
        return re;
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelWFCID"] != null)
        {
            //WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
            string msg = "";
            int re = delWFINFO(Request["DelWFCID"],out msg);// BLLTable<WF_INFO>.Factory(conn).Delete(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
            if (re > 0)
            {
                Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
            }
            else
            {
                Response.Write("ɾ��ʧ�ܣ�");
            }
        }

        if (Request["DelByKeyID"] != null)
        {
            string msg = "ɾ���������ɹ�";
            int re = delWFINFO(Request["DelByKeyID"],out msg);
            if (re > 0)
            {
                Response.Write("{re:1,msg:'" + msg + "'}");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
            }
            else
            {
                Response.Write("{re:0,msg:'" + msg + "'}");
            }
        }
        //���б������ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��������¼
        if (Request["DelKeyIDS"] != null)
        {
            string[] arr = StringHelper.GetStringArray(Request["DelKeyIDS"], ',');
            int re = 0;
            string msg = "ɾ���������ɹ�";
            for (int i = 0; i < arr.Length; i++)
            {
                string mmm = "";
                re += delWFINFO(arr[i], out mmm);
                msg += mmm;
            }
            //WF_INFO cond = new WF_INFO();
            //cond.In(WF_INFO.Attribute.WFID, Request["DelKeyIDS"]);
            //int re = BLLTable<WF_INFO>.Factory(conn).Delete(cond);
            if (re > 0)
            {
                //WF_INFO wf = BLLTable<WF_INFO>.Factory(conn).GetRowData(WF_INFO.Attribute.WFID, Request["DelWFCID"]);
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
            WF_INFO val = new WF_INFO();
            val.WFID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<WF_INFO>.Factory(conn).Update(val, WF_INFO.Attribute.WFID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}