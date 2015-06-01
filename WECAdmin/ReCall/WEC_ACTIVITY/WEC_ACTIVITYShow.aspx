<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYShow.aspx.cs" Inherits="WEC_ACTIVITYShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
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
               <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName %>��</dt><%--���(ID)--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName %>��</dt><%--�ؼ���(NAM--%>
               <dd>
               
                    <asp:Label id="txtKEYWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INSTRUCTION.ZhName %>��</dt><%--�ɹ�����ȯ˵��--%>
               <dd>
               
                    <asp:Label id="txtINSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName %>��</dt><%--�ʱ��--%>
               <dd>
               
                    <asp:Label id="txtTIME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName %>��</dt><%--2-���ʼͼ--%>
               <dd>
               
                    <asp:Label id="txtSTART_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.WIN_PICURL.ZhName %>��</dt><%--�н�����ʾ��ͷ--%>
               <dd>
               
                    <asp:Label id="txtWIN_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.OUT_PICURL.ZhName %>��</dt><%--�н�ͼƬ������--%>
               <dd>
               
                    <asp:Label id="txtOUT_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName %>��</dt><%--3-�������--%>
               <dd>
               
                    <asp:Label id="txtEND_THEME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName %>��</dt><%--3-�����ͼ--%>
               <dd>
               
                    <asp:Label id="txtEND_PICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName %>��</dt><%--��Ʒ���1--%>
               <dd>
               
                    <asp:Label id="txtTYPE_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_ONE.ZhName %>��</dt><%--ͼƬ��ַ1--%>
               <dd>
               
                    <asp:Label id="txtPIC_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_ONE.ZhName %>��</dt><%--�Ż�ȯ����1--%>
               <dd>
               
                    <asp:Label id="txtNAME_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_ONE.ZhName %>��</dt><%--�Ż�ȯ����1--%>
               <dd>
               
                    <asp:Label id="txtNUM_ONE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_TWO.ZhName %>��</dt><%--��Ʒ���2--%>
               <dd>
               
                    <asp:Label id="txtTYPE_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_TWO.ZhName %>��</dt><%--ͼƬ��ַ2--%>
               <dd>
               
                    <asp:Label id="txtPIC_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_TWO.ZhName %>��</dt><%--�Ż�ȯ����2--%>
               <dd>
               
                    <asp:Label id="txtNAME_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_TWO.ZhName %>��</dt><%--�Ż�ȯ����2--%>
               <dd>
               
                    <asp:Label id="txtNUM_TWO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_THREE.ZhName %>��</dt><%--��Ʒ���3--%>
               <dd>
               
                    <asp:Label id="txtTYPE_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_THREE.ZhName %>��</dt><%--ͼƬ��ַ3--%>
               <dd>
               
                    <asp:Label id="txtPIC_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_THREE.ZhName %>��</dt><%--�Ż�ȯ����3--%>
               <dd>
               
                    <asp:Label id="txtNAME_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_THREE.ZhName %>��</dt><%--�Ż�ȯ����3--%>
               <dd>
               
                    <asp:Label id="txtNUM_THREE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FOUR.ZhName %>��</dt><%--��Ʒ���4--%>
               <dd>
               
                    <asp:Label id="txtTYPE_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FOUR.ZhName %>��</dt><%--ͼƬ��ַ4--%>
               <dd>
               
                    <asp:Label id="txtPIC_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FOUR.ZhName %>��</dt><%--�Ż�ȯ����4--%>
               <dd>
               
                    <asp:Label id="txtNAME_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FOUR.ZhName %>��</dt><%--�Ż�ȯ����4--%>
               <dd>
               
                    <asp:Label id="txtNUM_FOUR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FIVE.ZhName %>��</dt><%--��Ʒ���5--%>
               <dd>
               
                    <asp:Label id="txtTYPE_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FIVE.ZhName %>��</dt><%--ͼƬ��ַ5--%>
               <dd>
               
                    <asp:Label id="txtPIC_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FIVE.ZhName %>��</dt><%--�Ż�ȯ����5--%>
               <dd>
               
                    <asp:Label id="txtNAME_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FIVE.ZhName %>��</dt><%--�Ż�ȯ����5--%>
               <dd>
               
                    <asp:Label id="txtNUM_FIVE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_SIX.ZhName %>��</dt><%--��Ʒ���6--%>
               <dd>
               
                    <asp:Label id="txtTYPE_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PIC_SIX.ZhName %>��</dt><%--ͼƬ��ַ6--%>
               <dd>
               
                    <asp:Label id="txtPIC_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME_SIX.ZhName %>��</dt><%--�Ż�ȯ����6--%>
               <dd>
               
                    <asp:Label id="txtNAME_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUM_SIX.ZhName %>��</dt><%--�Ż�ȯ����6--%>
               <dd>
               
                    <asp:Label id="txtNUM_SIX" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName %>��</dt><%--�ҽ�����--%>
               <dd>
               
                    <asp:Label id="txtCONFIRM_PWD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SN_RENAME.ZhName %>��</dt><%--SN��������Ϊ--%>
               <dd>
               
                    <asp:Label id="txtSN_RENAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.TEL_RENAME.ZhName %>��</dt><%--�ֻ���������--%>
               <dd>
               
                    <asp:Label id="txtTEL_RENAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_NUM.ZhName %>��</dt><%--�齱ҳ���Ƿ���--%>
               <dd>
               
                    <asp:Label id="txtSHOW_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SN_CODE.ZhName %>��</dt><%--SN����������--%>
               <dd>
               
                    <asp:Label id="txtSN_CODE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName %>��</dt><%--�����--%>
               <dd>
               
                    <asp:Label id="txtNAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName %>��</dt><%--�˵��--%>
               <dd>
               
                    <asp:Label id="txtINFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION.ZhName %>��</dt><%--�һ�ȯʹ��˵��--%>
               <dd>
               
                    <asp:Label id="txtUSE_INSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName %>��</dt><%--�����˵��--%>
               <dd>
               
                    <asp:Label id="txtEND_INSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE.ZhName %>��</dt><%--������Ⱥ--%>
               <dd>
               
                    <asp:Label id="txtFOR_PEOPLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName %>��</dt><%--�н�����--%>
               <dd>
               
                    <asp:Label id="txtPROBABILITY" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName %>��</dt><%--ÿ����������--%>
               <dd>
               
                    <asp:Label id="txtNUMBER_TIMES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES.ZhName %>��</dt><%--ÿ��ÿ������--%>
               <dd>
               
                    <asp:Label id="txtMOST_NUM_TIMES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.KIND.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtKIND" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName %>��</dt><%--�ҽ���Ϣ--%>
               <dd>
               
                    <asp:Label id="txtINFORMATION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.WIN_INFO.ZhName %>��</dt><%--�н���ʾ--%>
               <dd>
               
                    <asp:Label id="txtWIN_INFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO.ZhName %>��</dt><%--δ�н���ʾ--%>
               <dd>
               
                    <asp:Label id="txtNO_WIN_INFO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE.ZhName %>��</dt><%--��ʾ����--%>
               <dd>
               
                    <asp:Label id="txtSHOW_WIN_USRE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO.ZhName %>��</dt><%--����ѡ��--%>
               <dd>
               
                    <asp:Label id="txtPLAY_AUDIO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.MP3_URL.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtMP3_URL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.RULES.ZhName %>��</dt><%--�����--%>
               <dd>
               
                    <asp:Label id="txtRULES" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE.ZhName %>��</dt><%--ÿ��ϵͳ��ֵ--%>
               <dd>
               
                    <asp:Label id="txtSYSTEM_SCORE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE.ZhName %>��</dt><%--ÿ���Զ����ֵ--%>
               <dd>
               
                    <asp:Label id="txtCUSTOM_SCORE" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>