<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAReal" CodeFile="KM_KNMAReal.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
<script type="text/javascript">
   

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidOneID" type="hidden" runat="server" /><!--һ�Զ��ϵ��һ�Ǹ��������-->
<input id="hidMulIDS" type="hidden" runat="server" /><!--һ�Զ��ϵ�ж��Ǹ��������-->
<div class="main">
     <div class="tblist" style="height:auto;">
         <table cellpadding="0" cellspacing="0">
            <thead >
                <tr>
                    <td class="<%=hideEditLinkClsName %>">&nbsp;</td>
                    
                    
                    <td><%=KM_KNMA.Attribute.KNMA_ID._ZhName %></td><!--֪ʶ��ʶ-->
                    
                    
                    <td><%=KM_KNMA.Attribute.KNMA_NAME._ZhName %></td><!--֪ʶ����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.P_KNMA_ID._ZhName %></td><!--����ID-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CONTENT._ZhName %></td><!--֪ʶ����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CLASS_ID._ZhName %></td><!--֪ʶ���-->
                    
                    
                    <td><%=KM_KNMA.Attribute.UP_TYPE._ZhName %></td><!--�ϴ��ĵ�����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EA_SIGN._ZhName %></td><!--������־-->
                    
                    
                    <td><%=KM_KNMA.Attribute.AUTHOR._ZhName %></td><!--����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.SORT_NO._ZhName %></td><!--���-->
                    
                    
                    <td><%=KM_KNMA.Attribute.DEPT_ID._ZhName %></td><!--���ű��-->
                    
                    
                    <td><%=KM_KNMA.Attribute.ADD_TIME._ZhName %></td><!--�ļ�¼��ʱ��-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EDIT_TIME._ZhName %></td><!--�ļ��༭ʱ��-->
                    
                    
                    <td><%=KM_KNMA.Attribute.PATH_ID._ZhName %></td><!--�ϼ����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CAN_EDIT._ZhName %></td><!--����ͬ�༭-->
                    
                    
                    <td><%=KM_KNMA.Attribute.CAN_COMMENTS._ZhName %></td><!--��������-->
                    
                    
                    <td><%=KM_KNMA.Attribute.ADD_USER._ZhName %></td><!--¼����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EDIT_USER._ZhName %></td><!--�༭��-->
                    
                    
                    <td><%=KM_KNMA.Attribute.S_LEVEL._ZhName %></td><!--��ȫ����-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP1._ZhName %></td><!--�Զ���1-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP2._ZhName %></td><!--�Զ���2-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP3._ZhName %></td><!--�Զ���3-->
                    
                    
                    <td><%=KM_KNMA.Attribute.EXP4._ZhName %></td><!--�Զ���4-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="<%#hideEditLinkClsName %>">
                    <a href="KM_KNMAFEdit.aspx?KNMA_ID=<%#((KM_KNMA)Container.DataItem).KNMA_ID %>">�༭</a>
                    <a href="" data="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>">�Ƴ�</a>
                    </td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).KNMA_ID %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).KNMA_NAME %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).P_KNMA_ID %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).CONTENT %></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CLASS_ID, ((KM_KNMA)Container.DataItem).CLASS_ID)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.UP_TYPE, ((KM_KNMA)Container.DataItem).UP_TYPE)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.EA_SIGN, ((KM_KNMA)Container.DataItem).EA_SIGN)%></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).AUTHOR %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#(((KM_KNMA)Container.DataItem).ADD_TIME == DateTime.MinValue) ? "" : ((KM_KNMA)Container.DataItem).ADD_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((KM_KNMA)Container.DataItem).EDIT_TIME == DateTime.MinValue) ? "" : ((KM_KNMA)Container.DataItem).EDIT_TIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).PATH_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CAN_EDIT, ((KM_KNMA)Container.DataItem).CAN_EDIT)%></td>
                    
                    
                    <td><%#FormHelper.GetText(KM_KNMA.Attribute.CAN_COMMENTS, ((KM_KNMA)Container.DataItem).CAN_COMMENTS)%></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).ADD_USER %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_KNMA)Container.DataItem).EDIT_USER) %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).S_LEVEL %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_KNMA)Container.DataItem).EXP4 %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>