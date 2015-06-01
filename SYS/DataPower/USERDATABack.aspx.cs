using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;

public partial class SYS_USERDATABack : AgileFrame.AppInOne.Common.BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["USER_ID"] != null && Request["delFromUserRole"] != null)
        {
            SYS_USERDATA delCond = new SYS_USERDATA();
            delCond.USER_ID =decimal.Parse( Request["USER_ID"]);
            delCond.DATA_TYPE = Request["Data_Type"];
            delCond.In(SYS_USERDATA.Attribute.DATA_ID, Request["delFromUserRole"]);

            BLLTable<SYS_USERDATA>.Factory(conn).Delete(delCond);
            Response.Write("{}");
        }
        if (Request["USER_ID"] != null && Request["AddToUserData"] != null)
        {
            SYS_USERDATA valObj = new SYS_USERDATA();
            valObj.USER_ID = decimal.Parse(Request["USER_ID"]);
            string datatype = Request["Data_Type"];
            valObj.DATA_TYPE = datatype;
            string[] arrDataID = null;
            string dataid = Request["AddToUserData"];
            if (dataid.IndexOf(",") == -1)
            {
                arrDataID = new string[] { dataid };
            }
            else
            {
                arrDataID = dataid.Split(',');
            }
            if (valObj.DATA_ID != "0")
            {
                SYS_USERDATA delCond = new SYS_USERDATA();
                delCond.USER_ID = valObj.USER_ID;
                delCond.DATA_TYPE = datatype;
                BLLTable<SYS_USERDATA>.Factory(conn).Delete(delCond);
            }

            StringBuilder sbData = new StringBuilder("[");
            for (int a = 0; a < arrDataID.Length; a++)
            {
                valObj.DATA_ID = arrDataID[a];
                
                if (!BLLTable<SYS_USERDATA>.Exists(valObj))
                {
                    int re = BLLTable<SYS_USERDATA>.Factory(conn).Insert(valObj);
                    if (re > 0)
                    {
                        if (sbData.Length > 1) {
                            sbData.Append(",");
                        }
                        sbData.Append("{valObj:''");
                       
                        if (datatype.IndexOf("HR_ORG") != -1)
                        {
                            #region//
                            HR_ORG valORG = BLLTable<HR_ORG>.Factory(conn).GetRowData(HR_ORG.Attribute.ORG_ID, valObj.DATA_ID);

                            List<AttributeItem> lstCol = valORG.af_AttributeItemList;
                            for (int i = 0; i < lstCol.Count; i++)
                            {
                                object val = valORG.GetValue(lstCol[i]);
                                if (val != null)
                                {
                                    sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                                }
                            }
                            #endregion
                        }
                        else if (datatype.IndexOf("HR_DEPT") != -1)
                        {
                            #region//
                            HR_DEPT valORG = BLLTable<HR_DEPT>.Factory(conn).GetRowData(HR_DEPT.Attribute.DEPT_ID, valObj.DATA_ID);

                            List<AttributeItem> lstCol = valORG.af_AttributeItemList;
                            for (int i = 0; i < lstCol.Count; i++)
                            {
                                object val = valORG.GetValue(lstCol[i]);
                                if (val != null)
                                {
                                    sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                                }
                            }
                            #endregion
                        }
                        else if (datatype.IndexOf("IM_STORAGE") != -1)
                        {
                            #region//
                            IM_STORAGE valORG = BLLTable<IM_STORAGE>.Factory(conn).GetRowData(IM_STORAGE.Attribute.STOR_ID, valObj.DATA_ID);

                            List<AttributeItem> lstCol = valORG.af_AttributeItemList;
                            for (int i = 0; i < lstCol.Count; i++)
                            {
                                object val = valORG.GetValue(lstCol[i]);
                                if (val != null)
                                {
                                    sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                                }
                            }
                            #endregion
                        }
                        sbData.Append("}");
                        
                    }
                }
            }
            sbData.Append("]");
            Response.Write(sbData.ToString());
        }

            //���б������ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��������¼
        if (Request["DelKeyIDS"] != null)
        {
            if (Request["USER_ID"] != null)
            {
                SYS_USERDATA cond = new SYS_USERDATA();
                cond.In(SYS_USERDATA.Attribute.DATA_ID, Request["DelKeyIDS"]);
                cond.DATA_TYPE = Request["Data_Type"];
                cond.USER_ID = decimal.Parse(Request["USER_ID"]);
                int re = BLLTable<SYS_USERDATA>.Factory(conn).Delete(cond);
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
                SYS_USERDATA cond = new SYS_USERDATA();
                cond.In(SYS_USERDATA.Attribute.USER_ID, Request["DelKeyIDS"]);
                int re = BLLTable<SYS_USERDATA>.Factory(conn).Delete(cond);
                if (re > 0)
                {
                    Response.Write("1");//����������� ����0 ��ʾ�����ɹ���Ҳ����ֱ����� �ַ������ͻ��˽��������ַ�����Ϣ��Ϊ��ʾ
                }
                else
                {
                    Response.Write("ɾ��ʧ�ܣ�");
                }
            }
        }

        //���û���ϸ��Ϣ�鿴�༭ҳ�棬�㱣��ʱ��ͨ��AJAXִ������ĺ�̨���룬ʵ�ֲ����ֶεĸ���
        if (Request["saveInfo"] != null)
        {
            SYS_USERDATA val = new SYS_USERDATA();
            val.USER_ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName])) {
                    val.SetValue(lstCol[i].FieldName,Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<SYS_USERDATA>.Factory(conn).Update(val, SYS_USERDATA.Attribute.USER_ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }
        Response.End();
    }
}