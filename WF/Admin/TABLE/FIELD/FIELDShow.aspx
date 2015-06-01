<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDShow2" CodeFile="FIELDShow.aspx.cs" %>
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
               <dt><%=TF_TB_FIELD.Attribute.FIELD_ID.ZhName %>��</dt><%--ID--%>
               <dd>
                
                    <asp:Label id="txtFIELD_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>��</dt><%--�ֶ���--%>
               <dd>
                
                    <asp:Label id="txtFIELD_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt>��</dt><%--�ֶ�����--%>
               <dd>
               
                    <asp:Label id="txtFIELD_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.DB_TYPE.ZhName %>��</dt><%--��Ӧ��������--%>
               <dd>
                
                    <asp:Label id="txtDB_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.IS_NULL.ZhName %>��</dt><%--IS_NULL--%>
               <dd>
                
                    <asp:Label id="txtIS_NULL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.NOTE.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.DEFAULT_VAL.ZhName %>��</dt><%--Ĭ��ֵ--%>
               <dd>
                
                    <asp:Label id="txtDEFAULT_VAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.TB_ID.ZhName %>��</dt><%--������ID--%>
               <dd>
                
                    <asp:Label id="txtTB_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.CTRL_TYPE.ZhName %>��</dt><%--Ĭ�Ͽؼ�����--%>
               <dd>
                
                    <asp:Label id="txtCTRL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=TF_TB_FIELD.Attribute.SORT_NO.ZhName %>��</dt><%--���--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>