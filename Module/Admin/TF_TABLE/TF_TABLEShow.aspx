<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEShow.aspx.cs" Inherits="TF_TABLEShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>��</dt><%--��ID--%>
               <dd>
                
                    <asp:Label id="txtTB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtTB_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.WF_TB_NAME.ZhName %>��</dt><%--���̱���--%>
               <dd>
                
                    <asp:Label id="txtWF_TB_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtCH_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtM_TB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>��</dt><%--���--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>��</dt><%--������--%>
               <dd>
               
                    <asp:Label id="txtTB_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>��</dt><%--��ע--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.CREATED.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtCREATED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.DB_SRC.ZhName %>��</dt><%--����Դ--%>
               <dd>
                
                    <asp:Label id="txtDB_SRC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.MENU_NAME.ZhName %>��</dt><%--ģ��˵���--%>
               <dd>
                
                    <asp:Label id="txtMENU_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.KEY_NAME.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtKEY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.KEY_TYPE.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtKEY_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.API_NAME.ZhName %>��</dt><%--API������--%>
               <dd>
                
                    <asp:Label id="txtAPI_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_REPORT.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtALLOW_REPORT" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_ACTIVITY.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtALLOW_ACTIVITY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.MODIFY_HIS.ZhName %>��</dt><%--�����ֶ���ʷ--%>
               <dd>
                
                    <asp:Label id="txtMODIFY_HIS" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_USER_AREA.ZhName %>��</dt><%--�����û����ֲ�--%>
               <dd>
                
                    <asp:Label id="txtALLOW_USER_AREA" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ALLOW_PUBLIC.ZhName %>��</dt><%--�����ڿͻ������վ ��ѡ��ʹ���Զ�������ͨ�� Salesforce �ͻ������վʹ�á�--%>
               <dd>
                
                    <asp:Label id="txtALLOW_PUBLIC" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.TB_NAMESPACE.ZhName %>��</dt><%--�����ռ�ǰ׺--%>
               <dd>
                
                    <asp:Label id="txtTB_NAMESPACE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.INSTALL_STAT.ZhName %>��</dt><%--����״̬--%>
               <dd>
                
                    <asp:Label id="txtINSTALL_STAT" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.ADD_NOTE_FILE.ZhName %>��</dt><%--��ӱ�ע�͸���--%>
               <dd>
                
                    <asp:Label id="txtADD_NOTE_FILE" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TABLE.Attribute.HAS_WF.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtHAS_WF" runat="server" ></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>