<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUEST_DETAILManage.aspx.cs" Inherits="WEC_REQUEST_DETAILManage" %>
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
         
            <dl colname="WEC_REQUEST_DETAIL.ID" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ID.ZhName %>��</dt><!--��ϸID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.TID" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TID.ZhName %>��</dt><!--�ظ�ID-->
               <dd><span>
               
                    <input id="txtTID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.TITLE">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TITLE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.SORT_ID" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtSORT_ID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.PICURL" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.PICURL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.TYPE_ID" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID.ZhName %>��</dt><!--ҵ������-->
               <dd><span>
               
                    <select id="txtTYPE_ID" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.TYPE_VALUE" class="hide">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE.ZhName %>��</dt><!--ҵ��ֵ-->
               <dd><span>
               
                    <input id="txtTYPE_VALUE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.STATUS">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST_DETAIL.ADDTIME">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
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
            <li><span><input power="newWEC_REQUEST_DETAIL" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_REQUEST_DETAILEdit.aspx?tid=<%=tid %>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_REQUEST_DETAIL" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_REQUEST_DETAILEdit.aspx','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_REQUEST_DETAIL" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_REQUEST_DETAILBack.aspx');" /></span></li>
            <li><span><input id="Button1" type="button" value="����" onclick="history.back();" /></span></li>
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
                    
<%--                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.ID.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.ID._ZhName %></td><!--��ϸID-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.TID.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.TID._ZhName %></td><!--�ظ�ID-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.TITLE.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.TITLE._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.SORT_ID.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.PICURL.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.PICURL._ZhName %></td><!--ͼƬ��ַ-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID._ZhName %></td><!--ҵ������-->
                    
                    
                   <%-- <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE._ZhName %></td><!--ҵ��ֵ-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.STATUS.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST_DETAIL.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_REQUEST_DETAIL)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_REQUEST_DETAIL)Container.DataItem).PATH, ((WEC_REQUEST_DETAIL)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
<%--                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TID %></td>--%>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).SORT_ID %></td>
                    
                    
                    <td><img style="width:50px;height:50px;" src="<%#((WEC_REQUEST_DETAIL)Container.DataItem).PICURL %>"/></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST_DETAIL.Attribute.TYPE_ID, ((WEC_REQUEST_DETAIL)Container.DataItem).TYPE_ID)%></td>
                    
                    
                 <%--   <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TYPE_VALUE %></td>--%>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST_DETAIL.Attribute.STATUS, ((WEC_REQUEST_DETAIL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_REQUEST_DETAIL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_REQUEST_DETAIL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
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