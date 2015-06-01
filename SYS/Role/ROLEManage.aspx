<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_ROLE_ManageMulti" CodeFile="ROLEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initPageSizeEvt("txtPageNum");

        bindWinResize(40);
    });

    function setRolePower(me) {
        var roleid = manager.getSelectedID();
        if (roleid == "") {
            alert("�뵥��ĳ��ѡ��һ����ɫ��");
            return;
        }
        var result = window.showModalDialog("../Power/PowerSet.aspx?ROLE_ID="+roleid+"&r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        return false;
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
    <dl><dt><b>��ɫ����</b></dt></dl>
    </div>
    <div class="warn">
        <div class="warn"><asp:Literal ID="litWarn" runat="server">���½������򿪴����½���ɫ���ڱ����ѡ��һ�У��㡰�༭���򿪴��ڱ༭��ɫ���㡰�½��¼������Խ����Ӳ㼶���ݡ��ڱ����߶�ѡ��ɫ���ٵ㡰ɾ��������ɾ����ɫ��</asp:Literal></div>
    </div>
    <div class="topfind">  
          <dl><dt><%=SYS_ROLE.Attribute.ROLE_NAME.ZhName %>��</dt><dd><span><input id="txtROLE_NAME" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/></span></dd></dl>
          <dl><dt><%=SYS_ROLE.Attribute.CREATER.ZhName %>��</dt><dd><span><input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/></span></dd></dl>
          <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="topFindClear(this);"/></span>
          </dd></dl>
          <div class="clear"></div>
    </div>   
    <div class="tool">
        <ul>
            <li><span><input power="NewUser"  type="button" value="�½�" onclick="manager.newRecord('RoleEdit.aspx','PID=<%=pid %>');" /></span></li>
            <li><span><input power="NewStaff" id="Button1" type="button" value="�½��¼�" onclick="manager.newRecord('RoleEdit.aspx','PID');" /></span></li>
            <li><span><input power="EditUser" type="button" value="�༭" onclick="manager.editRecord('RoleEdit.aspx');" /></span></li>
            <li><span><input power="DeleteSels" type="button" value="ɾ��" onclick="manager.delBySelIDS('RoleBack.aspx');" /></span></li>
            <li><span><input power="SetPower" type="button" value="Ȩ������" onclick="setRolePower(this);" /></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageNum" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="btnSetPageNum" runat="server" Text="����" OnClick="btnSetPageNum_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="olAllColCBS"></ol></li>
        </ol>
    </div>
    <div class="tblist" id="tbList">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr keyname="ROLE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="ROLEManage.aspx" id="a_top" runat="server"><b>/����</b></a></td>

                    <td colname="ROLE_ID"><%=SYS_ROLE.Attribute.ROLE_ID._ZhName %></td><!--��ɫID-->
                    <td colname="ROLE_NAME"><%=SYS_ROLE.Attribute.ROLE_NAME._ZhName %></td><!--��ɫ��-->
                    <td colname="CREATER"><%=SYS_ROLE.Attribute.CREATER._ZhName %></td><!--CREATER-->
                    <td colname="CREATIME"><%=SYS_ROLE.Attribute.CREATIME._ZhName %></td><!--����ʱ��-->
                    <td colname="PNAME"><%=SYS_ROLE.Attribute.PNAME._ZhName %></td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_ROLE)Container.DataItem).ROLE_ID%>" /><input value="<%#((SYS_ROLE)Container.DataItem).PATH%>" type="hidden" /></td>
                    <td><%#showLeftLinks(((SYS_ROLE)Container.DataItem).PATH, ((SYS_ROLE)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    <td><%#((SYS_ROLE)Container.DataItem).ROLE_ID %></td>
                    <td><a href="RoleUsers.aspx?ROLE_ID=<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>&preUrl=<%=curUrl %>"><%#((SYS_ROLE)Container.DataItem).ROLE_NAME %></a></td>
                    <td><%#((SYS_ROLE)Container.DataItem).CREATER %></td>
                    <td><%#(((SYS_ROLE)Container.DataItem).CREATIME == DateTime.MinValue) ? "" : ((SYS_ROLE)Container.DataItem).CREATIME.ToString("yyyy-MM-dd")%></td>
                     <td><%#((SYS_ROLE)Container.DataItem).PNAME%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
      <div class="path-url">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
      <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
      </div>
</div>
</asp:Content>