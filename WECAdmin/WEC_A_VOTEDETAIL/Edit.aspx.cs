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
using AgileFrame.Common;
using AgileFrame.Orm.TemplateEngine;

public partial class Edit : BaseAdminPage
{
    #region ģ�弯input
    //zlg�����,min:0,max:{�ֶα�ǩ����},need:{�ֶ��Ƿ����}}
    string Input = @"<!--Switch-->
                    <!--Case InputString--><!--����-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{type:{�ֶ�js����ö��},need:{�ֶ��Ƿ����}}' value='{�ֶ�ֵ}' />
                    <!--Case SmallText-->
                    <textarea name='{�ֶοؼ���}' id='{�ֶοؼ���}' class='smalltextarea' cols='1' rows='1' style='height:20px;width:300px;overflow:hidden;' 
                            ck='{need:{�ֶ��Ƿ����},len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}' value='{�ֶ�ֵ}'>{�ֶ�ֵ}</textarea>
                    <!--Case Text-->
                    <script type='text/javascript'>
                        $(function () {
                            var kindEditor = new creatKindEditor('#{�ֶοؼ���}');
                        });
                    </script>  
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' rel='text'  style='width:668px;height:230px;' ck='{len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}' value='{�ֶ�ֵ}' />
                    <!--Case HTML-->
                    <FCKV2:FCKeditor name='{�ֶοؼ���}' ID='{�ֶοؼ���}'  Height='250' Width='400' ToolbarSet='Basic'  value='{�ֶ�ֵ}' />
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <script type='text/javascript'>
                         $(function(){
                            $('#{�ֶοؼ���}').multiselect({
                                noneSelectedText: 'δѡ��',
                                checkAllText: 'ȫѡ',
                                uncheckAllText: 'ȫ��ѡ',
                                selectedList:4
                            });
                        });
                    </script>
                    <select name='{�ֶοؼ���}' id='{�ֶοؼ���}'   ck='{need:{�ֶ��Ƿ����},len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}'>
                            {�ֶ�ֵ}
                    </select>
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser--><!--Case SelectMultiple-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='hidden'   value='{�ֶ�ֵ}' />
                    <input name='{�ֶοؼ���}_NAME' id='{�ֶοؼ���}_NAME' onclick='sel(this,""{����ĸ��д��������}"");' class='selshowinput' value='{�ֶ���ʾֵ}' readonly='readonly' style='width:70%;float:left;'  type='text' />
                    <input class='sel' type='button' onclick='sel(this,""{����ĸ��д��������}"");' value='' style='float:left;' />                    
                    <!--Case CheckBoxList-->
                        {�ֶ�ֵ}
                    <!--Case CheckBoxMultiList-->
                        {�ֶ�ֵ}
                    <!--Case InputDateTime-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)'  value='{�ֶ�ֵ}'   ck='{need:{�ֶ��Ƿ����},len:{�ֶα�ǩ����},type:3}' />
                    <!--Case InputDate-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)'  value='{�ֶ�ֵ}'   ck='{need:{�ֶ��Ƿ����},len:{�ֶα�ǩ����},type:3}'/>
                  

                    <!--Case InputPassWord--> 
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='password' value='{�ֶ�ֵ}'   ck='{need:{�ֶ��Ƿ����},len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}' />
                    <!--Case FileUpImage-->              
                    <script type='text/javascript'>
                        $(function () {
                            var smImage = new creatSmImage('#btn{�ֶοؼ���}', '#{�ֶοؼ���}', '#hid{�ֶοؼ���}');
                        });
                    </script>
                    <div class='controls'>
					    <img name='{�ֶοؼ���}' id='{�ֶοؼ���}' src='{�ֶ�ֵ}'   style='max-height:100px;vertical-align: middle;'>
                        <span class='insertimage'><a id='btn{�ֶοؼ���}'>ѡ��ͼ�ķ���</a></span>  �����С(��720��400)
                        <input type='hidden' name='{�ֶοؼ���}' id='hid{�ֶοؼ���}'  value='{�ֶ�ֵ}'  />
                    </div>

                    <!--Case InputNumber-->  
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' onKeypress='return (/[\d.]/.test(String.fromCharCode(event.keyCode)))' style='ime-mode:Disabled' value='{�ֶ�ֵ}'>
                    <!--Case InputMobile-->
                     <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{need:{�ֶ��Ƿ����},type:6}' value='{�ֶ�ֵ}'/>

                    <!--Case InputEmail-->  
                     <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{need:{�ֶ��Ƿ����},type:4}' value='{�ֶ�ֵ}'/>

                     <!--Case InputQQ-->  
                     <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{need:{�ֶ��Ƿ����},type:10}' value='{�ֶ�ֵ}'/>

                      <!--Case InputWangWang-->                
                     <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{need:{�ֶ��Ƿ����},type:11}'value='{�ֶ�ֵ}' />

                    <!--Case InputHttp-->                
                     <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' ck='{need:{�ֶ��Ƿ����},type:12}' value='{�ֶ�ֵ}'/>
               
                     <!--Case FileUpUpDoc-->              
                    <script type='text/javascript'>
                        $(function () {
                            var file = new creatFileUpload('#btn{�ֶοؼ���}', '#hid{�ֶοؼ���}');
                        });
                         
                    </script>
                    <div class='controls'> 
                        <div id='files' style='margin-bottom:10px;'></div>
                        <span class='insertimage'><a id='btn{�ֶοؼ���}'>ѡ���ļ�</a></span>  
                        <input type='hidden' name='{�ֶοؼ���}' id='hid{�ֶοؼ���}'  value='{�ֶ�ֵ}'  />
                    </div>
               <!--EndSwitch-->";


    #endregion ģ�弯
    /// <summary>
    /// ����html
    /// </summary>
    /// <returns></returns>
    protected string getInput()
    {
        StringBuilder sb = new StringBuilder();
        try
        {
            foreach (DataBaseField f1 in fieldList)
            {
                if (f1.TableName.ToLower() == valObj._TableName.ToLower())//�����ֶ�
                {
                    AttributeItem attr1 = new AttributeItem(f1);
                    f1.Value = Convert.ToString(resultObj.GetValue(attr1));

                    if (f1.ZhName == "��ѡ����")
                        "".ToString();
                    if (f1.ZhName == "�ؼ���")
                        "".ToString();

                    string attrHtml = Input;
                    
                    BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                    b1.ParseForSwitch��ǩ(ref attrHtml, f1);

                    if (isChaZhao(f1))
                    {
                        DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                        AttributeItem attr11 = AttributeItem.Factory(f2);
                        string html = Convert.ToString(resultObj.GetValue(attr11));
                        attrHtml = attrHtml.Replace("{�ֶ���ʾֵ}", html);
                    }
                    else if(f1.Desc.CtrlType==BaseCtrlType.SelectDrop){
                        string[] strs = null;
                        if (f1.Value.Contains(","))
                        {
                            strs = f1.Value.Split(',');
                            foreach (string s in strs)
                            {
                                string str = "value='" + s + "'";
                                attrHtml = attrHtml.Replace(str,str+" selected");
                            }
                        }
                    }else if(f1.Desc.CtrlType==BaseCtrlType.FileUpUpDoc){
                        if (!f1.Value.Equals(" "))
                        {
                            string val = Convert.ToString(f1.Value);
                            string[] strs = val.Split(';');
                            string html="";
                            for (int i = 0; i < strs.Length - 1; i++)
                            {
                                string[] ss = strs[i].Split(',');
                                string title = ss[0];
                                string url = ss[1];
                                string hidId = ss[2];
                                html+="<div>" + title + "<a href=\"javascript:\" flag=\"delete\" url=\"" + url + "\" onclick=\"deleteFileName(this,'"+hidId+"')\"><img src=\"../../Themes/WEC/del-icon.png\"></a></div>";
                            }
                            attrHtml = attrHtml.Replace("<div id='files' style='margin-bottom:10px;'></div>", "<div id='files' style='margin-bottom:10px;'>" + html + "</div>");
                        }
                    }
                    sb.Append("<dl><dt>").Append(f1.Desc.ZhName).Append("��</dt><!--").Append(f1.FieldName)
                        .Append("--><dd><span>");
                    sb.Append(attrHtml);
                    sb.Append("</span></dd></dl>");

                }
            }
        }
        catch (Exception ex)
        {
            Cs.Error("34" + ex.ToString());
        }
        return sb.ToString();
    }
    ITableImplement valObj = new ITableImplement();
    protected AttributeItem KeyID = null;
    protected List<DataBaseField> fieldList = new List<DataBaseField>();
    ITableImplement resultObj = new ITableImplement();
    int count = 0;
    string keyid = "";
    protected string title = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        base.InitModule(ref valObj, ref KeyID, ref fieldList);
        
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
        if (!string.IsNullOrEmpty(Request["record"]))
        {
            keyid = Request["record"];
        }
        if (!IsPostBack)
        {
            try
            {
                if (string.IsNullOrEmpty(keyid))//����
                {
                }
                else//�޸�
                {
                    ITableImplement cond1 = valObj.Clone(); cond1.SetValue(KeyID, keyid);
                    resultObj = BLLTable<ITableImplement>.Factory(conn).GetRowData(valObj, cond1);
                    if (resultObj == null)
                    {
                        ScriptHelper.Alert(this, "��¼������");
                        ScriptHelper.CloseMe(this); return;
                    }
                    //string html = Convert.ToString(resultObj.GetValue(WEC_A_VOTE.Attribute.TITLE));
                }
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
        if (valObj.IsNull())
        {
            //valObj.LoadAllAttributes(true);
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        try
        {
            ITableImplement valdata = valObj;//.Clone();

            foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
            {
                if (f1.TableName.ToLower() == valObj._TableName.ToLower())//�����ֶ�
                {
                    string fieldValue;
                    if (TryGetRequest(f1, out fieldValue))
                    {
                        AttributeItem attr1 = new AttributeItem(f1);
                        valdata.SetValue(attr1, fieldValue);
                    }
                }
            }
            
            if (keyid != "")
            {
                valdata.SetValue(valdata.KeyID, Convert.ToDecimal(keyid));
                count = BLLTable<ITableImplement>.Factory(conn).Update(valdata, valdata.KeyID);
            }
            else
            {
                count = BLLTable<ITableImplement>.Factory(conn).Insert(valdata, valdata.KeyID);
                string ss=BLLTable.SQL_Test.ToString();
                keyid = Convert.ToString(valdata.GetValue(valdata.KeyID));

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
                //if (btn.ID.IndexOf("btnOK")!=-1)//�����˳�
                {
                    if (ViewState["sbData"] == null)
                    {
                        string dataStr = "[" + ViewState["sbData"].ToString() + "]";
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = '" + dataStr + "';}else{window.returnValue = '" + dataStr + "';}window.close();", true);
                    }
                    else
                    {
                        ScriptManager.RegisterStartupScript(Page, this.GetType(), "goto", "if (window.opener){window.opener.returnValue = 're';}else{window.returnValue = 're';};window.close();", true);
                    }
                }
                //else  //������
                {           
                   
                }
            }
            else
            {
                //��δ���
            }
        }
        catch (Exception ex)
        {
            litWarn.Text = ex.Message;
        }
    }
    protected bool TryGetRequest(string fieldName, out string fieldValue)
    {
        fieldValue = Request[fieldName]; ;
        if (!string.IsNullOrEmpty(fieldValue))
        {
            return true;
        }
        return false;
    }
    protected bool TryGetRequest(DataBaseField f1, out string fieldValue)
    {
        if (TryGetRequest(f1.Desc.FieldCtrlName, out fieldValue))
        {
            if (f1.Desc.CtrlType == BaseCtrlType.SelectDrop &&
                (fieldValue == "-1" || fieldValue == ""))
                return false;

            if ((f1.Desc.CtrlType == BaseCtrlType.InputDate || f1.Desc.CtrlType == BaseCtrlType.InputDateTime) &&
                (fieldValue == "0001-01-01" || fieldValue == "1900-01-01"))
                return false;
            return true;
        }
        else if (TryGetRequest(f1.Desc.FieldName, out fieldValue))
        {
            return true;
        }
        return false;
    }
    private bool isSelect(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.RadioBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.CheckBoxList
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectDrop
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectSingle
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.SelectMultiple)
        {
            return true;
        }
        return false;
    }
    private bool isChaZhao(DataBaseField f1)
    {
        if (f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationUser
                    || f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationFK )//����
        {
            return true;
        }
        return false;
    }

}
