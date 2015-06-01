<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_CTRL_TYPEManage" CodeFile="CTRL_TYPEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
   <div class="topfindl"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="TF_CTRL_TYPE.CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE.ZhName %>��</dt><!--CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_CTRL_TYPE.P_CTRL_TYPE">
               <dt><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE.ZhName %>��</dt><!--P_CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtP_CTRL_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_CTRL_TYPE.CTRL_NAME">
               <dt><%=TF_CTRL_TYPE.Attribute.CTRL_NAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtCTRL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_CTRL_TYPE.EL_HTML">
               <dt><%=TF_CTRL_TYPE.Attribute.EL_HTML.ZhName %>��</dt><!--EL_HTML-->
               <dd><span>
               
                    <input id="txtEL_HTML" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_CTRL_TYPE.SORT_NO">
               <dt><%=TF_CTRL_TYPE.Attribute.SORT_NO.ZhName %>��</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_CTRL_TYPE.JS_CODE">
               <dt><%=TF_CTRL_TYPE.Attribute.JS_CODE.ZhName %>��</dt><!--JS_CODE-->
               <dd><span>
               
                    <input id="txtJS_CODE" type="text" runat="server" />
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
            <li><span><input power="newTF_CTRL_TYPE" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('TF_CTRL_TYPEEdit.aspx');" /></span></li>
            <li><span><input power="editTF_CTRL_TYPE" id="btn_Edit" type="button" value="�½�" onclick="manager.editRecord('TF_CTRL_TYPEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newTF_CTRL_TYPE" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('TF_CTRL_TYPEBack.aspx');" /></span></li>
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
                <tr keyname="CTRL_TYPE">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>

                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.CTRL_TYPE._ZhName %></td><!--CTRL_TYPE-->
                    
                    
                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.P_CTRL_TYPE._ZhName %></td><!--P_CTRL_TYPE-->
                    
                    
                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.CTRL_NAME.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.CTRL_NAME._ZhName %></td><!--������-->
                    
                    
                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.EL_HTML.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.EL_HTML._ZhName %></td><!--EL_HTML-->
                    
                    
                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td data="{colname:'<%=TF_CTRL_TYPE.Attribute.JS_CODE.LongName%>',show:1}"><%=TF_CTRL_TYPE.Attribute.JS_CODE._ZhName %></td><!--JS_CODE-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_CTRL_TYPE)Container.DataItem).CTRL_TYPE%>" /></td>

                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).P_CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).CTRL_NAME %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).EL_HTML %></td>
                    
                    
                    <td><%#((TF_CTRL_TYPE)Container.DataItem).SORT_NO %></td>
                    
                    
                     <td><%#((TF_CTRL_TYPE)Container.DataItem).JS_CODE %></td>
                    
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