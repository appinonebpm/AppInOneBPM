<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksManage.aspx.cs" Inherits="Ec_blocksManage" %>
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
         
            <dl colname="Ec_blocks.Blockid">
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>��</dt><!--Blockid-->
               <dd><span>
               
                    <input id="txtBlockid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Tabid">
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>��</dt><!--ģ��id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Blocklabel">
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>��</dt><!--��ʾ��������-->
               <dd><span>
               
                    <input id="txtBlocklabel" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Sequence">
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>��</dt><!--��ʾ˳��-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Show_title">
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtShow_title" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Visible">
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>��</dt><!--�Ƿ�ɼ�-->
               <dd><span>
               
                    <input id="txtVisible" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Create_view">
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>��</dt><!--Create_-->
               <dd><span>
               
                    <input id="txtCreate_view" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Edit_view">
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>��</dt><!--Edit_vi-->
               <dd><span>
               
                    <input id="txtEdit_view" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_blocks.Detail_view">
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>��</dt><!--Detail_-->
               <dd><span>
               
                    <input id="txtDetail_view" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newEc_blocks" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('Ec_blocksEdit.aspx');" /></span></li>
            <li><span><input power="editEc_blocks" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('Ec_blocksEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_blocks" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('Ec_blocksBack.aspx');" /></span></li>
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
                <tr keyname="Blockid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Blockid.LongName%>',show:1}"><%=Ec_blocks.Attribute.Blockid._ZhName %></td><!--Blockid-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Tabid.LongName%>',show:1}"><%=Ec_blocks.Attribute.Tabid._ZhName %></td><!--ģ��id-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Blocklabel.LongName%>',show:1}"><%=Ec_blocks.Attribute.Blocklabel._ZhName %></td><!--��ʾ��������-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Sequence.LongName%>',show:1}"><%=Ec_blocks.Attribute.Sequence._ZhName %></td><!--��ʾ˳��-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Show_title.LongName%>',show:1}"><%=Ec_blocks.Attribute.Show_title._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Visible.LongName%>',show:1}"><%=Ec_blocks.Attribute.Visible._ZhName %></td><!--�Ƿ�ɼ�-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Create_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Create_view._ZhName %></td><!--Create_-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Edit_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Edit_view._ZhName %></td><!--Edit_vi-->
                    
                    
                    <td data="{colname:'<%=Ec_blocks.Attribute.Detail_view.LongName%>',show:1}"><%=Ec_blocks.Attribute.Detail_view._ZhName %></td><!--Detail_-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_blocks)Container.DataItem).Blockid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_blocks)Container.DataItem).PATH, ((Ec_blocks)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blockid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blocklabel %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Show_title %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Visible %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Create_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Edit_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Detail_view %></td>
                    
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