<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTOMEREdit" CodeFile="CUSTOMEREdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CompanyName.ZhName %>��</dt><%--��˾����--%>
               <dd><span>
                
                    <input id="txtCompanyName" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CompanyAddress.ZhName %>��</dt><%--��˾��ַ--%>
               <dd><span>
                
                    <input id="txtCompanyAddress" type="text" runat="server" ck="{need:0,len:200,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.ShopName.ZhName %>��</dt><%--��������--%>
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.ShopNameURL.ZhName %>��</dt><%--������ַ--%>
               <dd><span>
                
                    <input id="txtShopNameURL" type="text" runat="server" ck="{need:0,len:100,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CustSex.ZhName %>��</dt><%--�Ա�--%>
               <dd><span>
                
                    <input id="txtCustSex" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.Birthday.ZhName %>��</dt><%--����--%>
               <dd><span>
               
                    <input id="txtBirthday" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.WangWangId.ZhName %>��</dt><%--����ID--%>
               <dd><span>
                
                    <input id="txtWangWangId" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.CustQQ.ZhName %>��</dt><%--QQ����--%>
               <dd><span>
                
                    <input id="txtCustQQ" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.LastEditors.ZhName %>��</dt><%--���༭��--%>
               <dd><span>
                
                    <input id="txtLastEditors" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName %>��</dt><%--���빫��ʱ��--%>
               <dd><span>
               
                    <input id="txtLoadHighSeasTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=CRM_CUSTOMER.Attribute.Cus_Id.ZhName %>��</dt><%--�ͻ�����--%>
               <dd><span>
                
                    <input id="txtCus_Id" type="text" runat="server" ck="{need:1,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>