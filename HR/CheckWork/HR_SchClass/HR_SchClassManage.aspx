<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassManage" CodeFile="HR_SchClassManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    var selectedID = "";
    var page;

    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);

        var trs = $("#tbodyList").find("tr");
        var headtds = $("#theadRow").find("td");
        for (var i = 0; i < trs.length; i++) {
            var trObj = $(trs[i]);
            trObj.bind("click", trObj, function (e) {
                selectedID = e.data.find("input[type='hidden']").val(); //ѡ�����е�input 
                if (selectedID == undefined || selectedID == "") {
                    var tds = e.data.children();
                    selectedID = $(tds[0]).text(); //ѡ��td��һ��                        
                }
                //showAllInfo(e.data, $("#theadRow"), "bodyDetail", 3, 1);
                selThis(e.data);
            });
            /*˫��ѡ�з���*/
            $(trs[i]).bind("dblclick", $(trs[i]), function (e) { //��Ϊѡ����ʱ��Ч��˫��ֱ��ѡ���У����رմ���
                selok(); //selThis(e.data); selok();
            });
        }
    });

    var selinfo = "";
    function selok() {
        if (selinfo == "") {
            alert('��ѡ��һ����¼��');
            return;
        }
        window.returnValue = selinfo; //����һ��JSON��ʽ���ַ����� alert(window.returnValue);
        window.close();
    }
    function selThis(el) {
        var trs = el.parent().find("tr");
        var tds = el.children();

        var tmlID = $(tds[10]).text();

        selinfo = "({ID:'" + $(tds[1]).text() + "',NO:'" + $(tds[3]).text() + "',Name:'"
            + $(tds[4]).text() + "',TmlID:'" + tmlID
            + "'})";
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfindl" style="display:none;"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="HR_SchClass.SchClassid">
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>��</dt><!--��α��-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.SchName">
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>��</dt><!--���ʱ������-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.StartHour">
               <dt><%=HR_SchClass.Attribute.StartHour.ZhName %>��</dt><!--��ʼʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.StartMin">
               <dt><%=HR_SchClass.Attribute.StartMin.ZhName %>��</dt><!--��ʼʱ�����-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EndHour">
               <dt><%=HR_SchClass.Attribute.EndHour.ZhName %>��</dt><!--����ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EndMin">
               <dt><%=HR_SchClass.Attribute.EndMin.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.LateMinutes">
               <dt><%=HR_SchClass.Attribute.LateMinutes.ZhName %>��</dt><!--�Ƴٵ�������-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.EarlyMinutes">
               <dt><%=HR_SchClass.Attribute.EarlyMinutes.ZhName %>��</dt><!--�����˷�����-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckIn">
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>��</dt><!--�ϰ�ǩ��-->
               <dd><span>
               
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOut">
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>��</dt><!--�°�ǩ��-->
               <dd><span>
               
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInHour1">
               <dt><%=HR_SchClass.Attribute.CheckInHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInMin1">
               <dt><%=HR_SchClass.Attribute.CheckInMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInHour2">
               <dt><%=HR_SchClass.Attribute.CheckInHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckInMin2">
               <dt><%=HR_SchClass.Attribute.CheckInMin2.ZhName %>��</dt><!--����ǩ��ʱ�����(int(4))-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutHour1">
               <dt><%=HR_SchClass.Attribute.CheckOutHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutMin1">
               <dt><%=HR_SchClass.Attribute.CheckOutMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutHour2">
               <dt><%=HR_SchClass.Attribute.CheckOutHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.CheckOutMin2">
               <dt><%=HR_SchClass.Attribute.CheckOutMin2.ZhName %>��</dt><!--����ǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.Color">
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>��</dt><!--��ʾ��ɫ-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_SchClass.IsOverTime">
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>��</dt><!--����Ӱ�-->
               <dd><span>
               
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckb" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul style=" width:300px;">
            <li><span><input power="newHR_SchClass" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('HR_SchClassEdit.aspx');" /></span></li>
            <li><span><input power="editHR_SchClass" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('HR_SchClassEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_SchClass" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('HR_SchClassBack.aspx');" /></span></li>
            <!--<li><span><input id="btn_Add" type="button" value="���" onclick="selok();" /></span></li>-->
        </ul>
        <ol style=" display:none;">
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead id="theadRow">
                <tr keyname="SchClassid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>                    
                    
                    <td><%=HR_SchClass.Attribute.SchClassid._ZhName %></td><!--��α��-->
                    
                    
                    <td>�������</td><!--���ʱ������-->
                    
                    
                    <td>ֵ��ʱ��</td><!--ֵ��ʱ��-->
                    
                    <td>�Ƴ�/�����</td><!--�Ƴٵ�/���˷�����-->
                    
                    <td>ǩ��</td><!--�ϰ�ǩ��-->
                    
                    <td>ǩ��</td><!--�°�ǩ��-->
                    
                    <td>ǩ��ʱ��</td><!--ǩ��ʱ��-->
                    
                    <td>ǩ��ʱ��</td><!--ǩ��ʱ��-->
                    
                    <td>��ɫ</td><!--��ʾ��ɫ-->
                    
                    <td>�Ӱ�</td><!--����Ӱ�-->

                    <td>��ֵ</td><!--����Ӱ�-->

                    <td>��λ</td><!--����Ӱ�-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_SchClass)Container.DataItem).SchClassid%>" /></td>
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchClassid %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartHour.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).StartMin.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).EndHour.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).EndMin.ToString().PadLeft(2, '0')%></td>
  
                    
                    <td><%#((HR_SchClass)Container.DataItem).LateMinutes + "/" + ((HR_SchClass)Container.DataItem).EarlyMinutes%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckIn ? "��" : "��"%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOut ? "��" : "��"%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour1.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckInMin1.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).CheckInHour2.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckInMin2.ToString().PadLeft(2, '0')%></td>
                    

                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour1.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin1.ToString().PadLeft(2, '0') + "--" + ((HR_SchClass)Container.DataItem).CheckOutHour2.ToString().PadLeft(2, '0') + ":" + ((HR_SchClass)Container.DataItem).CheckOutMin2.ToString().PadLeft(2, '0')%></td>

                    
                    <td style=" background-color:<%#((HR_SchClass)Container.DataItem).Color %>"></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).IsOverTime ? "��" : "��"%></td>

                    <td><%#((HR_SchClass)Container.DataItem).SchNumber%></td>

                    <td><%#formHelper.GetOptionText(HR_SchClass.Attribute.SchUnit, ((HR_SchClass)Container.DataItem).SchUnit)%></td>
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>