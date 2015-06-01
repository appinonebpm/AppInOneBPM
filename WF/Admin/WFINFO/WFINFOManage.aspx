<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WFINFOManage" CodeFile="WFINFOManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.AppInOne.WF"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var hadDetail = false;
    var orignSta = "0";
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);

        if (manager.getSelectedID() == undefined || manager.getSelectedID() == "") {
            $("#btn_ProcessMag").attr("disabled", true);
            $("#btn_StepMag").attr("disabled", true);
            
            //$("#btn_MainForm").attr("disabled", true);
            //$("#btn_DetailForm").attr("disabled", true);
        }
    });

    function goProcessMag(me) {
        //alert(manager.getSelectedID());
        window.location.href = "../Process/PROCESSManage.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
    }

   function goFormMag(me, type) {
       window.location.href = "../FORMTB/FORMTBManage.aspx" + '?preUrl=<%=curUrl %>';
    }
    
    function _trClick_Exd(trObj) {
        var haddetail = $(trObj.children()[5]).text(); //alert(haddetail);
        if (haddetail == "��") {
            $("#btn_DetailForm").attr("disabled", true);
            hadDetail = false;
        } else {
            hadDetail = true;
            $("#btn_DetailForm").attr("disabled", false);
        }

        orignSta = $(trObj.children()[6]).find("input[type='hidden']").val(); //alert(haddetail);

    }
    function goStepMag(me) {
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/StepManage.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
        }
    }
    function goFlowMag(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../PROCESS/PROCESS_SET.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
        }
    }
    function goStepFlowMag(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/Step_SET.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
        }
    }
    function goProcessSetting1(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            //window.location.href = "../Step/STEPATH_SET.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
            window.location.href = "../Step/STEPATH_SETNEW.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
        }
    }
    function goProcessSetting(me) {
        //alert(manager.getSelectedID());
        if (manager.getSelectedID() == "") {
            alert("û��ѡ����̣�");
            return;
        }
        else {
            window.location.href = "../Step/STEPATH_SET.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
            //window.location.href = "../Step/STEPATH_SETNEW.aspx?WFID=" + manager.getSelectedID() + '&preUrl=<%=curUrl %>';
        }
    }

    function createWFObject(me,wfid,wfcname) {
        var win = window.showModalDialog("../WFOBJ/WFOBJECTEdit.aspx?WFID=" + wfid + "&WFCName=" + escape(wfcname) + "&r=" + Math.random(), "", "dialogHeight: 500px; dialogWidth: 600px; dialogTop:; dialogLeft:; edge: Raised; center: Yes; help: No; resizable: No; status: No;"); if (!win) { win = window.returnValue; } //jin-shenjian chromeˢ�¸�����
        if (win != "" && win != undefined) {
            var obj = eval(win);
            var tdobj = $(me).parent().parent().find("td:last");
            tdobj.append("<span><span>" + obj.WF_OBJ_NAME + "</span><a>" + obj.STATUS + "</a></span>");

            window.location.reload();
        }
    }
</script>
<style type="text/css">

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt><dd>
    <a href="../../../Module/Admin/TBManage.aspx?preUrl=<%=curUrl %>" >������</a><%--onclick="return addToTab(this);" data="{key:'wfm_25'}"--%>
    <a href="../WFTYPE/TYPEManage.aspx?preUrl=<%=curUrl %>" >���̷������</a>
    <a href="../WFOBJ/WFOBJECTManage.aspx?preUrl=<%=curUrl %>" >����ʵ������</a>
    </dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
            <dl colname="WF_INFO.WFCNAME">
               <dt><%=WF_INFO.Attribute.WFCNAME.ZhName %>��</dt><!--���̷�����-->
               <dd><span>
                
                    <input id="txtWFCNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
         <dl colname="WF_INFO.STATUS">
               <dt><%=WF_INFO.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WF_INFO.USE_LIMIT">
               <dt><%=WF_INFO.Attribute.USE_LIMIT.ZhName %>��</dt><!--�Ƿ������ύ-->
               <dd><span>
               
                    <select id="txtUSE_LIMIT" runat="server" >
                    </select>
               </span></dd>
               
        </dl>

         <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newWFINFO" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WFINFOEdit.aspx');" /></span></li>
            <li><span><input power="editWFINFO" id="btn_editWFINFO" type="button" value="�޸�" onclick="manager.editRecord('WFINFOEdit.aspx');" /></span></li>
            <li><span><input power="delWFINFO" id="btn_Dels" type="button" value="ɾ��" onclick="manager.delByKeyID('WFINFOBack.aspx');" /></span></li>
            
        </ul>
        <ol>
<%--            <li><span><input power="StepSetting" id="btn_StepMag" onclick="goStepMag(this);" type="button" value="�ڵ����" /></span></li>
            <li><span><input power="StepSetting" id="btn_FlowMag" onclick="goFlowMag(this);" type="button" value="��������" /></span></li>
            <li><span><input power="StepSetting" id="btn_StepFlowMag" onclick="goStepFlowMag(this);" type="button" value="�ڵ��������" /></span></li>
--%>
            <li><span><input power="ProcMag" id="aaa" onclick="goProcessSetting1(this);" type="button" value="����ͼ����v2014" /></span></li>
            <li><span><input power="ProcMag" id="btn_ProcessSetting" onclick="goProcessSetting(this);" type="button" value="����ͼ����v2013" /></span></li>
            <li><span><input power="ProcMag" id="btn_ProcessMag" onclick="goProcessMag(this);" type="button" value="���̰汾�����б�" /></span></li>
<%--            <li><span><input id="btn_MainForm" type="button" value="����Ŀ����" onclick="goFormMag(this,1);" /></span></li>
            <li><span><input id="btn_DetailForm" type="button" value="��ϸ��Ŀ����" onclick="goFormMag(this,2);" /></span></li>--%>
        </ol>

    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="WFCID">
                    <td class="first"></td>
                    <td data="{colname:'<%=WF_INFO.Attribute.WFID.LongName%>',show:1}">ID</td><!--����ID-->
                    <td data="{colname:'<%=WF_INFO.Attribute.WFCNAME.LongName%>',show:1}"><%=WF_INFO.Attribute.WFCNAME._ZhName %></td><!--���̷�����-->
                    <td data="{colname:'<%=WF_INFO.Attribute.STATUS.LongName%>',show:1}"><%=WF_INFO.Attribute.STATUS._ZhName %></td><!--״̬-->
                    <td data="{colname:'<%=WF_INFO.Attribute.USE_LIMIT.LongName%>',show:1}"><%=WF_INFO.Attribute.USE_LIMIT._ZhName %></td><!--�Ƿ������ύ-->
                   <%-- <td data="{colname:'',show:1}">�з���ϸ</td><!--��ע-->--%>
                    <td data="{colname:'<%=WF_INFO.Attribute.ADDTIME.LongName%>',show:1}"><%=WF_INFO.Attribute.ADDTIME._ZhName %></td><!--����ʱ��-->
                    <td>����ʵ��</td>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><a href="#" onclick="createWFObject(this,<%#((WF_INFO)Container.DataItem).WFID %>,'<%#((WF_INFO)Container.DataItem).WFCNAME %>');">��������ʵ��</a></td>
                    <td><%#((WF_INFO)Container.DataItem).WFID %></td>
                    <td><%#((WF_INFO)Container.DataItem).WFCNAME %></td>
                    <td><%#((WF_INFO)Container.DataItem).STATUS == "1" ? "����" : (((WF_INFO)Container.DataItem).STATUS == "2" ? "����" : "δ����")%></td>
                    <td><%#FormHelper.GetText(WF_INFO.Attribute.USE_LIMIT, ((WF_INFO)Container.DataItem).USE_LIMIT)%></td>
                   <%-- <td><%#((WF_INFO)Container.DataItem).HadDetailInfo()==true?"��":"��" %></td>--%>
                    <td><%#(((WF_INFO)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WF_INFO)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    <td>
                      <asp:Repeater ID="repObject" runat="server">
                        <ItemTemplate>
                         <span><span style="color:#006;"><%#((WF_WFOBJECT)Container.DataItem).WF_OBJ_NAME%></span><a><%#((WF_WFOBJECT)Container.DataItem).STATUS == 0 ? "<font color='red'>δ����</font>" : (((WF_WFOBJECT)Container.DataItem).STATUS == 2 ? "<font color='red'>����</font>" : "<font color='green'>����</font>")%></a></span>
                         |
                        </ItemTemplate>
                      </asp:Repeater> 
                    </td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>