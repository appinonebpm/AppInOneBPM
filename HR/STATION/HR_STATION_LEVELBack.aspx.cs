using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class HR_STATION_LEVELBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelLEVEL_ID"] != null)
        {
            int re = BLLTable<HR_STATION_LEVEL>.Delete(HR_STATION_LEVEL.Attribute.LEVEL_ID, Request["DelLEVEL_ID"]);
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
            HR_STATION_LEVEL cond = new HR_STATION_LEVEL();
            cond.In(HR_STATION_LEVEL.Attribute.LEVEL_ID, Request["DelKeyIDS"]);
            int re = BLLTable<HR_STATION_LEVEL>.Delete(cond);
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
            HR_STATION_LEVEL val = new HR_STATION_LEVEL();
            val.LEVEL_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<HR_STATION_LEVEL>.Update(val, HR_STATION_LEVEL.Attribute.LEVEL_ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}