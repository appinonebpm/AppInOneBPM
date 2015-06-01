using System;
using System.Collections.Generic;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Core.WebSystem;

public partial class WEC_CUSTOM_ArticleEdit : BaseAdminPage
{
    WEC_CUSTOM_Article valObj =new WEC_CUSTOM_Article();
    int count = 0;
    string keyid = "", deptid="";
    protected string title = "";
    public string aid;
    protected void Page_Load(object sender, EventArgs e)
    {
        aid = HttpUtil.GetReqStrValue("aid");
        title = valObj._ZhName + "�༭";
        Page.Title = title;
        if (!string.IsNullOrEmpty(Request["ID"]))
        {
            keyid = Request["ID"];
        }

        if (!string.IsNullOrEmpty(Request["KeyID"]))
        {
            keyid = Request["KeyID"];
        }
        if (Request["deptid"] != null)
        {
            deptid = Request["deptid"];
        }
        if (!IsPostBack)
        {
            WEC_CUSTOM_MODEL cond = new WEC_CUSTOM_MODEL();
            cond.TYPE = 3;
            txtMODEL_ID.Items.AddRange(FormHelper.GetListItem(WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.ID, WEC_CUSTOM_MODEL.Attribute.NAME, null, cond));
            txtCID.Value = "";
            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_CUSTOM_Article>.GetRowData(WEC_CUSTOM_Article.Attribute.ID, keyid);
                    if (valObj == null) return;


                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                

                    txtCID.Value = Convert.ToString(valObj.CID);//Convert.ToString                

                    txtAID.Value = Convert.ToString(valObj.AID);//Convert.ToDecimal                

                    txtTITLE.Value = Convert.ToString(valObj.TITLE);//Convert.ToString                

                    txtDES.Value = Convert.ToString(valObj.DES);//Convert.ToString                

                    txtCONTENT.Value = Convert.ToString(valObj.CONTENT);//Convert.ToString                

                    txtURL.Value = Convert.ToString(valObj.URL);//Convert.ToString                

                    txtPICURL.Src = valObj.PIC_URL;

                    txtMODEL_ID.Value = Convert.ToString(valObj.MODEL_ID);//Convert.ToDecimal

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");
                }
                else
                {
                    txtCID.Value = deptid;
                    txtAID.Value = Convert.ToString(aid);
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
        try
        {

            WEC_CUSTOM_Article valObj = new WEC_CUSTOM_Article();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtCID.Value !="" )
                valObj.CID = Convert.ToString(txtCID.Value);
            
            
            if(txtAID.Value !="" )
                valObj.AID = Convert.ToDecimal(txtAID.Value);
            
            
            if(txtTITLE.Value !="" )
                valObj.TITLE = Convert.ToString(txtTITLE.Value);
            
            
            if(txtDES.Value !="" )
                valObj.DES = Convert.ToString(txtDES.Value);
            
            
            if(txtCONTENT.Value !="" )
                valObj.CONTENT = Convert.ToString(txtCONTENT.Value);
            
                valObj.URL = Convert.ToString(txtURL.Value);


            valObj.PIC_URL = hidPICURL.Value;


            if (txtMODEL_ID.Value != "")
            {
                valObj.MODEL_ID = Convert.ToDecimal(txtMODEL_ID.Value);
            }
            else
            {
                valObj.MODEL_ID = -1;
            }

            if (txtADDTIME.Value != "")
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_CUSTOM_Article>.Update(valObj, WEC_CUSTOM_Article.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_CUSTOM_Article>.Insert(valObj, WEC_CUSTOM_Article.Attribute.ID);
                keyid = valObj.ID.ToString();

            }
            if (count > 0)
            {
                StringBuilder sbData = new StringBuilder("{valObj:''");
                List<AttributeItem> lstCol = valObj.af_AttributeItemList;
                for (int i = 0; i < lstCol.Count; i++)
                {
                    object val = valObj.GetValue(lstCol[i]);
                    if (val != null)
                    {
                        sbData.Append(",").Append(lstCol[i].FieldName).Append(":'").Append(val.ToString()).Append("'");
                    }
                }
                sbData.Append("}");
                if (ViewState["sbData"] == null)
                {
                    ViewState["sbData"] = sbData.ToString();
                }
                else {
                    ViewState["sbData"] += ","+sbData.ToString();
                }
                Button btn = (Button)sender;
                if (btn.ID.IndexOf("btnOK")!=-1)
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';}window.close();", true);
                    }
                }
                else
                {
                    
                    
                    txtID.Value ="";
                    
                    
                    txtCID.Value ="";
                    
                    
                    txtAID.Value ="";
                    
                    
                    txtTITLE.Value ="";
                    
                    
                    txtDES.Value ="";
                    
                    
                    txtCONTENT.Value ="";
                    
                    
                    txtURL.Value ="";
                    
                    
                    txtMODEL_ID.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}
