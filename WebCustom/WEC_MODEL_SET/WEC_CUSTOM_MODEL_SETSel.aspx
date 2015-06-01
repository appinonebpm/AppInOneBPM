<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CUSTOM_MODEL_SETSel.aspx.cs" Inherits="WEC_CUSTOM_MODEL_SETSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
         
            <dl colname="ID">
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id='txtWEC_CUSTOM_MODEL_SET_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="A_ID">
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.A_ID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id='txtWEC_CUSTOM_MODEL_SET_A_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="M_ID">
               <dt><%=WEC_CUSTOM_MODEL_SET.Attribute.M_ID.ZhName %>��</dt><!--ģ����-->
               <dd><span>
               
                    <input id='txtWEC_CUSTOM_MODEL_SET_M_ID' type='text' runat='server' />
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
                    
                    
                    <td><%=WEC_CUSTOM_MODEL_SET.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL_SET.Attribute.A_ID._ZhName %></td><!--���ںű��-->
                    
                    
                    <td><%=WEC_CUSTOM_MODEL_SET.Attribute.M_ID._ZhName %></td><!--ģ����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_CUSTOM_MODEL_SET)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CUSTOM_MODEL_SET)Container.DataItem).A_ID %></td>
                    
                    
                    <td><%#((WEC_CUSTOM_MODEL_SET)Container.DataItem).M_ID %></td>
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

