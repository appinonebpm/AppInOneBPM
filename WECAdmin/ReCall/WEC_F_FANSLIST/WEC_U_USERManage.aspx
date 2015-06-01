<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_U_USERManage.aspx.cs" Inherits="WEC_U_USERManage" %>
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
        $("#display_search").click(function () {
            $(".topfind").toggleClass("hide");   if($("#display_search").val()=="��ʾ��ѯ")$("#display_search").val("���ز�ѯ");else $("#display_search").val("��ʾ��ѯ"); 
        });
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
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
       <%--     <dl colname="WEC_U_USER.ID">
               <dt><%=WEC_U_USER.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_U_USER.OPENID">
               <dt><%=WEC_U_USER.Attribute.OPENID.ZhName %>��</dt><!--΢��ID-->
               <dd><span>
               
                    <input id="txtOPENID" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_U_USER.USERNAME">
               <dt><%=WEC_U_USER.Attribute.USERNAME.ZhName %>��</dt><!--�û�����-->
               <dd><span>
               
                    <input id="txtUSERNAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_U_USER.SEX">
               <dt><%=WEC_U_USER.Attribute.SEX.ZhName %>��</dt><!--�Ա�-->
               <dd><span>
               
                    <input id="txtSEX" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_U_USER.COMMENT">
               <dt><%=WEC_U_USER.Attribute.COMMENT.ZhName %>��</dt><!--��ע-->
               <dd><span>
               
                    <input id="txtCOMMENT" type="text" runat="server"  ck="{len:200,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_U_USER.ADDTIME">
               <dt><%=WEC_U_USER.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>--%>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <%--<ul>
            <li><span><input power="newWEC_U_USER" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_U_USEREdit.aspx');" /></span></li>
            <li><span><input power="editWEC_U_USER" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_U_USEREdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_U_USER" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_U_USERBack.aspx');" /></span></li>
            <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
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
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.ID.LongName%>',show:1}"><%=WEC_U_USER.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.OPENID.LongName%>',show:1}"><%=WEC_U_USER.Attribute.OPENID._ZhName %></td><!--΢��ID-->
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.USERNAME.LongName%>',show:1}"><%=WEC_U_USER.Attribute.USERNAME._ZhName %></td><!--�û�����-->
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.SEX.LongName%>',show:1}"><%=WEC_U_USER.Attribute.SEX._ZhName %></td><!--�Ա�-->
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.COMMENT.LongName%>',show:1}"><%=WEC_U_USER.Attribute.COMMENT._ZhName %></td><!--��ע-->
                    
                    
                    <td data="{colname:'<%=WEC_U_USER.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_U_USER.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_U_USER)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_U_USER)Container.DataItem).PATH, ((WEC_U_USER)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((WEC_U_USER)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_U_USER)Container.DataItem).OPENID %></td>
                    
                    
                    <td><%#((WEC_U_USER)Container.DataItem).USERNAME %></td>
                    
                    
                    <td><%#((WEC_U_USER)Container.DataItem).SEX %></td>
                    
                    
                    <td><%#((WEC_U_USER)Container.DataItem).COMMENT %></td>
                    
                    
                    <td><%#(((WEC_U_USER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_U_USER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
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