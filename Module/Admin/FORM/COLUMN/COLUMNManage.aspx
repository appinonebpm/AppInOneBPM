<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMNManage" CodeFile="COLUMNManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
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
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        

            <dl colname="TF_F_COLUMN.CTRL_TYPE">
               <dt><%=TF_F_COLUMN.Attribute.CTRL_TYPE.ZhName %>��</dt><!--CTRL_TYPE-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server" />
               </span></dd>
               
        </dl>

         
            <dl colname="TF_F_COLUMN.IS_NEED">
               <dt><%=TF_F_COLUMN.Attribute.IS_NEED.ZhName %>��</dt><!--IS_NEED-->
               <dd><span>
                
                    <input id="txtIS_NEED" type="text" runat="server" />
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
            <li><span><input power="newTF_F_COLUMN" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('COLUMNEdit.aspx','formid=<%=formid %>&kind=1');" /></span></li>
            <li><span><input power="editTF_F_COLUMN" id="btn_Edit" type="button" value="�޸�" onclick="manager.editRecord('COLUMNEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('COLUMNBack.aspx');" /></span></li>
        </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="COLUMN_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.COLUMN_ID.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SHOW_NAME.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.SHOW_NAME._ZhName %></td><!--��ʾ����-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.CTRL_TYPE._ZhName %></td><!--CTRL_TYPE-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.MAX_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MAX_VAL._ZhName %></td><!--MAX_VAL-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.MIN_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MIN_VAL._ZhName %></td><!--MIN_VAL-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.IS_NEED.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.IS_NEED._ZhName %></td><!--IS_NEED-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.CAL_FORMULA.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.CAL_FORMULA._ZhName %></td><!--�м������-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SUM_FIELD_ID.LongName%>',show:1}">�й���</td><!--�ϼƵ����ֶ�ID,��ID.�ֶ�ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID%>" /></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SHOW_NAME %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).CTRL_TYPE %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).MAX_VAL %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).MIN_VAL %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).IS_NEED %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).CAL_FORMULA %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SUM_FIELD_ID %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="titnav">
      <dl><dt><b>Ĭ����Ŀ</b></dt></dl>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr keyname="COLUMN_ID">
                    <td class="first"></td>
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.COLUMN_ID.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.COLUMN_ID._ZhName %></td><!--COLUMN_ID-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SHOW_NAME.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.SHOW_NAME._ZhName %></td><!--��ʾ����-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.CTRL_TYPE._ZhName %></td><!--CTRL_TYPE-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.MAX_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MAX_VAL._ZhName %></td><!--MAX_VAL-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.MIN_VAL.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.MIN_VAL._ZhName %></td><!--MIN_VAL-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.IS_NEED.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.IS_NEED._ZhName %></td><!--IS_NEED-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.CAL_FORMULA.LongName%>',show:1}"><%=TF_F_COLUMN.Attribute.CAL_FORMULA._ZhName %></td><!--�м������-->
                    <td data="{colname:'<%=TF_F_COLUMN.Attribute.SUM_FIELD_ID.LongName%>',show:1}">�й���</td><!--�ϼƵ����ֶ�ID,��ID.�ֶ�ID-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repDefault" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).COLUMN_ID %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SHOW_NAME %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).CTRL_TYPE %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).MAX_VAL %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).MIN_VAL %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).IS_NEED %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).CAL_FORMULA %></td>
                    <td><%#((TF_F_COLUMN)Container.DataItem).SUM_FIELD_ID %></td>
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