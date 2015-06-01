<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_TB_FIELDEdit" CodeFile="FIELDEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
    <script src="../../../../Lib/JScript/myOptions.js" type="text/javascript"></script>
 <script type="text/javascript">
     $(function () {

         var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });

//         var str = "({'o_1':[{name:'�����ı�',val:'InputText'}],'o_2':[{name:'HTML����',val:'HTML'},{name:'���ı�����',val:'Text'}],'o_3':[{name:'�����ı�',val:'InputText'}],'o_4':[{name:'�����ı�',val:'InputText'}],'o_5':[{name:'�����ı�',val:'InputText'}]})";
//         var obj = eval(str);
//         var aaa = obj["o_1"];
//         alert(aaa[0].name); 

         setCtrlType($("select[id$='txtFIELD_TYPE']")[0]);
     });

       function setCtrlType(me) {
           var selObj = $("select[id$='selCtrlType']");
           removeAll(selObj[0]);
           var dataObj =eval($(me).next().val());
           var obj = dataObj["o_"+me.value];
           var aaa = "";//  selObj.next().val();
           if (obj != null && obj != undefined) {
               for (var a = 0; a < obj.length; a++) {
                   if (aaa == "") { aaa = obj[a].val; }
                   if (obj[a].val == selObj.next().val()) {
                      
                       addOption(selObj[0], obj[a].val, obj[a].name, true);
                    }
                   else {
                       addOption(selObj[0], obj[a].val, obj[a].name, false);
                   }
               }
           }
           selObj.next().val(aaa);
       }

       function selCtrlTypeChg(me) {
           $(me).next().val(me.value);
       }
</script>
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
  <%--  <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
          <input id="txtFIELD_ID" type="hidden" runat="server"/>
          <dl>
               <dt>��������</dt><%--������--%>
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>�ֶ�����</dt><%--�ֶ���--%>
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server" ck="{need:0,len:50,type:0,reg:'^\\w+?$'}"/></span>
               </dd>
           </dl>
            <dl>
               <dt>�������ͣ�</dt>
               <dd><span>
               
                    <select id="txtFIELD_TYPE" runat="server" ck="{need:0,len:50,type:0}" onchange="setCtrlType(this);">
                    </select><input id="hidCtrlTypeData" type="hidden" runat="server" /></span>
               </dd>
           </dl>
          <dl>
               <dt>Ĭ�Ͽؼ����ͣ�</dt>
               <dd><span>
                <select id="selCtrlType" runat="server" ck="{need:1,len:50,type:0}" onchange="selCtrlTypeChg(this);">
                    </select><input id="txtCTRL_TYPE" type="hidden" runat="server" ck="{need:0,len:20,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>����գ�</dt><%--IS_NULL--%>
               <dd class="ckbs"><span>
                
                    <input id="txtIS_NULL" type="checkbox" checked="checked" runat="server"/> <label for='<%=txtIS_NULL.ClientID %>'>�����</label></span>
               </dd>
           </dl>
           <dl>
               <dt>��ӵ�����Ŀ��</dt><%--IS_NULL--%>
               <dd class="ckbs"><span>
                
                    <input id="ckAddToFormCol" type="checkbox" checked="checked" runat="server"/> </span>
               </dd>
           </dl>
           <dl>
               <dt>Ĭ��ֵ��</dt><%--Ĭ��ֵ--%>
               <dd><span>
                
                    <input id="txtDEFAULT_VAL" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt>��ţ�</dt><%--���--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" value="1" runat="server" ck="{need:1,len:88,type:1}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
   <%-- <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>--%>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>