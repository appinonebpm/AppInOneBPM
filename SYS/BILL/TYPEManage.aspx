<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_TYPEManage" CodeFile="TYPEManage.aspx.cs" %>
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
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="SYS_BILL_TYPE.TYPE_NAME">
               <dt><%=SYS_BILL_TYPE.Attribute.TYPE_NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtTYPE_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_TYPE.TYPE_DES">
               <dt><%=SYS_BILL_TYPE.Attribute.TYPE_DES.ZhName %>��</dt><!--����������-->
               <dd><span>
                
                    <input id="txtTYPE_DES" type="text" runat="server" />
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
            <li><span><input power="newSYS_BILL_TYPE" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('TYPEEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_BILL_TYPE" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('TYPEEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('TYPEBack.aspx');" /></span></li>
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
                <tr keyname="TYPE_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="SYS_BILL_TYPEManage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=SYS_BILL_TYPE.Attribute.TYPE_ID.LongName%>',show:1}"><%=SYS_BILL_TYPE.Attribute.TYPE_ID._ZhName %></td><!--������ID-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_TYPE.Attribute.TYPE_NAME.LongName%>',show:1}"><%=SYS_BILL_TYPE.Attribute.TYPE_NAME._ZhName %></td><!--��������-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_TYPE.Attribute.TYPE_DES.LongName%>',show:1}"><%=SYS_BILL_TYPE.Attribute.TYPE_DES._ZhName %></td><!--����������-->
                    
                    
                    <td data="{colname:'<%=SYS_BILL_TYPE.Attribute.BILL_ID.LongName%>',show:1}"><%=SYS_BILL_TYPE.Attribute.BILL_ID._ZhName %></td><!--������ʹ�õı�-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{TYPE_ID}</td>
            
            <td>{TYPE_NAME}</td>
            
            <td>{TYPE_DES}</td>
            
            <td>{BILL_ID}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL_TYPE)Container.DataItem).TYPE_ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((SYS_BILL_TYPE)Container.DataItem).PATH, ((SYS_BILL_TYPE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((SYS_BILL_TYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_TYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#((SYS_BILL_TYPE)Container.DataItem).TYPE_DES %></td>
                    
                    
                    <td><%#((SYS_BILL_TYPE)Container.DataItem).BILL_ID %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>