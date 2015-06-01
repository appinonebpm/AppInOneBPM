<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ArticleShow.aspx.cs" Inherits="WEC_ArticleShow" %>
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
               <dt><%=WEC_Article.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.CID.ZhName %>��</dt><%--��Ŀ���--%>
               <dd>
               
                    <asp:Label id="txtCID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.TITLE.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.DES.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtDES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.CONTENT.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.URL.ZhName %>��</dt><%--������ַ--%>
               <dd>
               
                    <asp:Label id="txtURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.PIC_URL.ZhName %>��</dt><%--ͼƬ��ַ--%>
               <dd>
               
                    <asp:Label id="txtPIC_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_Article.Attribute.MODEL_ID.ZhName %>��</dt><%--ģ����--%>
               <dd>
               
                    <asp:Label id="txtMODEL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>