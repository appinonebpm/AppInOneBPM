using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.HR;
public partial class HR_ORGBack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelORG_ID"] != null)
        {
            int re = ORGHelper.DelORG(Request["DelORG_ID"]);// BLLTable<HR_ORG>.Factory(conn).Delete(HR_ORG.Attribute.ORG_ID, Request["DelORG_ID"]);
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
            //HR_ORG cond = new HR_ORG();
            //cond.In(HR_ORG.Attribute.ORG_ID, Request["DelKeyIDS"]);
            int re = ORGHelper.DelORG(Request["DelKeyIDS"]);// BLLTable<HR_ORG>.Factory(conn).Delete(cond);
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
            HR_ORG val = new HR_ORG();
            val.ORG_ID = Request["FieldKeyID"];
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<HR_ORG>.Factory(conn).Update(val, HR_ORG.Attribute.ORG_ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }

        //��ʾ�ӽڵ�
        if (Request["ShowSubNodes"] != null)
        {
            #region
            string pid = Request["id"];
            HR_ORG obj = new HR_ORG();
            HR_ORG val = new HR_ORG();
            obj.P_ORG_ID = pid;

            val.OrderBy(HR_ORG.Attribute.SORT_NO, Order.Asc);

            List<HR_ORG> lst = BLLTable<HR_ORG>.Factory(conn).Select(val, obj);
            if (lst.Count > 0)
            {
                StringBuilder sb = new StringBuilder("[");
                for (int i = 0; i < lst.Count; i++)
                {
                    if (i > 0)
                    {
                        sb.Append(",");
                    }
                    int subcount = BLLTable<HR_ORG>.Factory(conn).Select(HR_ORG.Attribute.P_ORG_ID, lst[i].ORG_ID).Count;

                    sb.Append("{rid:'").Append(lst[i].P_ORG_ID).Append("',id:'").Append(lst[i].ORG_ID.ToString());
                    sb.Append("',pid:'").Append(lst[i].P_ORG_ID.ToString()).Append("',no:").Append(lst[i].SORT_NO);
                    sb.Append(",sc:").Append(subcount.ToString());
                    sb.Append(",name:'").Append(lst[i].ORG_NAME).Append("'}");

                }
                sb.Append("]");
                Response.Write(sb.ToString());
            }



            #endregion
        }
        //ɾ��Ⱥ��
        if (Request["DelNodeID"] != null)
        {
            string keyid = Request["id"];
            int re = BLLTable<HR_ORG>.Factory(conn).Delete(HR_ORG.Attribute.ORG_ID, keyid);
            if (re > 0)
            {
                HR_ORG cond = new HR_ORG();
                cond.ORG_ID = keyid;
            }
            Response.Write(re.ToString());
        }
        //�޸����
        if (Request["UpdateSort"] != null)
        {
            string chgid1 = Request["chgid1"];
            string chgsort1 = Request["chgsort1"].ToString();
            string chgid2 = Request["chgid2"];
            string chgsort2 = Request["chgsort2"].ToString();
            try
            {
                // int re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort1, sys_ModuleInfo.Attribute.ModuleID, chgid1, 1);
                //re=BllTable.UpdateCol(sys_ModuleInfo.Attribute.SortNum, chgsort2, sys_ModuleInfo.Attribute.ModuleID, chgid2, 1);
                int re = BLLTable<HR_ORG>.Factory(conn).Update(HR_ORG.Attribute.ORG_ID, chgid1, HR_ORG.Attribute.SORT_NO, chgsort1);
                re = BLLTable<HR_ORG>.Factory(conn).Update(HR_ORG.Attribute.ORG_ID, chgid2, HR_ORG.Attribute.SORT_NO, chgsort2);

                Response.Write(re.ToString());
            }
            catch
            {
                Response.Write("0");
            }

        }

        Response.End();
    }
}