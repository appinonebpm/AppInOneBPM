using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core.WebSystem;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.HR;
using AgileFrame.AppInOne.SYS;
using AgileFrame.AppInOne.WF;
using AgileFrame.Common;
using AgileFrame.Core;

public partial class WF_TB_FIELDEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_TB_FIELD valObj =new TF_TB_FIELD();
    int count = 0;
    string keyid = "";
    protected string title = "";
    string tbid = "";
    private string setJson(string pkey, string subkey,string subvalue)
    {
        StringBuilder sb = new StringBuilder("({");

        return sb.ToString();
    }
    protected void Page_Load(object sender, EventArgs e)
    {
        title = valObj._ZhName + "�༭";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["FIELD_ID"]))
        {
            keyid = Request["FIELD_ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (Request["tree"] != null)
        {
            
            if (Request["edit"] != null)
            {
                keyid = Request["id"];
                tbid = Request["pid"];
            }
            else {
                tbid = Request["id"];
            }
        }
        if (!IsPostBack)
        {
            if (keyid != "")
            {
                valObj = BLLTable<TF_TB_FIELD>.Factory(conn).GetRowData(TF_TB_FIELD.Attribute.FIELD_ID, keyid);
                //Response.Write(valObj.TYPE_CODE);
            }
            List<TF_FIELD_DBTYPE> lstDBType = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).Select(new TF_FIELD_DBTYPE(),new TF_FIELD_DBTYPE());
            Dictionary<string, List<TF_CTRL_TYPE>> json1 = new Dictionary<string, List<TF_CTRL_TYPE>>();
            for (int i = 0; i < lstDBType.Count; i++)
            {
                ListItem li = new ListItem(lstDBType[i].TYPE_NAME, lstDBType[i].TYPE_CODE);
                if (lstDBType[i].TYPE_CODE == null) continue;
                if (valObj != null && valObj.TYPE_CODE != null && lstDBType[i].TYPE_CODE == valObj.TYPE_CODE)
                {
                    li.Selected = true;
                }
                txtFIELD_TYPE.Items.Add(li);

                json1.Add(lstDBType[i].TYPE_CODE, new List<TF_CTRL_TYPE>());

                if (lstDBType[i].CTRL_TYPES == null) continue;
                TF_CTRL_TYPE ccc = new TF_CTRL_TYPE();
                ccc.In(TF_CTRL_TYPE.Attribute.CTRL_TYPE, lstDBType[i].CTRL_TYPES);
                List<TF_CTRL_TYPE> lstCtrl = BLLTable<TF_CTRL_TYPE>.Factory(conn).Select(new TF_CTRL_TYPE(), ccc);
                json1[lstDBType[i].TYPE_CODE].AddRange(lstCtrl);
            }
            StringBuilder sb = new StringBuilder("({");
            foreach (string key1 in json1.Keys)
            {
                if (sb.Length > 2)
                {
                    sb.Append(",");
                }
                sb.Append("'o_" + key1 + "':[");
                for (int a = 0; a < json1[key1].Count; a++)
                {
                    if (a > 0)
                    {
                        sb.Append(",");
                    }
                    sb.Append("{name:'" + json1[key1][a].CTRL_NAME + "',val:'" + json1[key1][a].CTRL_TYPE + "'}");
                }
                sb.Append("]");
            }
            sb.Append("})");
            hidCtrlTypeData.Value = sb.ToString();

            //txtFIELD_TYPE.Items.AddRange(FormHelper.GetListItem(TF_TB_FIELD.Attribute.FIELD_TYPE));

            this.txtFIELD_ID.Disabled = true;
            this.txtFIELD_ID.Attributes["class"] = "dis";
            try
            {
                ViewState["OLDNAME"] = "";
                if (keyid != "")
                {
                    if(valObj==null) return ;
                    
                    
                    txtFIELD_ID.Value = Convert.ToString(valObj.FIELD_ID);//Convert.ToInt32                
                    
        
                    ViewState["OLDNAME"] = valObj.FIELD_NAME;
                    txtFIELD_NAME.Value = valObj.FIELD_NAME.Trim();

                    txtFIELD_TYPE.Value=valObj.TYPE_ID.ToString();                
                    
                    //txtDB_TYPE.Value = Convert.ToString(valObj.DB_TYPE);//Convert.ToString                

                    txtIS_NULL.Checked = valObj.IS_NULL == 1;            
                    
                    txtNOTE.Value = Convert.ToString(valObj.NOTE);//Convert.ToString                
                    
                    txtDEFAULT_VAL.Value = Convert.ToString(valObj.DEFAULT_VAL);//Convert.ToString                
                    
                    //txtTB_ID.Value = Convert.ToString(valObj.TB_ID);//Convert.ToInt32                

                    txtCTRL_TYPE.Value = valObj.CTRL_TYPE;//Convert.ToString                
                    
                    txtSORT_NO.Value = Convert.ToString(valObj.SORT_NO);//Convert.ToInt32
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
    }
    protected string errMsg;
    protected void btnOK_Click(object sender, EventArgs e)
    {
        //try
        //{
            #region
            TF_TABLE tbObj = null;
            TF_TB_FIELD valObj = new TF_TB_FIELD();
            if (string.IsNullOrEmpty(keyid))//�����ʱ��
            {
                if (string.IsNullOrEmpty(tbid))
                {
                    litWarn.Text = "�������������";
                    return;
                }
                valObj.TB_ID = int.Parse(tbid);// Convert.ToInt32(txtTB_ID.Value);
            }
            else{//�޸ĵ�ʱ��
                valObj.FIELD_ID = Convert.ToInt32(keyid);
                if (string.IsNullOrEmpty(tbid)){
                    valObj.TB_ID  = Convert.ToInt32(BLLTable<TF_TB_FIELD>.Factory(conn).GetOneValue(TF_TB_FIELD.Attribute.FIELD_ID,
                            valObj.FIELD_ID, TF_TB_FIELD.Attribute.TB_ID));
                }
                if (valObj.TB_ID != 0)//
                {
                    tbObj = BLLTable<TF_TABLE>.Factory(conn).GetRowData(TF_TABLE.Attribute.TB_ID, valObj.TB_ID);
                }
            }
            if (txtFIELD_NAME.Value != "")
                valObj.FIELD_NAME = Convert.ToString(txtFIELD_NAME.Value);
            else
            {
                litWarn.Text = "�ֶ���Ϊ�գ�";
                return;
            }
            if (ViewState["OLDNAME"].ToString().Trim() != txtFIELD_NAME.Value)
            {
                if (BLLTable<TF_TB_FIELD>.Exists(valObj)) {
                    litWarn.Text = "���ֶ��Ѿ����ڣ����������룡";
                    return;
                }
            }
           
            if (txtFIELD_ID.Value != "")
                valObj.FIELD_ID = Convert.ToInt32(txtFIELD_ID.Value);

            if (txtFIELD_TYPE.Value != "")
            {
                TF_FIELD_DBTYPE typeObj = BLLTable<TF_FIELD_DBTYPE>.Factory(conn).GetRowData(TF_FIELD_DBTYPE.Attribute.TYPE_CODE, txtFIELD_TYPE.Value);
                valObj.TYPE_CODE = typeObj.TYPE_CODE;
                valObj.DB_TYPE = typeObj.DB_TYPE;
                //valObj.TYPE_ID = Convert.ToInt32(txtFIELD_TYPE.Value);
            }            
            
            //if(txtDB_TYPE.Value !="" )
            //    valObj.DB_TYPE = Convert.ToString(txtDB_TYPE.Value);


            valObj.IS_NULL = txtIS_NULL.Checked == true ? 1 : 0;
            
            
            if(txtNOTE.Value !="" )
                valObj.NOTE = Convert.ToString(txtNOTE.Value);
            
            
            if(txtDEFAULT_VAL.Value !="" )
                valObj.DEFAULT_VAL = Convert.ToString(txtDEFAULT_VAL.Value);


            //if (txtTB_ID.Value != "")             
            
            
            if(txtCTRL_TYPE.Value !="" )
                valObj.CTRL_TYPE = Convert.ToString(txtCTRL_TYPE.Value);
            
            
            if(txtSORT_NO.Value !="" )
                valObj.SORT_NO = Convert.ToInt32(txtSORT_NO.Value);

            #endregion

            int editb = -9;
            editb = AgileFrame.Common.TF_TABLEHelper.Factory(conn).InsertOrUpdateField(valObj, Convert.ToString(ViewState["OLDNAME"]), ref errMsg);//ͬʱ�޸���ʽ���������ʱ���ֶ�

            if (keyid != "")
            {
                if (editb > 0)
                {
                    count = BLLTable<TF_TB_FIELD>.Factory(conn).Update(valObj, TF_TB_FIELD.Attribute.FIELD_ID);
                }
                else
                {
                    //CHG START ȥ��ϵͳ������Ϣ��ʾ��ҳ�� jin-shenjian 2013/10/23
                    //litWarn.Text = "�����ݿ����޸��ֶ���Ϣʧ�ܣ�" + editb + "<a>" + errMsg + "</a>"
                    litWarn.Text = "�����ݿ����޸��ֶ���Ϣʧ�ܣ�";
                    //CHG END ȥ��ϵͳ������Ϣ��ʾ��ҳ�� jin-shenjian 2013/10/23
                    return;
                }
            }
            else
            {
                //editb = AgileFrame.Common.TF_TABLEHelper.Factory(conn).AddField(valObj, ref errMsg);
                if (editb > 0)
                {
                    valObj.CREATED = ckAddToFormCol.Checked == true ? 1 : 0;
                    count = BLLTable<TF_TB_FIELD>.Factory(conn).Insert(valObj, TF_TB_FIELD.Attribute.FIELD_ID);
                    keyid = valObj.FIELD_ID.ToString();

                }
                else
                {
                    litWarn.Text = "�����ݿ��ﴴ���ֶ���Ϣʧ�ܣ�" + editb + ":" + errMsg;
                    return;
                }
            }
            if (count > 0)
            {
                if (editb > 0)//��������޸�
                {
                    if (ckAddToFormCol.Checked == true && count > 0)
                    {
                        #region//ͬʱ�½�Ϊĳ��������Ŀ��ǰ���Ǵ˱�ĳ����ʹ���С�
                        List<TF_FORM> lstForm = BLLTable<TF_FORM>.Factory(conn).Select(TF_FORM.Attribute.TB_ID, valObj.TB_ID);
                        if (lstForm != null)
                        {
                            foreach (TF_FORM f in lstForm)
                            {
                                TF_F_COLUMN valCol = new TF_F_COLUMN();
                                valCol.TB_ID = valObj.TB_ID;
                                valCol.FORM_ID = f.FORM_ID;

                                valCol.FIELD_ID = valObj.FIELD_ID;

                                if (!BLLTable<TF_F_COLUMN>.Exists(valCol))
                                {
                                    valCol.SHOW_NAME = valObj.NOTE;
                                    valCol.CTRL_TYPE = valObj.CTRL_TYPE;

                                    valCol.MAX_VAL = 0;

                                    valCol.IS_DEFAULT = "0";

                                    valCol.MIN_VAL = 0;
                                    valCol.IS_NEED = valObj.IS_NULL == 1 ? 0 : 1;
                                    valCol.SORT_NO = valObj.SORT_NO;
                                    valCol.SHOWIN_FORM = "1";
                                    int count2 = BLLTable<TF_F_COLUMN>.Factory(conn).Insert(valCol, TF_F_COLUMN.Attribute.COLUMN_ID);
                                    if (count2 <= 0)
                                    {
                                        "".ToString();
                                    }
                                }
                            }
                        }
                        #endregion
                    }
                }
                #region
                string gotoUrl = WebHelper.GetAppPath() + @"ok.aspx";
                if (Request["tree"] != null)//��������������������
                {   
                    //if(Server.MapPath(gotoUrl))
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.TB_ID).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");
                    //CHG START ����ڵ�ѡ��ҳ���������� jin-shenjian 2013/10/26
                    //sb.Append(valObj.NOTE).Append("',ntype:'TF_F_COLUMN'}");
                    sb.Append(valObj.NOTE).Append("',ntype:'TF_TB_FIELD'}");
                    //CHG END ����ڵ�ѡ��ҳ���������� jin-shenjian 2013/10/26
                    if (Request["edit"] == null)
                    {

                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                }
                else //�������Ӵ��ڵ����
                {
                    StringBuilder sbData = new StringBuilder("({valObj:''");
                    List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                    for (int i = 0; i < lstCol.Count; i++)
                    {
                        object val = valObj.GetValue(lstCol[i]);
                        if (val != null)
                        {
                            sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                        }
                    }
                    sbData.Append("})");

                    Button btn = (Button)sender;
                    if (btn.ID == "btnOK")//ѡ���ʱ��
                    {
                        if (ViewState["hadSave"] == null)
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + sbData.ToString() + "';}else{window.returnValue = '" + sbData.ToString() + "';}window.close();", true);
                        }
                        else
                        {
                            ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                        }
                    }
                    else //���水ť�����
                    {
                        txtFIELD_NAME.Value = "";
                        txtFIELD_TYPE.Value = "";
                        txtIS_NULL.Value = "";
                        txtNOTE.Value = "";
                        txtDEFAULT_VAL.Value = "";
                        AgileFrame.Core.ScriptHelper.Alert(Page, "�����ɹ�");
                    }
                }
                #endregion
            }
            else {
                litWarn.Text ="�޸ļ�¼û�гɹ���";
            }
        //}
        //catch (Exception ex)
        //{
        //    litWarn.Text = ex.Message;
        //}
    }

}
