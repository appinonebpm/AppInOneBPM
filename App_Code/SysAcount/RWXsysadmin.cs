/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:23
  Description:    ���ݱ�RWXsysadmin��Ӧ��ҵ���߼���RWXsysadmin
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� RWXsysadmin_Entity:RWXsysadmin
 * 
************************************************************/
/************************************************************
SQL���룺
select Password,Version,LoginMode,Verification,Logoimg,Logoposition,Logosize,Logotype from RWXsysadmin
delete from RWXsysadmin
INSERT INTO RWXsysadmin (Password,Version,LoginMode,Verification,Logoimg,Logoposition,Logosize,Logotype)
     VALUES
           ('','','','','','','','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.Password = "";
        valObj.Version = "";
        valObj.LoginMode = "";
        valObj.Verification = "";
        valObj.Logoimg = "";
        valObj.Logoposition = "";
        valObj.Logosize = "";
        valObj.Logotype = ""; 
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
    /// <para>ϵͳ���ƹ���</para>
    /// <para>��RWXsysadmin���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class RWXsysadmin : ITableImplement
    {
        /// <summary>ϵͳ���ƹ��� ��������</summary>
        public static RWXsysadmin Factory()
        {
            return new RWXsysadmin();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> ���� Attribute </summary>
        public string _Password
        {            
            get { return this.Password; }
            set { this.Password = value; }
        }
        
        /// <summary> �汾 Attribute </summary>
        public string _Version
        {            
            get { return this.Version; }
            set { this.Version = value; }
        }
        
        /// <summary> ��¼ģʽ Attribute </summary>
        public int _LoginMode
        {            
            get { return this.LoginMode; }
            set { this.LoginMode = value; }
        }
        
        /// <summary> ��֤ģʽ Attribute </summary>
        public int _Verification
        {            
            get { return this.Verification; }
            set { this.Verification = value; }
        }
        
        /// <summary> ��λLogo Attribute </summary>
        public Byte[] _Logoimg
        {            
            get { return this.Logoimg; }
            set { this.Logoimg = value; }
        }
        
        /// <summary> Logoλ�� Attribute </summary>
        public string _Logoposition
        {            
            get { return this.Logoposition; }
            set { this.Logoposition = value; }
        }
        
        /// <summary> Logo��С Attribute </summary>
        public string _Logosize
        {            
            get { return this.Logosize; }
            set { this.Logosize = value; }
        }
        
        /// <summary> Logo���� Attribute </summary>
        public string _Logotype
        {            
            get { return this.Logotype; }
            set { this.Logotype = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> ���룬�Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Password
        {
            get { return this.m_password; }
            set //
            {
                if (!password_initialized || m_password != value)
                {
                    this.m_password = value;
                }
                password_initialized = true;
            }
        }
        
        /// <summary> �汾���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Version
        {
            get { return this.m_version; }
            set //
            {
                if (!version_initialized || m_version != value)
                {
                    this.m_version = value;
                }
                version_initialized = true;
            }
        }
        
        /// <summary> ��¼ģʽ���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public int LoginMode
        {
            get { return this.m_loginmode; }
            set //
            {
                if (!loginmode_initialized || m_loginmode != value)
                {
                    this.m_loginmode = value;
                }
                loginmode_initialized = true;
            }
        }
        
        /// <summary> ��֤ģʽ���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public int Verification
        {
            get { return this.m_verification; }
            set //
            {
                if (!verification_initialized || m_verification != value)
                {
                    this.m_verification = value;
                }
                verification_initialized = true;
            }
        }
        
        /// <summary> ��λLogo���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public Byte[] Logoimg
        {
            get { return this.m_logoimg; }
            set //
            {
                if (!logoimg_initialized || m_logoimg != value)
                {
                    this.m_logoimg = value;
                }
                logoimg_initialized = true;
            }
        }
        
        /// <summary> Logoλ�ã��Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Logoposition
        {
            get { return this.m_logoposition; }
            set //
            {
                if (!logoposition_initialized || m_logoposition != value)
                {
                    this.m_logoposition = value;
                }
                logoposition_initialized = true;
            }
        }
        
        /// <summary> Logo��С���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Logosize
        {
            get { return this.m_logosize; }
            set //
            {
                if (!logosize_initialized || m_logosize != value)
                {
                    this.m_logosize = value;
                }
                logosize_initialized = true;
            }
        }
        
        /// <summary> Logo���ͣ��Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Logotype
        {
            get { return this.m_logotype; }
            set //
            {
                if (!logotype_initialized || m_logotype != value)
                {
                    this.m_logotype = value;
                }
                logotype_initialized = true;
            }
        }    
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>����</summary>
            public static AttributeItem Password =  new AttributeItem("[RWXsysadmin].[Password]", typeof(string), 100);
            
            /// <summary>�汾</summary>
            public static AttributeItem Version =  new AttributeItem("[RWXsysadmin].[Version]", typeof(string), 100);
            
            /// <summary>��¼ģʽ</summary>
            public static AttributeItem LoginMode =  new AttributeItem("[RWXsysadmin].[LoginMode]", typeof(int), 2147483647);
            
            /// <summary>��֤ģʽ</summary>
            public static AttributeItem Verification =  new AttributeItem("[RWXsysadmin].[Verification]", typeof(int), 2147483647);
            
            /// <summary>��λLogo</summary>
            public static AttributeItem Logoimg =  new AttributeItem("[RWXsysadmin].[Logoimg]", typeof(Byte[]), 16);
            
            /// <summary>Logoλ��</summary>
            public static AttributeItem Logoposition =  new AttributeItem("[RWXsysadmin].[Logoposition]", typeof(string), 8000);
            
            /// <summary>Logo��С</summary>
            public static AttributeItem Logosize =  new AttributeItem("[RWXsysadmin].[Logosize]", typeof(string), 8000);
            
            /// <summary>Logo����</summary>
            public static AttributeItem Logotype =  new AttributeItem("[RWXsysadmin].[Logotype]", typeof(string), 8000);
        }
        #endregion
        #region bool�嵥 �������
        
        private string m_password;
        /// <summary></summary>
        protected bool password_initialized = false;
        
        private string m_version;
        /// <summary></summary>
        protected bool version_initialized = false;
        
        private int m_loginmode;
        /// <summary></summary>
        protected bool loginmode_initialized = false;
        
        private int m_verification;
        /// <summary></summary>
        protected bool verification_initialized = false;
        
        private Byte[] m_logoimg;
        /// <summary></summary>
        protected bool logoimg_initialized = false;
        
        private string m_logoposition;
        /// <summary></summary>
        protected bool logoposition_initialized = false;
        
        private string m_logosize;
        /// <summary></summary>
        protected bool logosize_initialized = false;
        
        private string m_logotype;
        /// <summary></summary>
        protected bool logotype_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� ϵͳ���ƹ���
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "RWXsysadmin";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.password_initialized = IsLoadAllAttributes;this.version_initialized = IsLoadAllAttributes;this.loginmode_initialized = IsLoadAllAttributes;this.verification_initialized = IsLoadAllAttributes;this.logoimg_initialized = IsLoadAllAttributes;this.logoposition_initialized = IsLoadAllAttributes;this.logosize_initialized = IsLoadAllAttributes;this.logotype_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			RWXsysadmin value = new RWXsysadmin();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"Password"))
				value.password_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Version"))
				value.version_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"LoginMode"))
				value.loginmode_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Verification"))
				value.verification_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logoimg"))
				value.logoimg_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logoposition"))
				value.logoposition_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logosize"))
				value.logosize_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Logotype"))
				value.logotype_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>ϵͳ���ƹ���</summary>
        public new RWXsysadmin Clone()
        {
            return (RWXsysadmin)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>ϵͳ���ƹ��� ���캯��</summary>
        static RWXsysadmin()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>ϵͳ���ƹ��� ���캯��</summary>
        public RWXsysadmin() { }
        /// <summary>
        /// ϵͳ���ƹ��� �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public RWXsysadmin(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>ϵͳ���ƹ��� ʵ�ֱַ��ܣ��޸ı���</summary>
        //public RWXsysadmin(string tableName):base(tableName) { }
        /// <summary>ϵͳ���ƹ��� ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        //public RWXsysadmin(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>ϵͳ���ƹ��� ʵ�ֿ�ݹ���</summary>
        //public RWXsysadmin(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>ϵͳ���ƹ��� ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public RWXsysadmin(string password, string version, int loginmode, int verification, Byte[] logoimg, string logoposition, string logosize, string logotype)
        {
            
            this.Password = password;
            
            this.Version = version;
            
            this.LoginMode = loginmode;
            
            this.Verification = verification;
            
            this.Logoimg = logoimg;
            
            this.Logoposition = logoposition;
            
            this.Logosize = logosize;
            
            this.Logotype = logotype;
        }
        /// <summary>ϵͳ���ƹ��� ����ͼ������ڻ�ȡ����</summary>
        public static RWXsysadmin FromIView(IView view)
        {
            return (RWXsysadmin)IView.GetITable(view, "RWXsysadmin");
        }
        /// <summary>ϵͳ���ƹ��� ���һ��ʵ��</summary>
        public static RWXsysadmin GetOneInstance()
        {
            RWXsysadmin value = new RWXsysadmin();
            return value;
        }
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "Password":
			        return Password;
			    			
			    case "Version":
			        return Version;
			    			
			    case "LoginMode":
			        return LoginMode;
			    			
			    case "Verification":
			        return Verification;
			    			
			    case "Logoimg":
			        return Logoimg;
			    			
			    case "Logoposition":
			        return Logoposition;
			    			
			    case "Logosize":
			        return Logosize;
			    			
			    case "Logotype":
			        return Logotype;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "Password":
			        this.Password = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Version":
			        this.Version = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "LoginMode":
			        this.LoginMode = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Verification":
			        this.Verification = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Logoimg":
			        this.Logoimg = (byte[])(AttributeValue);
                    return true;
			    			
			    case "Logoposition":
			        this.Logoposition = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Logosize":
			        this.Logosize = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Logotype":
			        this.Logotype = Convert.ToString(AttributeValue);
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
				case "Password":
					return password_initialized;
				
				case "Version":
					return version_initialized;
				
				case "LoginMode":
					return loginmode_initialized;
				
				case "Verification":
					return verification_initialized;
				
				case "Logoimg":
					return logoimg_initialized;
				
				case "Logoposition":
					return logoposition_initialized;
				
				case "Logosize":
					return logosize_initialized;
				
				case "Logotype":
					return logotype_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "Password":
					password_initialized = ret;
					return true;
				
				case "Version":
					version_initialized = ret;
					return true;
				
				case "LoginMode":
					loginmode_initialized = ret;
					return true;
				
				case "Verification":
					verification_initialized = ret;
					return true;
				
				case "Logoimg":
					logoimg_initialized = ret;
					return true;
				
				case "Logoposition":
					logoposition_initialized = ret;
					return true;
				
				case "Logosize":
					logosize_initialized = ret;
					return true;
				
				case "Logotype":
					logotype_initialized = ret;
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

			
			if (password_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Password;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Password);
                }
			}
			
			if (version_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Version;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Version);
                }
			}
			
			if (loginmode_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.LoginMode;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(LoginMode);
                }
			}
			
			if (verification_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Verification;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Verification);
                }
			}
			
			if (logoimg_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logoimg;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logoimg);
                }
			}
			
			if (logoposition_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logoposition;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logoposition);
                }
			}
			
			if (logosize_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logosize;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logosize);
                }
			}
			
			if (logotype_initialized)
			{
                AttributeItem attr = RWXsysadmin.Attribute.Logotype;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Logotype);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}