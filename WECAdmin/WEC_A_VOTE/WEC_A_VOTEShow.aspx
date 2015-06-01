<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTEShow.aspx.cs" Inherits="WEC_A_VOTEShow" %>
<%@ Import Namespace="AgileFrame.Core" %><%@ Import Namespace="AgileFrame.Common" %>
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
   <div class="relationlist">
        <%if(valObj.DataBaseTable!=null) //jinsj ��ϸ��
              foreach (DataBaseTableRelation dr1 in valObj.DataBaseTable.SubTable_ChaZhao)
              {
                  DataBaseTable dt1 = dr1.DataBaseTable;
                  %>
                  <a href=""><%=dt1.ZhName %>,<%=dt1.IDField %><%=dt1.NameField %></a>
                  <%
              }%>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd>
               
                    <asp:Label id="txtAID" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtSTATUS" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd>
               
                    <asp:Label id="txtADDTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>��</dt><%--�ؼ���--%>
               <dd>
               
                    <asp:Label id="txtKEYWORD" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>��</dt><%--ͶƱ����--%>
               <dd>
               
                    <asp:Label id="txtTITLE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>��</dt><%--ͶƱͼƬ--%>
               <dd>
               
                    <asp:Label id="txtPICURL" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>��</dt><%--ͶƱ˵��--%>
               <dd>
               
                    <asp:Label id="txtINSTRUCTION" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>��</dt><%--ͼƬ��ʾ--%>
               <dd>
               
                    <asp:Label id="txtPIC_SHOW" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>��</dt><%--�Ƿ��ѡ--%>
               <dd>
               
                    <asp:Label id="txtIS_RADIO" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>��</dt><%--��ѡ����--%>
               <dd>
               
                    <asp:Label id="txtSELECT_NUM" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>��</dt><%--ʱ������--%>
               <dd>
               
                    <asp:Label id="txtTIME" runat="server" ></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>��</dt><%--ͶƱ���--%>
               <dd>
               
                    <asp:Label id="txtRESULT" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>��</dt><%--�Ƿ����--%>
               <dd>
               
                    <asp:Label id="txtSHARE" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>��</dt><%--���--%>
               <dd>
               
                    <asp:Label id="txtKIND" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>