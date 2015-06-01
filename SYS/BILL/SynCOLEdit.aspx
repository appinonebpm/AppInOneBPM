<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_SYNCOLEdit" CodeFile="SynCOLEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/myOptions.js" type="text/javascript"></script>
 <script type="text/javascript">

     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         var divs = $("div.grp");

         var aObjs = divs.find("a");
         for (var a = 0; a < aObjs.length; a++) {
             var aObj = $(aObjs[a]);
             aObj.bind("click", aObj, function (e) {
                 var ttt = e.data.text();
                 if (ttt == "չ��") {
                     e.data.parent().next().show(); e.data.text("����");

                 } else {
                     e.data.parent().next().hide(); e.data.text("չ��");
                 }
             });

             aObj.parent().bind("dblclick", aObj, function (e) {
                 var ttt = e.data.text();
                 if (ttt == "չ��") {
                     e.data.parent().next().show(); e.data.text("����");

                 } else {
                     e.data.parent().next().hide(); e.data.text("չ��");
                 }
             });
         }

         DATA_TYPE_CHG();
         DB_SRC_CHG();
         ISPK_CHG();

         $("input[id$='txtCOL_NAME']").attr("readonly", true);
         $("select[id$='txtDATA_TYPE']").attr("disabled", true);
         $("input[id$='txtDATA_LEN']").attr("disabled", true);
         $("input[id$='txtDATA_ACC']").attr("disabled", true);
         $("select[id$='txtIS_AUTO']").attr("disabled", true);
         $("select[id$='txtISPK']").attr("disabled", true);
         $("input[id$='txtDVAL']").attr("disabled", true);

//         setDisabled($("input[id$='txtCOL_NAME']"));
//         setDisabled($("select[id$='txtDATA_TYPE']"));
//         setDisabled($("input[id$='txtDATA_LEN']"));
//         setDisabled($("input[id$='txtDATA_ACC']"));
//         setDisabled($("select[id$='txtIS_AUTO']"));
//         setDisabled($("select[id$='txtISPK']"));
//         setDisabled($("input[id$='txtDVAL']"));
     });

     function ISPK_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtISPK']")[0];
         }
         if (me.value == "1") {
             $("#dlPK_VALCODE").show();
         } else {
             $("#dlPK_VALCODE").hide();
         }
     }

     function selTableField(me) {
         var devObj = $("select[id$='txtDB_SRC']");
         var tbname = $("select[id$='txtTABLE_NAME']").val();
         if (tbname == undefined || tbname == "") {
             alert("����д������"); return;
         }
         var result = window.showModalDialog("TableFieldSel_DEV.aspx?DEV=" + devObj.val() + "&TB=" + tbname + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=700px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����

         if (result == undefined || result == "") {
             return;
         }
         var obj = eval(result);

         $("input[id$='txtCOL_NAME']").val(obj.colname);
         $("input[id$='hidFK_NAME']").val(obj.colname);
         $("select[id$='txtTABLE_NAME']").val(obj.tablename);
         $("input[id$='txtTABLE_NAME1']").val(obj.tablename);
         $("input[id$='hidTABLE_NAME1']").val(obj.tablename);
         $("input[id$='txtCOL_NOTE']").val(obj.colnote);
         //alert(obj.datatype);
         if (obj.datatype.indexOf('(') >= 0)
             $("select[id$='txtDATA_TYPE']").val(obj.datatype.substr(0, obj.datatype.indexOf('(')));
         else
             $("select[id$='txtDATA_TYPE']").val(obj.datatype);

         $("input[id$='txtDATA_LEN']").val(obj.datalen);
         $("input[id$='txtDATA_ACC']").val(obj.datascale);
         $("select[id$='txtIS_AUTO']").val(obj.isAuto);
         $("select[id$='txtISPK']").val(obj.iskey);
         $("input[id$='txtDVAL']").val(obj.defaultValue);

         $("input[id$='txtCOL_SHOW']").val(obj.showname);
         ISPK_CHG();
         DATA_TYPE_CHG();
     }

     function DB_SRC_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtDB_SRC']")[0]; // alert($("select[id$='txtDATA_TYPE']").length);
         }
//         if (me.value == "" || me.value == "AIO") {
//             $("#dlCOL_SYN_TO").hide(); $("#divFKInfo").hide();
//             $("input[id$='txtTABLE_NAME1']").show();$("select[id$='txtTABLE_NAME']").hide();
//         } else {
             $("#dlCOL_SYN_TO").show(); $("#divFKInfo").show();
             $("input[id$='txtTABLE_NAME1']").hide(); $("select[id$='txtTABLE_NAME']").show();
         //}
         //txtTABLE_NAME
         var src = $("input[id$='hidConnSrc']").val();
         var arr = [src];
         if (src.indexOf(",") != -1) {
             arr = src.split(',');
         }
         var selObj = $("select[id$='txtTABLE_NAME']")[0];
         removeAll(selObj);
         //selObj.selectedIndex = 0;
         for (var i = 0; i < arr.length; i++) {
             var aaa = arr[i].split('.');
             if (aaa[0] == me.value) {
                 var li = new Option(aaa[1], aaa[1]);
                 selObj.options.add(li);
             }
         }
     }

     function DATA_TYPE_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtDATA_TYPE']")[0]; // alert($("select[id$='txtDATA_TYPE']").length);
         }
         var dlLen = $("#dlDATA_LEN");
         var dlAcc = $("#dlDATA_ACC");
         var dlPKValCode = $("#dlPK_VALCODE");
         var selIsAuto = $("select[id$='txtIS_AUTO']");
         var selIsPK = $("select[id$='txtISPK']");
         var tp = me.value;
         var tps = dlLen.attr("showtypes"); //alert(tp+"|"+tps);
//         if (tps.indexOf(tp) != -1) {
//             dlLen.show(); $("input[id$='txtDATA_LEN']").val("50");
//             if (tp == "decimal" || tp == "numeric") {
//                 $("input[id$='txtDATA_LEN']").val("25");
//             }
//         } else {
//             dlLen.hide(); $("input[id$='txtDATA_LEN']").val("0");
//         }
         tps = dlAcc.attr("showtypes"); // alert(tps + "|" + tp);
         if (tps.indexOf(tp) != -1) {
             dlAcc.show();
         } else {
             dlAcc.hide();
         }
         tps = selIsAuto.attr("showtypes");
//         if (tps.indexOf(tp) != -1) {
//             selIsAuto.attr("disabled", false);
//         } else {
//             selIsAuto.val("0");
//             selIsAuto.attr("disabled", true);
         //         }
         
         tps = dlPKValCode.attr("showtypes"); // alert(tps + "|" + tp);
         //alert(selIsAuto.val());
         if (tps.indexOf(tp) != -1 && selIsPK.val() == "1") {
             dlPKValCode.show();
         } else {
             dlPKValCode.hide();
         }

     }

</script>
<style type="text/css">
.form dl dt{width:160px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
    <input id="hidConnSrc" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text=""></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="����"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>--%>
   <%-- <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>--%>
    <li><span><input id="Button1" type="button" value="��Ԥ��" onclick="_FormView();"/></span></li>
    <li id="liSetItems" runat="server" visible="false"><span><input  type="button" value="�ؼ��б���" onclick="_SetItems();" style="font-weight:bold;color:#900;"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtCOL_ID" type="hidden" runat="server"/>
           <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
           <div class="grp"><label>��������</label><a>����</a></div>
           <div>
           <dl>
               <dt title="���ֶ����ڱ���ͬ������ϵͳ��ĳ����ֶ���Ϣ">����Դ��</dt>
               <dd><span><select id="txtDB_SRC" runat="server" onchange="DB_SRC_CHG(this);">
                       <option value="AIO">��������Դ</option>
                       <%--<option value="AIO_SYN">����ͬ��</option>--%>
                       <option value="DEV1">�����豸1</option>
                       <option value="DEV2">�����豸2</option>
                       <option value="DEV3">�����豸3</option>
                   </select></span>
               </dd>
           </dl>
          <dl>
               <dt>���������(Ӣ��)��</dt><%--��������--%>
               <dd><span>
                   <select id="txtTABLE_NAME" runat="server">
                      <%-- <option value="">��ѡ��</option>--%>
                   </select>
                    <input id="txtTABLE_NAME1" type="text" class="hide" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}"/>
                    <input id="hidTABLE_NAME" type="hidden" runat="server"/>
                    </span>
               </dd>
           </dl>
           <dl>
               <dt>�ֶ���(Ӣ����ĸ)��</dt><%--����--%>
               <dd><span>
                     <input id="txtCOL_NAME" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}" style="width:70%;"/>
                     <input id="btnSelCol" type="button" value="" class="sel" title="ѡ��������ֶ�" onclick="selTableField(this);" />
                    </span>
               </dd>
           </dl>
           <dl>
               <dt>�ֶ�������</dt><%--��Ĭ����--%>
               <dd><span>
                    <input id="txtCOL_NOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>��</dt><%--��������--%>
               <dd><span>
                   <select id="txtDATA_TYPE" ck="{need:0,len:50,type:0}" runat="server" onchange="DATA_TYPE_CHG(this);">
                   </select></span>
               </dd>
           </dl>
           <dl showtypes="nvarchar,decimal,numeric,nchar" id="dlDATA_LEN">
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>��</dt><%--���ݳ���--%>
               <dd><span>
                    <input id="txtDATA_LEN" type="text" value="0" runat="server" ck="{need:0,len:4000,type:'number'}"/></span>
               </dd>
           </dl>
           <dl showtypes="decimal,numeric" id="dlDATA_ACC">
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>��</dt><%--���ݾ���--%>
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" value="0" runat="server" ck="{need:0,len:12,type:'number'}"/></span>
               </dd>
           </dl>
            <dl>
                   <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>��</dt><%--�Ƿ������ֵ����ֶ�--%>
                   <dd><span>
                       <select id="txtIS_AUTO" runat="server" showtypes="int,bigint,decimal,numeric">
                           <option value="0">�ǵ���</option><option value="1">����</option>
                       </select></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_BILL_COL.Attribute.ISPK.ZhName %>��</dt><%--�Ƿ������ֵ����ֶ�--%>
                   <dd><span>
                       <select id="txtISPK" runat="server" onchange="ISPK_CHG(this);">
                           <option value="0">������</option><option value="1">����</option>
                       </select></span>
                   </dd>
               </dl>
            <dl id="dlPK_VALCODE" showtypes="nvarchar,nchar,ntext,char,varchar">
               <dt>����ֵ�����ʽ��</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtPK_VALCODE" type="text" value="" runat="server" ck="{need:0,len:2147483647,type:'string'}"/></span>
               </dd>
           </dl>
            <dl>
               <dt><%=SYS_BILL_COL.Attribute.DVAL.ZhName %>��</dt><%--Ĭ��ֵ--%>
               <dd><span>
                
                    <input id="txtDVAL" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           </div>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="����"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>--%>
    <li><span><input id="btnFormView" type="button" value="��Ԥ��" onclick="_FormView();"/></span></li>
</ul>
   </div>
</div>
</asp:Content>