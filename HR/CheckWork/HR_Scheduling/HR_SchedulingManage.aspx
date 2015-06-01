<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchedulingManage" CodeFile="HR_SchedulingManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
   <div class="topfindl" style="display:none;"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="HR_Scheduling.Year">
               <dt><%=HR_Scheduling.Attribute.SchYear.ZhName%>��</dt><!--��-->
               <dd><span>
                
                    <input id="txtYear" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Month">
               <dt><%=HR_Scheduling.Attribute.SchMonth.ZhName%>��</dt><!--��-->
               <dd><span>
                
                    <input id="txtMonth" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Day">
               <dt><%=HR_Scheduling.Attribute.SchDay.ZhName%>��</dt><!--��-->
               <dd><span>
                
                    <input id="txtDay" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.Type">
               <dt><%=HR_Scheduling.Attribute.SchType.ZhName%>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtType" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="HR_Scheduling.SchClassid">
               <dt><%=HR_Scheduling.Attribute.SchClassid.ZhName %>��</dt><!--�Ű���-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_Scheduling" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('HR_SchedulingEdit.aspx');" /></span></li>
            <li><span><input power="editHR_Scheduling" id="btn_Edit" type="button" value="�½�" onclick="manager.editRecord('HR_SchedulingEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_Scheduling" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('HR_SchedulingBack.aspx');" /></span></li>
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
                <tr keyname="Day">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchYear.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchYear._ZhName%></td><!--��-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchMonth.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchMonth._ZhName%></td><!--��-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchDay.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchDay._ZhName%></td><!--��-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchType.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchType._ZhName%></td><!--����-->
                    
                    
                    <td data="{colname:'<%=HR_Scheduling.Attribute.SchClassid.LongName%>',show:1}"><%=HR_Scheduling.Attribute.SchClassid._ZhName %></td><!--�Ű���-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_Scheduling)Container.DataItem).SchDay%>" /></td>
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchYear %></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchMonth%></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchDay%></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_Scheduling.Attribute.SchType, ((HR_Scheduling)Container.DataItem).SchType)%></td>
                    
                    
                    <td><%#((HR_Scheduling)Container.DataItem).SchClassid %></td>
                    
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