<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USEREdit" CodeFile="USEREdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
  <script src="../../Lib/JScript/myTabs.js" type="text/javascript"></script>
<script type="text/javascript">

    function addReal(me) {
        var result = window.showModalDialog("../Role/RoleSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ID);
            var url = window.frames["ifrReal"].location.pathname;//  window.frames["ifrReal"].document.URL;
            window.frames["ifrReal"].location.href = url + "?mulids=" + roles;
        }
        $(me).parent().parent().next().show();
        return false;
    }

    function selStaff(me) {
        var result = window.showModalDialog("../../HR/STAFF/STAFFSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result != undefined && result != "") {
            var obj = eval(result);
            var txts = $(me).parent().find("input");
            txts[0].value = obj.ID;
            txts[1].value = obj.Name;
        }
        return false;
    }


    function delReal(me) {

        var delroles = window.frames["ifrReal"]._delOneAndReturn();

        $(me).parent().parent().next().show();
        return false;
    }

    function newReal(me) {

        var result = window.showModalDialog("../Role/RoleEdit.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ROLE_ID);
            var url = window.frames["ifrReal"].location.pathname; //
          
        }
        $(me).parent().parent().next().show();
        return false;
    }

    function _myCheck() {
        var roleids = window.frames["ifrReal"]._getSelRealIDS();
        $("input[id$='hidSelReals']").val(roleids);
        return true;
    }
</script>
<style type="text/css">
body,html{ overflow:hidden;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
       <dl><dt><b><%=title %></b></dt></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
     <ul><li><span class="btn"><asp:Button ID="btnSave" runat="server" lang="BtnOK" Text="����" onclick="btnOK_Click"/></span></li>
     <li><span class="btn"><asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="�����˳�" onclick="btnOK_Click"/></span></li>
     <li><span class="btn"><input onclick="window.close();" lang="close" value="�ر�" type="button" /></span></li></ul>
    </div>
    <div class="tabs">
       <ul>
         <li class="show"><a>������Ϣ</a></li><li><a>�û���ɫ</a></li>
       </ul>
       <ol>
           <li class="show" style="height:520px;">
               <div class="form" id="divForm"><input id="txtUSER_ID" type="hidden" runat="server"/>
                <dl>
                   <dt>ѡ��Ա����</dt><%--�û���--%>
                   <dd>
                       <SelStaff:wucSelStaff ID="wucSelStaff1" runat="server" />
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>��</dt><%--�û���--%>
                   <dd>
                        <span><input id="txtUSER_NAME" type="text" runat="server" ck="{need:1,len:20,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.PASS.ZhName %>��</dt><%--����--%>
                   <dd>
                        <span><input id="txtPASS" type="password" runat="server" ck="{need:0,len:20,type:0}"/><br />����д�����޸�����</span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>��</dt><%--�ڲ��ʼ�--%>
                   <dd><span><input id="txtEMAIL" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt>��������IP��ַ��</dt>
                   <dd><span><input id="txtLOGIN_IPS" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
                   <dd><span>֧�ֶ�IP���ԡ�,���ŷָ</span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>��</dt><%--״̬��־--%>
                   <dd><span><select id="txtSTATE_FLAG" runat="server" ck="{need:0,len:2,type:0}">
                        </select></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>��</dt><%--�û�����--%>
                   <dd><span><select id="txtUSER_TYPE" runat="server" ck="{need:0,len:2,type:0}">
                        </select></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.USER_QQ.ZhName %>��</dt><%--�û�QQ--%>
                   <dd><span>
                
                        <input id="txtUSER_QQ" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.USER_Taobao.ZhName %>��</dt><%--�û�����--%>
                   <dd><span>
                
                        <input id="txtUSER_Taobao" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_FeiQ_Remind.ZhName %>��</dt><%--�Ƿ��������--%>
                   <dd><span>
                
                        <input id="txtIS_FeiQ_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_EMAIL_Remind.ZhName %>��</dt><%--�Ƿ��ʼ�����--%>
                   <dd><span>
                
                        <input id="txtIS_EMAIL_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_Taobao_Remind.ZhName %>��</dt><%--�Ƿ���������--%>
                   <dd><span>
                
                        <input id="txtIS_Taobao_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_USER.Attribute.IS_QQ_Remind.ZhName %>��</dt><%--�Ƿ�QQ����--%>
                   <dd><span>
                
                        <input id="txtIS_QQ_Remind" type="checkbox" class="ckb" runat="server" /></span>
                   </dd>
               </dl>
               <div class="clear"></div>
           </div>
          
           </li>
           <li>
              <div class="tool">
              <p>
              <span><input id="btn_AddReal" type="button" value="���" class="btn" onclick="addReal(this);" /></span>
              <span><input id="btn_NewReal" type="button" value="�½�" class="btn" onclick="newReal(this);" /></span>
              <span><input id="btn_DelReal" type="button" value="ɾ��" class="btn" onclick="delReal(this);" /></span>
              </p>
              </div>
              <div>
                <iframe name="ifrReal" id="ifrReal" src="UserRole.aspx?oneid=<%=keyid %>" frameborder="0" scrolling="auto" style="width:100%;height:480px;"></iframe>
              </div>
           </li>
       </ol>
    </div>
    <div class="tool"></div>
</div>
</asp:Content>