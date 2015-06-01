<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTEdit.aspx.cs" Inherits="WEC_C_CHANNELlISTEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
     $(function () {
         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
     });
//     function disableTwo(obj) {
//         alert(obj.value);
//         if (obj.value == 0) {
//             $("#txtAddress").removeAttr("class");
//             $("#txtAddress").removeAttr("disable");
//             $("#txtURL").attr("class", "dis");
//             $("#txtURL").attr("disable", "true");
//             $("#txtREMARK").attr("class", "dis");
//             $("#txtREMARK").attr("disable", "true");
//         } else if (obj.value == 1) {
//             $("#txtURL").removeAttr("class");
//             $("#txtURL").removeAttr("disable");
//             $("#txtAddress").attr("class", "dis");
//             $("#txtAddress").attr("disable", "true");
//             $("#txtREMARK").attr("class", "dis");
//             $("#txtREMARK").attr("disable", "true");
//         }
//         else if (obj.value == 2) {
//             $("#txtREMARK").removeAttr("class");
//             $("#txtREMARK").removeAttr("disable");
//             $("#txtAddress").attr("class", "dis");
//             $("#txtAddress").attr("disable", "true");
//             $("#txtURL").attr("class", "dis");
//             $("#txtURL").attr("disable", "true");
//         }
//     }
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
        
           <dl class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd><span>
               <!--����-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd><span>
               <!--����-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>��</dt><%--��������--%>
               <dd><span>
               <!--����-->
                    <input id="txtNAME" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>

            <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>��</dt><%--��������--%>
               <dd><span>
               
                    <select id="txtTYPE" runat="server" ck="{need:1,len:4,type:1}" >
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>��</dt><%--����url--%>
               <dd><span>
               
                    <textarea   id="txtURL"  cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>��</dt><%--�������ڵ���--%>
               <dd><span>
               
                    <textarea id="txtADDRESS"  cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>��</dt><%--������ע--%>
               <dd><span>
               
                    <textarea id="txtREMARK"  cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>��</dt><%--��������--%>
               <dd><span>
               <!--����-->
                    <%--<input id="txtCATEGORY_ID" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/>--%>
                    <select id="txtCATEGORY_ID" runat="server" ck="{need:1,len:4,type:1}">
                    </select>
                   </span>
               </dd>
           </dl>
       
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>��</dt><%--��ע��Ϣ--%>
               <dd><span>
               
                    <textarea id="txtNOTE"  cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
          
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
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