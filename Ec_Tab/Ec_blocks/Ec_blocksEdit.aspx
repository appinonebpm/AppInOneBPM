<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksEdit.aspx.cs" Inherits="Ec_blocksEdit" %>
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
<div class="form" id="divForm">
       <div>
        
           <dl>
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>��</dt><%--Blockid--%>
               <dd><span>
               <!--����-->
                    <input id="txtBlockid" type="text" runat="server" ck="{type:0,min:1,max:10,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>��</dt><%--ģ��id--%>
               <dd><span>
               <!--����-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:0,min:1,max:10,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>��</dt><%--��ʾ��������--%>
               <dd><span>
               <!--����-->
                    <input id="txtBlocklabel" type="text" runat="server" ck="{type:0,min:1,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>��</dt><%--��ʾ˳��--%>
               <dd><span>
               <!--����-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:0,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtShow_title" type="text" runat="server" ck="{type:0,min:0,max:30,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>��</dt><%--�Ƿ�ɼ�--%>
               <dd><span>
               <!--����-->
 
                          <input type="radio" id="IsVisible"  runat="server" name="Visible" value="1"/>�ɼ�
                           <input type="radio" id="NoVisible" runat="server" name="Visible" value="0"/>���ɼ�

                   </span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>��</dt><%--Create_--%>
               <dd><span>
               <!--����-->
                         <input type="radio" id="IsCreate_view" runat="server" name="Create_view" value="1"  />��
                           <input type="radio" id="NoCreate_view" runat="server" name="Create_view" value="0"/>��
                    
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>��</dt><%--Edit_vi--%>
               <dd><span>
               <!--����-->
                    <input id="txtEdit_view" type="text" runat="server" ck="{type:1,min:0,max:1,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>��</dt><%--Detail_--%>
               <dd><span>
               <!--����-->
                    <input id="txtDetail_view" type="text" runat="server" ck="{type:0,min:0,max:100,need:0}"/></span>
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