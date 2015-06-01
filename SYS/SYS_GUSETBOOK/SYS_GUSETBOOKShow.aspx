<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GUSETBOOKShow.aspx.cs" Inherits="SYS_GUSETBOOKShow" %>
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
               <dt><%=SYS_GUSETBOOK.Attribute.ID.ZhName %>��</dt><%--ID--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.TYPE.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.MEMO.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtMEMO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.EMAIL.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtEMAIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.MOBIL.ZhName %>��</dt><%--�ֻ�����--%>
               <dd>
               
                    <asp:Label id="txtMOBIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.ANSWER.ZhName %>��</dt><%--�ظ�--%>
               <dd>
               
                    <asp:Label id="txtANSWER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_GUSETBOOK.Attribute.USERNAME.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtUSERNAME" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>