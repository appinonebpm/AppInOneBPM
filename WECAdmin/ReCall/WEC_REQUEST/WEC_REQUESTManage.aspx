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
        $("#helpWd").attr("href", $("#helpWd").attr("href") + "?key=" + parent.indexParas.guideObj.find("li[class=sel] span").html());
        $("#helpWd").click(function () {
            
            parent.addLinkToParentTab($("#helpWd"), true);      
            return false;
        });
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b>
        <span><a href="<%=webpath %>WECAdmin/WebSite/Help/WEC_HELPER.aspx" data="{key:'mdl_0108',name:'�����ĵ�'}" id ='helpWd'>����</a></span>
        </dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="WEC_REQUEST.TID" class = "hide">
               <dt><%=WEC_REQUEST.Attribute.TID.ZhName %>��</dt><!--�ظ�ID-->
               <dd><span>
               
                    <input id="txtTID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.AID" class = "hide">
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>��</dt><!--���ں�ID-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.KEYWORD">
               <dt><%=WEC_REQUEST.Attribute.KEYWORD.ZhName %>��</dt><!--�ؼ���-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.MATCH_TYPE" class = "hide">
               <dt><%=WEC_REQUEST.Attribute.MATCH_TYPE.ZhName %>��</dt><!--ƥ������-->
               <dd><span>
               
                    <select id="txtMATCH_TYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.MEMO" class = "hide">
               <dt><%=WEC_REQUEST.Attribute.MEMO.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtMEMO" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.KIND" class = "hide">
               <dt><%=WEC_REQUEST.Attribute.KIND.ZhName %>��</dt><!--�ظ�����-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.STATUS">
               <dt><%=WEC_REQUEST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_REQUEST.ADDTIME">
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
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
            <li><span><input power="newWEC_REQUEST" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_REQUESTEdit.aspx?kind=<%=kind %>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_REQUEST" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_REQUESTEdit.aspx?kind=<%=kind %>','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_REQUEST" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_REQUESTBack.aspx');" /></span></li>
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
                <tr keyname="TID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    <%--<%foreach (AttributeItem attr in valObj.af_AttributeItemList)
                      { %>
                        <td data="{colname:'<%=attr.LongName%>',show:1}"><%=attr._ZhName%></td>--%>
                    
                   <%-- <td data="{colname:'<%=WEC_REQUEST.Attribute.TID.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.TID._ZhName%></td><!--�ظ�ID-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.AID.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.AID._ZhName%></td><!--���ں�ID-->
                    --%>
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.KEYWORD.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.KEYWORD._ZhName%></td><!--�ؼ���-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.MATCH_TYPE.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.MATCH_TYPE._ZhName%></td><!--ƥ������-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.MEMO.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.MEMO._ZhName%></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.KIND.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.KIND._ZhName%></td><!--�ظ�����-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.STATUS.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.STATUS._ZhName%></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_REQUEST.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_REQUEST.Attribute.ADDTIME._ZhName%></td><!--���ʱ��-->
                    
               <%--    <%} %>--%>
                    <%if (kind.Equals("3") || kind.Equals("1"))
                      { %>
                    <td >����</td><!--���ʱ��-->
                     <%} %>
            </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_REQUEST)Container.DataItem).TID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_REQUEST)Container.DataItem).PATH, ((WEC_REQUEST)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                   <%-- 
                    <td><%#((WEC_REQUEST)Container.DataItem).TID %></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).AID %></td>--%>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).KEYWORD %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.MATCH_TYPE, ((WEC_REQUEST)Container.DataItem).MATCH_TYPE)%></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.KIND, ((WEC_REQUEST)Container.DataItem).KIND)%></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_REQUEST.Attribute.STATUS, ((WEC_REQUEST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_REQUEST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_REQUEST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    <%if (kind.Equals("3") || kind.Equals("1"))
                      { %>
                    <td > <a href="../WEC_REQUEST_DETAIL/WEC_REQUEST_DETAILManage.aspx?tid=<%#((WEC_REQUEST)Container.DataItem).TID%>&kind=<%=kind %>">����</a></td><!--���ʱ��-->
                     <%} %>
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