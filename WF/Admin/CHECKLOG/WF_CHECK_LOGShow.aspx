<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CHECK_LOGShow" CodeFile="WF_CHECK_LOGShow.aspx.cs" %>
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
               <dt><%=WF_CHECK_LOG.Attribute.LOG_ID.ZhName %>��</dt><%--��־ID--%>
               <dd>
                
                    <asp:Label id="txtLOG_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.WFID.ZhName %>��</dt><%--WFCID--%>
               <dd>
                
                    <asp:Label id="txtWFCID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.PROCID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtPROCID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.STEP_ID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtSTEP_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RECID.ZhName%>��</dt><%--��¼ID--%>
               <dd>
                
                    <asp:Label id="txtREC_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.DETAIL_ID.ZhName %>��</dt><%--��ϸ��¼ID--%>
               <dd>
                
                    <asp:Label id="txtDETAIL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RESULT.ZhName %>��</dt><%--���ս��--%>
               <dd>
               
                    <asp:Label id="txtRESULT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECKER.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtCHECKER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIME.ZhName %>��</dt><%--�������ʱ��--%>
               <dd>
               
                    <asp:Label id="txtCHECK_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.NOTE.ZhName %>��</dt><%--����������--%>
               <dd>
               
                    <asp:Label id="txtNOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.RESULTS.ZhName %>��</dt><%--�����������--%>
               <dd>
                
                    <asp:Label id="txtRESULTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECKERS.ZhName %>��</dt><%--����������--%>
               <dd>
               
                    <asp:Label ID="txtCHECKERS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.CHECK_TIMES.ZhName %>��</dt><%--��������ʱ��--%>
               <dd>
               
                    <asp:Label ID="txtCHECK_TIMES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WF_CHECK_LOG.Attribute.NOTES.ZhName %>��</dt><%--�����������--%>
               <dd>
               
                    <asp:Label ID="txtNOTES" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>