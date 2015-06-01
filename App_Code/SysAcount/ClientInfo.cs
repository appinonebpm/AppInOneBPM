/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:22
  Description:    ���ݱ�ClientInfo��Ӧ��ҵ���߼���ClientInfo
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� ClientInfo_Entity:ClientInfo
 * 
************************************************************/
/************************************************************
SQL���룺
select Id,Type,DateTime,ClientDateTime,Cpu,Memory,OtherInfo,Os,LoginUserId,ProfileId,SlVersion from ClientInfo
delete from ClientInfo
INSERT INTO ClientInfo (Id,Type,DateTime,ClientDateTime,Cpu,Memory,OtherInfo,Os,LoginUserId,ProfileId,SlVersion)
     VALUES
           ('','','','','','','','','','','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.Id = "";
        valObj.Type = "";
        valObj.DateTime = "";
        valObj.ClientDateTime = "";
        valObj.Cpu = "";
        valObj.Memory = "";
        valObj.OtherInfo = "";
        valObj.Os = "";
        valObj.LoginUserId = "";
        valObj.ProfileId = "";
        valObj.SlVersion = ""; 
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
    /// <para>�ͻ�����Ϣ</para>
    /// <para>��ClientInfo���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class ClientInfo : ITableImplement
    {
        /// <summary>�ͻ�����Ϣ ��������</summary>
        public static ClientInfo Factory()
        {
            return new ClientInfo();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> Id Attribute_IsPrimary_IsNotNull_IDENTITY </summary>
        public int _Id
        {            
            get { return this.Id; }
            set { this.Id = value; }
        }
        
        /// <summary> Type Attribute_IsNotNull </summary>
        public Byte _Type
        {            
            get { return this.Type; }
            set { this.Type = value; }
        }
        
        /// <summary> DateTime Attribute_IsNotNull </summary>
        public DateTime _DateTime
        {            
            get { return this.DateTime; }
            set { this.DateTime = value; }
        }
        
        /// <summary> ClientDateTime Attribute_IsNotNull </summary>
        public DateTime _ClientDateTime
        {            
            get { return this.ClientDateTime; }
            set { this.ClientDateTime = value; }
        }
        
        /// <summary> Cpu Attribute_IsNotNull </summary>
        public string _Cpu
        {            
            get { return this.Cpu; }
            set { this.Cpu = value; }
        }
        
        /// <summary> Memory Attribute_IsNotNull </summary>
        public decimal _Memory
        {            
            get { return this.Memory; }
            set { this.Memory = value; }
        }
        
        /// <summary> OtherInfo Attribute </summary>
        public string _OtherInfo
        {            
            get { return this.OtherInfo; }
            set { this.OtherInfo = value; }
        }
        
        /// <summary> Os Attribute </summary>
        public string _Os
        {            
            get { return this.Os; }
            set { this.Os = value; }
        }
        
        /// <summary> LoginUserId Attribute </summary>
        public string _LoginUserId
        {            
            get { return this.LoginUserId; }
            set { this.LoginUserId = value; }
        }
        
        /// <summary> ProfileId Attribute </summary>
        public string _ProfileId
        {            
            get { return this.ProfileId; }
            set { this.ProfileId = value; }
        }
        
        /// <summary> SlVersion Attribute </summary>
        public string _SlVersion
        {            
            get { return this.SlVersion; }
            set { this.SlVersion = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> Id���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public int Id
        {
            get { return this.m_id; }
            set //private 
            {
                if (!id_initialized || m_id != value)
                {
                    this.m_id = value;
                }
                id_initialized = true;
            }
        }
        
        /// <summary> Type���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public Byte Type
        {
            get { return this.m_type; }
            set //
            {
                if (!type_initialized || m_type != value)
                {
                    this.m_type = value;
                }
                type_initialized = true;
            }
        }
        
        /// <summary> DateTime���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public DateTime DateTime
        {
            get { return this.m_datetime; }
            set //
            {
                if (!datetime_initialized || m_datetime != value)
                {
                    this.m_datetime = value;
                }
                datetime_initialized = true;
            }
        }
        
        /// <summary> ClientDateTime���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public DateTime ClientDateTime
        {
            get { return this.m_clientdatetime; }
            set //
            {
                if (!clientdatetime_initialized || m_clientdatetime != value)
                {
                    this.m_clientdatetime = value;
                }
                clientdatetime_initialized = true;
            }
        }
        
        /// <summary> Cpu���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Cpu
        {
            get { return this.m_cpu; }
            set //
            {
                if (!cpu_initialized || m_cpu != value)
                {
                    this.m_cpu = value;
                }
                cpu_initialized = true;
            }
        }
        
        /// <summary> Memory���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public decimal Memory
        {
            get { return this.m_memory; }
            set //
            {
                if (!memory_initialized || m_memory != value)
                {
                    this.m_memory = value;
                }
                memory_initialized = true;
            }
        }
        
        /// <summary> OtherInfo���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string OtherInfo
        {
            get { return this.m_otherinfo; }
            set //
            {
                if (!otherinfo_initialized || m_otherinfo != value)
                {
                    this.m_otherinfo = value;
                }
                otherinfo_initialized = true;
            }
        }
        
        /// <summary> Os���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string Os
        {
            get { return this.m_os; }
            set //
            {
                if (!os_initialized || m_os != value)
                {
                    this.m_os = value;
                }
                os_initialized = true;
            }
        }
        
        /// <summary> LoginUserId���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string LoginUserId
        {
            get { return this.m_loginuserid; }
            set //
            {
                if (!loginuserid_initialized || m_loginuserid != value)
                {
                    this.m_loginuserid = value;
                }
                loginuserid_initialized = true;
            }
        }
        
        /// <summary> ProfileId���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string ProfileId
        {
            get { return this.m_profileid; }
            set //
            {
                if (!profileid_initialized || m_profileid != value)
                {
                    this.m_profileid = value;
                }
                profileid_initialized = true;
            }
        }
        
        /// <summary> SlVersion���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string SlVersion
        {
            get { return this.m_slversion; }
            set //
            {
                if (!slversion_initialized || m_slversion != value)
                {
                    this.m_slversion = value;
                }
                slversion_initialized = true;
            }
        }    
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>Id</summary>
            public static AttributeItem Id =  new AttributeItem("[ClientInfo].[Id]", typeof(int), 2147483647);
            
            /// <summary>Type</summary>
            public static AttributeItem Type =  new AttributeItem("[ClientInfo].[Type]", typeof(Byte), 1);
            
            /// <summary>DateTime</summary>
            public static AttributeItem DateTime =  new AttributeItem("[ClientInfo].[DateTime]", typeof(DateTime), 100);
            
            /// <summary>ClientDateTime</summary>
            public static AttributeItem ClientDateTime =  new AttributeItem("[ClientInfo].[ClientDateTime]", typeof(DateTime), 100);
            
            /// <summary>Cpu</summary>
            public static AttributeItem Cpu =  new AttributeItem("[ClientInfo].[Cpu]", typeof(string), 100);
            
            /// <summary>Memory</summary>
            public static AttributeItem Memory =  new AttributeItem("[ClientInfo].[Memory]", typeof(decimal), 2147483647);
            
            /// <summary>OtherInfo</summary>
            public static AttributeItem OtherInfo =  new AttributeItem("[ClientInfo].[OtherInfo]", typeof(string), 16);
            
            /// <summary>Os</summary>
            public static AttributeItem Os =  new AttributeItem("[ClientInfo].[Os]", typeof(string), 50);
            
            /// <summary>LoginUserId</summary>
            public static AttributeItem LoginUserId =  new AttributeItem("[ClientInfo].[LoginUserId]", typeof(string), 100);
            
            /// <summary>ProfileId</summary>
            public static AttributeItem ProfileId =  new AttributeItem("[ClientInfo].[ProfileId]", typeof(string), 100);
            
            /// <summary>SlVersion</summary>
            public static AttributeItem SlVersion =  new AttributeItem("[ClientInfo].[SlVersion]", typeof(string), 50);
        }
        #endregion
        #region bool�嵥 �������
        
        private int m_id;
        /// <summary></summary>
        protected bool id_initialized = false;
        
        private Byte m_type;
        /// <summary></summary>
        protected bool type_initialized = false;
        
        private DateTime m_datetime;
        /// <summary></summary>
        protected bool datetime_initialized = false;
        
        private DateTime m_clientdatetime;
        /// <summary></summary>
        protected bool clientdatetime_initialized = false;
        
        private string m_cpu;
        /// <summary></summary>
        protected bool cpu_initialized = false;
        
        private decimal m_memory;
        /// <summary></summary>
        protected bool memory_initialized = false;
        
        private string m_otherinfo;
        /// <summary></summary>
        protected bool otherinfo_initialized = false;
        
        private string m_os;
        /// <summary></summary>
        protected bool os_initialized = false;
        
        private string m_loginuserid;
        /// <summary></summary>
        protected bool loginuserid_initialized = false;
        
        private string m_profileid;
        /// <summary></summary>
        protected bool profileid_initialized = false;
        
        private string m_slversion;
        /// <summary></summary>
        protected bool slversion_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� �ͻ�����Ϣ
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "ClientInfo";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.id_initialized = IsLoadAllAttributes;this.type_initialized = IsLoadAllAttributes;this.datetime_initialized = IsLoadAllAttributes;this.clientdatetime_initialized = IsLoadAllAttributes;this.cpu_initialized = IsLoadAllAttributes;this.memory_initialized = IsLoadAllAttributes;this.otherinfo_initialized = IsLoadAllAttributes;this.os_initialized = IsLoadAllAttributes;this.loginuserid_initialized = IsLoadAllAttributes;this.profileid_initialized = IsLoadAllAttributes;this.slversion_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			ClientInfo value = new ClientInfo();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"Id"))
				value.id_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Type"))
				value.type_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DateTime"))
				value.datetime_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ClientDateTime"))
				value.clientdatetime_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Cpu"))
				value.cpu_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Memory"))
				value.memory_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"OtherInfo"))
				value.otherinfo_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"Os"))
				value.os_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"LoginUserId"))
				value.loginuserid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ProfileId"))
				value.profileid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"SlVersion"))
				value.slversion_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>�ͻ�����Ϣ</summary>
        public new ClientInfo Clone()
        {
            return (ClientInfo)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>�ͻ�����Ϣ ���캯��</summary>
        static ClientInfo()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>�ͻ�����Ϣ ���캯��</summary>
        public ClientInfo() { }
        /// <summary>
        /// �ͻ�����Ϣ �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public ClientInfo(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>�ͻ�����Ϣ ʵ�ֱַ��ܣ��޸ı���</summary>
        //public ClientInfo(string tableName):base(tableName) { }
        /// <summary>�ͻ�����Ϣ ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        //public ClientInfo(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>�ͻ�����Ϣ ʵ�ֿ�ݹ���</summary>
        //public ClientInfo(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>�ͻ�����Ϣ ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public ClientInfo(int id, Byte type, DateTime datetime, DateTime clientdatetime, string cpu, decimal memory, string otherinfo, string os, string loginuserid, string profileid, string slversion)
        {
            
            this.Id = id;
            
            this.Type = type;
            
            this.DateTime = datetime;
            
            this.ClientDateTime = clientdatetime;
            
            this.Cpu = cpu;
            
            this.Memory = memory;
            
            this.OtherInfo = otherinfo;
            
            this.Os = os;
            
            this.LoginUserId = loginuserid;
            
            this.ProfileId = profileid;
            
            this.SlVersion = slversion;
        }
        /// <summary>�ͻ�����Ϣ ����ͼ������ڻ�ȡ����</summary>
        public static ClientInfo FromIView(IView view)
        {
            return (ClientInfo)IView.GetITable(view, "ClientInfo");
        }
        /// <summary>�ͻ�����Ϣ ���һ��ʵ��</summary>
        public static ClientInfo GetOneInstance()
        {
            ClientInfo value = new ClientInfo();
            return value;
        }
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "Id":
			        return Id;
			    			
			    case "Type":
			        return Type;
			    			
			    case "DateTime":
			        return DateTime;
			    			
			    case "ClientDateTime":
			        return ClientDateTime;
			    			
			    case "Cpu":
			        return Cpu;
			    			
			    case "Memory":
			        return Memory;
			    			
			    case "OtherInfo":
			        return OtherInfo;
			    			
			    case "Os":
			        return Os;
			    			
			    case "LoginUserId":
			        return LoginUserId;
			    			
			    case "ProfileId":
			        return ProfileId;
			    			
			    case "SlVersion":
			        return SlVersion;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "Id":
			        this.Id = Convert.ToInt32(AttributeValue);
                    return true;
			    			
			    case "Type":
			        this.Type = Convert.ToByte(AttributeValue);
                    return true;
			    			
			    case "DateTime":
			        this.DateTime = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "ClientDateTime":
			        this.ClientDateTime = Convert.ToDateTime(AttributeValue);
                    return true;
			    			
			    case "Cpu":
			        this.Cpu = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Memory":
			        this.Memory = Convert.ToDecimal(AttributeValue);
                    return true;
			    			
			    case "OtherInfo":
			        this.OtherInfo = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "Os":
			        this.Os = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "LoginUserId":
			        this.LoginUserId = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ProfileId":
			        this.ProfileId = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "SlVersion":
			        this.SlVersion = Convert.ToString(AttributeValue);
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
				case "Id":
					return id_initialized;
				
				case "Type":
					return type_initialized;
				
				case "DateTime":
					return datetime_initialized;
				
				case "ClientDateTime":
					return clientdatetime_initialized;
				
				case "Cpu":
					return cpu_initialized;
				
				case "Memory":
					return memory_initialized;
				
				case "OtherInfo":
					return otherinfo_initialized;
				
				case "Os":
					return os_initialized;
				
				case "LoginUserId":
					return loginuserid_initialized;
				
				case "ProfileId":
					return profileid_initialized;
				
				case "SlVersion":
					return slversion_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "Id":
					id_initialized = ret;
					return true;
				
				case "Type":
					type_initialized = ret;
					return true;
				
				case "DateTime":
					datetime_initialized = ret;
					return true;
				
				case "ClientDateTime":
					clientdatetime_initialized = ret;
					return true;
				
				case "Cpu":
					cpu_initialized = ret;
					return true;
				
				case "Memory":
					memory_initialized = ret;
					return true;
				
				case "OtherInfo":
					otherinfo_initialized = ret;
					return true;
				
				case "Os":
					os_initialized = ret;
					return true;
				
				case "LoginUserId":
					loginuserid_initialized = ret;
					return true;
				
				case "ProfileId":
					profileid_initialized = ret;
					return true;
				
				case "SlVersion":
					slversion_initialized = ret;
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
                AttributeItem attr = ClientInfo.Attribute.Id;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Id);
                }
			}
			
			if (type_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.Type;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Type);
                }
			}
			
			if (datetime_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.DateTime;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DateTime);
                }
			}
			
			if (clientdatetime_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.ClientDateTime;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ClientDateTime);
                }
			}
			
			if (cpu_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.Cpu;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Cpu);
                }
			}
			
			if (memory_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.Memory;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Memory);
                }
			}
			
			if (otherinfo_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.OtherInfo;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(OtherInfo);
                }
			}
			
			if (os_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.Os;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(Os);
                }
			}
			
			if (loginuserid_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.LoginUserId;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(LoginUserId);
                }
			}
			
			if (profileid_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.ProfileId;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ProfileId);
                }
			}
			
			if (slversion_initialized)
			{
                AttributeItem attr = ClientInfo.Attribute.SlVersion;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(SlVersion);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}