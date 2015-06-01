<%@ Page Title="�ֿ�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_STORAGESel" CodeFile="STORAGESel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script type="text/javascript">
        var manager = new ListManager({ listCID: "tbList" });
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
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <script type="text/javascript">
       function selOK_B(id) {
           $("input[id$='hidSelID']").val(id);
           __doPostBack("ctl00$cphBody$LinkButton1", "");
       }
   </script>
   <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
    <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.STOR_ID.ZhName %>��</dt><!--�ֿ�Ψһ��ʶ-->
               <dd><span>
                
                    <input id="txtSTOR_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.NAME.ZhName %>��</dt><!--�ֿ���-->
               <dd><span>
                
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.SNAME.ZhName %>��</dt><!--�ֿ���-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.RNAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.ORG_ID.ZhName %>��</dt><!--����ID-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.USE_FLAG.ZhName%>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=IM_STORAGE.Attribute.REMARK.ZhName %>��</dt><!--REMARK-->
               <dd><span>
                    <input id="txtREMARK"  runat="server" />
               </span></dd>
        </dl>
        <dl><dt></dt>
        <dd><span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
      <span><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="ȷ��ѡ��" /></span></dd>
        </dl>
    </div> 

        <div class="tblist">
          <table cellpadding="0" cellspacing="0 id="tbList">
            <thead>
                <tr> <td><a href="STAFFSel.aspx" id="a_top" runat="server"><b>/����</b></a></td>
                    <td><%=IM_STORAGE.Attribute.STOR_ID._ZhName %></td><!--�ֿ�Ψһ��ʶ-->
                    <td><%=IM_STORAGE.Attribute.NAME._ZhName %></td><!--�ֿ���-->
                    <td><%=IM_STORAGE.Attribute.SNAME._ZhName %></td><!--�ֿ���-->
                    <td><%=IM_STORAGE.Attribute.RNAME._ZhName %></td><!--������-->
                    <td><%=IM_STORAGE.Attribute.ORG_ID._ZhName %></td><!--����ID-->
                    <td><%=IM_STORAGE.Attribute.USE_FLAG._ZhName%></td><!--״̬-->
                    <td><%=IM_STORAGE.Attribute.REMARK._ZhName %></td><!--REMARK-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                      <td><%#showLeftLinks(((IM_STORAGE)Container.DataItem).PATH, ((IM_STORAGE)Container.DataItem).PNAME)%></td>
                        <td><%#((IM_STORAGE)Container.DataItem).STOR_ID %></td>
                        <td><%#((IM_STORAGE)Container.DataItem).NAME %></td>
                        <td><%#((IM_STORAGE)Container.DataItem).SNAME %></td>
                        <td><%#((IM_STORAGE)Container.DataItem).RNAME %></td>
                        <td><%#((IM_STORAGE)Container.DataItem).ORG_ID %></td>
                        <td><%#FormHelper.GetText(IM_STORAGE.Attribute.USE_FLAG, ((IM_STORAGE)Container.DataItem).USE_FLAG)%></td>
                        <td><%#((IM_STORAGE)Container.DataItem).REMARK %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="path-url">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

