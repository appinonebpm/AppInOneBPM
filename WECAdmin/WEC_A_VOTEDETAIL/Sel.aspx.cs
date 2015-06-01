using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using AgileFrame.Core;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Orm.PersistenceLayer.BLL;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.AppInOne.Common;
using AgileFrame.AppInOne.SYS;
using AgileFrame.Orm.TemplateEngine;
using System.Text;
using AgileFrame.Common;

public partial class Sel : BaseAdminPage
{
        protected string showLeftLinks(string path, string pname, int rowIndex)
        {
            if (litPathLink.Text == "")
            {
                litPathLink.Text = CommonHelper.GetPathLinks("Manage.aspx", pid, path, pname);
            }
            int numStr = aspPager.PageSize * (aspPager.CurrentPageIndex - 1) + rowIndex + 1;
            return "<b>" + numStr + "</b>" + CommonHelper.ShowLinkByPath("Manage.aspx", path);
        }
        //��������
        protected ITableImplement finderObj = new ITableImplement();
        //ȡֵ��ͼ����
        protected ITableImplement valObj = new ITableImplement();
        //������ͼ����
        protected ITableImplement condObj = new ITableImplement();
        //�༭����
        protected ITableImplement valObjEdit = new ITableImplement();
        //�б�ҳ
        protected List<ITableImplement> listObj = new List<ITableImplement>();
        #region ģ�弯
        string Finder = @"<!--Switch-->
                    <!--Case InputString-->
                       <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' ck='{len:{�ֶα�ǩ����},type:{�ֶ�js����ö��}}' />
                    <!--Case SmallText-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case Text-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case SelectDrop--><!--Case SelectDrop-->
                    <select name='{�ֶοؼ���}' id='{�ֶοؼ���}'>
                        {�ֶ�ֵ}
                    </select>
                    <!--Case Select_RelationFK--><!--Case Select_RelationUser-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='hidden'  value='{�ֶ�ֵ}' />
                    <input name='{�ֶοؼ���}_NAME' id='{�ֶοؼ���}_NAME' value='{�ֶ���ʾֵ}' class='selshowinput' readonly='readonly' style='width:70%;float:left;' type='text' />
                    <input class='sel' type='button' onclick='sel(this,""{����ĸ��д��������}"");' value='' style='float:left;' />    
                    <!--Case CheckBoxList-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='checkbox' value='{�ֶ�ֵ}' class='ckb' />
                    <!--Case RadioBoxList-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='radio' value='{�ֶ�ֵ}' class='ckb' />
                    <!--Case InputDateTime-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)' value='{�ֶ�ֵ}' />
                    <!--Case InputDate-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' readonly='readonly' onclick='setday(this)' value='{�ֶ�ֵ}' />
                    <!--Case FileUpUpDoc-->
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='text' value='{�ֶ�ֵ}' />
                    <!--Case InputPassWord--> 
                    <input name='{�ֶοؼ���}' id='{�ֶοؼ���}' type='password' value='{�ֶ�ֵ}'>
                <!--EndSwitch-->";

        #endregion ģ�弯
        /// <summary>
        /// ����html
        /// </summary>
        /// <returns></returns>
        protected string getFinder()
        {
            StringBuilder sb = new StringBuilder();
            try
            {
                foreach (DataBaseField f1 in fieldList)
                {
                    f1.Value = null;
                    bool isNull1 = finderObj.IsNotNull();
                    bool isInit1 = false;
                    //���������и�ֵ
                    if (isNull1)
                    {
                        AttributeItem attr1 = new AttributeItem(f1);
                        isInit1 = finderObj.GetInitialized(attr1);
                        if (isInit1)
                            f1.Value = Convert.ToString(finderObj.GetValue(attr1));
                    }

                    string attrHtml = Finder;

                    BuildByTag b1 = new BuildByTag(BuildType.ForHtmlValue);
                    b1.ParseForSwitch��ǩ(ref attrHtml, f1);

                    if (isChaZhao(f1))
                    {
                        attrHtml = attrHtml.Replace("{�ֶ���ʾֵ}", Convert.ToString(finderObj.GetValue(f1.TableName, f1.Desc.FieldCtrlName + "_NAME")));
                    }

                    sb.Append("<dl><dt>").Append(f1.Desc.ZhName).Append("��</dt><!--").Append(f1.FieldName)
                        .Append("--><dd><span>");
                    sb.Append(attrHtml);
                    sb.Append("</span></dd></dl>");
                }
            }
            catch (Exception ex)
            {
                Cs.Error("34" + ex.ToString());
            }
            return sb.ToString();
        }

        protected string pid = "0";

        int recount = -1;//��ѯ�ܼ�¼��
        protected string title = "";
        protected List<DataBaseField> fieldList = new List<DataBaseField>();

        private void BindList(int curPage)
        {
            #region//����Ȩ������

            #endregion

            //���÷�ΧȨ��
            SetConditionByRequest(condObj);

            List<Relation> relations = new List<Relation>();
            if (!string.IsNullOrEmpty(ModuleName))
            {
                //������
                List<ITableImplement> otherValueList; List<Relation> relationList;
                valObj.GetModule(out otherValueList, out relationList);

                listObj = BLLTable<ITableImplement>.Factory(conn).SelectByPage(valObj, relations, null,
            condObj, aspPager.PageSize, curPage, ref recount);
                BLLTable.SQL_Test.ToString();
            }

            aspPager.RecordCount = recount;
        }
        protected AttributeItem pageAttr1 = null;
        protected void Page_Load(object sender, EventArgs e)
        {
            base.InitModule(ref valObj, ref KeyID, ref fieldList);

            if (!string.IsNullOrEmpty(ModuleName))
            {
                pageAttr1 = AttributeItem.Factory(valObj.DataBaseTable.IDField);
                condObj.af_PageBy(pageAttr1, Order.Desc);

                //condObj111._TableName = valObj111._TableName;

                finderObj._TableName = valObj._TableName;

                DataBaseField[] ds1 = valObj.af_GetAvailableDataBaseField();
                foreach (DataBaseField f1 in ds1)
                {
                    if (!f1.Desc.af_Enable || !f1.Desc.af_Visable)
                        continue;
                    fieldList.Add(f1);
                }
            }

            title = valObj._ZhName + "����";
            Page.Title = title;

            if (!IsPostBack)
            {
                //�����ݿ��ȡ���õ�ȡֵ���������������Ϊ��ͼ��jinsj
                Ec_View cond1 = new Ec_View();
                cond1.ModuleName = valObj._TableName;
                Ec_View v1 = BLLTable<Ec_View>.GetRowData(cond1);
                if (v1 != null && v1.IsNotNull())
                {
                    if (v1.ValueJsonString != "")
                    {
                        valObj = JsonServiceBase.FromJson<ITableImplement>(v1.ValueJsonString);
                    }
                    if (v1.ConditionJsonString != "")
                    {
                        condObj = JsonServiceBase.FromJson<ITableImplement>(v1.ConditionJsonString);
                    }
                    string viewName = v1.ViewName;
                }
                #region//Ĭ�����Գ�ʼ��
                aspPager.CurrentPageIndex = 1;
                txtPageSize.Value = "30";
                aspPager.PageSize = 30;
                #endregion
                #region//���ݳ�ʼ��

                #endregion

                BindList(1);
            }
            if (hidCondition.Value != "")
            {
                //condObj111 = JsonServiceBase.FromJson<ITableImplement>(hidCondition.Value);
            }
            if (hidFind.Value != "")
            {
                finderObj = JsonServiceBase.FromJson<ITableImplement>(hidFind.Value);
            }
            if (hidVal.Value != "")
            {
                //valObj111 = JsonServiceBase.FromJson<ITableImplement>(hidVal.Value);
            }
            if (valObj.IsNull())
            {
                //valObj111.LoadAllAttributes(true);
            }
        }

        #region ��ȡ����е�ֵ
        /// <summary>
        /// ��ȡlistҳ������Դ  
        /// ֧����ģ�������
        /// ֧��ö����
        /// ֧��ʱ���ʽ
        /// </summary>
        /// <param name="f1"></param>
        /// <returns></returns>
        public string GetHtmlList(DataBaseField f1, ITableImplement this1)
        {
            if (!f1.Desc.af_Enable) return "";//�Ƿ����
            if (!f1.Desc.af_Visable) return "";//�Ƿ�ɼ�
            string html = "";
            string tableName = f1.TableName;
            AttributeItem attr1 = AttributeItem.Factory(f1);
            object value1 = (this1.GetValue(attr1));
            DataBaseTable dt1 = f1.DataBaseTable; //DataBaseField f1;

            try
            {
                DataBaseField id1 = dt1.IDField;
                DataBaseField name1 = dt1.NameField;

                if (f1 == dt1.IDField)
                {
                    //html = "<a href='index.aspx?id=" + this1.GetValue(dt1.FieldID.FieldName) + "'>" + html + "</a>";
                }
                else if (f1 == dt1.NameField)// != null && dt1.NameField.FieldName == f1.FieldName)//��ģ��name��ϸ����
                {
                    string showUrl = "../" + dt1.TableName + "/show.aspx";
                    if (!Exist(showUrl))
                    {
                        showUrl = "show.aspx";
                    }
                    html = "<a href='" + showUrl + "?id=" + this1.GetValue(id1) + "&moduleName=" + tableName
                        + "' target='_blank'>" + value1 + "</a>";
                }
                else if (isSelect(f1))//ö����
                {
                    html = BaseFormHelper.Factory(this1.ConnectKey).GetOptionText(attr1, value1);
                }
                else if (isChaZhao(f1))//����
                {
                    DataBaseField f2 = f1.DataBaseTable.FatherTable_ChaZhao[0].DataBaseTable.NameField;
                    AttributeItem attr2 = AttributeItem.Factory(f2);
                    html = Convert.ToString(this1.GetValue(attr2));
                }
                else if (f1.Desc.Switch_CtrlType == BaseCtrlType.FileUpImage)
                {
                    html = "<img src ='" + value1 + "' style='height:40px' />";
                }
            }
            catch (Exception ex)
            {
                Cs.Error(ex.ToString());
            }
            if (html == "")
            {
                html = Convert.ToString(value1);
            }
            return html;
        }
        private static Dictionary<string, bool> urlExistFile = new Dictionary<string, bool>();
        private bool Exist(string showUrl)
        {
            bool isExist;
            if (urlExistFile.TryGetValue(showUrl, out isExist))
            {
                string file1 = Request.MapPath(showUrl);
                //file1 = Server.MapPath(showUrl);
                isExist = System.IO.File.Exists(file1);
                urlExistFile.Add(showUrl, isExist);
            }
            return isExist;
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
                        || f1.Desc.Switch_CtrlType == BaseCtrlType.Select_RelationFK)//����
            {
                return true;
            }
            return false;
        }
        #endregion ��ȡ����е�ֵ

        protected void aspPager_PageChanged(object sender, EventArgs e)
        {
            SaveState();
            BindList(aspPager.CurrentPageIndex);
        }
        protected bool TryGetRequest(string fieldName, out string fieldValue)
        {
            fieldValue = Request[fieldName];
            //if (!string.IsNullOrEmpty(fieldValue))
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

        protected void btnFind_Click(object sender, EventArgs e)
        {
            SaveState();
            BindList(1);
        }
        private void SaveState()
        {
            #region ��ȡ����
            finderObj = new ITableImplement();
            foreach (DataBaseField f1 in valObj.af_GetAvailableDataBaseField())
            {
                string fieldValue = null;
                AttributeItem attr1 = null;
                try
                {
                    if (isChaZhao(f1))
                    {
                        if (TryGetRequest(f1.Desc.FieldCtrlName + "_NAME", out fieldValue))
                        {
                            attr1 = new AttributeItem(f1.TableName, f1.Desc.FieldCtrlName + "_NAME");
                            finderObj.SetValue(attr1, fieldValue);
                        }
                    }
                    if (TryGetRequest(f1, out fieldValue))
                    {
                        attr1 = new AttributeItem(f1);
                        finderObj.SetValue(attr1, fieldValue);
                        if (!string.IsNullOrEmpty(fieldValue))
                            condObj.Like(attr1, fieldValue);
                    }
                }
                catch (Exception ex)
                {
                    Cs.Error(ex.ToString());
                    litWarn.Text = ex.Message + ":" + attr1.LongName + "=" + fieldValue;
                }
            }

            //hidVal.Value = valObj111.ToJson(20);
            //hidCondition.Value = condObj111.ToJson(20);
            hidFind.Value = finderObj.ToJson(20);

            //if (hidCondition.Value != "")
            //{
            //    condObj111 = JsonServiceBase.FromJson<ITableImplement>(hidCondition.Value);
            //}
            #endregion
        }

        protected void btnSetPageSize_Click(object sender, EventArgs e)
        {
            aspPager.PageSize = int.Parse(txtPageSize.Value);
            SaveState();
            BindList(aspPager.CurrentPageIndex);
        }

        protected void repList_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            try
            {
            }
            catch (Exception ex)
            {
                litWarn.Text = ex.Message;
            }
        }
}