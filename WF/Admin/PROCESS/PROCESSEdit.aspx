<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_PROCESS_TPLEdit" CodeFile="PROCESSEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
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
        <input id="txtPROCID" type="hidden" runat="server"/>
           <dl>
               <dt><%=WF_PROCESS_TPL.Attribute.WFID.ZhName%>��</dt><%--���̷�����--%>
               <dd><span>
                
                    <input id="txtWFCID" readonly="readonly"  class="dis" type="text" runat="server"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_PROCESS_TPL.Attribute.GUID.ZhName %>��</dt><%--Ψһ�汾ID--%>
               <dd><span>
                
                    <input id="txtGUID" class="dis" type="text" readonly="readonly" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_PROCESS_TPL.Attribute.PROC_NAME.ZhName %>��</dt><%--������--%>
               <dd><span>
                
                    <input id="txtPROC_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
          
           <dl>
               <dt><%=WF_PROCESS_TPL.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
                    <select id="txtSTATUS" runat="server" ck="{need:0,len:2,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WF_PROCESS_TPL.Attribute.CONDITION.ZhName %>��</dt><%--�������--%>
               <dd><span>
                    <textarea id="txtSHOW_CONDITION" runat="server" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" /></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WF_PROCESS_TPL.Attribute.FORMULAR.ZhName %>��</dt><%--������ʽ--%>
               <dd><span>
                   <input id="txtSHOW_FORMULA" type="text"  runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_PROCESS_TPL.Attribute.NOTE.ZhName %>��</dt><%--��ע--%>
               <dd><span><textarea id="txtNOTE" cols="60" rows="3" runat="server"></textarea></span>
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