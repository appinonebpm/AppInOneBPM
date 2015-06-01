<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILLSel" CodeFile="BILLSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();

        var listObj = $("#" + manager.paraObj.listCID);

        try {
            if (listObj.height() < 500)
                listObj.height(500);
        } catch (e) { }
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "����ѡ�����ӽڵ�����ݣ�";
            _selOK = false;
        }
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
    </div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
            <dl colname="TABLE_NAME">
               <dt><%=SYS_BILL.Attribute.TABLE_NAME.ZhName %>��</dt><!--�������-->
               <dd><span>
                
                    <input id="txtTABLE_NAME" type="text" runat="server" />
               </span></dd>
        </dl>

         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=SYS_BILL.Attribute.BILL_ID._ZhName %></td><!--��ID-->
                     <td><%=SYS_BILL.Attribute.TABLE_NAME._ZhName %></td><!--�������-->
                    <td><%=SYS_BILL.Attribute.BILL_NAME._ZhName %></td><!--������-->
                    <td><%=SYS_BILL.Attribute.BILL_TYPE._ZhName %></td><!--������-->
                    
                    <td><%=SYS_BILL.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    <td><%=SYS_BILL.Attribute.ADDER._ZhName %></td><!--������-->
                    
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_ID %></td>
                    <td><%#((SYS_BILL)Container.DataItem).TABLE_NAME %></td>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_NAME %></td>
                    <td><%#((SYS_BILL)Container.DataItem).BILL_TYPE %></td>
                    <td><%#(((SYS_BILL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_BILL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    <td><%#((SYS_BILL)Container.DataItem).ADDER %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

