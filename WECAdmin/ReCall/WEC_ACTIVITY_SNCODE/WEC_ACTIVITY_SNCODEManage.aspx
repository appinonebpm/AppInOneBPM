<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITY_SNCODEManage.aspx.cs" Inherits="WEC_ACTIVITY_SNCODEManage" %>
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
         
            <dl colname="WEC_ACTIVITY_SNCODE.ID" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.SN_CODE" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.ZhName %>��</dt><!--SN��-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.AWARD_TYPE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.ZhName %>��</dt><!--��Ʒ���-->
               <dd><span>
               
                    <input id="txtAWARD_TYPE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.STATUS">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.PHONE">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.ZhName %>��</dt><!--��ȡ���ֻ���-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.WX_CODE" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.ZhName %>��</dt><!--��ȡ��΢����-->
               <dd><span>
               
                    <input id="txtWX_CODE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.ZJ_TIME" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.ZhName %>��</dt><!--�н�ʱ��-->
               <dd><span>
               
                    <input id="txtZJ_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.SY_TIME" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.ZhName %>��</dt><!--ʹ��ʱ��-->
               <dd><span>
               
                    <input id="txtSY_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY_SNCODE.A_ID" class ="hide">
               <dt><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.ZhName %>��</dt><!--�ID-->
               <dd><span>
               
                    <input id="txtA_ID" type="text" runat="server"  ck="{len:18,type:1}" />
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
            <li><span><input power="newWEC_ACTIVITY_SNCODE" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_ACTIVITY_SNCODEEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_ACTIVITY_SNCODE" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_ACTIVITY_SNCODEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_ACTIVITY_SNCODE" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_ACTIVITY_SNCODEBack.aspx');" /></span></li>
            <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
            <li><span><input id="Button1" type="button" value="����" onclick="history.back();" /></span></li>
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
                    
                    
                   <%-- <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.ID.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.ID._ZhName %></td><!--���-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.SN_CODE._ZhName %></td><!--SN��-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.AWARD_TYPE._ZhName %></td><!--��Ʒ���-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.STATUS.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.PHONE.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.PHONE._ZhName %></td><!--��ȡ���ֻ���-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.WX_CODE._ZhName %></td><!--��ȡ��΢����-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.ZJ_TIME._ZhName %></td><!--�н�ʱ��-->
                    
                    
                    <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.SY_TIME._ZhName %></td><!--ʹ��ʱ��-->
                    
                    
                  <%--  <td data="{colname:'<%=WEC_ACTIVITY_SNCODE.Attribute.A_ID.LongName%>',show:1}"><%=WEC_ACTIVITY_SNCODE.Attribute.A_ID._ZhName %></td><!--�ID-->--%>

          
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_ACTIVITY_SNCODE)Container.DataItem).PATH, ((WEC_ACTIVITY_SNCODE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                 <%--   <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).ID %></td>
                    --%>
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).SN_CODE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).AWARD_TYPE %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_ACTIVITY_SNCODE.Attribute.STATUS, ((WEC_ACTIVITY_SNCODE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).WX_CODE %></td>
                    
                    
                    <td><%#(((WEC_ACTIVITY_SNCODE)Container.DataItem).ZJ_TIME == DateTime.MinValue) ? "" : ((WEC_ACTIVITY_SNCODE)Container.DataItem).ZJ_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WEC_ACTIVITY_SNCODE)Container.DataItem).SY_TIME == DateTime.MinValue) ? "" : ((WEC_ACTIVITY_SNCODE)Container.DataItem).SY_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                   <%-- 
                    <td><%#((WEC_ACTIVITY_SNCODE)Container.DataItem).A_ID %></td>--%>

                 
                    
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