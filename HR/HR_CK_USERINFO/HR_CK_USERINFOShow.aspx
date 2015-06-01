<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CK_USERINFOShow" CodeFile="HR_CK_USERINFOShow.aspx.cs" %>
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
               <dt><%=HR_CK_USERINFO.Attribute.USERID.ZhName %>��</dt><%--USERID--%>
               <dd>
                
                    <asp:Label id="txtUSERID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>��</dt><%--STAFF_ID--%>
               <dd>
                
                    <asp:Label id="txtSTAFF_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BADGENUMBER.ZhName %>��</dt><%--BADGENUMBER--%>
               <dd>
                
                    <asp:Label id="txtBADGENUMBER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SSN.ZhName %>��</dt><%--SSN--%>
               <dd>
                
                    <asp:Label id="txtSSN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.NAME.ZhName %>��</dt><%--NAME--%>
               <dd>
                
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.GENDER.ZhName %>��</dt><%--GENDER--%>
               <dd>
                
                    <asp:Label id="txtGENDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.TITLE.ZhName %>��</dt><%--TITLE--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PAGER.ZhName %>��</dt><%--PAGER--%>
               <dd>
                
                    <asp:Label id="txtPAGER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.BIRTHDAY.ZhName %>��</dt><%--BIRTHDAY--%>
               <dd>
               
                    <asp:Label id="txtBIRTHDAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HIREDDAY.ZhName %>��</dt><%--HIREDDAY--%>
               <dd>
               
                    <asp:Label id="txtHIREDDAY" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STREET.ZhName %>��</dt><%--STREET--%>
               <dd>
                
                    <asp:Label id="txtSTREET" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.CITY.ZhName %>��</dt><%--CITY--%>
               <dd>
                
                    <asp:Label id="txtCITY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.STATE.ZhName %>��</dt><%--STATE--%>
               <dd>
                
                    <asp:Label id="txtSTATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ZIP.ZhName %>��</dt><%--ZIP--%>
               <dd>
                
                    <asp:Label id="txtZIP" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OPHONE.ZhName %>��</dt><%--OPHONE--%>
               <dd>
                
                    <asp:Label id="txtOPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.FPHONE.ZhName %>��</dt><%--FPHONE--%>
               <dd>
                
                    <asp:Label id="txtFPHONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.VERIFICATIONMETHOD.ZhName %>��</dt><%--VERIFICATIONMETHOD--%>
               <dd>
                
                    <asp:Label id="txtVERIFICATIONMETHOD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.DEFAULTDEPTID.ZhName %>��</dt><%--DEFAULTDEPTID--%>
               <dd>
                
                    <asp:Label id="txtDEFAULTDEPTID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SECURITYFLAGS.ZhName %>��</dt><%--SECURITYFLAGS--%>
               <dd>
                
                    <asp:Label id="txtSECURITYFLAGS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.ATT.ZhName %>��</dt><%--ATT--%>
               <dd>
                
                    <asp:Label id="txtATT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.INLATE.ZhName %>��</dt><%--INLATE--%>
               <dd>
                
                    <asp:Label id="txtINLATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OUTEARLY.ZhName %>��</dt><%--OUTEARLY--%>
               <dd>
                
                    <asp:Label id="txtOUTEARLY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.OVERTIME.ZhName %>��</dt><%--OVERTIME--%>
               <dd>
                
                    <asp:Label id="txtOVERTIME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.SEP.ZhName %>��</dt><%--SEP--%>
               <dd>
                
                    <asp:Label id="txtSEP" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.HOLIDAY.ZhName %>��</dt><%--HOLIDAY--%>
               <dd>
                
                    <asp:Label id="txtHOLIDAY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MINZU.ZhName %>��</dt><%--MINZU--%>
               <dd>
                
                    <asp:Label id="txtMINZU" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PASSWORD.ZhName %>��</dt><%--PASSWORD--%>
               <dd>
                
                    <asp:Label id="txtPASSWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.LUNCHDURATION.ZhName %>��</dt><%--LUNCHDURATION--%>
               <dd>
                
                    <asp:Label id="txtLUNCHDURATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.MVerifyPass.ZhName %>��</dt><%--MVerifyPass--%>
               <dd>
                
                    <asp:Label id="txtMVerifyPass" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_CK_USERINFO.Attribute.PHOTO.ZhName %>��</dt><%--PHOTO--%>
               <dd>
                
                    <asp:Label id="txtPHOTO" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>