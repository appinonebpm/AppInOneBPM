<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFShow" CodeFile="STAFFShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <h3> <asp:Literal ID="litTitle" runat="server">ĳĳĳ</asp:Literal>����ϸ��Ϣ</h3>
       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opened"></em><a>������Ϣ</a></dt><dd><b id="bERR" runat="server"></b></dd></dl>
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

       <dl class="f-tit"><dt><em onclick="openMore(this);" class="opended"></em><a>�ҵĹ�����Ϣ</a></dt></dl>
           <div>
            <iframe name="ifrReal" id="ifrReal" src="HR_STAFFReal.aspx" frameborder="0" scrolling="auto" style="width:100%;height:100%;"></iframe>
           </div>
    </div>

</div>
</asp:Content>