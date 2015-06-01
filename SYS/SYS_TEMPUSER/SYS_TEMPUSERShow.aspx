<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSERShow.aspx.cs" Inherits="SYS_TEMPUSERShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
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
               <dt><%=SYS_TEMPUSER.Attribute.ID.ZhName %>��</dt><%--ID--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.CONAME.ZhName %>��</dt><%--��λ--%>
               <dd>
               
                    <asp:Label id="txtCONAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>��</dt><%--�ֻ�����--%>
               <dd>
               
                    <asp:Label id="txtPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.IP.ZhName %>��</dt><%--IP--%>
               <dd>
               
                    <asp:Label id="txtIP" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>��</dt><%--��¼��--%>
               <dd>
               
                    <asp:Label id="txtLOGINNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtPWD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_TEMPUSER.Attribute.USER_ID.ZhName %>��</dt><%--�û����--%>
               <dd>
               
                    <asp:Label id="txtUSER_ID" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>