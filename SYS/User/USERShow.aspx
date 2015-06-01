<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERShow" CodeFile="USERShow.aspx.cs" %>
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
       <h3> <asp:Literal ID="litTitle" runat="server">ĳĳĳ</asp:Literal>����ϸ��Ϣ</h3>
       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>������Ϣ</a></dt><dd><b id="bERR" runat="server"></b></dd></dl>
       <div>
        
             <dl>
               <dt><%=SYS_USER.Attribute.USER_ID.ZhName %>��</dt><%--�û���ʶ--%>
               <dd>
                
                    <asp:Label id="txtUSER_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>��</dt><%--�û���--%>
               <dd>
                
                    <asp:Label id="txtUSER_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.PASS.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtPASS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>��</dt><%--�ڲ��ʼ�--%>
               <dd>
                
                    <asp:Label id="txtEMAIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.LOGIN_IPS.ZhName %>��</dt><%--�ɵ�¼IP��ַ����--%>
               <dd>
                
                    <asp:Label id="txtLOGIN_IPS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>��</dt><%--״̬��־--%>
               <dd>
               
                    <asp:Label id="txtSTATE_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.EDITTIME.ZhName%>��</dt><%--�޸�ʱ��--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.ADDTIME.ZhName %>��</dt><%--¼��ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>��</dt><%--�û�����--%>
               <dd>
               
                    <asp:Label id="txtUSER_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>

       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>�ҵĹ�����Ϣ</a></dt></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="UserRole.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>
    </div>

</div>
</asp:Content>