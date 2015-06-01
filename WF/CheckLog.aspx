<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CheckLog" CodeFile="CheckLog.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "����ѡ�����ӽڵ�����ݣ�";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>

        <div class="tblist" id="tblist" >
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td>������</td><!--COLUMN_ID-->
                    <td>��������</td><!--��ʾ����-->
                    
                    
                    <td>��ʼʱ��</td><!--CTRL_TYPE-->
                    
                    
                    <td>����ʱ��</td><!--MAX_VAL-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                    
                    <td><%#((WF_CHECK_LOG_TPL)Container.DataItem).CHECKER%></td>
                    <td><%#FormHelper.GetText(WF_CHECK_LOG_TPL.Attribute.RESULT, ((WF_CHECK_LOG_TPL)Container.DataItem).RESULT)%></td>
                    
                    
                    <td><%#((WF_CHECK_LOG_TPL)Container.DataItem).RECEIVE_TIME %></td>
                    
                    
                    <td><%#((WF_CHECK_LOG_TPL)Container.DataItem).CHECK_TIME%></td>

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

