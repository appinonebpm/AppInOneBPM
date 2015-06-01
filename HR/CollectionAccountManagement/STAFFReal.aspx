<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_STAFFReal2" CodeFile="STAFFReal.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_ID._ZhName %></td><!--Ա����ʾ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_NO._ZhName %></td><!--Ա����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STAFF_NAME._ZhName%></td><!--Ա������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.DEPT_ID._ZhName %></td><!--�������ű�ʶ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GENDER._ZhName %></td><!--�Ա�-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PHOTO._ZhName %></td><!--��Ƭ��ַ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POS_NAME._ZhName %></td><!--ְλ����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STATION_CODE._ZhName %></td><!--��λ����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.WORK_TYPE_CODE._ZhName %></td><!--�����ֹ�����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.TECH_LEVEL_CODE._ZhName %></td><!--�����ȼ�-->
                    
                    
                    <td><%=HR_STAFF.Attribute.YMD._ZhName %></td><!--��������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.MOBILE._ZhName %></td><!--�ֻ�����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.OFFICE_TEL._ZhName %></td><!--�칫�绡-->
                    
                    
                    <td><%=HR_STAFF.Attribute.CERT_FLAG._ZhName %></td><!--��֤���-->
                    
                    
                    <td><%=HR_STAFF.Attribute.FIXED_FLAG._ZhName %></td><!--�����־-->
                    
                    
                    <td><%=HR_STAFF.Attribute.ON_POS_FLAG._ZhName %></td><!--�ڸڱ�־-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PROFESSION_CODE._ZhName %></td><!--��רҵ��������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.PROFESSION_BGN_DATE._ZhName %></td><!--��רҵ��������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.JOIN_DATE._ZhName %></td><!--��������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POLITICAL_STATUS_CODE._ZhName %></td><!--������ò-->
                    
                    
                    <td><%=HR_STAFF.Attribute.TITLE_CODE._ZhName %></td><!--ְ�Ʊ���-->
                    
                    
                    <td><%=HR_STAFF.Attribute.STATUS_CODE._ZhName %></td><!--������״̬-->
                    
                    
                    <td><%=HR_STAFF.Attribute.ADDR._ZhName %></td><!--��ϵ��ַ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.EMAIL._ZhName %></td><!--�����ʼ�-->
                    
                    
                    <td><%=HR_STAFF.Attribute.NATION._ZhName %></td><!--����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.NATIVE_PLACE._ZhName %></td><!--����-->
                    
                    
                    <td><%=HR_STAFF.Attribute.POST_NO._ZhName %></td><!--��������-->
                    
                    
                    <td><%=HR_STAFF.Attribute.DEGREE_CODE._ZhName %></td><!--�Ļ��̶�-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GRAD_SCHOOL._ZhName %></td><!--��ҵѧУ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.GRAD_DATE._ZhName %></td><!--��ҵʱ��-->
                    
                    
                    <td><%=HR_STAFF.Attribute.MAJOR._ZhName %></td><!--רҵ-->
                    
                    
                    <td><%=HR_STAFF.Attribute.AF_ADDTIME._ZhName %></td><!--¼��ʱ��-->
                    
                    
                    <td><%=HR_STAFF.Attribute.AF_EDITTIME._ZhName %></td><!--�޸�ʱ��-->
                    
                    
                    <td><%=HR_STAFF.Attribute.REMARK._ZhName %></td><!--��ע-->
                    
                    
                    <td><%=HR_STAFF.Attribute.USER_ID._ZhName %></td><!--�û���ʶ-->
                </tr>
            </thead>
            <tbody id="tbodyList">
                <asp:Repeater ID="repList" runat="server">
                <ItemTemplate>
                <tr>
                    <td class="<%#hideEditLinkClsName %>">
                    <a href="HR_STAFFFEdit.aspx?STAFF_ID=<%#((HR_STAFF)Container.DataItem).STAFF_ID %>">�༭</a>
                    <a href="" data="<%#((SYS_ROLE)Container.DataItem).ROLE_ID %>">�Ƴ�</a>
                    </td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_ID %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NO %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STAFF_NAME%></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.GENDER, ((HR_STAFF)Container.DataItem).GENDER)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((HR_STAFF)Container.DataItem).PHOTO) %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POS_NAME %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STATION_CODE %></td>
                    
                    
                    <td><%#FormHelper.GetText(HR_STAFF.Attribute.WORK_TYPE_CODE, ((HR_STAFF)Container.DataItem).WORK_TYPE_CODE)%></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).TECH_LEVEL_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).YMD %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).MOBILE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).OFFICE_TEL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).CERT_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).FIXED_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ON_POS_FLAG %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).PROFESSION_BGN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).JOIN_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POLITICAL_STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).TITLE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).STATUS_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).ADDR %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATION %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).NATIVE_PLACE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).POST_NO %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).DEGREE_CODE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_SCHOOL %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).GRAD_DATE %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).MAJOR %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_ADDTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((HR_STAFF)Container.DataItem).AF_EDITTIME == DateTime.MinValue) ? "" : ((HR_STAFF)Container.DataItem).AF_EDITTIME.ToString("yyyy-MM-dd HH:mm")%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((HR_STAFF)Container.DataItem).REMARK) %></td>
                    
                    
                    <td><%#((HR_STAFF)Container.DataItem).USER_ID %></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
     </div>
</div>
</asp:Content>