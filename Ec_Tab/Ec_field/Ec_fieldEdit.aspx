<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldEdit.aspx.cs" Inherits="Ec_fieldEdit" %>
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
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>��</dt><%--�ֶ�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtFieldid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>��</dt><%--ģ��ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtTabid" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtColumnname" type="text" runat="server" ck="{type:0,min:0,max:30,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtTablename" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>��</dt><%--��������--%>
               <dd><span>
               <!--����-->
                    <input id="txtGeneratedtype" type="text" runat="server" ck="{type:1,min:0,max:4,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>��</dt><%--�ؼ�����--%>
               <dd><span>
               
                    <select id="txtUitype" runat="server" ck="{need:0,len:30,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>��</dt><%--�ֶ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtFieldname" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>��</dt><%--�ֶα�ǩ--%>
               <dd><span>
               <!--����-->
                    <input id="txtFieldlabel" type="text" runat="server" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>��</dt><%--ֻ��--%>
               <dd><span>
               
                    <select id="txtReadonly" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Presence.ZhName %>��</dt><%--�Ƿ����--%>
               <dd><span>
               
                    <select id="txtPresence" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Selected.ZhName %>��</dt><%--�Ƿ�ѡ��--%>
               <dd><span>
               
                    <select id="txtSelected" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>��</dt><%--��󳤶�--%>
               <dd><span>
               <!--����-->
                    <input id="txtMaximumlength" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>��</dt><%--˳���--%>
               <dd><span>
               <!--����-->
                    <input id="txtSequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Block.ZhName %>��</dt><%--���ֱ��--%>
               <dd><span>
               <!--����-->
                    <input id="txtBlock" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>��</dt><%--������o���Ǳ�--%>
               <dd><span>
               <!--����-->
                    <input id="txtTypeofdata" type="text" runat="server" ck="{type:0,min:0,max:100,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>��</dt><%--�Ƿ���ٴ���--%>
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server" ck="{need:0,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>��</dt><%--���ٴ����Ĵ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtQuickcreatesequence" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>��</dt><%--����--%>
               <dd><span>
               
                    <select id="txtInfo_type" runat="server" ck="{need:1,len:20,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>��</dt><%--�ؼ�����--%>
               <dd><span>
               
                    <select id="txtCtrlType" runat="server" ck="{need:1,len:50,type:0}">
                    </select></span>
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