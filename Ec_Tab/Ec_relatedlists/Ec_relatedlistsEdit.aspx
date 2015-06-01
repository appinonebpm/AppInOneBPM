<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_relatedlistsEdit.aspx.cs" Inherits="Ec_relatedlistsEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
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
               <dt><%=Ec_relatedlists.Attribute.Relation_id.ZhName %>��</dt><%--Relatio--%>
               <dd><span>
               <!--����-->
                    <input id="txtRelation_id" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Tabid.ZhName %>��</dt><%--ģ��id--%>
               <dd><span>
               <!--����-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabid.ZhName %>��</dt><%--Related--%>
               <dd><span>
               <!--����-->
                    <input id="txtRelated_tabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Name.ZhName %>��</dt><%--Name--%>
               <dd><span>
               <!--����-->
                    <input id="txtName" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Sequence.ZhName %>��</dt><%--Sequenc--%>
               <dd><span>
               <!--����-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Label.ZhName %>��</dt><%--Label--%>
               <dd><span>
               <!--����-->
                    <input id="txtLabel" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Presence.ZhName %>��</dt><%--�Ƿ���ʾ0��ʾ--%>
               <dd><span>
               <!--����-->
                    <input id="txtPresence" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.TabTableName.ZhName %>��</dt><%--������--%>
               <dd><span>
               <!--����-->
                    <input id="txtTabTableName" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_PK.ZhName %>��</dt><%--���ֶ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtColumnName_PK" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.ColumnName_FK.ZhName %>��</dt><%--�����ֶ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtColumnName_FK" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_relatedlists.Attribute.Related_tabTableName.ZhName %>��</dt><%--��������--%>
               <dd><span>
               <!--����-->
                    <input id="txtRelated_tabTableName" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
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