<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_F_COLUMNEdit" CodeFile="COLUMNEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
  <script src="../../../../Lib/JScript/myOptions.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

         ctrlTypeChg($("select[name='txtCTRL_TYPE']")[0]);
     });
       var colid = '<%=keyid %>';
       function selFIELD_ID(me) {
           var result = window.showModalDialog('../../FIELD/FIELDSel.aspx?formid=<%=formid %>&r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
           if (result == undefined || result == '') return;

           var obj = eval(result);
           var puts = $(me).parent().find('input');
           puts[0].value = obj.Name;
           puts[1].value = obj.ID;

           if (obj.Code == "Decimal" || obj.Code == "Number") {
               $("dl[id$='dlCAL_FORMULA']").show(); $("dl[id$='dlSUM_FIELD_ID']").show();
           } else {
               $("dl[id$='dlCAL_FORMULA']").hide(); $("dl[id$='dlSUM_FIELD_ID']").hide();
           }

       }

       function ctrlTypeChg(me) {
           var ctrltype = me.value;
           if (ctrltype == "CheckBoxList" || ctrltype == "RadioBoxList" || ctrltype == "SelectDrop") {
               $("#btnAddItem").show();
           } else {
               $("#btnAddItem").hide();
           }
           var dlSel = $("#dlSelTBINFO");
           if (me.value == "OpenSelExistsRec") {
               dlSel.show();
           } else {
               dlSel.hide();
           }
       }

       function ctrlItemSet(me) {
           var result = window.showModalDialog('../COL_ITEM/ITEMManage.aspx?ColID='+colid+'&r=' + Math.random(), 'newwindow', 'dialogHeight=600px; dialogWidth=600px;dialogLeft:;dialogTop:; status=No;');if (!result) {result = window.returnValue;}//jin-shenjian chromeˢ�¸�����
          
       }

       function setColItems(ctrltype) {
           if (ctrltype == "CheckBoxList" || ctrltype == "RadioBoxList" || ctrltype == "SelectDrop") {
               var selObj = $("#selColItems");
               var sel=selObj[0];
               if (colid != "" && selObj.attr("getdata") == undefined) {
                   $.get("COLUMNBack.aspx?getColItems="+Math.random(), { colID: colid, ctrlTypr: ctrltype }, function (dataStr) {
                       alert(dataStr);
                       var arr = eval(dataStr);
                       for (var a = 0; a < arr.length; a++) { 
                           var txt=arr[a].val+"|"+arr[a].txt;
                           addOption(sel,arr[a].val,txt,false);
                       }
                   });
               }
           }
       }

       function selColToCalInput(me) {
           var colname = $(me).attr("data");
           var txtObj = $("input[id$='txtCAL_FORMULA']");


       }
       function selColToSum(me) {
           var colname = $(me).attr("data");
           var txtObj = $("input[id$='txtSUM_FIELD_ID']");

           txtObj.val(colname);
       }


</script>
<style type="text/css">
.bill dl .num-f a{margin-left:5px;color:#009; cursor:pointer;}
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
    <li><span><asp:Button ID="btnOK" runat="server" Text="����"
                onclick="btnOK_Click"/></span></li>
    <%--<li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="bill" id="divForm">
       <div class="rows">
        <input id="txtCOLUMN_ID" type="hidden" runat="server" ck="{need:0,len:99999,type:1}"/>
        <input id="txtFORM_ID" type="hidden" runat="server" ck="{need:0,len:9999,type:1}"/>
        <input id="txtTB_ID" type="hidden" runat="server" ck="{need:0,len:9999,type:1}"/> 
           <dl>
               <dt>��Ӧ���ֶΣ�</dt><%--FIELD_ID--%>
               <dd><span>
                    <input id="txtFIELD_ID" type="text" runat="server" ck="{need:1,len:2147483647,type:0}" style="float:left;width:120px;"/>
                    <input id="hidFIELD_ID" type="hidden"  runat="server"/>
                    <input id="btnSelFIELD_ID" runat="server" class="sel" type="button" onclick="selFIELD_ID(this);" value="" style="float:left;width:30px;" />
                    </span>
               </dd>
           </dl>
           <dl>
               <dt><%=TF_F_COLUMN.Attribute.SHOW_NAME.ZhName %>��</dt><%--��ʾ����--%>
               <dd><span>
                
                    <input id="txtSHOW_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>

           <dl>
               <dt>�ؼ����ͣ�</dt><%--CTRL_TYPE--%>
               <dd><span>
                   <select name="txtCTRL_TYPE" onchange="ctrlTypeChg(this);">
                       <asp:Literal ID="litCTRL_TYPE" runat="server"></asp:Literal>
                   </select>
                   <input value="ѡ��ֵ����" type="button" id="btnAddItem" style="display:none;width:70px;" onclick="ctrlItemSet(this);" />
                   </span>
               </dd>
           </dl>
           <div class="hide" id="dlSelTBINFO">
           <dl>
             <dt>������</dt><dd><span><input id="txtSEL_TBNAME" runat="server" type="text" style="width:120px;" /></span></dd>
           </dl>
           <dl><dt>�����ֶΣ�</dt><dd><select id="txtSEL_KEY" runat="server" style="width:120px;"></select></dd></dl>
           <dl><dt>�����ֶΣ�</dt><dd><select id="txtSEL_NAME" runat="server" style="width:120px;"></select></dd></dl>
           </div>
           <dl>
               <dt>���ֵ��</dt><%--MAX_VAL--%>
               <dd><span>
                
                    <input id="txtMAX_VAL" type="text" runat="server" value="0" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>��Сֵ��</dt><%--MIN_VAL--%>
               <dd><span>
                
                    <input id="txtMIN_VAL" type="text" runat="server" value="0" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>�Ƿ���</dt><%--IS_NEED--%>
               <dd><span> <input id="txtIS_NEED" type="checkbox" runat="server" /></span>
               </dd>
           </dl>
            <dl>
               <dt>��ʾ�ڱ���</dt><%--IS_NEED--%>
               <dd><span> <input id="txtSHOWIN_FORM" type="checkbox" runat="server" checked="checked" /></span>
               </dd>
           </dl>
           <dl>
               <dt>��ʾ���б�ͷ��</dt><%--IS_NEED--%>
               <dd><span> <input id="txtSHOWIN_HEADR" type="checkbox" runat="server" /></span>
               </dd>
           </dl>
           <dl>
               <dt>�ύʱ��д��</dt><%--IS_NEED--%>
               <dd><span> <input id="Checkbox1" type="checkbox" runat="server" checked="checked" /></span>
               </dd>
           </dl>
           <dl>
               <dt>��ţ�</dt><%--SORT_NO--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" value="1" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>Ĭ��ֵ��</dt><%--Ĭ��ֵ--%>
               <dd><span>
                
                    <input id="txtDEFAULT_VAL" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="row" id="dlCAL_FORMULA" runat="server">
               <dt>�м��㹫ʽ��</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtCAL_FORMULA" type="text" runat="server" ck="{need:0,len:999,type:0}"/><a>�磺DJ*SL</a></span>
                    <div class="num-f">
                        <b>��ѡ�����У�</b><asp:Literal ID="litNumberFields" runat="server"></asp:Literal>
                    </div>
               </dd>
           </dl>
           <dl class="row" id="dlSUM_FIELD_ID" runat="server">
               <dt>�ϼƵ������ֶΣ�</dt><%--SORT_NO--%>
               <dd><span>
                    <input id="txtSUM_FIELD_ID" type="text" runat="server" ck="{need:0,len:999,type:0}" readonly="readonly"/></span>
                    <div class="num-f">
                        <b>��ѡ�����У�</b><asp:Literal ID="litSUM_FIELD_ID" runat="server"></asp:Literal>
                    </div>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="����"
                onclick="btnOK_Click"/></span></li>
   <%-- <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>