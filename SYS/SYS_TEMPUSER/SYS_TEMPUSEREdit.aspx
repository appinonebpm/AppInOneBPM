<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSEREdit.aspx.cs" Inherits="SYS_TEMPUSEREdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <style type="text/css">
.form dl dd input{ height:25px; font-size:16px;}
.form dl dt{ line-height:30px;font-size:15px;}
.form dl dt{ line-height:30px;font-size:15px;}
.tool input { font-size:18px; }
.tool ul li { float:none}
.tool ul { float:none}
.tool .btn { margin-left:20px;}
.tool { height:30px;}
</style>
 <script type="text/javascript">
     var checker
       $(function () {
           checker = new formChecker({btnIDS: '' });
       });
       $(document).ready(function () {
           $("#btnCheckNum").click(function () {
               
               var re = /^0?(13|14|15|18)\d{9}$/;
               var tel = $("#txtPHONE").val();
               if (tel.length == 0) {
                   alert("�������ֻ�����!");
                   return false;
               }
               if (!re.test(tel)) {
                   alert("����ȷ�����ֻ�����!");
                   $("#txtPHONE").focus();
                   return false;
               }

               var url = "SYS_TEMPUSERBack.aspx?action=GetCheckNum&Mobile=" + tel + "&callid=" + callid();
               var resource = {
           };
               $.post(url, { "ResJson": resource }, function (data) {
               if (data == "-100") {
                   alert("��֤�����·�����ע�����")
               } else if (data == "-101") {
                   $("#hidFlag").val('1');
                   alert("�·�ʧ��,������������λ��֤�����ע�ᡣ")
               } else if (data == "-102") {
                   alert("ͨѶ�˿ڱ�ռ�ã����Ŷӵȴ�")
               } else {
                   alert("�벻Ҫ�ظ���ȡ������" + data + "������ԣ�")
               }
           });
       });
       $("#btnOK").click(function () {
           if (!checker.checkFormInfo()) {
               return false;
           }

           var txtLOGINNAME = $("#txtLOGINNAME").val();
           var txtPWD = $("#txtPWD").val();
           var txtNAME = $("#txtNAME").val();
           var txtCONAME = $("#txtCONAME").val();
           var txtPHONE = $("#txtPHONE").val();
           var txtCheckNum = $("#txtCheckNum").val();
           var txtEMAIL = $("#txtEMAIL").val();

           if (!/.*[\u4e00-\u9fa5]+.*$/.test(txtCONAME)) {
               alert("���������ĺ��֣�");
               $("#txtCONAME").val('');
               $("#txtCONAME").focus();
               return false;
           }
           if (txtCONAME.length<2) {
               alert("�����������������ĺ��֣�");
               $("#txtCONAME").val('');
               $("#txtCONAME").focus();
               return false;
           }

           var url = "SYS_TEMPUSERBack.aspx?action=Add&loginname=" + txtLOGINNAME + "&pwd=" + txtPWD + "&name=" + txtNAME + "&coname=" + txtCONAME + "&phone=" + txtPHONE + "&checknum=" + txtCheckNum + "&email=" + txtEMAIL + "&callid=" + callid() + "&hidFlag=" + $("#hidFlag").val();
           var resource = {
       };
       $.post(url, { "ResJson": resource }, function (data) {
           if (data == "-1") {
               alert("��֤���������������");
               $("#txtCheckNum").val('');
               $("#txtCheckNum").focus();
           } else if (data == "-2") {
               alert("��¼���Ѵ��ڣ�����������");
               $("#txtLOGINNAME").val('');
               $("#txtLOGINNAME").focus();
           } else {
               alert("ע��ɹ���");
               window.close();
           }
       });
       return false;

   });


});
       function callid() {
           var random = Math.floor(Math.random() * 10001);
           var id = (random + "_" + new Date().getTime()).toString();
           return id;
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
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<input type="hidden" id="hidFlag" value ="0" />
<div class="form" id="divForm">
       <div>
           <dl>
               <dt>���õ�λ��</dt><%--��λ--%>
               <dd><span>
               <!--����-->
                    <input id="txtCONAME" type="text" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <br>
            <br>
             <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>��</dt><%--�ֻ�����--%>
               <dd><span>
               <!--����-->
                    <input id="txtPHONE" type="text" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
               <dd>
                   <div class="controls">
                        <span class="insertimage"><a id="btnCheckNum">��ȡ��֤��</a></span>
                    </div>
                   </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl >
               <dt>��֤�룺</dt>
               <dd><span>
                    <input id="txtCheckNum" type="text" ck="{type:1,min:1000,max:9999,need:1}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>��</dt><%--��¼��--%>
               <dd><span>
               <!--����-->
                    <input id="txtLOGINNAME" type="text" ck="{type:0,min:0,max:20,need:1}"/></span>
               </dd>
           </dl>
            <br> <br>
             <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtPWD" value="123456" type="text"  ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtNAME" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
            <br>
             <br>
              <br>
           <dl>
               <dt>QQ��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtEMAIL" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
               </dd>
           </dl>
            <br> <br> <br>
           
       </div>
       <div class="clear"></div>
    </div>
</div>
<div class="tool">
<ul>
    <li><span class="btn"><input ID="btnOK" value="�ύ" type=button /></span><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
</asp:Content>