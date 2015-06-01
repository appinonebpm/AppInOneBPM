<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchedulingEdit" CodeFile="HR_SchedulingEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
  <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
  <link href="../Uploadify/jquery_loadmask.css" rel="stylesheet" type="text/css" />
     <script src="../Uploadify/jquery_loadmask.js" type="text/javascript"></script>
 <script type="text/javascript">
     var manager = new ListManager();
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
$(function () {
    manager.initBodyRows();
    manager.initFindDL();
    //manager.initPageSizeEvt("txtPageNum");
    bindWinResize(40);
});
function deleteCheckedItem() {
    var cks = $("#tbList tbody tr input");

    var count = 0;
    for (var i = 0; i < cks.length; i++) {
        if (cks[i].checked) {
            cks[i].parentNode.parentNode.parentNode.removeChild(cks[i].parentNode.parentNode);
            count++;
        }
    }
    if (count == 0)
        alert('��ѡ��һ�����ϼ�¼��');
}

function addItem() {
    var ids = $("#tbList tbody tr .cssSchClassid");
    var haveids = "";
    for (var i = 0; i < ids.length; i++) {
        haveids += ids[i].innerText + ",";
    }
    var rec = manager.newRecord('../HR_SchClass/HR_SchClassManage.aspx?haveschids=' + haveids);
}

function dateDuibi(a, b) {
    var arr = a.split("-");
    var starttime = new Date(arr[0], arr[1], arr[2]);
    var starttimes = starttime.getTime();

    var arrs = b.split("-");
    var lktime = new Date(arrs[0], arrs[1], arrs[2]);
    var lktimes = lktime.getTime();

    if (starttimes >= lktimes) {

        alert('��ʼʱ����ڽ���ʱ�䡣');
        return false;
    }
    else
        return true;
}

function checkFindTime(sid, eid) {
    var isOk = false;
    try {
        return dateDuibi($("#cphBody_" + sid).val(), $("#cphBody_" + eid).val());
    }
    catch (e) {
        isOk = false;
    }
    if (!isOk) {
        alert("����ȷ������ֹʱ�䣡");
    }
    return isOk;
}

function checkInput() {
    var isTimeRight = checkFindTime("txtStartTime", "txtEndTime");
    if (!isTimeRight)
        return isTimeRight;
    var paibanid = "";
    var selpaibanid = 0;
    var paiban = $(".tblist table tbody .first input");
    for (var i = 0; i < paiban.length; i++) {
        if (paiban[i].checked) {
            paibanid += paiban[i].value + ",";
            selpaibanid++;
        }
    }
    if (selpaibanid < 1) {
        alert("������Ҫ��ѡһ����Σ�");
        return false;
    }
    $("#cphBody_hidSelBanciId").val(paibanid);
    $('.main').mask('���ڱ����޸ģ����ܻ���Ҫ�ϳ�ʱ�䣬���Ժ�......');
    return true;
}

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
    <input id="hidSelBanciId" name="hidSelBanciId" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="form" id="divForm">
       <div>
        <dl style="display:none;">
               <dt><%=HR_CK_USERINFO.Attribute.STAFF_ID.ZhName %>��</dt><%--STAFF_ID--%>
               <dd>
                  <SelStaff:wucSelStaff ID="wucSelStaff1" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt>��ʼʱ��:</dt>
               <dd style=" width:180px;"><span><input id="txtStartTime" runat="server" type="text" readonly="readonly" onclick="setday(this);" /></span></dd>
               <dt style=" width:80px;">����ʱ��:</dt>
               <dd style=" width:180px;"><span><input id="txtEndTime" runat="server" type="text" readonly="readonly" onclick="setday(this);" /></span></dd>
           </dl>
           <dl>
               <dt><%=HR_Scheduling.Attribute.SchType.ZhName%>��</dt><%--����--%>
               <dd><span>
               
                    <select id="txtType" runat="server" ck="{need:0,len:2147483647,type:1}">
                    </select></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
       <div class="tool">
        <ul style="width:100%;">
            <li><span><input power="newHR_SchClass" id="btn_New" type="button" value="����" onclick="manager.newRecord('../HR_SchClass/HR_SchClassEdit.aspx');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="$('.main').mask('����ɾ�������Ժ�......');manager.delBySelIDS('../HR_SchClass/HR_SchClassBack.aspx');$('.main').unmask();" /></span></li>
            <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="�����Ű��" OnClientClick="return checkInput();" onclick="btnOK_Click"/></span></li>
            <li style="float:right;"><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
            <li style="float:right;"><span class="btn"><asp:Button ID="btnRefresh" runat="server" Text="ˢ���б�" onclick="btnRefresh_Click"/></span></li>
        </ul>
    </div>
    <div class="tblist" style="min-width:600px; height:450px; max-height:450px;">
         <table cellpadding="0" cellspacing="0" id="tbList" style="min-width:600px;>
            <thead>
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
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_SchClass)Container.DataItem).SchClassid%>" /></td>
                    
                    <td class="cssSchClassid"><%#((HR_SchClass)Container.DataItem).SchClassid%></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName%></td>
                    
                    
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
    </div>
</div>
</asp:Content>