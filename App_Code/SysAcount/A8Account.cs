/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:21
  Description:    ���ݱ�A8Account��Ӧ��ҵ���߼���A8Account
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� A8Account_Entity:A8Account
 * 
************************************************************/
/************************************************************
SQL���룺
select RECID,FullName,DBName,CreateDate,ShowOrder,ConnectStr from A8Account
delete from A8Account
INSERT INTO A8Account (RECID,FullName,DBName,CreateDate,ShowOrder,ConnectStr)
     VALUES
           ('','','','','','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.RECID = "";
        valObj.FullName = "";
        valObj.DBName = "";
        valObj.CreateDate = "";
        valObj.ShowOrder = "";
        valObj.ConnectStr = ""; 
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
    /// <para>������</para>
    /// <para>��A8Account���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class A8Account : ITableImplement
    {
        /// <summary>������ ��������</summary>
        public static A8Account Factory()
        {
            return new A8Account();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> RECID Attribute_IsPrimary_IsNotNull_IDENTITY </summary>
        public int _RECID
        {            
            get { return this.RECID; }
            set { this.RECID = value; }
        }
        
        /// <summary> ȫ�� Attribute </summary>
        public string _FullName
        {            
            get { return this.FullName; }
            set { this.FullName = value; }
        }
        
        /// <summary> ���ݿ��� Attribute </summary>
        public string _DBName
        {            
            get { return this.DBName; }
            set { this.DBName = value; }
        }
        
        /// <summary> ����ʱ�� Attribute </summary>
        public DateTime _CreateDate
        {            
            get { return this.CreateDate; }
            set { this.CreateDate = value; }
        }
        
        /// <summary> ��ʾ˳�� Attribute </summary>
        public Byte _ShowOrder
        {            
            get { return this.ShowOrder; }
            set { this.ShowOrder = value; }
        }
        
        /// <summary> �����ַ��� Attribute </summary>
        public string _ConnectStr
        {            
            get { return this.ConnectStr; }
            set { this.ConnectStr = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> RECID���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public int RECID
        {
            get { return this.m_recid; }
            set //private 
            {
                if (!recid_initialized || m_recid != value)
                {
                    this.m_recid = value;
                }
                recid_initialized = true;
            }
        }
        
        /// <summary> ȫ�ƣ��Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string FullName
        {
            get { return this.m_fullname; }
            set //
            {
                if (!fullname_initialized || m_fullname != value)
                {
                    this.m_fullname = value;
                }
                fullname_initialized = true;
            }
        }
        
        /// <summary> ���ݿ������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string DBName
        {
            get { return this.m_dbname; }
            set //
            {
                if (!dbname_initialized || m_dbname != value)
                {
                    this.m_dbname = value;
                }
                dbname_initialized = true;
            }
        }
        
        /// <summary> ����ʱ�䣬�Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public DateTime CreateDate
        {
            get { return this.m_createdate; }
            set //
            {
                if (!createdate_initialized || m_createdate != value)
                {
                    this.m_createdate = value;
                }
                createdate_initialized = true;
            }
        }
        
        /// <summary> ��ʾ˳���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public Byte ShowOrder
        {
            get { return this.m_showorder; }
            set //
            {
                if (!showorder_initialized || m_showorder != value)
                {
                    this.m_showorder = value;
                }
                showorder_initialized = true;
            }
        }
        
        /// <summary> �����ַ������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string ConnectStr
        {
            get { return this.m_connectstr; }
            set //
            {
                if (!connectstr_initialized || m_connectstr != value)
                {
                    this.m_connectstr = value;
                }
                connectstr_initialized = true;
            }
        }    
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>RECID</summary>
            public static AttributeItem RECID =  new AttributeItem("[A8Account].[RECID]", typeof(int), 2147483647);
            
            /// <summary>ȫ��</summary>
            public static AttributeItem FullName =  new AttributeItem("[A8Account].[FullName]", typeof(string), 100);
            
            /// <summary>���ݿ���</summary>
            public static AttributeItem DBName =  new AttributeItem("[A8Account].[DBName]", typeof(string), 100);
            
            /// <summary>����ʱ��</summary>
            public static AttributeItem CreateDate =  new AttributeItem("[A8Account].[CreateDate]", typeof(DateTime), 100);
            
            /// <summary>��ʾ˳��</summary>
            public static AttributeItem ShowOrder =  new AttributeItem("[A8Account].[ShowOrder]", typeof(Byte), 1);
            
            /// <summary>�����ַ���</summary>
            public static AttributeItem ConnectStr =  new AttributeItem("[A8Account].[ConnectStr]", typeof(string), 500);
        }
        #endregion
        #region bool�嵥 �������
        
        private int m_recid;
        /// <summary></summary>
        protected bool recid_initialized = false;
        
        private string m_fullname;
        /// <summary></summary>
        protected bool fullname_initialized = false;
        
        private string m_dbname;
        /// <summary></summary>
        protected bool dbname_initialized = false;
        
        private DateTime m_createdate;
        /// <summary></summary>
        protected bool createdate_initialized = false;
        
        private Byte m_showorder;
        /// <summary></summary>
        protected bool showorder_initialized = false;
        
        private string m_connectstr;
        /// <summary></summary>
        protected bool connectstr_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� ������
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "A8Account";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.recid_initialized = IsLoadAllAttributes;this.fullname_initialized = IsLoadAllAttributes;this.dbname_initialized = IsLoadAllAttributes;this.createdate_initialized = IsLoadAllAttributes;this.showorder_initialized = IsLoadAllAttributes;this.connectstr_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			A8Account value = new A8Account();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"RECID"))
				value.recid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"FullName"))
				value.fullname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DBName"))
				value.dbname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"CreateDate"))
				value.createdate_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ShowOrder"))
				value.showorder_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ConnectStr"))
				value.connectstr_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>������</summary>
        public new A8Account Clone()
        {
            return (A8Account)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>������ ���캯��</summary>
        static A8Account()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>������ ���캯��</summary>
        public A8Account() { }
        /// <summary>
        /// ������ �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public A8Account(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>������ ʵ�ֱַ��ܣ��޸ı���</summary>
        //public A8Account(string tableName):base(tableName) { }
        /// <summary>������ ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        //public A8Account(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>������ ʵ�ֿ�ݹ���</summary>
        //public A8Account(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>������ ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public A8Account(int recid, string fullname, string dbname, DateTime createdate, Byte showorder, string connectstr)
        {
            
            this.RECID = recid;
            
            this.FullName = fullname;
            
            this.DBName = dbname;
            
            this.CreateDate = createdate;
            
            this.ShowOrder = showorder;
            
            this.ConnectStr = connectstr;
        }
        /// <summary>������ ����ͼ������ڻ�ȡ����</summary>
        public static A8Account FromIView(IView view)
        {
            return (A8Account)IView.GetITable(view, "A8Account");
        }
        /// <summary>������ ���һ��ʵ��</summary>
        public static A8Account GetOneInstance()
        {
            A8Account value = new A8Account();
            return value;
        }
       
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "RECID":
			        return RECID;
			    			
			    case "FullName":
			        return FullName;
			    			
			    case "DBName":
			        return DBName;
			    			
			    case "CreateDate":
			        return CreateDate;
			    			
			    case "ShowOrder":
			        return ShowOrder;
			    			
			    case "ConnectStr":
			        return ConnectStr;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "RECID":
			        this.RECID = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "FullName":
			        this.FullName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DBName":
			        this.DBName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "CreateDate":
			        this.CreateDate = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ShowOrder":
			        this.ShowOrder = Convert.ToByte(AttributeValue);
                    return true;
			    			
			    case "ConnectStr":
			        this.ConnectStr = Convert.ToString(AttributeValue);
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
				case "RECID":
					return recid_initialized;
				
				case "FullName":
					return fullname_initialized;
				
				case "DBName":
					return dbname_initialized;
				
				case "CreateDate":
					return createdate_initialized;
				
				case "ShowOrder":
					return showorder_initialized;
				
				case "ConnectStr":
					return connectstr_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "RECID":
					recid_initialized = ret;
					return true;
				
				case "FullName":
					fullname_initialized = ret;
					return true;
				
				case "DBName":
					dbname_initialized = ret;
					return true;
				
				case "CreateDate":
					createdate_initialized = ret;
					return true;
				
				case "ShowOrder":
					showorder_initialized = ret;
					return true;
				
				case "ConnectStr":
					connectstr_initialized = ret;
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

			
			if (recid_initialized)
			{
                AttributeItem attr = A8Account.Attribute.RECID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(RECID);
                }
			}
			
			if (fullname_initialized)
			{
                AttributeItem attr = A8Account.Attribute.FullName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(FullName);
                }
			}
			
			if (dbname_initialized)
			{
                AttributeItem attr = A8Account.Attribute.DBName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DBName);
                }
			}
			
			if (createdate_initialized)
			{
                AttributeItem attr = A8Account.Attribute.CreateDate;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(CreateDate);
                }
			}
			
			if (showorder_initialized)
			{
                AttributeItem attr = A8Account.Attribute.ShowOrder;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ShowOrder);
                }
			}
			
			if (connectstr_initialized)
			{
                AttributeItem attr = A8Account.Attribute.ConnectStr;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ConnectStr);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}