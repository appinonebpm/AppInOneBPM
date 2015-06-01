<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_BILL_COLEditTBClient" CodeFile="COLEditTBClient.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../../Lib/MyDP/selDate.js" type="text/javascript"></script>
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
         //DATA_TYPE_CHG();
         checkTBName();
         ISPK_CHG();
     });

     function ISPK_CHG(me) {
         if (me == undefined) {
             me = $("select[id$='txtISPK']")[0];
         }
         var dtype = $("select[id$='txtDATA_TYPE']").val();
         if (me.value == "1" && (dtype == "nvarchar" || dtype == "varchar" || dtype == "nchar")) {
             $("#dlPK_VALCODE").show();
         } else {
             $("#dlPK_VALCODE").hide();
         }
     }

     function selTableField(me) {
         var devObj = $("select[id$='txtCONN_SOURCE']");
         var result = "";
         if (devObj.val() == "" || devObj.val() == "AIO") {
             result = window.showModalDialog("../TableFieldSel.aspx?modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
         } else {

             result = window.showModalDialog("../TableFieldSel_DEV.aspx?DEV=" + devObj.val() + "&TB=" + $("input[id$='txtTABLE_NAME']").val() + "&modlg=" + Math.random(), "newwindow", "dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;");if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
         }
        
         if (result == undefined || result == "") {
             return;
         }
         var obj = eval(result); 

         $("input[id$='txtCOL_NAME']").val(obj.colname);
         $("input[id$='hidFK_NAME']").val(obj.colname);
         $("input[id$='txtTABLE_NAME']").val(obj.tablename);
         $("input[id$='txtCOL_SHOW']").val(obj.showname);
         $("input[id$='txtCOL_NOTE']").val(obj.colnote);
         $("select[id$='txtDATA_TYPE']").val(obj.datatype);
        
         checkTBName();
         DATA_TYPE_CHG();
        
     }


       function DATA_TYPE_CHG(me) {
           if (me == undefined) {
               me = $("select[id$='txtDATA_TYPE']")[0];// alert($("select[id$='txtDATA_TYPE']").length);
           }
           var dlLen = $("#dlDATA_LEN");
           var dlAcc = $("#dlDATA_ACC");
           var selIsAuto = $("select[id$='txtIS_AUTO']");
           var tp = me.value;
           var tps = dlLen.attr("showtypes");//alert(tp+"|"+tps);
           if (tps.indexOf(tp) != -1) {
               dlLen.show(); $("input[id$='txtDATA_LEN']").val("50");
               if (tp == "decimal" || tp == "numeric") {
                   $("input[id$='txtDATA_LEN']").val("25");
               }
           } else {
               dlLen.hide(); $("input[id$='txtDATA_LEN']").val("0");
           }
           tps = dlAcc.attr("showtypes");// alert(tps + "|" + tp);
           if (tps.indexOf(tp) != -1) {
               dlAcc.show();
           } else {
               dlAcc.hide();
           }
           tps = selIsAuto.attr("showtypes");
           if (tps.indexOf(tp) != -1) {
               selIsAuto.attr("disabled", false);
           } else {
               selIsAuto.val("0");
               selIsAuto.attr("disabled", true);
           }
       }

       function checkTBName(me) {
           if (me == undefined) {
               me = $("input[id$='txtTABLE_NAME']")[0]; 
           }
           if (me.value != $(me).next().val()) {
               $("#divFKInfo").show();
           } else {
               $("#divFKInfo").hide();
           }
       }
</script>
<style type="text/css">
.form dl dt{width:160px; }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b>�ֶ���Ϣ�༭</b></dt></dl>
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
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
    <li id="liSetItems" runat="server" visible="false"><span><input  type="button" value="�ؼ��б���" onclick="_SetItems();" style="font-weight:bold;color:#900;"/></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
           <input id="txtCOL_ID" type="hidden" runat="server"/>
           <input id="txtBILL_ID" type="hidden" runat="server" ck="{need:1,len:2147483647,type:1}"/>
           <div class="grp"><label>�ֶ�����</label></div>
           <div>
           <dl class="hide">
               <dt title="���ֶ����ڱ���ͬ������ϵͳ��ĳ����ֶ���Ϣ">����ͬ����������Դ��</dt>
               <dd><span><select id="txtCONN_SOURCE" runat="server" onchange="CONN_SOURCE_CHG(this);">
                       <option value="AIO">����</option>
                       <option value="AIO_SYN">ͬ�����ͬ��</option>
                       <option value="DEV1">�����豸1</option>
                       <option value="DEV2">�����豸2</option>
                       <option value="DEV3">�����豸3</option>
                   </select></span>
               </dd>
           </dl>
          <dl>
               <dt>�ֶ�ע�ͣ�</dt><%--��Ĭ����--%>
               <dd><span>
                    <input id="txtCOL_NOTE" type="text" runat="server" ck="{need:1,len:50,type:0}"/></span>
               </dd>
           </dl>
          <dl>
               <dt>���������(Ӣ��)��</dt><%--��������--%>
               <dd><span>
                    <input id="txtTABLE_NAME" type="text" onblur="checkTBName(this);" runat="server" ck="{need:1,len:50,type:'string',reg:'^\\w+?$'}"/>
                    <input id="hidTABLE_NAME" type="hidden" runat="server"/>
                    </span>
               </dd>
           </dl>
            
           <dl>
               <dt>�ֶ���(Ӣ����ĸ)��</dt><%--�ֶ���--%>
               <dd><span>
                     <a>U_</a>
                     <input id="txtCOL_NAME" type="text" runat="server" ck="{need:1,len:50,type:'string',reg:'^\\w+?$'}" style="width:70%;"/>
                     <input id="btnSelCol" runat="server" type="button" value="" class="hide" title="ѡ��������ֶ�" onclick="selTableField(this);return false;" />
                    </span>
               </dd>
           </dl>
           <div id="divFKInfo" class="hide">
             <dl>
               <dt>������ֵ�ֶ�(Ӣ��)��</dt><%--������ʾ��Ϣ������--%>
               <dd><span>
                
                    <input id="hidFK_NAME" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}"/></span>
               </dd>
              </dl>
            <dl>
               <dt>�����������ֶ�(Ӣ��)��</dt><%--������ʾ��Ϣ������--%>
               <dd><span>
                
                    <input id="txtCOL_SHOW" type="text" runat="server" ck="{need:0,len:50,type:'string',reg:'^\\w+?$'}"/></span>
               </dd>
            </dl>
            </div>
           <dl>
               <dt><%=SYS_BILL_COL.Attribute.DATA_TYPE.ZhName %>��</dt><%--��������--%>
               <dd><span><select id="txtDATA_TYPE" ck="{need:0,len:50,type:0}" runat="server" onchange="DATA_TYPE_CHG(this);">
                      <%-- <option value="nvarchar">nvarchar</option>
                       <option value="int">int</option>
                       <option value="bigint">bigint</option>
                       <option value="date">date</option>
                       <option value="datetime">datetime</option>
                       <option value="decimal">decimal</option>
                       <option value="ntext">ntext</option>
                       <option value="float">float</option>
                       <option value="numeric">numeric</option>
                       <option value="nchar">nchar</option>--%>
                   </select></span>
               </dd>
           </dl>
           <dl showtypes="nvarchar,decimal,numeric,nchar" id="dlDATA_LEN">
               <dt><%=SYS_BILL_COL.Attribute.DATA_LEN.ZhName %>��</dt><%--���ݳ���--%>
               <dd><span>
                    <input id="txtDATA_LEN" type="text" value="0" runat="server" ck="{need:1,len:4000,type:'number'}"/></span>
               </dd>
           </dl>
           <dl showtypes="decimal,numeric" id="dlDATA_ACC">
               <dt><%=SYS_BILL_COL.Attribute.DATA_ACC.ZhName %>��</dt><%--���ݾ���--%>
               <dd><span>
                
                    <input id="txtDATA_ACC" type="text" value="0" runat="server" ck="{need:1,len:12,type:'number'}"/></span>
               </dd>
           </dl>
            <dl class="hide">
                   <dt><%=SYS_BILL_COL.Attribute.IS_AUTO.ZhName %>��</dt><%--�Ƿ������ֵ����ֶ�--%>
                   <dd><span>
                       <select id="txtIS_AUTO" runat="server" showtypes="int,bigint,decimal,numeric">
                           <option value="0">��</option><option value="1">��</option>
                       </select></span>
                   </dd>
               </dl>
               <dl>
                   <dt><%=SYS_BILL_COL.Attribute.ISPK.ZhName %>��</dt><%--�Ƿ������ֵ����ֶ�--%>
                   <dd><span>
                       <select id="txtISPK" runat="server" onchange="ISPK_CHG(this);">
                           <option value="0">��</option><option value="1">��</option>
                       </select></span>
                   </dd>
               </dl>

           <dl>
               <dt>����ţ�</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtSORT_NO" type="text" value="1" runat="server" ck="{need:0,len:2147483647,type:'number'}"/>
                   </span>
               </dd>
           </dl>
           
         <%--  </div>
           <div class="grp"><label>�ֶ�����</label><a>չ��</a></div>
           <div class="hide">--%>
           <dl class="hide">
               <dt><%=SYS_BILL_COL.Attribute.TITLE.ZhName %>��</dt><%--��ʾ����--%>
               <dd><span>
                
                    <input id="txtTITLE" type="text" runat="server" ck="{need:0,len:250,type:0}"/></span>
               </dd>
           </dl>
           <dl id="dlPK_VALCODE" showtypes="nvarchar,nchar,ntext,char,varchar">
               <dt>����ֵ�����ʽ��</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtPK_VALCODE" type="text" value="" runat="server" ck="{need:0,len:2147483647,type:'string'}"/></span>
               </dd>
           </dl> 
               
               <dl class="hide">
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
</ul>
   </div>
</div>
</asp:Content>