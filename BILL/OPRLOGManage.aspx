<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_OPRLOGManage" CodeFile="OPRLOGManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
         
            <dl colname="SYS_BILL_OPRLOG.TABLE_NAME">
               <dt><%=SYS_BILL_OPRLOG.Attribute.TABLE_NAME.ZhName %>��</dt><!--�����ľ����-->
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
        <dl colname="SYS_BILL_OPRLOG.DB_SRC_NAME">
               <dt><%=SYS_BILL_OPRLOG.Attribute.DB_SRC_NAME.ZhName %>��</dt><!--�豸����Դ��-->
               <dd><span>
                
                    <input id="txtDB_SRC_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_OPRLOG.OPR_TYPE">
               <dt><%=SYS_BILL_OPRLOG.Attribute.OPR_TYPE.ZhName %>��</dt><!--��������1������2�޸ģ�3ɾ��-->
               <dd><span>
                
                    <input id="txtOPR_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL_OPRLOG.STATUS">
               <dt><%=SYS_BILL_OPRLOG.Attribute.STATUS.ZhName %>��</dt><!--״̬0δ����1�Ѵ���2����ʧ��-->
               <dd><span>
                
                    <input id="txtSTATUS" type="text" runat="server" />
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
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('SYS_BILL_OPRLOGBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="LOG_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.LOG_ID.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.LOG_ID._ZhName %></td><!--LOG_ID-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.LOG_NAME.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.LOG_NAME._ZhName %></td><!--������־˵��-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.TABLE_NAME.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.TABLE_NAME._ZhName %></td><!--�����ľ����-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.KEY_NAME.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.KEY_NAME._ZhName %></td><!--�����������-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.KEY_VAL.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.KEY_VAL._ZhName %></td><!--���������ֵ-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.DB_SRC_NAME.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.DB_SRC_NAME._ZhName %></td><!--�豸����Դ��-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.DB_TABLE.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.DB_TABLE._ZhName %></td><!--�豸����-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.OPR_TYPE.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.OPR_TYPE._ZhName %></td><!--��������1������2�޸ģ�3ɾ��-->
                    <td data="{colname:'<%=SYS_BILL_OPRLOG.Attribute.STATUS.LongName%>',show:1}"><%=SYS_BILL_OPRLOG.Attribute.STATUS._ZhName %></td><!--״̬0δ����1�Ѵ���2����ʧ��-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL_OPRLOG)Container.DataItem).LOG_ID%>" /></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).LOG_ID %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).LOG_NAME %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).TABLE_NAME %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).KEY_NAME %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).KEY_VAL %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).DB_SRC_NAME %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).DB_TABLE %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).OPR_TYPE %></td>
                    <td><%#((SYS_BILL_OPRLOG)Container.DataItem).STATUS %></td>
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