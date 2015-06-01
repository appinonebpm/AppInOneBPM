<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STATIONManage" CodeFile="STATIONManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=name%> <%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="�½�" onclick="manager.newRecord('STATIONEdit.aspx','ORG_ID=<%=org %>&DEPT_ID=<%=dept %>&P_ID=<%=pid %>');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
<li><span><input id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('STATIONEdit.aspx','ORG_ID=<%=org %>&DEPT_ID=<%=dept %>&P_ID=<%=pid %>');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('STATIONBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="STATION_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <%--<td data="{colname:'<%=HR_STATION.Attribute.STATION_ID.LongName%>',show:1}"><%=HR_STATION.Attribute.STATION_ID._ZhName %></td><!--��λ���-->
                    --%><td data="{colname:'<%=HR_STATION.Attribute.SORT_NO.LongName%>',show:1}"><%=HR_STATION.Attribute.SORT_NO._ZhName %></td><!--���-->
                    <td data="{colname:'<%=HR_STATION.Attribute.STATION_NAME.LongName%>',show:1}"><%=HR_STATION.Attribute.STATION_NAME._ZhName %></td><!--��λ����-->
<%--                    <td data="{colname:'<%=HR_STATION.Attribute.PID.LongName%>',show:1}"><%=HR_STATION.Attribute.PID._ZhName %></td><!--�����-->
                    <td data="{colname:'<%=HR_STATION.Attribute.PATH.LongName%>',show:1}"><%=HR_STATION.Attribute.PATH._ZhName %></td><!--���·��-->
                    --%>
                    <td data="{colname:'<%=HR_STATION.Attribute.SUB_NUM.LongName%>',show:1}"><%=HR_STATION.Attribute.SUB_NUM._ZhName %></td><!--�Ӹ�λ����-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION_TYPE.Attribute.TYPE_NAME._ZhName%></td><!--����-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME._ZhName%></td><!--�ȼ�-->
                    <td data="{colname:'<%=HR_STATION.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION.Attribute.MBR_NUM._ZhName%></td><!--Ա������-->
                    </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_STATION)Container.DataItem).STATION_ID%>" /></td>
                    <td><%#((HR_STATION)Container.DataItem).SORT_NO %></td>
                 <%--   <td><%#((HR_STATION)Container.DataItem).STATION_ID %></td>--%>
                    <td><%#((HR_STATION)Container.DataItem).STATION_NAME %></td>
<%--                    <td><%#((HR_STATION)Container.DataItem).PID %></td>
                    <td><%#((HR_STATION)Container.DataItem).PATH %></td>--%>
                    <td><%#((HR_STATION)Container.DataItem).SUB_NUM %></td>
                    <td><%#((HR_STATION)Container.DataItem).GetValue(HR_STATION_TYPE.Attribute.TYPE_NAME)%></td>
                    <td><%#((HR_STATION)Container.DataItem).GetValue(HR_STATION_LEVEL.Attribute.LEVEL_NAME)%></td>
                    <td><%#((HR_STATION)Container.DataItem).MBR_NUM %></td>
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