<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERManage" CodeFile="USERManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
<script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager= new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        manager.initPageSizeEvt("txtPageNum");

        bindWinResize(45);
    });
    function setRolePower(me) {
        var roleid = manager.getSelectedID();
        if (roleid == "") {
            alert("�뵥��ĳ��ѡ��һ���û���");
            return;
        }
        var result = window.showModalDialog("../Power/PowerSet.aspx?USER_ID=" + roleid + "&r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        return false;
    }
//    function addNewToList(str) {
//        alert(str);
//        manager.addToList(str);
//    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server">���½������򿪴����½��û����ڱ����ѡ��һ�У��㡰�༭���򿪴��ڱ༭�û����ڱ����߶�ѡ�û����ٵ㡰ɾ��������ɾ���û���</asp:Literal></div>
   <div class="topfind">
        <dl><dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>��</dt><dd><span><input id="txtUSER_NAME" type="text" runat="server" /></span></dd></dl>
        <dl><dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>��</dt><dd><span><select id="txtSTATE_FLAG" runat="server" ></select></span></dd></dl>
        <dl><dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>��</dt><dd><span><select id="txtUSER_TYPE" runat="server" ></select></span></dd></dl>
        <dl class="btn"><dt>&nbsp;</dt>
            <dd>
        <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
        <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
        </dd></dl>
        <div class="clear"></div>
    </div>  
    <div class="tool">
        <ul>
            <li><span><input power="NewUser" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('USEREdit.aspx');" /></span></li>
            <li><span><input power="EditUser" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('USEREdit.aspx');" /></span></li>
            <li><span><input power="DeleteSels" id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('USERBack.aspx');" /></span></li>
            <li><span><input power="SetPower" type="button" value="Ȩ������" onclick="setRolePower(this);" /></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="btnSetPageNum" runat="server" Text="����" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="USER_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td colname="<%=SYS_USER.Attribute.USER_ID.FieldName%>"><%=SYS_USER.Attribute.USER_ID._ZhName %></td><!--�û���ʶ-->
                    <td colname="<%=SYS_USER.Attribute.REAL_NAME.FieldName%>">��ʵ����</td>
                    <td colname="<%=SYS_USER.Attribute.USER_NAME.FieldName%>"><%=SYS_USER.Attribute.USER_NAME._ZhName %></td><!--�û���-->
                    <td colname="<%=SYS_USER.Attribute.EMAIL.FieldName%>"><%=SYS_USER.Attribute.EMAIL._ZhName %></td><!--�ڲ��ʼ�-->
                    <td colname="<%=SYS_USER.Attribute.USE_FLAG.FieldName%>"><%=SYS_USER.Attribute.USE_FLAG._ZhName%></td><!--״̬��־-->
                    <td colname="<%=SYS_USER.Attribute.EDITTIME.FieldName%>"><%=SYS_USER.Attribute.EDITTIME._ZhName %></td><!--�޸�ʱ��-->
                    <td colname="<%=SYS_USER.Attribute.USER_TYPE.FieldName%>"><%=SYS_USER.Attribute.USER_TYPE._ZhName %></td><!--�û�����-->
                    <td>Ա��</td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_USER)Container.DataItem).USER_ID%>" /></td>
                    <td><%#((SYS_USER)Container.DataItem).USER_ID %></td>
                     <td><%#((SYS_USER)Container.DataItem).REAL_NAME %></td>
                    <td><a><%#((SYS_USER)Container.DataItem).USER_NAME %></a></td>
                    <td><%#((SYS_USER)Container.DataItem).EMAIL %></td>
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USE_FLAG, ((SYS_USER)Container.DataItem).USE_FLAG)%></td>
                    <td><%#(((SYS_USER)Container.DataItem).EDITTIME == DateTime.MinValue) ? "" : ((SYS_USER)Container.DataItem).EDITTIME.ToString("yyyy-MM-dd")%></td>
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USER_TYPE, ((SYS_USER)Container.DataItem).USER_TYPE)%></td>
                    <td><%#((SYS_USER)Container.DataItem).STAFF_ID>0?"��ָ��":"δָ��" %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>