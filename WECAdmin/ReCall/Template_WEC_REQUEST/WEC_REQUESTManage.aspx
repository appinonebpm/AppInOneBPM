<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTManage.aspx.cs" Inherits="WEC_REQUESTManage" %>
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


        var checker = new formChecker({ btnIDS: 'btnFind,btnSetPage' });

//        var Search = false;
//        $("#btnSearch").click(function () {
//            if (Search) {
//                return false;
//            }
//            Search = true;
//            var url = 'WEC_REQUESTBack.aspx';
//            jQuery.ajax({
//                type: 'POST', url: url,
//                data: { 'findString': '<%= findString() %>', 'module': "find" },
//                dataType: 'json',
//                success: function (txt) {
//                    if (txt.state) {
//                        if (txt.html != "") {
//                            jQuery('#cart').replaceWith(txt.html);
//                        }
//                    } else {
//                        //alert(txt.msg);
//                    }
//                },
//                error: function (data, status, e) {
//                },
//                complete: function () {
//                    Search = false;
//                }
//            });
//        });


    });

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidVal" type="hidden" runat="server" />
<input id="hidFind" type="hidden" runat="server" />
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %>  <%=getValObj().af_GetAvailableDataBaseField().Length %> <%=getValObj().af_GetAvailableAttributeItem().Length %>/<%=getValObj().af_AttributeItemList.Count %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
                <%=getFinder() %>
         
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
             <%--  <span><input id="btnSearch" type="button" value="aaaa" /></span>--%>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newWEC_REQUEST" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('<%=getValObj()._TableName%>Edit.aspx?kind=<%=kind %>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_REQUEST" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('<%=getValObj()._TableName%>Edit.aspx?kind=<%=kind %>    ','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_REQUEST" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_REQUESTBack.aspx');" /></span></li>
            <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="btnSetPage" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="TID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <%foreach (AttributeItem attr in getValObj().af_AttributeItemList)
                      { %>
                        <td data="{colname:'<%=attr.LongName%>',show:1}"><%=attr._ZhName%></td>
                    <%} %>
                    <td >����</td><!--���ʱ��-->
            </tr>
            </thead>
            <tbody>
                    <%  List<ITableImplement> list1 = getListObj();
                        if (list1.Count > 0)
                        {
                            AttributeItem[] attrs = list1[0].af_GetAvailableAttributeItem();
                            foreach (WEC_REQUEST val1 in list1)
                            {
                                %>
                            <tr><td class="first"><input type="checkbox" value="<%=val1.TID%>" /></td>
                                <%
                                foreach(AttributeItem attr1 in attrs)
                                { %>  
  
                                    <td><%=GetHtmlList(attr1, val1)%>
                                        <%//=val1.GetValue(attr1);//=val1.GetHtmlList(attr1); %></td>
                                <%}%>
                                <td> <a href="../WEC_REQUEST_DETAIL/WEC_REQUEST_DETAILManage.aspx?tid=<%=val1.TID%>&kind=<%=kind %>">����</a></td><!--���ʱ��-->
                            </tr>
                                <%
                             }
                         } %>
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