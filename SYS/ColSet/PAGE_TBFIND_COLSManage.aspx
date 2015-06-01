<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_PAGE_TBFIND_COLSManage" CodeFile="PAGE_TBFIND_COLSManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>

<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
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
            <li><span><input id="btn_New" type="button" value="�½�" onclick="manager.newRecord('PAGE_TBFIND_COLSEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('PAGE_TBFIND_COLSBack.aspx');" /></span></li>
            <li><span><asp:Button ID="_btnSave" runat="server" Text="ȷ������" onclick="btnSave_Click" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="P_COLID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.P_COLID.FieldName%>',show:1}"><%=SYS_PAGE_TBFIND_COLS.Attribute.P_COLID._ZhName %></td><!--P_COLID-->
                    
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.PAGE_URL.FieldName%>',show:1}"><%=SYS_PAGE_TBFIND_COLS.Attribute.PAGE_URL._ZhName %></td><!--PAGE_URL-->
                    
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.FOR_TYPE.FieldName%>',show:0}"><%=SYS_PAGE_TBFIND_COLS.Attribute.FOR_TYPE._ZhName %></td><!--0ͨ�ã�1�б��ͷ��2��ѯ��-->
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.COL_NAME.FieldName%>',show:1}"><%=SYS_PAGE_TBFIND_COLS.Attribute.COL_NAME._ZhName%></td><!--��������һ��Ϊ�ֶ���-->
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.SHOW_NAME.FieldName%>',show:1}"><%=SYS_PAGE_TBFIND_COLS.Attribute.SHOW_NAME._ZhName%></td><!--��������һ��Ϊ�ֶ���-->
                    
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.TB_SHOW.FieldName%>',show:1}"><input type="checkbox" onclick="_selAll(this);" /><%=SYS_PAGE_TBFIND_COLS.Attribute.TB_SHOW._ZhName %></td><!--�ڱ�����Ƿ���ʾ-->
                    
                    
                    <td data="{colname:'<%=SYS_PAGE_TBFIND_COLS.Attribute.FIND_SHOW.FieldName%>',show:1}"><%=SYS_PAGE_TBFIND_COLS.Attribute.FIND_SHOW._ZhName %></td><!--�ڲ�ѯ�����Ƿ���ʾ-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).P_COLID%>" /></td>
                   
                    <td><%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).P_COLID %></td>
                    
                    <td><%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).PAGE_URL %></td>
                    
                    
                    <td><%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).FOR_TYPE %></td>
                    <td><%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).COL_NAME%></td>
                    
                    <td><%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).SHOW_NAME%></td>
                    
                    
                    <td><input type="hidden" name="ckCols" value="<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).P_COLID%>" />
                        <input name="ck_TB_SHOW" value="<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).P_COLID%>" type="checkbox" <%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).TB_SHOW==1?"checked=''":"" %> /></td>
                    
                    
                    <td><select name="sel_FindCol">
                    <option value="1"<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).FIND_SHOW==1?" selected='selected'":"" %>>��������</option>
                    <option value="2"<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).FIND_SHOW==2?" selected='selected'":"" %>>��ѡ����</option>
                    <option value="3"<%#((SYS_PAGE_TBFIND_COLS)Container.DataItem).FIND_SHOW==3?" selected='selected'":"" %>>��������</option>
                    </select></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="tool">
        <ul>
            <li><span><asp:Button ID="btnSave" runat="server" Text="ȷ������" 
                    onclick="btnSave_Click" /></span></li>
        </ul>
    </div>
</div>
</asp:Content>