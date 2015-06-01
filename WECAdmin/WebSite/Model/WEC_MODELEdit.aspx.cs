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

public partial class WEC_MODELEdit : BaseAdminPage
{
    WEC_MODEL valObj =new WEC_MODEL();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
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
        if (!IsPostBack)
        {
                         
            txtTYPE.Items.AddRange(FormHelper.GetListItem(WEC_MODEL.Attribute.TYPE));                                                                        
            txtADDTIME.Value = (DateTime.Now).ToString("yyyy-MM-dd");             
            txtSTATUS.Items.AddRange(FormHelper.GetListItem(WEC_MODEL.Attribute.STATUS));

            this.txtID.Disabled = true; this.txtID.Value = "0";
            this.txtID.Attributes["class"] = "dis";
            try
            {
                if (keyid != "")
                {
                    valObj = BLLTable<WEC_MODEL>.GetRowData(WEC_MODEL.Attribute.ID, keyid);
                    if(valObj==null) return ;

                    txtID.Value = Convert.ToString(valObj.ID);//Convert.ToDecimal                
                    
                    txtTYPE.Value=valObj.TYPE.ToString();

                    txtPICURL.Src = valObj.PIC_URL;
                    
                    txtPATH.Value = Convert.ToString(valObj.PATH);//Convert.ToString                

                    txtADDTIME.Value = (valObj.ADDTIME == DateTime.MinValue) ? "" : valObj.ADDTIME.ToString("yyyy-MM-dd");                
                    
                    txtSTATUS.Value=valObj.STATUS.ToString();                
                    
                    txtNAME.Value = Convert.ToString(valObj.NAME);//Convert.ToString
                }
                else
                {
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

            WEC_MODEL valObj = new WEC_MODEL();
            
            
            if(txtID.Value !="" )
                valObj.ID = Convert.ToDecimal(txtID.Value);
            
            
            if(txtTYPE.Value !="" )
                valObj.TYPE = Convert.ToInt32(txtTYPE.Value);

            valObj.PIC_URL = hidPICURL.Value;
            
            if(txtPATH.Value !="" )
                valObj.PATH = Convert.ToString(txtPATH.Value);
            
            if(txtADDTIME.Value !="" )
                valObj.ADDTIME = Convert.ToDateTime(txtADDTIME.Value);
            
            
            if(txtSTATUS.Value !="" )
                valObj.STATUS = Convert.ToInt32(txtSTATUS.Value);
            
            
            if(txtNAME.Value !="" )
                valObj.NAME = Convert.ToString(txtNAME.Value);

            if (keyid != "")
            {
                valObj.ID = Convert.ToDecimal(keyid);
                count = BLLTable<WEC_MODEL>.Update(valObj, WEC_MODEL.Attribute.ID);
            }
            else
            {
                count = BLLTable<WEC_MODEL>.Insert(valObj, WEC_MODEL.Attribute.ID);
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
                    
                    
                    txtTYPE.Value ="";

                    
                    txtPATH.Value ="";
                    
                    
                    txtADDTIME.Value ="";
                    
                    
                    txtSTATUS.Value ="";
                    
                    
                    txtNAME.Value ="";
                }
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }

}
