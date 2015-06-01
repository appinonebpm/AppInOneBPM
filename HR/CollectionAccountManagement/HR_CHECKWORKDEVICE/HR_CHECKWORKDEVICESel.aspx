<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHECKWORKDEVICESel2" CodeFile="HR_CHECKWORKDEVICESel.aspx.cs" %>
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
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="DeviceID">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.DeviceID.ZhName %>��</dt><!--�豸ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ORG_ID">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID.ZhName %>��</dt><!--��֧������ʶ-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="USE_FLAG">
               <dt><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG.ZhName %>��</dt><!--�Ƿ�����-->
               <dd><span>
               
                    <select id="txtUSE_FLAG" runat="server" >
                    </select>
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
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.DeviceID._ZhName %></td><!--�豸ID-->
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.ORG_ID._ZhName %></td><!--��֧������ʶ-->
                    
                    
                    <td><%=HR_CHECKWORKDEVICE.Attribute.USE_FLAG._ZhName %></td><!--�Ƿ�����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHECKWORKDEVICE)Container.DataItem).ORG_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_CHECKWORKDEVICE.Attribute.USE_FLAG, ((HR_CHECKWORKDEVICE)Container.DataItem).USE_FLAG)%></td>
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

