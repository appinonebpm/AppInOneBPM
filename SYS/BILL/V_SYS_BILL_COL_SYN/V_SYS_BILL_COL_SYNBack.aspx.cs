using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class V_SYS_BILL_COL_SYNBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelCOL_SYNID"] != null)
        {
            int re = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).Delete(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, Request["DelCOL_SYNID"]);
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
            V_SYS_BILL_COL_SYN cond = new V_SYS_BILL_COL_SYN();
            cond.In(V_SYS_BILL_COL_SYN.Attribute.COL_SYNID, Request["DelKeyIDS"]);
            int re = BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).Delete(cond);
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
            V_SYS_BILL_COL_SYN val = new V_SYS_BILL_COL_SYN();
            val.COL_SYNID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<V_SYS_BILL_COL_SYN>.Factory(conn).Update(val, V_SYS_BILL_COL_SYN.Attribute.COL_SYNID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}