<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAShow" CodeFile="KM_KNMAShow.aspx.cs" %>
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
               <dt><%=KM_KNMA.Attribute.KNMA_ID.ZhName %>��</dt><%--֪ʶ��ʶ--%>
               <dd>
                
                    <asp:Label id="txtKNMA_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_NAME.ZhName %>��</dt><%--֪ʶ����--%>
               <dd>
                
                    <asp:Label id="txtKNMA_NAME" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.P_KNMA_ID.ZhName %>��</dt><%--����ID--%>
               <dd>
                
                    <asp:Label id="txtP_KNMA_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CONTENT.ZhName %>��</dt><%--֪ʶ����--%>
               <dd>
                
                    <asp:Label id="txtCONTENT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CLASS_ID.ZhName %>��</dt><%--֪ʶ���--%>
               <dd>
               
                    <asp:Label id="txtCLASS_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.UP_TYPE.ZhName %>��</dt><%--�ϴ��ĵ�����--%>
               <dd>
               
                    <asp:Label id="txtUP_TYPE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EA_SIGN.ZhName %>��</dt><%--������־--%>
               <dd>
               
                    <asp:Label id="txtEA_SIGN" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.AUTHOR.ZhName %>��</dt><%--����--%>
               <dd>
                
                    <asp:Label id="txtAUTHOR" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.SORT_NO.ZhName %>��</dt><%--���--%>
               <dd>
                
                    <asp:Label id="txtSORT_NO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.DEPT_ID.ZhName %>��</dt><%--���ű��--%>
               <dd>
                
                    <asp:Label id="txtDEPT_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.ADD_TIME.ZhName %>��</dt><%--�ļ�¼��ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADD_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_TIME.ZhName %>��</dt><%--�ļ��༭ʱ��--%>
               <dd>
               
                    <asp:Label id="txtEDIT_TIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.PATH_ID.ZhName %>��</dt><%--�ϼ����--%>
               <dd>
                
                    <asp:Label id="txtPATH_ID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CAN_EDIT.ZhName %>��</dt><%--����ͬ�༭--%>
               <dd>
               
                    <asp:Label id="txtCAN_EDIT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.CAN_COMMENTS.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtCAN_COMMENTS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.ADD_USER.ZhName %>��</dt><%--¼����--%>
               <dd>
                
                    <asp:Label id="txtADD_USER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_USER.ZhName %>��</dt><%--�༭��--%>
               <dd>
               
                    <asp:Label ID="txtEDIT_USER" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.S_LEVEL.ZhName %>��</dt><%--��ȫ����--%>
               <dd>
                
                    <asp:Label id="txtS_LEVEL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP1.ZhName %>��</dt><%--�Զ���1--%>
               <dd>
                
                    <asp:Label id="txtEXP1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP2.ZhName %>��</dt><%--�Զ���2--%>
               <dd>
                
                    <asp:Label id="txtEXP2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP3.ZhName %>��</dt><%--�Զ���3--%>
               <dd>
                
                    <asp:Label id="txtEXP3" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=KM_KNMA.Attribute.EXP4.ZhName %>��</dt><%--�Զ���4--%>
               <dd>
                
                    <asp:Label id="txtEXP4" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>