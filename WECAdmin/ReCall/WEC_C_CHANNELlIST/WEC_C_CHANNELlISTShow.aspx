<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTShow.aspx.cs" Inherits="WEC_C_CHANNELlISTShow" %>
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
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>��</dt><%--����url--%>
               <dd>
               
                    <asp:Label id="txtURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>��</dt><%--������ע--%>
               <dd>
               
                    <asp:Label id="txtREMARK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtCATEGORY_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>��</dt><%--��ά����ʽ--%>
               <dd>
               
                    <asp:Label id="txtQRCODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>��</dt><%--��ע��Ϣ--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>��</dt><%--�������ڵ���--%>
               <dd>
               
                    <asp:Label id="txtADDRESS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>