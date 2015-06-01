<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTDefault.aspx.cs" Inherits="WEC_REQUESTDefault" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>

 <script type="text/javascript">
       $(function () {
           //parent.indexParas.guideObj.find("li[class=sel] span").html()
           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           $("#helpWd").attr("href", $("#helpWd").attr("href") + "?key=" + parent.indexParas.guideObj.find("li[class=sel] span").html());
           $("#helpWd").click(function () {
       
               parent.addLinkToParentTab($("#helpWd"), true);
               return false;
            
           });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b>
       <span><a href="<%=appUrl %>WECAdmin/WebSite/Help/WEC_HELPER.aspx" data="{key:'mdl_0108',name:'�����ĵ�'}" id ='helpWd'>����</a></span>
        </dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
           <dl>
               <dt>Ĭ�Ϲ�ע�ظ���</dt><%--�ظ�����--%>
               <dd><span>
                     <select id="txtMEMO" runat="server" ck="{need:1,len:4,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt>Ĭ����ƥ��ظ���</dt><%--�ؼ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtKEYWORD" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>�Ƿ�����ƥ��ظ���</dt><%--״̬--%>
               <dd><span>
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>��</dt><%--���ں�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtAID" type="text" runat="server" ck="{type:0,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
</ul>
   </div>
</div>
</asp:Content>