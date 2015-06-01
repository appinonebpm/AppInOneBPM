<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLITEMSel" CodeFile="COLITEMSel.aspx.cs" %>
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
         
            <dl colname="ITEM_ID">
               <dt><%=SYS_BILL_COLITEM.Attribute.ITEM_ID.ZhName %>��</dt><!--������ѡ��-->
               <dd><span>
                
                    <input id="txtITEM_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COL_ID">
               <dt><%=SYS_BILL_COLITEM.Attribute.COL_ID.ZhName %>��</dt><!--������ID-->
               <dd><span>
                
                    <input id="txtCOL_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="VAL">
               <dt><%=SYS_BILL_COLITEM.Attribute.VAL.ZhName %>��</dt><!--ѡ��ֵ-->
               <dd><span>
                
                    <input id="txtVAL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TXT">
               <dt><%=SYS_BILL_COLITEM.Attribute.TXT.ZhName %>��</dt><!--ѡ����-->
               <dd><span>
                
                    <input id="txtTXT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SHOW_COL_REAL">
               <dt><%=SYS_BILL_COLITEM.Attribute.SHOW_COL_REAL.ZhName %>��</dt><!--����������ֵ�Ƿ���ʾ��ѡ��-->
               <dd><span>
                
                    <input id="txtSHOW_COL_REAL" type="text" runat="server" />
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
                    
                    
                    <td><%=SYS_BILL_COLITEM.Attribute.ITEM_ID._ZhName %></td><!--������ѡ��-->
                    
                    
                    <td><%=SYS_BILL_COLITEM.Attribute.COL_ID._ZhName %></td><!--������ID-->
                    
                    
                    <td><%=SYS_BILL_COLITEM.Attribute.VAL._ZhName %></td><!--ѡ��ֵ-->
                    
                    
                    <td><%=SYS_BILL_COLITEM.Attribute.TXT._ZhName %></td><!--ѡ����-->
                    
                    
                    <td><%=SYS_BILL_COLITEM.Attribute.SHOW_COL_REAL._ZhName %></td><!--����������ֵ�Ƿ���ʾ��ѡ��-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).ITEM_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).COL_ID %></td>
                    
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).VAL %></td>
                    
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).TXT %></td>
                    
                    
                    <td><%#((SYS_BILL_COLITEM)Container.DataItem).SHOW_COL_REAL %></td>
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

