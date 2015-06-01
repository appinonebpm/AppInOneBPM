<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_tabManage.aspx.cs" Inherits="Ec_tabManage" %>
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
         
            <dl colname="Ec_tab.Tabid">
               <dt><%=Ec_tab.Attribute.Tabid.ZhName %>��</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Name">
               <dt><%=Ec_tab.Attribute.Name.ZhName %>��</dt><!--ģ����-->
               <dd><span>
               
                    <input id="txtName" type="text" runat="server"  ck="{len:25,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Presence">
               <dt><%=Ec_tab.Attribute.Presence.ZhName %>��</dt><!--Presenc-->
               <dd><span>
               
                    <input id="txtPresence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Tabsequence">
               <dt><%=Ec_tab.Attribute.Tabsequence.ZhName %>��</dt><!--Tabsequ-->
               <dd><span>
               
                    <input id="txtTabsequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Tablabel">
               <dt><%=Ec_tab.Attribute.Tablabel.ZhName %>��</dt><!--ѡ���ǩ-->
               <dd><span>
               
                    <input id="txtTablabel" type="text" runat="server"  ck="{len:25,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Modifiedby">
               <dt><%=Ec_tab.Attribute.Modifiedby.ZhName %>��</dt><!--Modifie-->
               <dd><span>
               
                    <input id="txtModifiedby" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Modifiedtime">
               <dt><%=Ec_tab.Attribute.Modifiedtime.ZhName %>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtModifiedtime" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Customized">
               <dt><%=Ec_tab.Attribute.Customized.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtCustomized" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_tab.Reportable">
               <dt><%=Ec_tab.Attribute.Reportable.ZhName %>��</dt><!--Reporta-->
               <dd><span>
               
                    <input id="txtReportable" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newEc_tab" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('Ec_tabEdit.aspx');" /></span></li>
            <li><span><input power="editEc_tab" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('Ec_tabEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_tab" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('Ec_tabBack.aspx');" /></span></li>
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
                <tr keyname="Tabid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Tabid.LongName%>',show:1}"><%=Ec_tab.Attribute.Tabid._ZhName %></td><!--Tabid-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Name.LongName%>',show:1}"><%=Ec_tab.Attribute.Name._ZhName %></td><!--ģ����-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Presence.LongName%>',show:1}"><%=Ec_tab.Attribute.Presence._ZhName %></td><!--Presenc-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Tabsequence.LongName%>',show:1}"><%=Ec_tab.Attribute.Tabsequence._ZhName %></td><!--Tabsequ-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Tablabel.LongName%>',show:1}"><%=Ec_tab.Attribute.Tablabel._ZhName %></td><!--ѡ���ǩ-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Modifiedby.LongName%>',show:1}"><%=Ec_tab.Attribute.Modifiedby._ZhName %></td><!--Modifie-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Modifiedtime.LongName%>',show:1}"><%=Ec_tab.Attribute.Modifiedtime._ZhName %></td><!--�޸�ʱ��-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Customized.LongName%>',show:1}"><%=Ec_tab.Attribute.Customized._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=Ec_tab.Attribute.Reportable.LongName%>',show:1}"><%=Ec_tab.Attribute.Reportable._ZhName %></td><!--Reporta-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_tab)Container.DataItem).Tabid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_tab)Container.DataItem).PATH, ((Ec_tab)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Name %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Presence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tabsequence %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Tablabel %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedby %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Modifiedtime %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Customized %></td>
                    
                    
                    <td><%#((Ec_tab)Container.DataItem).Reportable %></td>
                    
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