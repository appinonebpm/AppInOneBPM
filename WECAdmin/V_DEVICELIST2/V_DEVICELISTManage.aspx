<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_DEVICELISTManage.aspx.cs" Inherits="V_DEVICELISTManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
        
         
            <dl colname="V_DEVICELIST.ID">
               <dt><%=V_DEVICELIST.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_ID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.USER_ID">
               <dt><%=V_DEVICELIST.Attribute.USER_ID.ZhName %>��</dt><!--�û����-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_USER_ID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.DEVICE_ID">
               <dt><%=V_DEVICELIST.Attribute.DEVICE_ID.ZhName %>��</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_DEVICE_ID" type="text" runat="server"  ck="{len:500,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.KIND">
               <dt><%=V_DEVICELIST.Attribute.KIND.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_KIND" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.DEBUG">
               <dt><%=V_DEVICELIST.Attribute.DEBUG.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_DEBUG" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.STATUS">
               <dt><%=V_DEVICELIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_STATUS" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.AF_ADDTIEM">
               <dt><%=V_DEVICELIST.Attribute.AF_ADDTIEM.ZhName %>��</dt><!--AF_ADDT-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_AF_ADDTIEM" type="text" runat="server"  ck="{len:8,type:2}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.AF_EDITTIME">
               <dt><%=V_DEVICELIST.Attribute.AF_EDITTIME.ZhName %>��</dt><!--AF_EDIT-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_AF_EDITTIME" type="text" runat="server"  ck="{len:8,type:2}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.TOKEN_ID">
               <dt><%=V_DEVICELIST.Attribute.TOKEN_ID.ZhName %>��</dt><!--TOKEN_I-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_TOKEN_ID" type="text" runat="server"  ck="{len:500,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="V_DEVICELIST.STAFF_NAME">
               <dt><%=V_DEVICELIST.Attribute.STAFF_NAME.ZhName %>��</dt><!--Ա������-->
               <dd><span>
               
                    <input id="txtV_DEVICELIST_STAFF_NAME" type="text" runat="server"  ck="{len:500,type:0}" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
              <span><input id="btnLoss" type="button" value="��ʧ" onclick="manager.newRecord('USER_LOSS.aspx');" /></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newV_DEVICELIST" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('V_DEVICELISTEdit.aspx');" /></span></li>
            <li><span><input power="editV_DEVICELIST" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('V_DEVICELISTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newV_DEVICELIST" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('V_DEVICELISTBack.aspx');" /></span></li>
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
                   <%--<td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.ID.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.USER_ID.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.USER_ID._ZhName %></td><!--�û����-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.DEVICE_ID.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.DEVICE_ID._ZhName %></td><!--TOKEN_I-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.KIND.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.KIND._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.DEBUG.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.DEBUG._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.STATUS.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.AF_ADDTIEM.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.AF_ADDTIEM._ZhName %></td><!--AF_ADDT-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.AF_EDITTIME.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.AF_EDITTIME._ZhName %></td><!--AF_EDIT-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.TOKEN_ID.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.TOKEN_ID._ZhName %></td><!--TOKEN_I-->
                    
                    
                    <td data="{colname:'<%=V_DEVICELIST.Attribute.STAFF_NAME.LongName%>',show:1}"><%=V_DEVICELIST.Attribute.STAFF_NAME._ZhName %></td><!--Ա������-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((V_DEVICELIST)Container.DataItem).ID%>" /></td>
                    <%-- <td>
                    <%#GetHtml(((V_DEVICELIST)Container.DataItem), new V_DEVICELIST(),
                        V_DEVICELIST.Attribute.ID, V_DEVICELIST.Attribute.ID)%>                    
                    </td>--%>
                   <%-- <td><%#showLeftLinks(((V_DEVICELIST)Container.DataItem).PATH, ((V_DEVICELIST)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEVICE_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).KIND %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).DEBUG %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_ADDTIEM %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).AF_EDITTIME %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).TOKEN_ID %></td>
                    
                    
                    <td><%#((V_DEVICELIST)Container.DataItem).STAFF_NAME %></td>
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