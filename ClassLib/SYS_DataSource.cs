/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-01-31 15:46:09
  Description:    ���ݱ�SYS_DATASOURCE��Ӧ��ҵ���߼���SYS_DATASOURCE
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� SYS_DATASOURCE_Entity:SYS_DATASOURCE
 * 
************************************************************/
/************************************************************
SQL���룺
select ID,SourceConnectString,SourceType,SourceName from SYS_DATASOURCE
delete from SYS_DATASOURCE
INSERT INTO SYS_DATASOURCE (ID,SourceConnectString,SourceType,SourceName)
     VALUES
           ('','','','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.ID = "";
        valObj.SourceConnectString = "";
        valObj.SourceType = "";
        valObj.SourceName = ""; 
 * ************************************************************/
using System;
using System.Data;
using System.Collections.Generic;
using System.Collections;
using System.Reflection;
using AgileFrame.Orm.PersistenceLayer.DAL.Base;
using AgileFrame.Orm.PersistenceLayer.BLL.Base;
using AgileFrame.Orm.PersistenceLayer.Model;
using AgileFrame.Core;

namespace AgileFrame.Orm.PersistenceLayer.Model
{
    /// <summary>
    /// <para>����Դ����</para>
    /// <para>��SYS_DATASOURCE���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class SYS_DATASOURCE : ITableImplement
    {
        /// <summary>����Դ���� ��������</summary>
        public static SYS_DATASOURCE Factory()
        {
            return new SYS_DATASOURCE();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> �Զ���ʶ Attribute_IsPrimary_IsNotNull </summary>
        public string _ID
        {            
            get { return this.ID; }
            set { this.ID = value; }
        }
        
        /// <summary> ����Դ�����ַ��� Attribute </summary>
        public string _SourceConnectString
        {            
            get { return this.SourceConnectString; }
            set { this.SourceConnectString = value; }
        }
        
        /// <summary> ����Դ���� Attribute </summary>
        public string _SourceType
        {            
            get { return this.SourceType; }
            set { this.SourceType = value; }
        }
        
        /// <summary> ����Դ��� Attribute </summary>
        public string _SourceName
        {            
            get { return this.SourceName; }
            set { this.SourceName = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> �Զ���ʶ���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string ID
        {
            get { return this.m_id; }
            set //
            {
                if (!id_initialized || m_id != value)
                {
                    this.m_id = value;
                }
                id_initialized = true;
            }
        }
        
        /// <summary> ����Դ�����ַ������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string SourceConnectString
        {
            get { return this.m_sourceconnectstring; }
            set //
            {
                if (!sourceconnectstring_initialized || m_sourceconnectstring != value)
                {
                    this.m_sourceconnectstring = value;
                }
                sourceconnectstring_initialized = true;
            }
        }
        
        /// <summary> ����Դ���ͣ��Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string SourceType
        {
            get { return this.m_sourcetype; }
            set //
            {
                if (!sourcetype_initialized || m_sourcetype != value)
                {
                    this.m_sourcetype = value;
                }
                sourcetype_initialized = true;
            }
        }
        
        /// <summary> ����Դ��ƣ��Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string SourceName
        {
            get { return this.m_sourcename; }
            set //
            {
                if (!sourcename_initialized || m_sourcename != value)
                {
                    this.m_sourcename = value;
                }
                sourcename_initialized = true;
            }
        }    
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>�Զ���ʶ</summary>
            public static AttributeItem ID =  new AttributeItem("[SYS_DATASOURCE].[ID]", typeof(string), 50);
            
            /// <summary>����Դ�����ַ���</summary>
            public static AttributeItem SourceConnectString =  new AttributeItem("[SYS_DATASOURCE].[SourceConnectString]", typeof(string), 50);
            
            /// <summary>����Դ����</summary>
            public static AttributeItem SourceType =  new AttributeItem("[SYS_DATASOURCE].[SourceType]", typeof(string), 50);
            
            /// <summary>����Դ���</summary>
            public static AttributeItem SourceName =  new AttributeItem("[SYS_DATASOURCE].[SourceName]", typeof(string), 10);
        }
        #endregion
        #region bool�嵥 �������
        
        private string m_id;
        /// <summary></summary>
        protected bool id_initialized = false;
        
        private string m_sourceconnectstring;
        /// <summary></summary>
        protected bool sourceconnectstring_initialized = false;
        
        private string m_sourcetype;
        /// <summary></summary>
        protected bool sourcetype_initialized = false;
        
        private string m_sourcename;
        /// <summary></summary>
        protected bool sourcename_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� ����Դ����
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "SYS_DATASOURCE";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.id_initialized = IsLoadAllAttributes;this.sourceconnectstring_initialized = IsLoadAllAttributes;this.sourcetype_initialized = IsLoadAllAttributes;this.sourcename_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			SYS_DATASOURCE value = new SYS_DATASOURCE();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"ID"))
				value.id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceConnectString"))
				value.sourceconnectstring_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceType"))
				value.sourcetype_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SourceName"))
				value.sourcename_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>����Դ����</summary>
        public new SYS_DATASOURCE Clone()
        {
            return (SYS_DATASOURCE)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>����Դ���� ���캯��</summary>
        static SYS_DATASOURCE()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>����Դ���� ���캯��</summary>
        public SYS_DATASOURCE() { }
        /// <summary>
        /// ����Դ���� �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public SYS_DATASOURCE(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>����Դ���� ʵ�ֱַ��ܣ��޸ı���</summary>
        public SYS_DATASOURCE(string tableName):base(tableName) { }
        /// <summary>����Դ���� ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        public SYS_DATASOURCE(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>����Դ���� ʵ�ֿ�ݹ���</summary>
        public SYS_DATASOURCE(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>����Դ���� ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public SYS_DATASOURCE(string id, string sourceconnectstring, string sourcetype, string sourcename)
        {
            
            this.ID = id;
            
            this.SourceConnectString = sourceconnectstring;
            
            this.SourceType = sourcetype;
            
            this.SourceName = sourcename;
        }
        /// <summary>����Դ���� ����ͼ������ڻ�ȡ����</summary>
        public static SYS_DATASOURCE FromIView(IView view)
        {
            return (SYS_DATASOURCE)IView.GetITable(view, "SYS_DATASOURCE");
        }
        /// <summary>����Դ���� ���һ��ʵ��</summary>
        public static SYS_DATASOURCE GetOneInstance()
        {
            SYS_DATASOURCE value = new SYS_DATASOURCE();
            return value;
        }
        /// <summary>����Դ���� ��ȡ��һʵ��==BLLTable.GetRowData();</summary>
        public SYS_DATASOURCE Retrieve()
        {
            BLLTable<SYS_DATASOURCE>.Factory(conn).GetRowData(this);
            return this;
        }
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "ID":
			        return ID;
			    			
			    case "SourceConnectString":
			        return SourceConnectString;
			    			
			    case "SourceType":
			        return SourceType;
			    			
			    case "SourceName":
			        return SourceName;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "ID":
			        this.ID = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceConnectString":
			        this.SourceConnectString = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceType":
			        this.SourceType = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SourceName":
			        this.SourceName = Convert.ToString(AttributeValue);
                    return true;
			
                default:
                    return base.SetValue(AttributeName, AttributeValue);
			}
        }
        
        /// <summary>ͨ������ ��ȡ���ֶ��Ƿ��ѱ���ʼ��</summary>
        public override bool GetInitialized(AttributeItem AttributeName)
        {
			switch(AttributeName.FieldName)
			{	
				case "ID":
					return id_initialized;
				
				case "SourceConnectString":
					return sourceconnectstring_initialized;
				
				case "SourceType":
					return sourcetype_initialized;
				
				case "SourceName":
					return sourcename_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "ID":
					id_initialized = ret;
					return true;
				
				case "SourceConnectString":
					sourceconnectstring_initialized = ret;
					return true;
				
				case "SourceType":
					sourcetype_initialized = ret;
					return true;
				
				case "SourceName":
					sourcename_initialized = ret;
					return true;
				
                default:
                    return base.SetInitialized(AttributeName, ret);
			}
        }
        #endregion


        #region ��ȡDataParameter PropertyInfo

        /// <summary>
        /// ��ȡ���б���ʼ������ֵ����ȡAttributeItem
        /// Ŀ��Ϊ��ȡ System.Windows.Forms.DataGridViewTextBoxColumn[] ���м����ݲ������ �Զ���� MyDataGridViewTextBoxColumn (����̳��� DataGridViewTextBoxColumn)
        /// ������������α����ķ�������Ϊ�˱����װ���̣�ʹ��Դ����ģʽ��ʱ�򣬲���������windows.form.dll��
        /// </summary>
        /// <returns></returns>
        public override AttributeItem[] af_GetAvailableAttributeItem(ref List<object> values)
        {
            List<AttributeItem> parametersList = new List<AttributeItem>();

			
			if (id_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ID);
                }
			}
			
			if (sourceconnectstring_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceConnectString;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceConnectString);
                }
			}
			
			if (sourcetype_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceType;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceType);
                }
			}
			
			if (sourcename_initialized)
			{
                AttributeItem attr = SYS_DATASOURCE.Attribute.SourceName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SourceName);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}