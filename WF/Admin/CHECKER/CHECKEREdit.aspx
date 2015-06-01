<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CHECKER_TPLEdit" CodeFile="CHECKEREdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave',blurEvt:true });

         selTypeChg($("select[id$='txtCHECKER_TYPE']")[0]);
     });

     function selTypeChg(me) {
         $("#dlSelChecker").hide(); $("#dlSelDept").hide(); $("#dlSelHRole").hide(); $("#dlSelUserRole").hide(); $("#dlSelLevel").hide(); $("#dlSelLeaderLevel").hide();
           if (me.value == "1") {
               $("#dlSelChecker").show();
           } else if (me.value == "2") {
               $("#dlSelDept").show();
           }
           else if (me.value == "3") {
               $("#dlSelHRole").show();
           }
           else if (me.value == "4") {
               $("#dlSelUserRole").show();
           }
           else if (me.value == "7") {
               $("#dlSelLevel").show();
           }
           else if (me.value == "8") {
               $("#dlSelLeaderLevel").show();
           }
       }
</script>
<style type="text/css">
.form dl dt{width:150px;}
</style>
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
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <dl>
               <dt><%=WF_CHECKER_TPL.Attribute.CHECKER_TYPE.ZhName %>��</dt><%--����������--%>
               <dd><span> <select id="txtCHECKER_TYPE" runat="server" onchange="selTypeChg(this);" ck="{need:1,len:2,type:0}">
                      <option value="1">ָ��Ա��</option>
                      <option value="2">ָ������</option>
                      <option value="3">���¸�λ</option>
                      <%--<option value="4">ָ���û���ɫ</option>--%>
                      <option value="5">ֱ���쵼</option>
                      <option value="6">����쵼</option>
                      <option value="7">Ա���ȼ�</option>
                      <option value="8">�����ϼ��ȼ�</option>
                    </select></span>
               </dd>
           </dl>
           <dl id="dlSelChecker" class="hide">
               <dt>ѡ��Ա����</dt><%--�������û�ID--%>
               <dd><selStaff:wucSelStaff ID="wucSelStaff1" runat="server" /></dd>
           </dl>
           <dl id="dlSelDept" class="hide">
             <dt>ѡ���ţ�</dt><dd><selDept:wucSelDept ID="wucSelDept1" runat="server" />
               </dd>
           </dl>
            <dl id="dlSelHRole" class="hide">
             <dt>ѡ�����¸�λ��</dt><dd><selStation:wucSelStation ID="wucSelStation1" runat="server" />
               </dd>
           </dl>
            <dl id="dlSelUserRole" class="hide">
           <dt></dt><dd></dd>
           </dl>
           <dl id="dlSelLevel" class="hide">
             <dt>ѡ��Ա���ȼ���</dt><dd><span>
                    <select id="SelLevel" runat="server">
                    </select></span>
               </dd>
           </dl>
           <dl id="dlSelLeaderLevel" class="hide">
             <dt>ѡ�������ϼ��ȼ���</dt><dd><span>
                    <select id="SelLeaderLevel" runat="server">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_CHECKER_TPL.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>