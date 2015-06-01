<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_TYPEShow.aspx.cs" Inherits="WEC_C_TYPEShow" %>
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
               <dt><%=WEC_C_TYPE.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_TYPE.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl >
               <dt><%=WEC_C_TYPE.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_TYPE.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_TYPE.Attribute.NAME.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_TYPE.Attribute.SORT.ZhName %>��</dt><%--��ʾ˳��--%>
               <dd>
               
                    <asp:Label id="txtSORT" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>