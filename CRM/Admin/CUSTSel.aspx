<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTSel" CodeFile="CUSTSel.aspx.cs" %>
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
         
            <dl colname="Cus_ID">
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>��</dt><!--�ͻ����-->
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Cus_Name">
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>��</dt><!--�ͻ�����-->
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Job">
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>��</dt><!--�ͻ�ְλ-->
               <dd><span>
               
                    <textarea id="txtJob" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="RelationTxt">
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>��</dt><!--�ͻ���ϵ����-->
               <dd><span>
                
                    <input id="txtRelationTxt" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Recorder">
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="MobPhone">
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>��</dt><!--�ֻ�-->
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Phone">
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>��</dt><!--��ϵ�绰-->
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ContactName">
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>��</dt><!--��ϵ������-->
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ShopName">
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ShopAddr">
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>��</dt><!--�����ַ-->
               <dd><span>
                
                    <input id="txtShopAddr" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="QQ">
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>��</dt><!--QQ����-->
               <dd><span>
                
                    <input id="txtQQ" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="WW">
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtWW" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Email">
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>��</dt><!--�ʼ���ַ-->
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Address">
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>��</dt><!--��ϸ��ַ-->
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Trade">
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>��</dt><!--��ҵ-->
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Type">
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>��</dt><!--���-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="State">
               <dt><%=CRM_CUST.Attribute.State.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtState" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="IsSign">
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>��</dt><!--�Ƿ�ǩԼ-->
               <dd><span>
               
                    <select id="txtIsSign" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="AddTime">
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>��</dt><!--¼��ʱ��-->
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EditTime">
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PATH">
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>��</dt><!--PATH-->
               <dd><span>
               
                    <textarea id="txtPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PNAME">
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>��</dt><!--PNAME-->
               <dd><span>
               
                    <textarea id="txtPNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
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
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_ID._ZhName %></td><!--�ͻ����-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_Name._ZhName %></td><!--�ͻ�����-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Job._ZhName %></td><!--�ͻ�ְλ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.RelationTxt._ZhName %></td><!--�ͻ���ϵ����-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Recorder._ZhName %></td><!--������-->
                    
                    
                    <td><%=CRM_CUST.Attribute.MobPhone._ZhName %></td><!--�ֻ�-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Phone._ZhName %></td><!--��ϵ�绰-->
                    
                    
                    <td><%=CRM_CUST.Attribute.ContactName._ZhName %></td><!--��ϵ������-->
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopName._ZhName %></td><!--��������-->
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopAddr._ZhName %></td><!--�����ַ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.QQ._ZhName %></td><!--QQ����-->
                    
                    
                    <td><%=CRM_CUST.Attribute.WW._ZhName %></td><!--��������-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Email._ZhName %></td><!--�ʼ���ַ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Address._ZhName %></td><!--��ϸ��ַ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Trade._ZhName %></td><!--��ҵ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.Type._ZhName %></td><!--���-->
                    
                    
                    <td><%=CRM_CUST.Attribute.State._ZhName %></td><!--״̬-->
                    
                    
                    <td><%=CRM_CUST.Attribute.IsSign._ZhName %></td><!--�Ƿ�ǩԼ-->
                    
                    
                    <td><%=CRM_CUST.Attribute.AddTime._ZhName %></td><!--¼��ʱ��-->
                    
                    
                    <td><%=CRM_CUST.Attribute.EditTime._ZhName %></td><!--�޸�ʱ��-->
                    
                    
                    <td><%=CRM_CUST.Attribute.PATH._ZhName %></td><!--PATH-->
                    
                    
                    <td><%=CRM_CUST.Attribute.PNAME._ZhName %></td><!--PNAME-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_ID %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_Name %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).Job) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).RelationTxt) %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Recorder %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).MobPhone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Phone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ContactName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopAddr %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).QQ %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).WW %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Email %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Address %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Trade %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Type %></td>
                    
                    
                    <td><%#FormHelper.GetText(CRM_CUST.Attribute.State, ((CRM_CUST)Container.DataItem).State)%></td>
                    
                    
                    <td><%#FormHelper.GetText(CRM_CUST.Attribute.IsSign, ((CRM_CUST)Container.DataItem).IsSign)%></td>
                    
                    
                    <td><%#(((CRM_CUST)Container.DataItem).AddTime == DateTime.MinValue) ? "" : ((CRM_CUST)Container.DataItem).AddTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((CRM_CUST)Container.DataItem).EditTime == DateTime.MinValue) ? "" : ((CRM_CUST)Container.DataItem).EditTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PNAME %></td>
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

