<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GUSETBOOKManage.aspx.cs" Inherits="SYS_GUSETBOOKManage" %>
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
         
            <dl colname="SYS_GUSETBOOK.ID">
               <dt><%=SYS_GUSETBOOK.Attribute.ID.ZhName %>��</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.TYPE">
               <dt><%=SYS_GUSETBOOK.Attribute.TYPE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.MEMO">
               <dt><%=SYS_GUSETBOOK.Attribute.MEMO.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtMEMO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.EMAIL">
               <dt><%=SYS_GUSETBOOK.Attribute.EMAIL.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.MOBIL">
               <dt><%=SYS_GUSETBOOK.Attribute.MOBIL.ZhName %>��</dt><!--�ֻ�����-->
               <dd><span>
               
                    <input id="txtMOBIL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.ADDTIME">
               <dt><%=SYS_GUSETBOOK.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.ANSWER">
               <dt><%=SYS_GUSETBOOK.Attribute.ANSWER.ZhName %>��</dt><!--�ظ�-->
               <dd><span>
               
                    <input id="txtANSWER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_GUSETBOOK.USERNAME">
               <dt><%=SYS_GUSETBOOK.Attribute.USERNAME.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtUSERNAME" type="text" runat="server"  ck="{len:50,type:0}" />
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
            <li><span><input power="newSYS_GUSETBOOK" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('SYS_GUSETBOOKEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_GUSETBOOK" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('SYS_GUSETBOOKEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newSYS_GUSETBOOK" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('SYS_GUSETBOOKBack.aspx');" /></span></li>
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
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.ID.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.TYPE.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.TYPE._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.MEMO.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.MEMO._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.EMAIL.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.EMAIL._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.MOBIL.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.MOBIL._ZhName %></td><!--�ֻ�����-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.ADDTIME.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.ANSWER.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.ANSWER._ZhName %></td><!--�ظ�-->
                    
                    
                    <td data="{colname:'<%=SYS_GUSETBOOK.Attribute.USERNAME.LongName%>',show:1}"><%=SYS_GUSETBOOK.Attribute.USERNAME._ZhName %></td><!--����-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_GUSETBOOK)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_GUSETBOOK)Container.DataItem).PATH, ((SYS_GUSETBOOK)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_GUSETBOOK.Attribute.TYPE, ((SYS_GUSETBOOK)Container.DataItem).TYPE)%></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MOBIL %></td>
                    
                    
                    <td><%#(((SYS_GUSETBOOK)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_GUSETBOOK)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ANSWER %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).USERNAME %></td>
                    
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