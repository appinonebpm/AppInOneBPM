<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_THEMEManage" CodeFile="THEMEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();

        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input power="newSYS_THEME" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('THEMEEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_THEME" id="btn_Edit" type="button" value="�޸�" onclick="manager.editRecord('THEMEEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delByKeyID('THEMEBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="THEME_ID">
                    <td data="{colname:'<%=SYS_THEME.Attribute.THEME_ID.LongName%>',show:1}"><%=SYS_THEME.Attribute.THEME_ID._ZhName %></td><!--THEME_ID-->
                    <td data="{colname:'<%=SYS_THEME.Attribute.THEME_NAME.LongName%>',show:1}"><%=SYS_THEME.Attribute.THEME_NAME._ZhName %></td><!--Ƥ������(Ӣ��)-->
                    <td data="{colname:'<%=SYS_THEME.Attribute.SYS_NAME.LongName%>',show:1}"><%=SYS_THEME.Attribute.SYS_NAME._ZhName %></td><!--ϵͳ����-->
                    <td data="{colname:'<%=SYS_THEME.Attribute.VERSION.LongName%>',show:1}"><%=SYS_THEME.Attribute.VERSION._ZhName %></td><!--�汾��Ϣ-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
            <td>{THEME_ID}<input value="{THEME_ID}" type="hidden" /></td>
            <td>{THEME_NAME}</td>
            <td>{SYS_NAME}</td>
            <td>{VERSION}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td><%#((SYS_THEME)Container.DataItem).THEME_ID %><input value="<%#((SYS_THEME)Container.DataItem).THEME_ID %>" type="hidden" /></td>
                    <td><%#((SYS_THEME)Container.DataItem).THEME_NAME %></td>
                    <td><%#((SYS_THEME)Container.DataItem).SYS_NAME %></td>
                    <td><%#((SYS_THEME)Container.DataItem).VERSION %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>

</div>
</asp:Content>