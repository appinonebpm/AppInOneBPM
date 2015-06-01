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
    public class ITableTree
    {
        public ITableTree()
        {
        }
        public ITableImplement val = new TF_TABLE();
        public List<Relation> relations = new List<Relation>();

        public AttributeItem ID = null;
        public AttributeItem M_ID = null;
        public AttributeItem NAME = null;
        public AttributeItem NOTE = null;
        public AttributeItem SORT_NO = null;
        /// <summary>
        /// ��������
        /// </summary>
        public AttributeItem TYPE = null;

        public string editUrl = null;
        public string manageUrl = null;
        public string showUrl = null;

        public string backSvrUrl = null;
    }
}