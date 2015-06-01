<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITY_SNCODEEdit.aspx.cs" Inherits="WEC_ACTIVITY_SNCODEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd><span>
               <!--����-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.ZhName %>��</dt><%--SN��--%>
               <dd><span>
               <!--����-->
                    <input id="txtSN_CODE" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.ZhName %>��</dt><%--��Ʒ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtAWARD_TYPE" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.ZhName %>��</dt><%--��ȡ���ֻ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtPHONE" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.ZhName %>��</dt><%--��ȡ��΢����--%>
               <dd><span>
               <!--����-->
                    <input id="txtWX_CODE" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.ZhName %>��</dt><%--�н�ʱ��--%>
               <dd><span>
               
                    <input id="txtZJ_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.ZhName %>��</dt><%--ʹ��ʱ��--%>
               <dd><span>
               
                    <input id="txtSY_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.ZhName %>��</dt><%--�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtA_ID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>