/************************************************************

  Copyright (c) 2008��ybkj_zlg
  Author:               Created Time: 2013-05-15 09:22:22
  Description:    ���ݱ�AutoBackUpPath��Ӧ��ҵ���߼���AutoBackUpPath
  Version:         2.1.0.0
 
 * �Դ��ļ��ĸ��Ŀ��ܻᵼ�²���ȷ����Ϊ���������
     �������ɴ��룬��Щ���Ľ��ᶪʧ����������չ����
 * ʵ���Լ��� AutoBackUpPath_Entity:AutoBackUpPath
 * 
************************************************************/
/************************************************************
SQL���룺
select PlanId,PlanName,DbName,PathInfo,ID from AutoBackUpPath
delete from AutoBackUpPath
INSERT INTO AutoBackUpPath (PlanId,PlanName,DbName,PathInfo,ID)
     VALUES
           ('','','','','')
UPDATE {����ĸ��д����} SET ...
������ֵ���룺
        valObj.PlanId = "";
        valObj.PlanName = "";
        valObj.DbName = "";
        valObj.PathInfo = "";
        valObj.ID = ""; 
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
    /// <para>�Զ�����·��</para>
    /// <para>��AutoBackUpPath���ݱ��Ӧ��ʵ�����</para>
    /// <para>����һ�������еķ����ǣ���"���ֶ�"������һ��bool��ʶλ����"Attribute"���� </para>
    /// </summary>    
    [Serializable]
    public class AutoBackUpPath : ITableImplement
    {
        /// <summary>�Զ�����·�� ��������</summary>
        public static AutoBackUpPath Factory()
        {
            return new AutoBackUpPath();
        }
		#region ���ֶ��嵥 ����������������ͼ��ʱ��һ���Լ��
        #region ���ֶ��嵥1
        
        /// <summary> ·��ID Attribute </summary>
        public string _PlanId
        {            
            get { return this.PlanId; }
            set { this.PlanId = value; }
        }
        
        /// <summary> ·���� Attribute </summary>
        public string _PlanName
        {            
            get { return this.PlanName; }
            set { this.PlanName = value; }
        }
        
        /// <summary> ���ݿ��� Attribute </summary>
        public string _DbName
        {            
            get { return this.DbName; }
            set { this.DbName = value; }
        }
        
        /// <summary> ·����Ϣ Attribute </summary>
        public string _PathInfo
        {            
            get { return this.PathInfo; }
            set { this.PathInfo = value; }
        }
        
        /// <summary> ID Attribute_IsNotNull_IDENTITY </summary>
        public int _ID
        {            
            get { return this.ID; }
            set { this.ID = value; }
        }
        #endregion
        #region ���ֶ��嵥2
        
        /// <summary> ·��ID���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string PlanId
        {
            get { return this.m_planid; }
            set //
            {
                if (!planid_initialized || m_planid != value)
                {
                    this.m_planid = value;
                }
                planid_initialized = true;
            }
        }
        
        /// <summary> ·�������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string PlanName
        {
            get { return this.m_planname; }
            set //
            {
                if (!planname_initialized || m_planname != value)
                {
                    this.m_planname = value;
                }
                planname_initialized = true;
            }
        }
        
        /// <summary> ���ݿ������Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string DbName
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
        
        /// <summary> ·����Ϣ���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public string PathInfo
        {
            get { return this.m_pathinfo; }
            set //
            {
                if (!pathinfo_initialized || m_pathinfo != value)
                {
                    this.m_pathinfo = value;
                }
                pathinfo_initialized = true;
            }
        }
        
        /// <summary> ID���Ƽ�ʹ�� "_"���ſ�ͷ </summary>
        public int ID
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
        #endregion
        #region Attribute�嵥 �������
        /// <summary>
        /// {������-�ṹ����}
        /// </summary>
        public class Attribute
        {
            
            /// <summary>·��ID</summary>
            public static AttributeItem PlanId =  new AttributeItem("[AutoBackUpPath].[PlanId]", typeof(string), 200);
            
            /// <summary>·����</summary>
            public static AttributeItem PlanName =  new AttributeItem("[AutoBackUpPath].[PlanName]", typeof(string), 200);
            
            /// <summary>���ݿ���</summary>
            public static AttributeItem DbName =  new AttributeItem("[AutoBackUpPath].[DbName]", typeof(string), 200);
            
            /// <summary>·����Ϣ</summary>
            public static AttributeItem PathInfo =  new AttributeItem("[AutoBackUpPath].[PathInfo]", typeof(string), 1000);
            
            /// <summary>ID</summary>
            public static AttributeItem ID =  new AttributeItem("[AutoBackUpPath].[ID]", typeof(int), 2147483647);
        }
        #endregion
        #region bool�嵥 �������
        
        private string m_planid;
        /// <summary></summary>
        protected bool planid_initialized = false;
        
        private string m_planname;
        /// <summary></summary>
        protected bool planname_initialized = false;
        
        private string m_dbname;
        /// <summary></summary>
        protected bool dbname_initialized = false;
        
        private string m_pathinfo;
        /// <summary></summary>
        protected bool pathinfo_initialized = false;
        
        private int m_id;
        /// <summary></summary>
        protected bool id_initialized = false;
        #endregion

        #endregion ���ֶ�
        
		#region �����������������ֵ���Լ��������ԵĲ��ַ���

        /// <summary>
        /// ʵ���� �Զ�����·��
        /// </summary>
        /// <returns></returns>
        public override string TableName()
        {
            return "AutoBackUpPath";
        }
        
        /// <summary>
        /// �����Զ�����������
        /// </summary>
        /// <returns></returns>
        public override void LoadAllAttributes(bool IsLoadAllAttributes)
        {
            base.LoadAllAttributes(IsLoadAllAttributes);
            this.planid_initialized = IsLoadAllAttributes;this.planname_initialized = IsLoadAllAttributes;this.dbname_initialized = IsLoadAllAttributes;this.pathinfo_initialized = IsLoadAllAttributes;this.id_initialized = IsLoadAllAttributes;
        }
        /// <summary></summary>
        public override ITable af_GetOptionValueSchema() 
		{ 
			AutoBackUpPath value = new AutoBackUpPath();
			
			
			if(BLLTable.IsExistOptionValue(this.TableName(),"PlanId"))
				value.planid_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PlanName"))
				value.planname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"DbName"))
				value.dbname_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"PathInfo"))
				value.pathinfo_initialized = true;
            
			if(BLLTable.IsExistOptionValue(this.TableName(),"ID"))
				value.id_initialized = true;
            
			return value;
		}
        #endregion
        
        #region ʵ��ICloneable ��Ա
        /// <summary>�Զ�����·��</summary>
        public new AutoBackUpPath Clone()
        {
            return (AutoBackUpPath)this.MemberwiseClone(); //ǳ����
        }
        #endregion
        
        #region ���캯�� ���ʵ��
        /// <summary>�Զ�����·�� ���캯��</summary>
        static AutoBackUpPath()
        {
            if (InitRunTime.IsInitRunTime) InitRunTime.IsInitRunTime = true;
        }
        /// <summary>�Զ�����·�� ���캯��</summary>
        public AutoBackUpPath() { }
        /// <summary>
        /// �Զ�����·�� �Ƿ�������������
        /// </summary>
        /// <param name="IsLoadAllAttributes">�Ƿ�ȫ����ʼ��Ϊtrue</param>
        public AutoBackUpPath(bool IsLoadAllAttributes):base(IsLoadAllAttributes) { }
        /// <summary>�Զ�����·�� ʵ�ֱַ��ܣ��޸ı���</summary>
        //public AutoBackUpPath(string tableName):base(tableName) { }
        /// <summary>�Զ�����·�� ʵ�ֱַ��ܣ��Զ���ʵ���ĳ�ʼ��</summary>
        //public AutoBackUpPath(string tableName, params AttributeItem[] attrs) : base(tableName, attrs) { }
        /// <summary>�Զ�����·�� ʵ�ֿ�ݹ���</summary>
        //public AutoBackUpPath(params AttributeItem[] attrs) : base(attrs) { }
        
        /// <summary>�Զ�����·�� ��ע�⣬���ﵱ���н�����һ���ֶε�ʱ�򣬽������빹�캯�� new Table(string tableName)��ͻ</summary>
        public AutoBackUpPath(string planid, string planname, string dbname, string pathinfo, int id)
        {
            
            this.PlanId = planid;
            
            this.PlanName = planname;
            
            this.DbName = dbname;
            
            this.PathInfo = pathinfo;
            
            this.ID = id;
        }
        /// <summary>�Զ�����·�� ����ͼ������ڻ�ȡ����</summary>
        public static AutoBackUpPath FromIView(IView view)
        {
            return (AutoBackUpPath)IView.GetITable(view, "AutoBackUpPath");
        }
        /// <summary>�Զ�����·�� ���һ��ʵ��</summary>
        public static AutoBackUpPath GetOneInstance()
        {
            AutoBackUpPath value = new AutoBackUpPath();
            return value;
        }
        #endregion
		
        #region 2.2 �����������Բ�������

        /// <summary>ͨ������ ����ֶ�ֵ</summary>
        public override object GetValue(AttributeItem AttributeName)
        {	
            switch(AttributeName.FieldName)
			{				
			    case "PlanId":
			        return PlanId;
			    			
			    case "PlanName":
			        return PlanName;
			    			
			    case "DbName":
			        return DbName;
			    			
			    case "PathInfo":
			        return PathInfo;
			    			
			    case "ID":
			        return ID;
			
                default:
                    return base.GetValue(AttributeName);
			}
        }
        /// <summary>ͨ������ �����ֶ�ֵ</summary>
        public override bool SetValue(AttributeItem AttributeName,object AttributeValue)
        {
			switch(AttributeName.FieldName)
			{				
			    case "PlanId":
			        this.PlanId = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PlanName":
			        this.PlanName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "DbName":
			        this.DbName = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "PathInfo":
			        this.PathInfo = Convert.ToString(AttributeValue);
                    return true;
			    			
			    case "ID":
			        this.ID = Convert.ToInt32(AttributeValue);
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
				case "PlanId":
					return planid_initialized;
				
				case "PlanName":
					return planname_initialized;
				
				case "DbName":
					return dbname_initialized;
				
				case "PathInfo":
					return pathinfo_initialized;
				
				case "ID":
					return id_initialized;
				
                default:
                    return base.GetInitialized(AttributeName);
			}
        }

        /// <summary>ͨ������ �������Եĳ�ʼ������ֵ</summary>
        public override bool SetInitialized(AttributeItem AttributeName, Boolean ret)
        {
			switch(AttributeName.FieldName)
			{	
				case "PlanId":
					planid_initialized = ret;
					return true;
				
				case "PlanName":
					planname_initialized = ret;
					return true;
				
				case "DbName":
					dbname_initialized = ret;
					return true;
				
				case "PathInfo":
					pathinfo_initialized = ret;
					return true;
				
				case "ID":
					id_initialized = ret;
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

			
			if (planid_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PlanId;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PlanId);
                }
			}
			
			if (planname_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PlanName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PlanName);
                }
			}
			
			if (dbname_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.DbName;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(DbName);
                }
			}
			
			if (pathinfo_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.PathInfo;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(PathInfo);
                }
			}
			
			if (id_initialized)
			{
                AttributeItem attr = AutoBackUpPath.Attribute.ID;
                if(!af_IsCondition || !Runtime_PersistenceLayer.IsInTbColumnCannotConditions(attr))
                {
                    parametersList.Add(attr);
                    if(values != null)
                        values.Add(ID);
                }
			}
			
            
			parametersList.AddRange(base.af_GetAvailableAttributeItem(ref values));
            return parametersList.ToArray();
        }
        #endregion                
    }
}