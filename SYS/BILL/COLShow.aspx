<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLShow" CodeFile="COLShow.aspx.cs" %>
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
       <div>
        
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.COL_ID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtCOL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ID.ZhName %>��</dt><%--������ID--%>
               <dd>
                
                    <asp:Label id="txtBILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.TABLE_NAME.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtTABLE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.COL_NAME.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtCOL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.COL_NOTE.ZhName %>��</dt><%--��Ĭ����--%>
               <dd>
                
                    <asp:Label id="txtCOL_NOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>��</dt><%--��������--%>
               <dd>
                
                    <asp:Label id="txtDATA_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>��</dt><%--���ݳ���--%>
               <dd>
                
                    <asp:Label id="txtDATA_LEN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>��</dt><%--���ݾ���--%>
               <dd>
                
                    <asp:Label id="txtDATA_ACC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>��</dt><%--�Ƿ������ֵ����ֶ�--%>
               <dd>
                
                    <asp:Label id="txtIS_AUTO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SORT_NO.ZhName %>��</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FK_SHOW.ZhName%>��</dt><%--������ʾ��Ϣ������--%>
               <dd>
                
                    <asp:Label id="txtCOL_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DISPLAY_NAME.ZhName %>��</dt><%--���Զ�����ʾ��--%>
               <dd>
                
                    <asp:Label id="txtDISPLAY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>��</dt><%--��ʾ����--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.DVAL.ZhName %>��</dt><%--Ĭ��ֵ--%>
               <dd>
                
                    <asp:Label id="txtDVAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ROW_FORMULAR.ZhName %>��</dt><%--��֮������ϵ��ʽ�������ܽ�ĳ�ӱ��еĺ�--%>
               <dd>
               
                    <asp:Label id="txtBILL_ROW_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_COL_FORMULAR.ZhName %>��</dt><%--��֮����㹫ʽ�����������*����--%>
               <dd>
               
                    <asp:Label id="txtBILL_COL_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_ISHEADER.ZhName %>��</dt><%--�Ƿ���ʾ�ڱ�ͷ--%>
               <dd>
                
                    <asp:Label id="txtBILL_ISHEADER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.BILL_HERDERWIDTH.ZhName %>��</dt><%--���ݱ�ͷ���--%>
               <dd>
                
                    <asp:Label id="txtBILL_HERDERWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CHECKTYPE.ZhName %>��</dt><%--��֤��������--%>
               <dd>
                
                    <asp:Label id="txtFORM_CHECKTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRL_ID.ZhName %>��</dt><%--�б��ؼ�����--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_SHOW.ZhName %>��</dt><%--��Ҫ�б���������--%>
               <dd>
                
                    <asp:Label id="txtFORM_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_NEED.ZhName %>��</dt><%--�Ƿ����--%>
               <dd>
                
                    <asp:Label id="txtFORM_NEED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_MIN.ZhName %>��</dt><%--��Сֵ--%>
               <dd>
                
                    <asp:Label id="txtFORM_MIN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_MAX.ZhName %>��</dt><%--���ֵ--%>
               <dd>
                
                    <asp:Label id="txtFORM_MAX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_ONEROW.ZhName %>��</dt><%--��ʾ������--%>
               <dd>
                
                    <asp:Label id="txtFORM_ONEROW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.FORM_CTRLWIDTH.ZhName %>��</dt><%--�ؼ����--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRLWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_INBILL.ZhName %>��</dt><%--���б�������--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_INBILL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_TYPE.ZhName %>��</dt><%--��ѯ��������--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=SYS_BILL_COL.Attribute.SEARCH_FORMULAR.ZhName %>��</dt><%--��ѯ��ʽ--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>