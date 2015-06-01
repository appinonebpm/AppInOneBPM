<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFEdit" CodeFile="STAFFEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Register src="../../UCtrl/Sels/wucSelDept.ascx" tagname="wucSelDept" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
    <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/myTabs.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/PinYin.js?r=11" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {

        var checker = new formChecker({btnIDS: 'btnOK' });

    });
    function selNames(me) {
        var txt1 = $("input[id$='txtSNAME']");
        var pinyin1 = toPinyinMy(me.value); //makePy
        if (txt1.val() == "") {
            txt1.val(pinyin1);
        }
        var txt2 = $("input[id$='txtRNAME']");
        if (txt2.val() == "") {
            txt2.val(pinyin1);
        }
        var txt3 = $("input[id$='txtUSER_NAME']");
        if (txt3.val() == "") {
            txt3.val(pinyin1);
        }
        var txt4 = $("input[id$='txtUSER_NAME1']");
        if (txt4.val() == "") {
            txt4.val(pinyin1);
        }
    }
     function selNames2(me) {
        var txt3 = $("input[id$='txtUSER_NAME']");
        if (txt3.val() == "") {
            txt3.val(me.value);
        } 
        var txt4 = $("input[id$='txtUSER_NAME1']");
        if (txt4.val() == "") {
            txt4.val(me.value);
        }
    }
</script>
<style type="text/css">
    body{ overflow:hidden;}
   .form{height:510px; overflow:auto;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool">
       <ul>
       <li><span>
              <asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="ȷ��" Width="51" 
               onclick="btnOK_Click"/>
           </span></li>
       <li><span><input onclick="window.close();" lang="close" value="�ر�" type="button" /></span></li>
       </ul>
       </div>
  <div class="tabs">
         <ul><li class="show"><a>������Ϣ</a></li><li><a>��ϸ��Ϣ</a></li><li><a>�˻���Ϣ</a></li></ul>
         <ol><li class="show"><input id="txtSTAFF_ID" type="hidden" runat="server"/>
            <div class="form">
           <dl>
               <dt><%=HR_STAFF.Attribute.STAFF_NO.ZhName %>��</dt><%--Ա����--%>
               <dd>
                
                    <span><input id="txtSTAFF_NO" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
           <dl><dt><%=HR_STAFF.Attribute.STAFF_NAME.ZhName%>��</dt><%--Ա������--%>
               <dd>
                
                    <span><input id="txtNAME" onblur="selNames(this);" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.SNAME.ZhName%>��</dt><%--���--%>
               <dd>
                
                    <span><input id="txtSNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.RNAME.ZhName%>��</dt><%--������--%>
               <dd>
                
                    <span><input id="txtRNAME" type="text" onblur="selNames2(this);"  runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd><dd>����������ƴ��ͬʱ��Ϊ�˻���</dd>
           </dl>
           <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName%>��</dt><%--��¼�û���--%>
               <dd>
                
                    <span><input id="txtUSER_NAME1" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd><dd>�޸ĵ�¼�û�������� �˻���Ϣ</dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.DEPT_ID.ZhName %>��</dt><%--�������ű�ʶ--%>
               <dd>
               <uc1:wucSelDept ID="wucSelDept1" runat="server" />
               <input type=hidden id="hidDEPT_ID" runat=server />
               </dd>
               </dl>
           <dl><dt><%=HR_STAFF.Attribute.GENDER.ZhName %>��</dt><%--�Ա�--%>
               <dd>
               <span>
                    <select id="txtGENDER" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.STATION_CODE.ZhName %>��</dt><%--��λ����--%>
               <dd><selStation:wucSelStation ID="wucSelStation1" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POS_NAME.ZhName %>��</dt><%--ְλ����--%>
               <dd>
                <span>
                    <input id="txtPOS_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           <dl>
               <dt><%=HR_STAFF.Attribute.WORK_TYPE_CODE.ZhName %>��</dt><%--�����ֹ�����--%>
               <dd>
               <span>
                    <select id="txtWORK_TYPE_CODE" runat="server" ck="{need:0,len:8,type:0}">
                    </select></span>
               </dd>
               </dl>
           <dl>
               <dt>���ܵȼ���</dt><%--���ܵȼ�--%>
               <dd>
                <span>
                    <input id="txtTECH_LEVEL_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.YMD.ZhName %>��</dt><%--��������--%>
               <dd>
                <span>
                    <input id="txtYMD" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.MOBILE.ZhName %>��</dt><%--�ֻ�����--%>
               <dd>
                <span>
                    <input id="txtMOBILE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.OFFICE_TEL.ZhName %>��</dt><%--�칫�绡--%>
               <dd>
                <span>
                    <input id="txtOFFICE_TEL" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.CERT_FLAG.ZhName %>��</dt><%--��֤���--%>
               <dd>
                <span>
                    <input id="txtCERT_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.FIXED_FLAG.ZhName %>��</dt><%--�����־--%>
               <dd>
                <span>
                    <input id="txtFIXED_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
               </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.ON_POS_FLAG.ZhName %>��</dt><%--�ڸڱ�־--%>
               <dd>
                <span>
                    <input id="txtON_POS_FLAG" type="text" runat="server" ck="{need:0,len:2,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_CODE.ZhName %>��</dt><%--��רҵ��������--%>
               <dd>
                <span>
                    <input id="txtPROFESSION_CODE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
        </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE.ZhName %>��</dt><%--��רҵ��������--%>
               <dd>
                <span>
                    <input id="txtPROFESSION_BGN_DATE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:22,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.JOIN_DATE.ZhName %>��</dt><%--��������--%>
               <dd>
                <span>
                    <input id="txtJOIN_DATE" type="text" onclick="setday(this);" runat="server" ck="{need:3,len:22,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE.ZhName %>��</dt><%--������ò--%>
               <dd>
                <span>
                    <input id="txtPOLITICAL_STATUS_CODE" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.TITLE_CODE.ZhName %>��</dt><%--ְ�Ʊ���--%>
               <dd>
                <span>
                    <input id="txtTITLE_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
            </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.STATUS_CODE.ZhName %>��</dt><%--������״̬--%>
               <dd>
                <span>
                    <input id="txtSTATUS_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.ADDR.ZhName %>��</dt><%--��ϵ��ַ--%>
               <dd>
                <span>
                    <input id="txtADDR" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
       </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.EMAIL.ZhName %>��</dt><%--�����ʼ�--%>
               <dd>
                <span>
                    <input id="txtEMAIL" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.NATION.ZhName %>��</dt><%--����--%>
               <dd>
                <span>
                    <input id="txtNATION" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.NATIVE_PLACE.ZhName %>��</dt><%--����--%>
               <dd>
                <span>
                    <input id="txtNATIVE_PLACE" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.POST_NO.ZhName %>��</dt><%--��������--%>
               <dd>
                <span>
                    <input id="txtPOST_NO" type="text" runat="server" ck="{need:0,len:18,type:0}"/></span>
               </dd>
                          </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.DEGREE_CODE.ZhName %>��</dt><%--�Ļ��̶�--%>
               <dd>
                <span>
                    <input id="txtDEGREE_CODE" type="text" runat="server" ck="{need:0,len:8,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_SCHOOL.ZhName %>��</dt><%--��ҵѧУ--%>
               <dd>
                <span>
                    <input id="txtGRAD_SCHOOL" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.GRAD_DATE.ZhName %>��</dt><%--��ҵʱ��--%>
               <dd>
                <span>
                    <input id="txtGRAD_DATE" type="text" runat="server" onclick="setday(this);" ck="{need:3,len:33,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_STAFF.Attribute.MAJOR.ZhName %>��</dt><%--רҵ--%>
               <dd>
                <span>
                    <input id="txtMAJOR" type="text" runat="server" ck="{need:0,len:88,type:0}"/></span>
               </dd>
           </dl>
           <dl>
            <dt><%=HR_STAFF.Attribute.REMARK.ZhName %>��</dt><%--��ע--%>
               <dd>
               <span>
                    <textarea id="txtREMARK" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:888,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               
               <dt><%=HR_STAFF.Attribute.PHOTO.ZhName %>��</dt><%--��Ƭ��ַ--%>
               <dd>
               <span>
                    <textarea id="txtPHOTO" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:550,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_ORG.Attribute.EXP1.ZhName%>��</dt><%--�Զ���1--%>
               <dd>
                
                    <span><input id="txtEXP1" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
                          </dl>
           <dl>
               <dt><%=HR_ORG.Attribute.EXP2.ZhName%>��</dt><%--�Զ���2--%>
               <dd>
                
                    <span><input id="txtEXP2" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=HR_ORG.Attribute.EXP3.ZhName%>��</dt><%--�Զ���3--%>
               <dd>
                    <span><input id="txtEXP3" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>



           <div class="clear"></div>
           </div>
         </li>
         <li>
           <div class="form">
           
           <!--�û�ģ��-->
           <dl>
                   <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>��</dt><%--�û���--%>
                   <dd>
                        <span><input id="txtUSER_NAME" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
                   </dd>
               </dl>
               <dl>
                   <dt>��ʼ���룺</dt><%--����--%>
                   <dd>
                        <span><input id="txtPASS" type="password" readonly="readonly" runat="server" ck="{need:0,len:20,type:0}"/></span>
                   </dd>
                   <dd>Ĭ������123456���״ε�¼�����</dd>
               </dl>
               
           <dl>
              <dt><%=HR_STAFF.Attribute.USER_ID.ZhName %>��</dt><%--�û���ʶ--%>
               <dd>
                <span>
                    <input id="txtUSER_ID" type="text" runat="server" readonly="readonly" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>


           <div class="clear"></div>
           </div>
         </li>         </ol>
   </div>
   <div class="tool"></div>
</div>
</asp:Content>