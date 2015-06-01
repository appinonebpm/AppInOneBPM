<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILLManage" CodeFile="BILLManage.aspx.cs" %>
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
    <dl><dt><b><%=title %></b>
    </dt>
    <dd><span><a href='../SYS_DATASOURCE/SYS_DataSourceManage.aspx' target="_blank">����Դ����</a></span></dd>
    </dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
          
            <dl colname="SYS_BILL.BILL_NAME">
               <dt><%=SYS_BILL.Attribute.BILL_NAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtBILL_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL.BILL_TYPE">
               <dt><%=SYS_BILL.Attribute.BILL_TYPE.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtBILL_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL.ADDTIME">
               <dt><%=SYS_BILL.Attribute.ADDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="SYS_BILL.ADDER">
               <dt><%=SYS_BILL.Attribute.ADDER.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl style="display:none" colname="SYS_BILL.TABLE_NAME">
               <dt><%=SYS_BILL.Attribute.TABLE_NAME.ZhName %>��</dt><!--�������-->
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" />
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
            <li><span><input power="newSYS_BILL" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('BILLEdit.aspx');" /></span></li>
            <li><span><input power="editSYS_BILL" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('BILLEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('BILLBack.aspx');" /></span></li>
            
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
                <tr keyname="BILL_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_ID.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_ID._ZhName %></td><!--��ID-->
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_NAME.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_NAME._ZhName %></td><!--������-->
                    <td data="{colname:'<%=SYS_BILL.Attribute.BILL_TYPE.LongName%>',show:1}"><%=SYS_BILL.Attribute.BILL_TYPE._ZhName %></td><!--������-->
                    <td data="{colname:'<%=SYS_BILL.Attribute.ADDTIME.LongName%>',show:1}"><%=SYS_BILL.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    <td data="{colname:'<%=SYS_BILL.Attribute.ADDER.LongName%>',show:1}"><%=SYS_BILL.Attribute.ADDER._ZhName %></td><!--������-->
                    <td data="{colname:'<%=SYS_BILL.Attribute.TABLE_NAME.LongName%>',show:1}"><%=SYS_BILL.Attribute.TABLE_NAME._ZhName %></td><!--�������-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            <td>{BILL_ID}</td>
            <td>{BILL_NAME}</td>
            <td>{BILL_TYPE}</td>
            <td>{ADDTIME}</td>
            <td>{ADDER}</td>
            <td>{TABLE_NAME}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((SYS_BILL)Container.DataItem).BILL_ID%>" /></td>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_ID %></td>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_NAME %></td>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_TYPE %></td>
                    <td><%#(((SYS_BILL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_BILL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    <td><%#((SYS_BILL)Container.DataItem).ADDER %></td>
                    <td><%#((SYS_BILL)Container.DataItem).TABLE_NAME %></td>
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