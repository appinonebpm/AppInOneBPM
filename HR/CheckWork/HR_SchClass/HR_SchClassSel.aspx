<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassSel" CodeFile="HR_SchClassSel.aspx.cs" %>
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
   <div class="topfindl"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="SchClassid">
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>��</dt><!--��α��-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="SchName">
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>��</dt><!--���ʱ������-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="StartHour">
               <dt><%=HR_SchClass.Attribute.StartHour.ZhName %>��</dt><!--��ʼʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="StartMin">
               <dt><%=HR_SchClass.Attribute.StartMin.ZhName %>��</dt><!--��ʼʱ�����-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EndHour">
               <dt><%=HR_SchClass.Attribute.EndHour.ZhName %>��</dt><!--����ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EndMin">
               <dt><%=HR_SchClass.Attribute.EndMin.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LateMinutes">
               <dt><%=HR_SchClass.Attribute.LateMinutes.ZhName %>��</dt><!--�Ƴٵ�������-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="EarlyMinutes">
               <dt><%=HR_SchClass.Attribute.EarlyMinutes.ZhName %>��</dt><!--�����˷�����-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckIn">
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>��</dt><!--�ϰ�ǩ��-->
               <dd><span>
               
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOut">
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>��</dt><!--�°�ǩ��-->
               <dd><span>
               
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckb" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInHour1">
               <dt><%=HR_SchClass.Attribute.CheckInHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInMin1">
               <dt><%=HR_SchClass.Attribute.CheckInMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInHour2">
               <dt><%=HR_SchClass.Attribute.CheckInHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckInMin2">
               <dt><%=HR_SchClass.Attribute.CheckInMin2.ZhName %>��</dt><!--����ǩ��ʱ�����(int(4))-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutHour1">
               <dt><%=HR_SchClass.Attribute.CheckOutHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutMin1">
               <dt><%=HR_SchClass.Attribute.CheckOutMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutHour2">
               <dt><%=HR_SchClass.Attribute.CheckOutHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CheckOutMin2">
               <dt><%=HR_SchClass.Attribute.CheckOutMin2.ZhName %>��</dt><!--����ǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Color">
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>��</dt><!--��ʾ��ɫ-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="IsOverTime">
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>��</dt><!--����Ӱ�-->
               <dd><span>
               
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckb" />
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
                    
                    
                    <td><%=HR_SchClass.Attribute.SchClassid._ZhName %></td><!--��α��-->
                    
                    
                    <td><%=HR_SchClass.Attribute.SchName._ZhName %></td><!--���ʱ������-->
                    
                    
                    <td><%=HR_SchClass.Attribute.StartHour._ZhName %></td><!--��ʼʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.StartMin._ZhName %></td><!--��ʼʱ�����-->
                    
                    
                    <td><%=HR_SchClass.Attribute.EndHour._ZhName %></td><!--����ʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.EndMin._ZhName %></td><!--����ʱ��-->
                    
                    
                    <td><%=HR_SchClass.Attribute.LateMinutes._ZhName %></td><!--�Ƴٵ�������-->
                    
                    
                    <td><%=HR_SchClass.Attribute.EarlyMinutes._ZhName %></td><!--�����˷�����-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckIn._ZhName %></td><!--�ϰ�ǩ��-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOut._ZhName %></td><!--�°�ǩ��-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInHour1._ZhName %></td><!--��ʼǩ��ʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInMin1._ZhName %></td><!--��ʼǩ��ʱ�����-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInHour2._ZhName %></td><!--����ǩ��ʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInMin2._ZhName %></td><!--����ǩ��ʱ�����(int(4))-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutHour1._ZhName %></td><!--��ʼǩ��ʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutMin1._ZhName %></td><!--��ʼǩ��ʱ�����-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutHour2._ZhName %></td><!--����ǩ��ʱ��Сʱ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutMin2._ZhName %></td><!--����ǩ��ʱ�����-->
                    
                    
                    <td><%=HR_SchClass.Attribute.Color._ZhName %></td><!--��ʾ��ɫ-->
                    
                    
                    <td><%=HR_SchClass.Attribute.IsOverTime._ZhName %></td><!--����Ӱ�-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchClassid %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartHour %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartMin %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EndHour %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EndMin %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).LateMinutes %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EarlyMinutes %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckIn %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOut %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInMin1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInMin2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutMin1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutMin2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).Color %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).IsOverTime %></td>
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

