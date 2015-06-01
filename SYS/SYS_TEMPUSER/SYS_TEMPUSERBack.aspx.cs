using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.CMS;
using AgileFrame.Orm.PersistenceLayer.DBUtility;
using AgileFrame.Core;
using System.Text;
using System.Net;
using System.IO;

public partial class SYS_TEMPUSERBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //���б�����ɾ����ť��ͨ��AJAXִ������ĺ�̨���룬ɾ��һ����¼
        if (Request["DelID"] != null)
        {
            int re = BLLTable<SYS_TEMPUSER>.Delete(SYS_TEMPUSER.Attribute.ID, Request["DelID"]);
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
            SYS_TEMPUSER cond = new SYS_TEMPUSER();
            cond.In(SYS_TEMPUSER.Attribute.ID, Request["DelKeyIDS"]);
            int re = BLLTable<SYS_TEMPUSER>.Delete(cond);
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
            SYS_TEMPUSER val = new SYS_TEMPUSER();
            val.ID = int.Parse(Request["FieldKeyID"]);
            List<AttributeItem> lstCol = val.af_AttributeItemList;
            for (int i = 0; i < lstCol.Count; i++)
            {
                if (!string.IsNullOrEmpty(Request["txt" + lstCol[i].FieldName]))
                {
                    val.SetValue(lstCol[i].FieldName, Request["txt" + lstCol[i].FieldName]);
                }
            }

            BLLTable<SYS_TEMPUSER>.Update(val, SYS_TEMPUSER.Attribute.ID);
            Response.Write("�޸��û���Ϣ�ɹ�");

        }

        if (!IsPostBack)
        {
            string strRet = "";
            //��ȡ��������
            switch (Common.GetReqStrValue("action"))
            {
                //��ȡ��֤��
                case "GetCheckNum":
                    strRet = GetCheckNum();
                    break;
                //��ȡ��֤��
                case "Add":
                    strRet = InsertUser();
                    break;
                default:
                    strRet = "";
                    break;
            }

            Response.Write(strRet);
        }



        Response.End();
    }
    private string InsertUser()
    {
        string loginname = Common.GetReqStrValue("loginname");
        string pwd = Common.GetReqStrValue("pwd");
        string name = Common.GetReqStrValue("name");
        string coname = Common.GetReqStrValue("coname");
        string phone = Common.GetReqStrValue("phone");
        int checknum = Common.GetReqIntValue("checknum");
        string email = Common.GetReqStrValue("email");


        if (Common.GetReqStrValue("hidFlag").Equals("0"))
        {
            SYS_CHECKNUM condobj = new SYS_CHECKNUM();
            condobj.CHECKNUM = checknum;
            condobj.PHONE = phone;
            if (!BLLTable<SYS_CHECKNUM>.Exists(condobj))
            {
                return "-1";
            }
        }

        SYS_TEMPUSER objval = new SYS_TEMPUSER();
        objval.NAME = loginname;
        SYS_USER objvalUser = new SYS_USER();
        objvalUser.USER_NAME = loginname;
        if (BLLTable<SYS_TEMPUSER>.Exists(objval) || BLLTable<SYS_USER>.Exists(objvalUser))
        {
            return "-2";
        }

       //������
        using (Transaction t = new Transaction("conn"))
        {
            objvalUser = new SYS_USER();
            objvalUser.USER_NAME = loginname;
            objvalUser.PASS = StringHelperExd.StringToMD5(pwd);
            objvalUser.USER_TYPE = "4";
            objvalUser.REAL_NAME = name;
            objvalUser.STAFF_ID = 21;

            int intRet = BLLTable<SYS_USER>.Factory(t).Insert(objvalUser, SYS_USER.Attribute.USER_ID);
            if (intRet == -1)
            {
                t.RollBack();
            }

            string sql = "  insert into SYS_USER_MDLPOWER_DIC select " + objvalUser.USER_ID + ",PAGE_URL,DIC_ID from SYS_USER_MDLPOWER_DIC where user_id =1";

            intRet = BLLTable<SYS_USER>.Factory(t).ExecSQL(sql, System.Data.CommandType.Text);
            if (intRet == -1)
            {
                t.RollBack();
            }

            objval = new SYS_TEMPUSER();
            objval.LOGINNAME = loginname;
            objval.PWD = pwd;
            objval.NAME = name;
            objval.CONAME = coname;
            objval.PHONE = phone;
            objval.IP = GetIP();
            objval.USER_ID = objvalUser.USER_ID;
            objval.EMAIL = email;

            intRet = BLLTable<SYS_TEMPUSER>.Factory(t).Insert(objval, SYS_TEMPUSER.Attribute.ID);
            if (intRet == -1)
            {
                t.RollBack();
            }

            intRet = BLLTable<SYS_CHECKNUM>.Factory(t).Delete(SYS_CHECKNUM.Attribute.PHONE, phone);
            if (intRet == -1)
            {
                t.RollBack();
            }

            t.Commit();
        }

        return "0";
    }
    public static string GetIP()
    {
        string result = "";
        if (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null)
        {
            result = HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"];
        }
        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"] != null)
            {
                result = HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
            }
        }

        if (null == result || result == String.Empty)
        {
            if (HttpContext.Current.Request.UserHostAddress != null)
            {
                result = HttpContext.Current.Request.UserHostAddress;
            }
        }
        return result;
    }

    private string GetCheckNum()
    {
        string tel = Common.GetReqStrValue("Mobile");
        bool boolLoop = true;
        int checkNum = 0;
        DateTime dat = DateTime.Now;

        //�ж��Ƿ��ظ���ȡ
        SYS_CHECKNUM objval = new SYS_CHECKNUM();
        SYS_CHECKNUM condobj = new SYS_CHECKNUM();
        condobj.PHONE = tel;
        condobj.Where(" datediff(s,ADDTIME , '" + dat + "')<=60");

        List<SYS_CHECKNUM> lst = BLLTable<SYS_CHECKNUM>.Select(objval, condobj);

        if (lst.Count > 0)
        {
            return Convert.ToString(60 - Convert.ToInt32((dat - lst[0].ADDTIME).TotalSeconds) + 1);
        }

        //ɾ����¼
        int intRet = BLLTable<SYS_CHECKNUM>.Delete(SYS_CHECKNUM.Attribute.PHONE, tel);

        //��ȡ��֤��
        if (intRet != -1)
        {
            while (boolLoop)
            {
                checkNum = new Random().Next(1000, 10000);
                condobj = new SYS_CHECKNUM();
                condobj.CHECKNUM = checkNum;
                if (!BLLTable<SYS_CHECKNUM>.Exists(condobj))
                {
                    boolLoop = false;
                }
            }
        }

        //������
        using (Transaction t = new Transaction("conn"))
        {
            try
            {
                //�����¼
                objval = new SYS_CHECKNUM();
                objval.CHECKNUM = checkNum;
                objval.PHONE = tel;

                intRet = BLLTable<SYS_CHECKNUM>.Factory(t).Insert(objval, SYS_CHECKNUM.Attribute.Id);

                if (intRet > 0)
                {
                    //�·���֤��
                    string result = PostHtmlFromUrl("http://183.247.151.178:2090/appinone/Interface/SendSMS.aspx", "tel=" + tel + "&msg=" + checkNum + "�����Ķ�����֤�룬����30��������֤��[AppInOneרҵ������� ƽ̨����]");

                    if (result.Equals("0"))
                    {
                        t.Commit();
                    }
                    else
                    {
                        t.RollBack();
                        return result;
                    }
                }

            }
            catch (Exception ex)
            {
                return "-101";
            }
        }

        return "-100";

    }

    /// <summary>
    /// �����������վ��UTF-8���룬Http Post�������Ҳ��Ҫ��UTF-8����
    /// HttpUtility.UrlEncode(merId, myEncoding)
    /// </summary>
    /// <param name="url">���ʵ�ַ����������</param>
    /// <param name="para">�����ַ���</param>
    /// <returns></returns>
    public static string PostHtmlFromUrl(string url, string postData)
    {
        String sResult = "";
        try
        {
            ASCIIEncoding encoding = new ASCIIEncoding();
            byte[] data = encoding.GetBytes(postData);
            HttpWebRequest request = (HttpWebRequest)WebRequest.Create(url);
            request.Method = "POST";
            request.ContentType = "application/x-www-form-urlencoded;charset=UTF-8";
            request.ContentLength = postData.Length;
            Stream stream = request.GetRequestStream();
            stream.Write(data, 0, data.Length);
            stream.Close();

            HttpWebResponse response = (HttpWebResponse)request.GetResponse();
            StreamReader reader = new StreamReader(response.GetResponseStream(), Encoding.UTF8);
            string content = reader.ReadToEnd();
            return content;

        }
        catch (Exception e)
        {
            sResult = "-101";
            return sResult;

        }
    }
}