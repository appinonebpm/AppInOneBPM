<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_PROCESS_TPLManage" CodeFile="PROCESSManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        if (manager.getSelectedID() == undefined || manager.getSelectedID() == "") {
            $("#btn_StepMag").attr("disabled", true);
        }
    });

    function goStepMag(me) {
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/StepManage.aspx?WFID=<%=wfid %>";//  + manager.getSelectedID();
        }
    }

    function goStepSet(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "PROCESS_SET.aspx?WFID=<%=wfid %>&PROCID=" + manager.getSelectedID();
        }
    }
    function goStepFlowMag(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/Step_SET.aspx?WFID=<%=wfid %>";//  + manager.getSelectedID();
        }
    }

    function goProcessSetting(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/STEPATH_SET.aspx?PROCID=" + manager.getSelectedID();
        }
    }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt><dd><a href="../WFINFO/WFINFOManage.aspx"><b>�������̹���</b></a></dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="�½�" onclick="manager.newRecord('PROCESSEdit.aspx','WFID=<%=wfid %>');" /></span></li>
            <li><span><input id="btn_editPROCE" power="editPROCE" type="button" value="�޸�" onclick="manager.editRecord('PROCESSEdit.aspx','WFID=<%=wfid %>');" /></span></li>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delByKeyID('PROCESSBack.aspx?WFID=<%=wfid %>');" /></span></li>
        </ul>
        <ol>
<%--        <li><span><input id="Button1" onclick="goStepMag(this);" type="button" value="�ڵ����" /></span></li>
         <li><span><input id="btn_StepMag" onclick="goStepSet(this);" type="button" value="��������" /></span></li>
         <li><span><input power="StepSetting" id="btn_StepFlowMag" onclick="goStepFlowMag(this);" type="button" value="�ڵ��������" /></span></li>--%>
           <li><span><input power="ProcMag" id="btn_ProcessSetting" onclick="goProcessSetting(this);" type="button" value="�ڵ�����" /></span></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="PROCID">
                    <td class="first"></td>
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.PROCID.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.PROCID._ZhName %></td><!--���̹���ID-->
                    
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.PROC_NAME.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.PROC_NAME._ZhName %></td><!--������-->
                    
                    
                    <%--<td data="{colname:'<%=WF_PROCESS_TPL.Attribute.WFID.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.WFID._ZhName %></td><!--�������̷���-->
                    --%>
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.ADDTIME.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    
                    
                   <%-- <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.EDITIME.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.EDITIME._ZhName %></td><!--�޸�ʱ��-->
                    --%>
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.GUID.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.GUID._ZhName %></td><!--Ψһ�汾ID-->
                    
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.STATUS.LongName%>',show:1}"><%=WF_PROCESS_TPL.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.CONDITION.LongName%>',show:0}"><%=WF_PROCESS_TPL.Attribute.CONDITION._ZhName %></td><!--�������-->
                    
                    
                    <td data="{colname:'<%=WF_PROCESS_TPL.Attribute.FORMULAR.LongName%>',show:0}"><%=WF_PROCESS_TPL.Attribute.FORMULAR._ZhName %></td><!--������ʽ-->

                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"></td>
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROCID %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).PROC_NAME %></td>
                    
                    
                    <%--<td><%#((WF_PROCESS_TPL)Container.DataItem).WFID %></td>
                    --%>
                    
                    <td><%#(((WF_PROCESS_TPL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WF_PROCESS_TPL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                   <%-- <td><%#(((WF_PROCESS_TPL)Container.DataItem).EDITIME == DateTime.MinValue) ? "" : ((WF_PROCESS_TPL)Container.DataItem).EDITIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    --%>
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).GUID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WF_PROCESS_TPL.Attribute.STATUS, ((WF_PROCESS_TPL)Container.DataItem).STATUS)%></td>
                    
                    
                     <td><%#((WF_PROCESS_TPL)Container.DataItem).CONDITION %></td>
                    
                    
                    <td><%#((WF_PROCESS_TPL)Container.DataItem).FORMULAR %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
</div>
</asp:Content>