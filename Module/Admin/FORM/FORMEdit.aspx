<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_FORMEdit" CodeFile="FORMEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });

       function selTB_ID(me) {
           var result = window.showModalDialog('../TABLE/TABLESel.aspx?r=' + Math.random() + "&PID=<%=pid %>", 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
           if (result == undefined || result == '') return;

           var obj = eval(result);
           var puts = $(me).parent().find('input');
           puts[0].value = obj.Name;
           puts[1].value = obj.ID;

           $("input[id$='txtF_NAME']").val(obj.Name);

       }
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b>��������Ϣ�༭</b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
         <input id="txtFORM_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
           <dl>
               <dt>ѡ�����ݱ�</dt><%--����ID--%>
               <dd><span>
                    <input id="txtTB_ID" type="text" runat="server" ck="{need:1,len:99,type:0}" style="width:70%;float:left;"/>
                    <input id="hidTB_ID" type="hidden"  runat="server"/>
                    <input id="btnSelTB_ID" runat="server" class="sel" type="button" onclick="selTB_ID(this);" value=""  style="float:left;"/>
                    </span>
               </dd>
           </dl>
           <dl>
               <dt>�����ƣ�</dt><%--F_NAME--%>
               <dd><span>
                
                    <input id="txtF_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           
           <dl class="hide">
               <dt>�༭ҳ��ģ�棺</dt><%--TPL_EDIT--%>
               <dd><span>
                
                    <input id="txtTPL_EDIT" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
            <dl class="hide">
               <dt>�б�ҳ��ģ�棺</dt><%--TPL_LIST--%>
               <dd><span>
                
                    <input id="txtTPL_LIST" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>��ʾҳ��ģ�棺</dt><%--TPL_SHOW--%>
               <dd><span>
                
                    <input id="txtTPL_SHOW" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>��ӡҳ��ģ�棺</dt><%--TPL_PRINT--%>
               <dd><span>
                
                    <input id="txtTPL_PRINT" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
          
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">

   </div>
</div>
</asp:Content>