<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="sys_MenuInfoEdit" Title="ϵͳ������Ϣ" CodeFile="ModuleEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">
    $(function () {

        var checker = new formChecker({ btnIDS: 'btnOK,_btnOK' });
    });

    function setpageDir(me) {
        var txt = $(me).parent().parent().next().find("input");
        if(txt.val()==""){
            txt.val(me.value);
        }
    }

    function selTablePage(me) {
        var result = window.showModalDialog('../bill/billsel.aspx?r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result == undefined || result == '') return;
        var obj = eval(result);
        var hidUrl = $("input[id$='hidPageUrl']");
        var txtUrl = $("input[id$='txtPageUrl']");
        hidUrl.val("bill/billlist.aspx?billid=" + obj.ID);
        txtUrl.val("bill/billlist.aspx?billid=" + obj.ID);
    }
</script>
<style type="text/css">
.form dl dd input{width:300px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" style=" vertical-align:middle;">
<div class="titnav">
  <dl><dt><b><%=LanguageService.GetLanguageString("SystemMenuEdit", "ϵͳ�˵��༭")%></b></dt>
  <dd></dd></dl>

</div>
<div class="warn">
    <asp:Literal ID="litWarn" runat="server"></asp:Literal>

</div>
<div class="tool">
<ol><li><span><asp:Button ID="btnOK" runat="server" Text="����" onclick="btnOK_Click" Width="60" /></span></li></ol>

</div>
    <div class="form" id="listform">
    <div>
        <dl>
            <dt><%=LanguageService.GetLanguageString("ModelName", "ģ������")%>��</dt>
            <dd><input id="txtModuleName" type="text" runat="server" ck="{need:1,len:240,dtype:0}"/></dd>
            
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("EnglishName", "Ӣ������")%>��</dt>
            <dd><input id="txtEN" type="text" runat="server" value="english" ck="{need:0,len:240,dtype:0}"/></dd>
            
        </dl>
        <!--ģ�����ͣ�ҳ���ַ����ģ�飬����ͬ������̨�������-->
         <dl>
            <dt><%=LanguageService.GetLanguageString("WebPageAddress", "ҳ���ַ")%>��</dt>
            <dd>
            <input onblur="setpageDir(this);" style="width:400px" id="txtPageUrl" type="text" runat="server" ck="{need:0,len:240,dtype:0}"/>
            <input id="hidPageUrl" type="hidden" runat="server" />
            <input style=" clear:both; width:auto; margin-top:5px; padding-top:2px;" id="btnSelTablePage" name="btnSelTablePage" type="button" onclick="selTablePage(this);" value="<%=LanguageService.GetLanguageString("Select Table Page","ѡ���ҳ")%>" />
            </dd>
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("NeedControlAccess", "����Ȩ��")%>��</dt>
            <dd class="ckbs">
                <asp:RadioButtonList ID="rblNeedPower" runat="server" RepeatLayout="Flow">
                <asp:ListItem Value="1" Text="��Ҫ"></asp:ListItem>
                <asp:ListItem Value="0" Text="����Ҫ" Selected="True"></asp:ListItem>
                </asp:RadioButtonList> 
            </dd>
        </dl>
         <dl>
            <dt><%=LanguageService.GetLanguageString("SerialNumber", "���")%>��</dt>
            <dd><input id="txtSortNum" value="0" type="text" runat="server" ck="{need:1,len:999999999,dtype:1}"/>
            <%=LanguageService.GetLanguageString("SerialNumberHelper", "���ԽС��Խ��ǰ")%>
            </dd>
        </dl>
        <dl style="display:none;">
            <dt><%=LanguageService.GetLanguageString("RelationWebPage", "���ҳ��")%>��</dt>
            <dd style="width:400px;">
                <textarea id="txtREALPAGES" cols="60" rows="6" style="width:400px;height:80px;" runat="server"></textarea><br />
                
                <span><%=LanguageService.GetLanguageString("Separated by '|', but checked one of the page when the page address corresponding to a page without permission button, button, fill out this check in the page address","�����'|'����,��ҳ���ַ��Ӧҳ��Ȩ�ް�ť������ǩ�����е�ҳ���а�ť�����ڴ���дǩ��ҳ��ַ��") %></span></dd>
        </dl>
        <dl>
            <dt><%=LanguageService.GetLanguageString("State", "״̬")%>��</dt>
            <dd><select id="selState" runat="server" ck="{need:0}">
                <option value="1">����</option>
                <option value="2">����</option>
                <%--<option value="3">ɾ��</option>--%>
              </select>
            </dd>
        </dl>
        <dl style="display:none;">
            <dt><%=LanguageService.GetLanguageString("ModelPicture", "ģ��ͼ��")%>��</dt>
            <dd><input id="txtIcoUrl" type="text" runat="server" ck="{need:0,len:240,dtype:0}"/></dd>
        </dl>

    </div>
    <div class="clear"></div>
  </div>
 </div>
</asp:Content>


