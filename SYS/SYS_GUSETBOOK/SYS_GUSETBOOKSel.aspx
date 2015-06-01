<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_GUSETBOOKSel.aspx.cs" Inherits="SYS_GUSETBOOKSel" %>
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
         
            <dl colname="ID">
               <dt><%=SYS_GUSETBOOK.Attribute.ID.ZhName %>��</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=SYS_GUSETBOOK.Attribute.TYPE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="MEMO">
               <dt><%=SYS_GUSETBOOK.Attribute.MEMO.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <textarea id="txtMEMO" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="EMAIL">
               <dt><%=SYS_GUSETBOOK.Attribute.EMAIL.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MOBIL">
               <dt><%=SYS_GUSETBOOK.Attribute.MOBIL.ZhName %>��</dt><!--�ֻ�����-->
               <dd><span>
               
                    <input id="txtMOBIL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=SYS_GUSETBOOK.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ANSWER">
               <dt><%=SYS_GUSETBOOK.Attribute.ANSWER.ZhName %>��</dt><!--�ظ�-->
               <dd><span>
               
                    <textarea id="txtANSWER" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="USERNAME">
               <dt><%=SYS_GUSETBOOK.Attribute.USERNAME.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtUSERNAME" type="text" runat="server" />
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
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ID._ZhName %></td><!--ID-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.TYPE._ZhName %></td><!--����-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.MEMO._ZhName %></td><!--����-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.EMAIL._ZhName %></td><!--����-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.MOBIL._ZhName %></td><!--�ֻ�����-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.ANSWER._ZhName %></td><!--�ظ�-->
                    
                    
                    <td><%=SYS_GUSETBOOK.Attribute.USERNAME._ZhName %></td><!--����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_GUSETBOOK.Attribute.TYPE, ((SYS_GUSETBOOK)Container.DataItem).TYPE)%></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).MOBIL %></td>
                    
                    
                    <td><%#(((SYS_GUSETBOOK)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_GUSETBOOK)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).ANSWER %></td>
                    
                    
                    <td><%#((SYS_GUSETBOOK)Container.DataItem).USERNAME %></td>
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

