/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:21
  Description:    ���ݱ�A8OnlineUserConstr��Ӧ��ҵ���߼���A8OnlineUserConstr
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� A8OnlineUserConstr_Entity:A8OnlineUserConstr
 * 
************************************************************/
/************************************************************
SQL���룺
select UserSession,Constring from A8OnlineUserConstr
delete from A8OnlineUserConstr
INSERT INTO A8OnlineUserConstr (UserSession,Constring)
     VALUES
           ('','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.UserSession = "";
        valObj.Constring = ""; 
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
    /// <para>�����û����Ӽ��</para>
    /// <para>��A8OnlineUserConstr���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class A8OnlineUserConstr : ITableImplement
    {
        /// <summary>�����û����Ӽ�� ��������</summary>
        public static A8OnlineUserConstr Factory()
        {
            return new A8OnlineUserConstr();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> �û��Ự Attribute_IsNotNull </summary>
        public string _UserSession
        {            
            get { return this.UserSession; }
            set { this.UserSession = value; }
        }
        
        /// <summary> �����ַ��� Attribute_IsNotNull </summary>
        public string _Constring
        {            
            get { return this.Constring; }
            set { this.Constring = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> �û��Ự���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string UserSession
        {
            get { return this.m_usersession; }
            set //
            {
                if (!usersession_initialized || m_usersession != value)
                {
                    this.m_usersession = value;
                }
                usersession_initialized = true;
            }
        }
        
        /// <summary> �����ַ������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Constring
        {
            get { return this.m_constring; }
            set //
            {
                if (!constring_initialized || m_constring != value)
                {
                    this.m_constring = value;
                }
                constring_initialized = true;
            }
        }    
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>�û��Ự</summary>
            public static AttributeItem UserSession =  new AttributeItem("[A8OnlineUserConstr].[UserSession]", typeof(string), 100);
            
            /// <summary>�����ַ���</summary>
            public static AttributeItem Constring =  new AttributeItem("[A8OnlineUserConstr].[Constring]", typeof(string), 500);
        }
        #endregion
        #region bool�嵥 �������
        
        private string m_usersession;
        /// <summary></summary>
        protected bool usersession_initialized = false;
        
        private string m_constring;
        /// <summary></summary>
        protected bool constring_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� �����û����Ӽ��
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "A8OnlineUserConstr";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.usersession_initialized = IsLoadAllAttributes;this.constring_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			A8OnlineUserConstr value = new A8OnlineUserConstr();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"UserSession"))
				value.usersession_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Constring"))
				value.constring_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>�����û����Ӽ��</summary>
        public new A8OnlineUserConstr Clone()
        {
            return (A8OnlineUserConstr)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>�����û����Ӽ�� ���캯��</summary>
        static A8OnlineUserConstr()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>�����û����Ӽ�� ���캯��</summary>
        public A8OnlineUserConstr() { }
        /// <summary>
        /// �����û����Ӽ�� �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public A8OnlineUserConstr(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>�����û����Ӽ�� ʵ�ֱַ��ܣ��޸ı���</summary>
        //public A8OnlineUserConstr(string tableName):base(tableName) { }
        /// <summary>�����û����Ӽ�� ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        //public A8OnlineUserConstr(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>�����û����Ӽ�� ʵ�ֿ�ݹ���</summary>
        //public A8OnlineUserConstr(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>�����û����Ӽ�� ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public A8OnlineUserConstr(string usersession, string constring)
        {
            
            this.UserSession = usersession;
            
            this.Constring = constring;
        }
        /// <summary>�����û����Ӽ�� ����ͼ������ڻ�ȡ����</summary>
        public static A8OnlineUserConstr FromIView(IView view)
        {
            return (A8OnlineUserConstr)IView.GetITable(view, "A8OnlineUserConstr");
        }
        /// <summary>�����û����Ӽ�� ���һ��ʵ��</summary>
        public static A8OnlineUserConstr GetOneInstance()
        {
            A8OnlineUserConstr value = new A8OnlineUserConstr();
            return value;
        }
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "UserSession":
			        return UserSession;
			    			
			    case "Constring":
			        return Constring;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "UserSession":
			        this.UserSession = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Constring":
			        this.Constring = Convert.ToString(AttributeValue);
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
				case "UserSession":
					return usersession_initialized;
				
				case "Constring":
					return constring_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "UserSession":
					usersession_initialized = ret;
					return true;
				
				case "Constring":
					constring_initialized = ret;
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

			
			if (usersession_initialized)
			{
                AttributeItem attr = A8OnlineUserConstr.Attribute.UserSession;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(UserSession);
                }
			}
			
			if (constring_initialized)
			{
                AttributeItem attr = A8OnlineUserConstr.Attribute.Constring;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Constring);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}