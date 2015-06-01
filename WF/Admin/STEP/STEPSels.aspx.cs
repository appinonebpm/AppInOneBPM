using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.WF;
public partial class WF_STEP_TPLSels : AgileFrame.AppInOne.Common.BaseAdminPage
{
    public string title = new WF_STEP_TPL()._ZhName;

    bool IsInOld(string str, string old, char ch)
    {
        if (str.IndexOf(ch) != -1)
        {
            string[] arr = str.Split(ch);
            for (int i = 0; i < arr.Length; i++)
            {
                if (old == arr[i])
                {
                    return true;
                }
            }
        }
        else
        {
            if (old == str)
            {
                return true;
            }
        }
        return false;
    }
    WF_STEP_TPL valObj = new WF_STEP_TPL();
    WF_STEP_TPL condObj = new WF_STEP_TPL();
    List<WF_STEP_TPL> listObj = new List<WF_STEP_TPL>();

   /// <summary>��ͼ��������࣬ʵ��ö�ٱ���ת��</summary>
    public FormHelper formhelper = new FormHelper();

    protected int procid = 0;
    protected int stepid = 0;
    protected string type = "";
    protected int NEXT_ID = 0;
    protected int wfid = 0;
    protected int PATH_TYPE = 0;
    protected int STEP_TYPE = 0;
    WF_STEPATH_TPL valObj_Step = new WF_STEPATH_TPL();
    WF_STEPATH_TPL condObj_Step = new WF_STEPATH_TPL();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!string.IsNullOrEmpty(Request["PROCID"]))
        {
            procid = int.Parse(Request["PROCID"]);
            condObj.PROCID = procid;
            condObj_Step.PROCID = procid;
        }
        if (!string.IsNullOrEmpty(Request["WFID"]))
        {
            wfid = int.Parse(Request["WFID"]);
            condObj.WFID = wfid;
            condObj_Step.WFID = wfid;
        }
        if (Request["STEP_ID"] != null)
        {
            stepid = int.Parse(Request["STEP_ID"]);
            //condObj_Step.STEP_ID = stepid;
        }
        if (Request["STEP_TYPE"] != null)
        {
            STEP_TYPE = int.Parse(Request["STEP_TYPE"]);
            //condObj.STEP_TYPE = STEP_TYPE;//�������� ·�ɽڵ㣬���ڵ�  
            condObj_Step.NODE_TYPE = STEP_TYPE;
        }
        valObj.OrderBy(WF_STEP_TPL.Attribute.STEP_ID, Order.Asc);
        valObj_Step.OrderBy(WF_STEPATH_TPL.Attribute.STEP_ID, Order.Asc);        
        //if (Request["NEXT_ID"] != null)
        //{
        //    NEXT_ID = int.Parse(Request["NEXT_ID"]);
        //    condObj_Step.NEXT_ID = NEXT_ID;
        //}
        if (Request["PATH_TYPE"] != null)
        {
            PATH_TYPE = int.Parse(Request["PATH_TYPE"]);
            condObj_Step.PATH_TYPE = PATH_TYPE;
        }

        //���ѡȡ��ڵ�
        if (STEP_TYPE == 1)
        {
            condObj.STEP_TYPE = STEP_TYPE;

            //�����µ�ʱ���ж��ã��������� 1������� 3���ٳ��� 0�����
            PATH_TYPE = 0;
        }
        else
        {
            //�ٳ���ѡȡ·�ɽڵ�
            if (PATH_TYPE == 3)
            {
                condObj.STEP_TYPE = STEP_TYPE;
            }
        }

        if (!IsPostBack)
        {
            if (!string.IsNullOrEmpty(Request["STEP_ID"]) || !string.IsNullOrEmpty(Request["NEXT_ID"]))
            {
                List<WF_STEPATH_TPL> lstPath = new List<WF_STEPATH_TPL>();
                //
                WF_STEP_TPL vvv = new WF_STEP_TPL();                
                vvv.STEP_NAME = "";
                vvv.STEP_ID = 0;
                if (STEP_TYPE == 1)
                {
                    condObj_Step.NEXT_ID = stepid;
                    //����ڽڵ㣬���������ҵ� ���
                    lstPath = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(valObj_Step, new Relation(WF_STEPATH_TPL.Attribute.STEP_ID, WF_STEP_TPL.Attribute.STEP_ID, RelationType.LeftJoin),
                        vvv, condObj_Step);
                }
                else  //�ҳ��ڽڵ�
                {
                    condObj_Step.STEP_ID = stepid;
                    lstPath = BLLTable<WF_STEPATH_TPL>.Factory(conn).Select(valObj_Step, new Relation(WF_STEPATH_TPL.Attribute.NEXT_ID, WF_STEP_TPL.Attribute.STEP_ID, RelationType.LeftJoin),
                         vvv, condObj_Step);
                }

                BLLTable.SQL_Test.ToString();

                //������ѡ�е���
                if (lstPath != null)
                {
                    for (int i = 0; i < lstPath.Count; i++)
                    {
                        if (i > 0)
                        {
                            hidOld.Value += ",";
                            hidInitIDS.Value += ",";
                        }
                        {
                            hidOld.Value += "{ID:'" + lstPath[i].GetValue(WF_STEP_TPL.Attribute.STEP_ID) + "',Name:'" + lstPath[i].GetValue(WF_STEP_TPL.Attribute.STEP_NAME) + "'}";//�����Name������ʾ���б��У��������ض��塣
                            hidInitIDS.Value += lstPath[i].GetValue(WF_STEP_TPL.Attribute.STEP_ID);
                        }
                    }
                }
            }
            try
            {
                listObj = BLLTable<WF_STEP_TPL>.Factory(conn).Select(valObj, condObj);
                repList.DataSource = listObj;
                repList.DataBind();
            }
            catch (Exception ex)
            {
                 litWarn.Text = ex.Message;
            }
        }
    }

    protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        if (hidOld.Value != "")
        {
            HtmlInputCheckBox ck = (HtmlInputCheckBox)e.Item.FindControl("chkSel");
            string id = ck.Attributes["value"];

            if (IsInOld(hidInitIDS.Value, id, ','))
            {
                ck.Checked = true;
            }
        }
    }
}