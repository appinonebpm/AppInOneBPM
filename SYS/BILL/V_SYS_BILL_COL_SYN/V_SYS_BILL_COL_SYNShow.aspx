<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="V_SYS_BILL_COL_SYNShow.aspx.cs" Inherits="V_SYS_BILL_COL_SYNShow" %>
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
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_SYNID.ZhName %>��</dt><%--COL_SYNID--%>
               <dd>
                
                    <asp:Label id="txtCOL_SYNID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ID.ZhName %>��</dt><%--BILL_ID--%>
               <dd>
                
                    <asp:Label id="txtBILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_ID.ZhName %>��</dt><%--COL_ID--%>
               <dd>
                
                    <asp:Label id="txtCOL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DB_SRC.ZhName %>��</dt><%--DB_SRC--%>
               <dd>
                
                    <asp:Label id="txtDB_SRC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TABLE_NAME.ZhName %>��</dt><%--TABLE_NAME--%>
               <dd>
                
                    <asp:Label id="txtTABLE_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NAME.ZhName %>��</dt><%--COL_NAME--%>
               <dd>
                
                    <asp:Label id="txtCOL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.COL_NOTE.ZhName %>��</dt><%--COL_NOTE--%>
               <dd>
                
                    <asp:Label id="txtCOL_NOTE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_TYPE.ZhName %>��</dt><%--DATA_TYPE--%>
               <dd>
                
                    <asp:Label id="txtDATA_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_LEN.ZhName %>��</dt><%--DATA_LEN--%>
               <dd>
                
                    <asp:Label id="txtDATA_LEN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DATA_ACC.ZhName %>��</dt><%--DATA_ACC--%>
               <dd>
                
                    <asp:Label id="txtDATA_ACC" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_AUTO.ZhName %>��</dt><%--IS_AUTO--%>
               <dd>
                
                    <asp:Label id="txtIS_AUTO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISPK.ZhName %>��</dt><%--ISPK--%>
               <dd>
                
                    <asp:Label id="txtISPK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DVAL.ZhName %>��</dt><%--DVAL--%>
               <dd>
                
                    <asp:Label id="txtDVAL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.PK_VALCODE.ZhName %>��</dt><%--PK_VALCODE--%>
               <dd>
                
                    <asp:Label id="txtPK_VALCODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ISFK.ZhName %>��</dt><%--ISFK--%>
               <dd>
                
                    <asp:Label id="txtISFK" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SORT_NO.ZhName %>��</dt><%--SORT_NO--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_NAME.ZhName %>��</dt><%--FK_NAME--%>
               <dd>
                
                    <asp:Label id="txtFK_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FK_SHOW.ZhName %>��</dt><%--FK_SHOW--%>
               <dd>
                
                    <asp:Label id="txtFK_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.DISPLAY_NAME.ZhName %>��</dt><%--DISPLAY_NAME--%>
               <dd>
                
                    <asp:Label id="txtDISPLAY_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.TITLE.ZhName %>��</dt><%--TITLE--%>
               <dd>
                
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ROW_FORMULAR.ZhName %>��</dt><%--BILL_ROW_FORMULAR--%>
               <dd>
               
                    <asp:Label id="txtBILL_ROW_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_COL_FORMULAR.ZhName %>��</dt><%--BILL_COL_FORMULAR--%>
               <dd>
               
                    <asp:Label id="txtBILL_COL_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_ISHEADER.ZhName %>��</dt><%--BILL_ISHEADER--%>
               <dd>
                
                    <asp:Label id="txtBILL_ISHEADER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_HERDERWIDTH.ZhName %>��</dt><%--BILL_HERDERWIDTH--%>
               <dd>
                
                    <asp:Label id="txtBILL_HERDERWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CHECKTYPE.ZhName %>��</dt><%--FORM_CHECKTYPE--%>
               <dd>
                
                    <asp:Label id="txtFORM_CHECKTYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_AFTREDTL.ZhName %>��</dt><%--BILL_AFTREDTL--%>
               <dd>
                
                    <asp:Label id="txtBILL_AFTREDTL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRL_ID.ZhName %>��</dt><%--FORM_CTRL_ID--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_SHOW.ZhName %>��</dt><%--FORM_SHOW--%>
               <dd>
                
                    <asp:Label id="txtFORM_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_NEED.ZhName %>��</dt><%--FORM_NEED--%>
               <dd>
                
                    <asp:Label id="txtFORM_NEED" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MIN.ZhName %>��</dt><%--FORM_MIN--%>
               <dd>
                
                    <asp:Label id="txtFORM_MIN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_MAX.ZhName %>��</dt><%--FORM_MAX--%>
               <dd>
                
                    <asp:Label id="txtFORM_MAX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_ONEROW.ZhName %>��</dt><%--FORM_ONEROW--%>
               <dd>
                
                    <asp:Label id="txtFORM_ONEROW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_INBILL.ZhName %>��</dt><%--SEARCH_INBILL--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_INBILL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.FORM_CTRLWIDTH.ZhName %>��</dt><%--FORM_CTRLWIDTH--%>
               <dd>
                
                    <asp:Label id="txtFORM_CTRLWIDTH" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_TYPE.ZhName %>��</dt><%--SEARCH_TYPE--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEARCH_FORMULAR.ZhName %>��</dt><%--SEARCH_FORMULAR--%>
               <dd>
                
                    <asp:Label id="txtSEARCH_FORMULAR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.STATUS.ZhName %>��</dt><%--STATUS--%>
               <dd>
                
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.SEL_TB_COL.ZhName %>��</dt><%--SEL_TB_COL--%>
               <dd>
                
                    <asp:Label id="txtSEL_TB_COL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_COL_EXISTS.ZhName %>��</dt><%--IS_COL_EXISTS--%>
               <dd>
                
                    <asp:Label id="txtIS_COL_EXISTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_NAME.ZhName %>��</dt><%--BILL_NAME--%>
               <dd>
                
                    <asp:Label id="txtBILL_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_TYPE.ZhName %>��</dt><%--BILL_TYPE--%>
               <dd>
                
                    <asp:Label id="txtBILL_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_SQL.ZhName %>��</dt><%--BILL_SQL--%>
               <dd>
               
                    <asp:Label ID="txtBILL_SQL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDTIME.ZhName %>��</dt><%--ADDTIME--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.EDITIME.ZhName %>��</dt><%--EDITIME--%>
               <dd>
               
                    <asp:Label id="txtEDITIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.ADDER.ZhName %>��</dt><%--ADDER--%>
               <dd>
                
                    <asp:Label id="txtADDER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.Expr1.ZhName %>��</dt><%--Expr1--%>
               <dd>
                
                    <asp:Label id="txtExpr1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.P_BILL_ID.ZhName %>��</dt><%--P_BILL_ID--%>
               <dd>
                
                    <asp:Label id="txtP_BILL_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.BILL_STATUS.ZhName %>��</dt><%--BILL_STATUS--%>
               <dd>
                
                    <asp:Label id="txtBILL_STATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.CONN_SOURCE.ZhName %>��</dt><%--CONN_SOURCE--%>
               <dd>
               
                    <asp:Label id="txtCONN_SOURCE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.IS_TABLE_EXISTS.ZhName %>��</dt><%--IS_TABLE_EXISTS--%>
               <dd>
                
                    <asp:Label id="txtIS_TABLE_EXISTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SYS_BILL_COL_SYN.Attribute.KEYS.ZhName %>��</dt><%--KEYS--%>
               <dd>
                
                    <asp:Label id="txtKEYS" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>