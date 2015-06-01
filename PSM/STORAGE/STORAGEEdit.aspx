<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_STORAGEEdit" CodeFile="STORAGEEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
<script type="text/javascript">


    $(function () {

        var checker = new formChecker({ formID: "divForm", btnIDS: 'btnOK' });


    });

   
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="tool">
     <ul><li><span class="btn"><asp:Button ID="btnSave" runat="server" lang="BtnOK" Text="����" onclick="btnOK_Click"/></span></li>
     <li><span class="btn"><asp:Button ID="btnOK" runat="server" lang="BtnOK" Text="�����˳�" onclick="btnOK_Click"/></span></li>
     <li><span class="btn"><input onclick="window.close();" lang="close" value="�ر�" type="button" /></span></li></ul>
    </div>
    <div class="form" id="divForm">
       <div><input id="txtSTOR_ID" type="hidden" runat="server"/>
           <dl>
               <dt><%=IM_STORAGE.Attribute.NAME.ZhName %>��</dt><%--�ֿ���--%>
               <dd>
                <span>
                    <input id="txtNAME" type="text" onblur="selNamesByThis(this);" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
               <dt><%=IM_STORAGE.Attribute.SNAME.ZhName %>��</dt><%--�ֿ���--%>
               <dd>
                <span>
                    <input id="txtSNAME" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_STORAGE.Attribute.RNAME.ZhName %>��</dt><%--������--%>
               <dd>
                <span>
                    <input id="txtRNAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               <dt><%=IM_STORAGE.Attribute.ORG_ID.ZhName %>��</dt><%--����ID--%>
               <dd><selorg:wucselorg ID="wucSelORG1" runat="server" />
               </dd>
           </dl>
           <dl>
               <dt><%=IM_STORAGE.Attribute.USE_FLAG.ZhName%>��</dt><%--״̬--%>
               <dd>
               <span>
                    <select id="txtSTATE" runat="server" ck="{need:0,len:2147483647,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_STORAGE.Attribute.REMARK.ZhName %>��</dt><%--REMARK--%>
               <dd><span>
                    <textarea id="txtREMARK" cols="1" rows="1" style="height:80px;width:400px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:550,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_STORAGE.Attribute.EXP1.ZhName%>��</dt><%--�Զ���1--%>
               <dd>
                
                    <span><input id="txtEXP1" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
               </dl>
         <dl>
               <dt><%=IM_STORAGE.Attribute.EXP2.ZhName%>��</dt><%--�Զ���2--%>
               <dd>
                
                    <span><input id="txtEXP2" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=IM_STORAGE.Attribute.EXP3.ZhName%>��</dt><%--�Զ���3--%>
               <dd>
                
                    <span><input id="txtEXP3" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>

</div>
</asp:Content>