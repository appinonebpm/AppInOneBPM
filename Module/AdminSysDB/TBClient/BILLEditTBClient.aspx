<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILLEditTBClient" CodeFile="BILLEditTBClient.aspx.cs" %>
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

       function delWEVTB(me) {
           $(me).parent().remove();
       }

        function _FormView(me) {
            var href = "../BillView.aspx?BillID=<%=keyid %>&r=" + Math.random();
            window.parent.frames["ifrShow"].location.href = href;
        }

        function addDEVTB(me) {
            var divObj = $(me).parent().next();
            var dev = $("select[id$='txtDEV']").val();
            var tb = $(me).prev().val();
            if (tb == undefined || tb == "") {
                return;
            }
            var vvv = dev + "." + tb;
            var olds = divObj.find("input[value='" + vvv + "']"); alert(olds.length);
            if (olds.length == 0) {
                divObj.append("<p><span>" + dev + "</span>&nbsp;.&nbsp;<span>" + tb + "</span><a onclick='delWEVTB(this);'>ɾ��</a><input name='selDEVTB' value='" + vvv + "' type='hidden'/></p>");
                $(me).prev().val("");
            }
        }

       function selTBByDEV(me) {
           var devObj = $("select[id$='txtDEV']");
           var result = window.showModalDialog("../TableSel_DEV.aspx?DEV=" + devObj.val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
           if (result == undefined || result == "") {
               return;
           }
           var obj = eval(result);
           me.value = obj.NAME;
       }
</script>
<style type="text/css">
.devs p{margin:0;padding:0;line-height:22px;}
.devs p span{color:#060;}
.devs p a{margin-left:20px; cursor:pointer;color:#006;}

</style>
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
    <li class="hide"><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
    <li><span><input id="btnFormView" type="button" value="��Ԥ��" onclick="_FormView(this);"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:0,len:2147483647,type:1}"/>
           
           <dl class="hide">
               <dt><%=SYS_BILL.Attribute.BILL_TYPE.ZhName %>��</dt><%--������--%>
               <dd><span>
                   <select id="txtBILL_TYPE" runat="server">
                       <option value="0">Ĭ��</option>
                       <option value="1">���ṹ</option>
                   </select></span>
               </dd>
           </dl>
           <dl>
           <dt>&nbsp;</dt><dd>
           <input id="ckDTL" type="checkbox" runat="server" style="width:20px;"/><label for="<%=ckDTL.ClientID %>">����ϸ��</label>
           </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL.Attribute.TABLE_NAME.ZhName %>��</dt><%--�������--%>
               <dd style="width:auto;"><span>
                <a>U_</a>
                <input id="txtTABLE_NAME_PRE" type="text" value="" runat="server" style="width:50px;"/>
                    <input id="txtTABLE_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
                     <span style="display:none;"><input id="txtTAVLE_EXISTS" type="checkbox" checked="checked" runat="server" style="width:20px;"/><label for="<%=txtTAVLE_EXISTS.ClientID %>">���Ѵ���</label></span>
                    </span><font color='green'>����(ģ����_����)</font>
               </dd>
           </dl>          
           <dl>
               <dt><%=LanguageService.GetLanguageString("TABLE_ZhNAME","��������") %>��
               <%--<%=SYS_BILL.Attribute.BILL_NAME.ZhName %>��--%></dt><%--������--%>
                <dd style="width:auto;"><span>                
                    <input id="txtBILL_NAME" type="text" runat="server" ck="{need:0,len:150,type:0}" style="width:205px"/></span>
                    <font color='green'>(��ע��)</font>
               </dd>
           </dl>

           <dl class="hide">
               <dt><%=SYS_BILL.Attribute.BILL_SQL.ZhName %>��</dt><%--���ݲ�ѯSQL���--%>
               <dd><span>
                   <textarea id="txtBILL_SQL" cols="20" runat="server" rows="2" style="width:200px;height:100px;"></textarea>
                    </span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>��ص��豸��</dt>
               <dd><span><select id="txtDEV" style="width:150px;" runat="server">
                       <option value="AIO_SYN">ͬ�������</option>
                       <option value="DEV1">�����豸1</option>
                       <option value="DEV2">�����豸2</option>
                       <option value="DEV3">�����豸3</option>
                   </select></span><br /><span><input id="txtTABLE" type="text" style="width:120px;" ondblclick="selTBByDEV(this);" /><input id="Button1" type="button" value="���" onclick="addDEVTB(this);" style="width:30px;" /></span>
                   <div class="devs">
                       <asp:Literal ID="litHTML" runat="server"></asp:Literal>
                   </div>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=SYS_BILL.Attribute.ADDER.ZhName %>��</dt><%--������--%>
               <dd><span>
                
                    <input id="txtADDER" type="text" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li class="hide"><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>