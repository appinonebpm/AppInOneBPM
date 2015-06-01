<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="HR_STATION_TYPESel.aspx.cs" Inherits="HR_STATION_TYPESel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="TYPE_ID">
               <dt><%=HR_STATION_TYPE.Attribute.TYPE_ID.ZhName %>��</dt><!--��λ����ID-->
               <dd><span>
               
                    <input id="txtTYPE_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE_NAME">
               <dt><%=HR_STATION_TYPE.Attribute.TYPE_NAME.ZhName %>��</dt><!--��λ��������-->
               <dd><span>
               
                    <input id="txtTYPE_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=HR_STATION_TYPE.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
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
                    
                    
                    <td><%=HR_STATION_TYPE.Attribute.TYPE_ID._ZhName %></td><!--��λ����ID-->
                    
                    
                    <td><%=HR_STATION_TYPE.Attribute.TYPE_NAME._ZhName %></td><!--��λ��������-->
                    
                    
                    <td><%=HR_STATION_TYPE.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_STATION_TYPE)Container.DataItem).TYPE_ID %></td>
                    
                    
                    <td><%#((HR_STATION_TYPE)Container.DataItem).TYPE_NAME %></td>
                    
                    
                    <td><%#(((HR_STATION_TYPE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((HR_STATION_TYPE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

