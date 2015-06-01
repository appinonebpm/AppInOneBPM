<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUESel2" CodeFile="HR_CHKWKDIVKEYVALUESel.aspx.cs" %>
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
         
            <dl colname="GroupId">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>��</dt><!--��ID-->
               <dd><span>
                
                    <input id="txtGroupId" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DeviceID">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>��</dt><!--�豸ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOTableName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>��</dt><!--AIO����-->
               <dd><span>
                
                    <input id="txtAIOTableName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>��</dt><!--AIO�ؼ��ֶ���-->
               <dd><span>
                
                    <input id="txtAIOKeyFieldName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OtherKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>��</dt><!--����ϵͳ�ؼ��ֶ���-->
               <dd><span>
                
                    <input id="txtOtherKeyFieldName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AIOKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>��</dt><!--AIO�ؼ��ֶ�ֵ-->
               <dd><span>
                
                    <input id="txtAIOKeyValue" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OtherKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>��</dt><!--����ϵͳ�ؼ��ֶ�ֵ-->
               <dd><span>
                
                    <input id="txtOtherKeyValue" type="text" runat="server" />
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
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId._ZhName %></td><!--��ID-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID._ZhName %></td><!--�豸ID-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName._ZhName %></td><!--AIO����-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName._ZhName %></td><!--AIO�ؼ��ֶ���-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName._ZhName %></td><!--����ϵͳ�ؼ��ֶ���-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue._ZhName %></td><!--AIO�ؼ��ֶ�ֵ-->
                    
                    
                    <td><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue._ZhName %></td><!--����ϵͳ�ؼ��ֶ�ֵ-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).GroupId %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOTableName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyValue %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyValue %></td>
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

