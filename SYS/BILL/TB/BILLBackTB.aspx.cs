using System;
using System.Collections.Generic;
using System.Text;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Common;
using AgileFrame.AppInOne.Common;
public partial class SYS_BILLBackTB : BasePage
{
    string InMTable(string tbs, string tbname)
    {
        string dev = ".";
        string[] arr = StringHelper.GetStringArray(tbs, ',');
        if (arr != null)
        {
            for (int i = 0; i < arr.Length; i++)
            {
                string[] aaa = arr[i].Split('.');
                if (aaa.Length > 2)
                {
                    if (aaa[2] == tbname)
                    {
                        dev = aaa[0]+"."+aaa[1];
                        break;
                    }
                }
                else {
                    if (aaa[1] == tbname)
                    {
                        dev = aaa[0] + "." + aaa[1];
                        break;
                    }
                }
            }
        }
        return dev;
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        string dev1 = null;
        if (Request["DEV2"] != null)
        {
            dev1 = Request["DEV2"];            
        }
        
        #region////��ʾ�ӽڵ�
        if (Request["getSubNodes"] != null)
        {
            string nodetype = Request["ntype"];
            StringBuilder sb = new StringBuilder("[");
            string id = Request["id"];
            DataBase m_db = null;
            if (dev1 == null)
                m_db = DataBase.Factory(conn);
            else
                m_db = DataBase.Factory(BillBase.GetConnByDevKey(dev1));
            if (nodetype == "bill-root")
            {
                #region
                m_db.Load(true);
                DataBaseTableCollection lst = m_db.DataTables;
                
                if (lst != null)
                {
                    for (int i = 0; i < lst.Count; i++)
                    {
                        if (lst[i].TableName.IndexOf("WF_U") != -1 || lst[i].TableName.Substring(0,2)=="Z_")
                        {
                            continue;
                        }
                        string dev = ".";
                        if (Request["tbs"] != null)
                        {
                            dev=InMTable(Request["tbs"], lst[i].TableName);
                            if (dev==".")
                            {
                                continue;
                            
                            }
                            //if (Request["tbs"].IndexOf(lst[i].TableName)== -1)
                            //{
                            //    continue;
                            //}
                        }
                        if (sb.Length > 2)
                        {
                            sb.Append(",");
                        }
                        string[] arr = dev.Split('.');
                        sb.Append("{id:'").Append(lst[i].TableName);
                        sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
                        sb.Append(",sc:").Append("1,dev:'" + arr[0] + "',tb:'"+arr[1]+"'");
                        sb.Append(",name:'").Append(lst[i].TableName).Append("',note:'[" + lst[i].Desc.ZhName + "]'").Append(",ntype:'bill'}");
                    }
                }
                #endregion
            }
            if (nodetype == "bill")
            {
                #region
                if (m_db.DataTables.Contains(id))
                {
                    DataBaseTable tb = m_db.DataTables[id];

                    DataBaseFieldCollection lst = tb.DataFields;
                    if (lst.Count > 0)
                    {
                        for (int i = 0; i < lst.Count; i++)
                        {
                            if (sb.Length > 2)
                            {
                                sb.Append(",");
                            }
                            sb.Append("{id:'").Append(lst[i].FieldName.ToString());
                            sb.Append("',pid:'").Append(id).Append("',no:").Append("1");
                            sb.Append(",sc:").Append("0,dev:'" + Request["dev"] + "',tb:'" + Request["tb"] + "'");
                            sb.Append(",name:'").Append(lst[i].FieldName).Append("',note:'[" + lst[i].Desc.ZhName + "]'").Append(",ntype:'col'}");
                            //&#60; &#62; <>
                        }

                    }
                }
                #endregion
            }
            //sb.Append("{id:'").Append("1");
            //sb.Append("',pid:'").Append("0").Append("',no:").Append("1");
            //sb.Append(",sc:").Append("1");
            //sb.Append(",name:'").Append("aaaaa(aaa)").Append("',ntype:'table'}");

            sb.Append("]");
            Response.Write(sb.ToString());
        }
        #endregion

        #region//ɾ���ڵ�
        if (Request["deleteNode"] != null)
        {
            string str = "";
            string delID = Request["id"];
            string ntype = Request["ntype"];
            if (ntype == "bill" || ntype == "bill-mx")
            {
                #region//ɾ����
                SYS_BILL_EXD eee = new SYS_BILL_EXD(int.Parse(delID));
                string msg = "";
                int re = eee.DB_DeleteTable(true, ref msg) == true ? 1 : 0;

                #endregion
                str = "{re:" + re + ",msg:'" + (re > 0 ? "ɾ���ɹ�" : "ɾ��ʧ�ܣ�") + "��'}";
            }
            else if (ntype == "col")
            {
                #region//ɾ�����ֶ�

                //string msg = "ɾ�����ݿ���ֶγɹ���";

                //SYS_BILL_EXD bllexd = new SYS_BILL_EXD(int.Parse(Request["pid"]));
                //int re = bllexd.AD_DelCol(int.Parse(delID));// TF_TABLEHelper.DelField(delID);// ;
                //if (re > 0)
                //{
                //    msg = "ɾ�����ݿ���ֶγɹ���";
                //}
                //else
                //{
                //    msg = "ɾ�����ݿ���ֶ�ʧ�ܣ�";
                //}
                #endregion
                str = "";// "{re:" + re + ",msg:'" + msg + "'}";
            }
            else if (ntype == "syncol")
            {
                #region//ɾ�����ֶ�

                string msg = "ɾ��ͬ���ֶγɹ���";
                int re = BLLTable<SYS_BILL_COL_SYN>.Factory(conn).Delete(SYS_BILL_COL_SYN.Attribute.COL_SYNID, delID);
                if (re > 0)
                {
                    msg = "ɾ��ͬ���ֶγɹ���";
                }
                else
                {
                    msg = "ɾ��ͬ���ֶ�ʧ�ܣ�";
                }
                #endregion
                str = "{re:" + re + ",msg:'" + msg + "'}";
            }
            Response.Write(str);
        }
        #endregion
        

        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelBILL_ID"] != null)
        {
            int re = BLLTable<SYS_BILL>.Factory(conn).Delete(SYS_BILL.Attribute.BILL_ID, Request["DelBILL_ID"]);
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
            SYS_BILL cond = new SYS_BILL();
            cond.In(SYS_BILL.Attribute.BILL_ID, Request["DelKeyIDS"]);
            int re = BLLTable<SYS_BILL>.Factory(conn).Delete(cond);
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
            SYS_BILL val = new SYS_BILL();
            val.BILL_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName]))
                {
                    val.SetValue(lstCol[i].FieldName, Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<SYS_BILL>.Factory(conn).Update(val, SYS_BILL.Attribute.BILL_ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();

    }
}