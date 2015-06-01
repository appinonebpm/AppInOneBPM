<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_PROCESS_TPLSel" CodeFile="PROCESSSel.aspx.cs" %>
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
         
            <dl colname="PROCID">
               <dt><%=WF_PROCESS_TPL.Attribute.PROCID.ZhName %>��</dt><!--���̹���ID-->
               <dd><span>
                
                    <input id="txtPROCID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PROC_NAME">
               <dt><%=WF_PROCESS_TPL.Attribute.PROC_NAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtPROC_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WFCID">
               <dt><%=WF_PROCESS_TPL.Attribute.WFID.ZhName %>��</dt><!--�������̷���-->
               <dd><span>
                
                    <input id="txtWFCID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WF_PROCESS_TPL.Attribute.ADDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EDITIME">
               <dt><%=WF_PROCESS_TPL.Attribute.EDITIME.ZhName %>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="GUID">
               <dt><%=WF_PROCESS_TPL.Attribute.GUID.ZhName %>��</dt><!--Ψһ�汾ID-->
               <dd><span>
                
                    <input id="txtGUID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="STATUS">
               <dt><%=WF_PROCESS_TPL.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="CONDITION">
               <dt><%=WF_PROCESS_TPL.Attribute.CONDITION.ZhName %>��</dt><!--�������-->
               <dd><span>
               
                    <textarea id="txtSHOW_CONDITION" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="FORMULAR">
               <dt><%=WF_PROCESS_TPL.Attribute.FORMULAR.ZhName %>��</dt><!--������ʽ-->
               <dd><span>
               
                    <textarea id="txtSHOW_FORMULA" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="NOTE">
               <dt><%=WF_PROCESS_TPL.Attribute.NOTE.ZhName %>��</dt><!--��ע-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
        </dl>
         <dl><dt></dt><dd class="btn">
         <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.PROCID._ZhName %></td><!--���̹���ID-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.PROC_NAME._ZhName %></td><!--������-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.WFID._ZhName %></td><!--�������̷���-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.EDITIME._ZhName %></td><!--�޸�ʱ��-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.GUID._ZhName %></td><!--Ψһ�汾ID-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.CONDITION._ZhName %></td><!--�������-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.FORMULAR._ZhName %></td><!--������ʽ-->
                    
                    
                    <td><%=WF_PROCESS_TPL.Attribute.NOTE._ZhName %></td><!--��ע-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROCID %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROC_NAME %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).WFID %></td>
                    
                    
                    <td><%#(((WF_PROCESS_TPL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WF_PROCESS_TPL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WF_PROCESS_TPL)Container.DataItem).EDITIME == DateTime.MinValue) ? "" : ((WF_PROCESS_TPL)Container.DataItem).EDITIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).GUID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WF_PROCESS_TPL.Attribute.STATUS, ((WF_PROCESS_TPL)Container.DataItem).STATUS)%></td>
                    
                    
                     <td><%#((WF_PROCESS_TPL)Container.DataItem).CONDITION %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).FORMULAR %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).NOTE %></td>
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

