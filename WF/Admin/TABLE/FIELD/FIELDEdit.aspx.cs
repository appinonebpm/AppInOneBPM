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
public partial class WF_TB_FIELDEdit : AgileFrame.AppInOne.Common.BaseAdminPage
{
    TF_TB_FIELD valObj =new TF_TB_FIELD();
    int count = 0;
    string keyid = "";
    protected string title = "";
    string tbid = "";
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
            StringBuilder sb = new StringBuilder("({");
            for (int i = 0; i < lstDBType.Count; i++)
            {
                ListItem li = new ListItem(lstDBType[i].TYPE_NAME, lstDBType[i].TYPE_CODE);
                if (valObj != null&&lstDBType[i].TYPE_CODE == valObj.TYPE_CODE)
                {
                    li.Selected = true;
                }
                txtFIELD_TYPE.Items.Add(li);

                TF_CTRL_TYPE ccc = new TF_CTRL_TYPE();
                ccc.In(TF_CTRL_TYPE.Attribute.CTRL_TYPE, lstDBType[i].CTRL_TYPES);
                List<TF_CTRL_TYPE> lstCtrl = BLLTable<TF_CTRL_TYPE>.Factory(conn).Select(new TF_CTRL_TYPE(), ccc);
                if (sb.Length > 2) {
                    sb.Append(",");
                }
                sb.Append("'o_" + lstDBType[i].TYPE_CODE + "':[");
                for (int a = 0; a < lstCtrl.Count; a++)
                {
                    if (a > 0) {
                        sb.Append(",");
                    }
                    sb.Append("{name:'" + lstCtrl[a].CTRL_NAME + "',val:'" + lstCtrl[a] .CTRL_TYPE+ "'}");
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
                    txtFIELD_NAME.Value = valObj.FIELD_NAME;

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

    protected void btnOK_Click(object sender, EventArgs e)
    {
        //try
        //{
            #region
            TF_TB_FIELD valObj = new TF_TB_FIELD();

            valObj.TB_ID = int.Parse(tbid);// Convert.ToInt32(txtTB_ID.Value);
            if (txtFIELD_NAME.Value != "")
                valObj.FIELD_NAME = Convert.ToString(txtFIELD_NAME.Value);

            if (ViewState["OLDNAME"].ToString() != txtFIELD_NAME.Value)
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
            if (keyid != "")
            {
                valObj.FIELD_ID = Convert.ToInt32(keyid);

                //TF_TB_FIELD oldObj = BLLTable<TF_TB_FIELD>.Factory(conn).GetRowData(TF_TB_FIELD.Attribute.FIELD_ID, keyid);
                editb = new AgileFrame.Common.TF_TABLEHelper(conn).SaveOrUpdateField(valObj, ViewState["OLDNAME"].ToString(), ref errMsg);//ͬʱ�޸���ʽ���������ʱ���ֶ�
                if (editb > 0)
                {
                    count = BLLTable<TF_TB_FIELD>.Factory(conn).Update(valObj, TF_TB_FIELD.Attribute.FIELD_ID);
                }
                else
                {
                    litWarn.Text = "�����ݿ����޸��ֶ���Ϣʧ�ܣ�" + editb;
                    return;
                }
            }
            else
            {
                //editb = new AgileFrame.Common.TF_TABLEHelper(conn).AddField(valObj, ref errMsg);
                editb = new AgileFrame.Common.TF_TABLEHelper(conn).InsertOrUpdateField(valObj, null, ref errMsg);
                if (editb > 0)
                {
                    valObj.CREATED = ckAddToFormCol.Checked == true ? 1 : 0;
                    count = BLLTable<TF_TB_FIELD>.Factory(conn).Insert(valObj, TF_TB_FIELD.Attribute.FIELD_ID);
                    keyid = valObj.FIELD_ID.ToString();
                }
                else
                {
                    litWarn.Text = "�����ݿ��ﴴ���ֶ���Ϣʧ�ܣ�" + editb;
                    return;
                }
            }
            if (count > 0)
            {
                if (editb > 0)
                {
                    if (ckAddToFormCol.Checked == true && count > 0)
                    {
                        #region//ͬʱ�½�Ϊĳ��������Ŀ��ǰ���Ǵ˱�ĳ����ʹ���С�
                        List<TF_FORM> lstForm = BLLTable<TF_FORM>.Factory(conn).Select(TF_FORM.Attribute.TB_ID, valObj.TB_ID);
                        if (lstForm != null)
                        {
                            lstForm.ForEach(f =>
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
                                    BLLTable<TF_F_COLUMN>.Factory(conn).Insert(valCol, TF_F_COLUMN.Attribute.COLUMN_ID);
                                }

                            });
                        }
                        #endregion
                    }
                }
                #region
                if (Request["tree"] != null)
                {
                    string gotoUrl = "../../../../ok.aspx";
                    StringBuilder sb = new StringBuilder("{");
                    sb.Append("id:'");
                    sb.Append(keyid).Append("',pid:'").Append(valObj.TB_ID).Append("',no:").Append(valObj.SORT_NO).Append(",sc:0,name:'");
                    sb.Append(valObj.NOTE).Append("',ntype:'field'}");
                    if (Request["edit"] == null)
                    {

                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.showSubNodes(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                    else
                    {
                        AgileFrame.Core.ScriptHelper.ResponseScript(Page, "parent.TV.editNodeInfo(\"" + sb.ToString() + "\");location.replace('" + gotoUrl + "');", false);
                    }
                }
                else
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
                    if (btn.ID == "btnOK")
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
                    else
                    {
                        txtFIELD_NAME.Value = "";
                        txtFIELD_TYPE.Value = "";
                        txtIS_NULL.Value = "";
                        txtNOTE.Value = "";
                        txtDEFAULT_VAL.Value = "";

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
