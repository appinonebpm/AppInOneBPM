<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFEditAdv" CodeFile="STAFFEditAdv.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

<script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    function addReal(me) {
        var result = window.showModalDialog("../../SYS/Role/RoleSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ID);
            var url = window.frames["ifrReal"].location.pathname; //  window.frames["ifrReal"].document.URL;
            window.frames["ifrReal"].location.href = url + "?mulids=" + roles;
        }

        return false;
    }

    function newReal(me) {

        var result = window.showModalDialog("../../SYS/Role/RoleEdit.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result != undefined && result != "") {
            var obj = eval(result);
            var roles = window.frames["ifrReal"]._addOneAndReturn(obj.ROLE_ID);
            var url = window.frames["ifrReal"].location.pathname; //
            window.frames["ifrReal"].location.href = url + "?mulids=" + roles;
        }

        return false;
    }

    $(function () {
        var keyid = $("input[id$='txtUser_ID']").val();
        if (keyid != "" && keyid != undefined) {
            var url = window.frames["ifrReal"].location.pathname;
            window.frames["ifrReal"].location.href = url + "?oneid=" + keyid;
        }

        var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK' });


    });



    function selDept(me) {
        var preDir = "../../../";
        if (arguments.length > 1) {
            preDir = predir;
        }
        var result = window.showModalDialog("../Dept/DeptSel.aspx?r=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
        if (result == undefined || result == "") return;
        var obj = eval(result);

        var puts = $(me).parent().find("input");
        puts[1].value = obj.name;
        puts[0].value = obj.id;
    }

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
    <input id="hidKey" type="hidden" value="<%=valObj.STAFF_ID %>" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>

  <div class="form">
           <dl class="f-tit"><dt><em onclick="openMore(this);" class='opened'></em><a>������Ϣ</a></dt><dd>
           <input id="btn_EditBase" type="button" value="�޸�" class="btn" onclick="editThisDepart(this);" />
           <input id="btn_SaveBase" class="btn hide" type="button" onclick="saveThisDepart(this,'StaffBack.aspx');" value="����" />
           <input id="Button6" class="btn hide" type="button" onclick="cancelThisDepart(this);" value="ȡ��" />
           </dd></dl>
           <div>
             
             <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_ID.ZhName %>��</dt><%--Ա����ʾ--%>
               <dd>
                
                    <asp:Label id="txtSTAFF_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>��</dt><%--Ա����--%>
               <dd>
                
                    <asp:Label id="txtSTAFF_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>��</dt><%--Ա������--%>
               <dd>
                
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.DEPT_ID.ZhName %>��</dt><%--�������ű�ʶ--%>
               <dd>
                
                    <asp:Label id="txtDEPT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.GENDER.ZhName %>��</dt><%--�Ա�--%>
               <dd>
               
                    <asp:Label id="txtGENDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.PHOTO.ZhName %>��</dt><%--��Ƭ��ַ--%>
               <dd>
               
                    <asp:Label id="txtPHOTO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.POS_NAME.ZhName %>��</dt><%--ְλ����--%>
               <dd>
                
                    <asp:Label id="txtPOS_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>��</dt><%--��λ����--%>
               <dd>
                
                    <asp:Label id="txtSTATION_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.WORK_TYPE_CODE.ZhName %>��</dt><%--�����ֹ�����--%>
               <dd>
               
                    <asp:Label id="txtWORK_TYPE_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.TECH_LEVEL_CODE.ZhName %>��</dt><%--�����ȼ�--%>
               <dd>
                
                    <asp:Label id="txtTECH_LEVEL_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.YMD.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtYMD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>��</dt><%--�ֻ�����--%>
               <dd>
                
                    <asp:Label id="txtMOBILE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.OFFICE_TEL.ZhName %>��</dt><%--�칫�绡--%>
               <dd>
                
                    <asp:Label id="txtOFFICE_TEL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.CERT_FLAG.ZhName %>��</dt><%--��֤���--%>
               <dd>
                
                    <asp:Label id="txtCERT_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.FIXED_FLAG.ZhName %>��</dt><%--�����־--%>
               <dd>
                
                    <asp:Label id="txtFIXED_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.ON_POS_FLAG.ZhName %>��</dt><%--�ڸڱ�־--%>
               <dd>
                
                    <asp:Label id="txtON_POS_FLAG" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_CODE.ZhName %>��</dt><%--��רҵ��������--%>
               <dd>
                
                    <asp:Label id="txtPROFESSION_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE.ZhName %>��</dt><%--��רҵ��������--%>
               <dd>
                
                    <asp:Label id="txtPROFESSION_BGN_DATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.JOIN_DATE.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtJOIN_DATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE.ZhName %>��</dt><%--������ò--%>
               <dd>
                
                    <asp:Label id="txtPOLITICAL_STATUS_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.TITLE_CODE.ZhName %>��</dt><%--ְ�Ʊ���--%>
               <dd>
                
                    <asp:Label id="txtTITLE_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.STATUS_CODE.ZhName %>��</dt><%--������״̬--%>
               <dd>
                
                    <asp:Label id="txtSTATUS_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.ADDR.ZhName %>��</dt><%--��ϵ��ַ--%>
               <dd>
                
                    <asp:Label id="txtADDR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.EMAIL.ZhName %>��</dt><%--�����ʼ�--%>
               <dd>
                
                    <asp:Label id="txtEMAIL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.NATION.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtNATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.NATIVE_PLACE.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtNATIVE_PLACE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.POST_NO.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtPOST_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.DEGREE_CODE.ZhName %>��</dt><%--�Ļ��̶�--%>
               <dd>
                
                    <asp:Label id="txtDEGREE_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_SCHOOL.ZhName %>��</dt><%--��ҵѧУ--%>
               <dd>
                
                    <asp:Label id="txtGRAD_SCHOOL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_DATE.ZhName %>��</dt><%--��ҵʱ��--%>
               <dd>
                
                    <asp:Label id="txtGRAD_DATE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.MAJOR.ZhName %>��</dt><%--רҵ--%>
               <dd>
                
                    <asp:Label id="txtMAJOR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.AF_ADDTIME.ZhName %>��</dt><%--¼��ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.AF_EDITTIME.ZhName %>��</dt><%--�޸�ʱ��--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.REMARK.ZhName %>��</dt><%--��ע--%>
               <dd>
               
                    <asp:Label id="txtREMARK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=HR_STAFF.Attribute.USER_ID.ZhName %>��</dt><%--�û���ʶ--%>
               <dd>
                
                    <asp:Label id="txtUSER_ID" runat="server"></asp:Label>
               </dd>
             </dl>
           </div>         
           
           <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>�ҵĹ�����Ϣ</a></dt><dd>
           <input id="btn_AddReal" type="button" value="���" class="btn" onclick="addReal(this);" />
           <input id="btn_NewReal" type="button" class="btn" onclick="newReal(this);" value="�½�" />
          </dd></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="STAFFReal.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>

    </div>
</div>
</asp:Content>
