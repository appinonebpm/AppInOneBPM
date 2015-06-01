<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TABLEShow2" CodeFile="TABLEShow.aspx.cs" %>
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
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>��</dt><%--������--%>
               <dd>
                
                    <asp:Label id="txtTB_NAME" runat="server"></asp:Label>
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
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>��</dt><%--NOTE--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>