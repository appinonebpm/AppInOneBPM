<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="HR_STATION_LEVELManage.aspx.cs" Inherits="HR_STATION_LEVELManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="HR_STATION_LEVEL.LEVEL_ID">
               <dt><%=HR_STATION_LEVEL.Attribute.LEVEL_ID.ZhName %>��</dt><!--��λ�ȼ�ID-->
               <dd><span>
               
                    <input id="txtLEVEL_ID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_STATION_LEVEL.LEVEL_NAME">
               <dt><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME.ZhName %>��</dt><!--��λ�ȼ�����-->
               <dd><span>
               
                    <input id="txtLEVEL_NAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_STATION_LEVEL.ADDTIME">
               <dt><%=HR_STATION_LEVEL.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_STATION_LEVEL" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('HR_STATION_LEVELEdit.aspx');" /></span></li>
            <li><span><input power="editHR_STATION_LEVEL" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('HR_STATION_LEVELEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_STATION_LEVEL" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('HR_STATION_LEVELBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="LEVEL_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=HR_STATION_LEVEL.Attribute.LEVEL_ID.LongName%>',show:1}"><%=HR_STATION_LEVEL.Attribute.LEVEL_ID._ZhName %></td><!--��λ�ȼ�ID-->
                    
                    
                    <td data="{colname:'<%=HR_STATION_LEVEL.Attribute.LEVEL_NAME.LongName%>',show:1}"><%=HR_STATION_LEVEL.Attribute.LEVEL_NAME._ZhName %></td><!--��λ�ȼ�����-->
                    
                    
                    <td data="{colname:'<%=HR_STATION_LEVEL.Attribute.ADDTIME.LongName%>',show:1}"><%=HR_STATION_LEVEL.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_STATION_LEVEL)Container.DataItem).LEVEL_ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_STATION_LEVEL)Container.DataItem).PATH, ((HR_STATION_LEVEL)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((HR_STATION_LEVEL)Container.DataItem).LEVEL_ID %></td>
                    
                    
                    <td><%#((HR_STATION_LEVEL)Container.DataItem).LEVEL_NAME %></td>
                    
                    
                    <td><%#(((HR_STATION_LEVEL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((HR_STATION_LEVEL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>