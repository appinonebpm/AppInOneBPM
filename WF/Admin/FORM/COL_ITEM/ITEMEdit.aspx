<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMN_ITEMEdit" CodeFile="ITEMEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         setItemVal($("input[id$='ckSetVal']")[0]);
     });

       function setItemVal(me) {
           if (me.checked == true) {
               $(me).parent().parent().next().show();
           } else {
               $(me).parent().parent().next().hide();
           }
       
       }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
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
        <input id="txtITEM_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
            <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.TEXT.ZhName %>��</dt><%--ѡ����--%>
               <dd><span>
                
                    <input id="txtTEXT" type="text" runat="server" ck="{need:0,len:30,type:0}"/></span>
               </dd>
           </dl>
           <dl>
           <dt>&nbsp;</dt><dd class="ckbs"><input id="ckSetVal" runat="server" type="checkbox" onclick="setItemVal(this);" /><label for="<%=ckSetVal.ClientID %>">ָ����ֵ</label></dd>
           </dl>
           <dl class="hide">
               <dt><%=TF_F_COLUMN_ITEM.Attribute.VALUE.ZhName %>��</dt><%--ѡ��ֵ--%>
               <dd><span><input id="txtVALUE" type="text" runat="server" ck="{need:0,len:30,type:0}"/></span>
                   
               </dd>
           </dl>
          
           <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.DROP_REAL.ZhName %>��</dt><%--������������Ϣ--%>
               <dd><span>
               
                    <textarea id="txtDROP_REAL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=TF_F_COLUMN_ITEM.Attribute.COL_HIDE.ZhName %>��</dt><%--��ʾ��������Ϣ--%>
               <dd><span>
               
                    <textarea id="txtCOL_HIDE" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>