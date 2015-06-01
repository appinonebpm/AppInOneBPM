<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_INFOShow" CodeFile="WFINFOShow.aspx.cs" %>
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
               <dt><%=WF_INFO.Attribute.WFID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtWFCID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_INFO.Attribute.WFCNAME.ZhName %>��</dt><%--���̷�����--%>
               <dd>
                
                    <asp:Label id="txtWFCNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_INFO.Attribute.ADDTIME.ZhName %>��</dt><%--����ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_INFO.Attribute.EDITIME.ZhName %>��</dt><%--�޸�ʱ��--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_INFO.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_INFO.Attribute.USE_LIMIT.ZhName %>��</dt><%--�Ƿ������ύ--%>
               <dd>
               
                    <asp:Label id="txtUSE_LIMIT" runat="server"></asp:Label>
               </dd>
             </dl>

             <dl>
               <dt><%=WF_INFO.Attribute.NOTE.ZhName %>��</dt><%--��ע--%>
               <dd>
                
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>