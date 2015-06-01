<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_STEP_TPLEdit" CodeFile="STEPEdit.aspx.cs" %>
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
           $("#saveSpan input").click(function () {
               window.parent.opener.stepName = $("#stepName input").val();
               window.parent.opener.updateStepName(<%=keyid %>);
           });
       });
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
    <li><span class="btn" id="saveSpan"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" runat="server" id="btnCloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
        <input id="txtSTEP_ID" type="hidden" runat="server"/>
            <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.WFID.ZhName%>��</dt><%--���̷�����--%>
               <dd><span>
                
                    <input id="txtWFCID" readonly="readonly"  class="dis" type="text" runat="server"/></span>
               </dd>
           </dl>
            <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.PROCID.ZhName %>��</dt><%--��������ID--%>
               <dd><span>
                
                    <input id="txtPROCID" type="text" class="dis" readonly="readonly" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
            <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.STEP_TYPE.ZhName %>��</dt><%--״̬--%>
               <dd><span>               
                    <select id="txtSTEP_TYPE" runat="server" ck="{need:0,len:2,type:0}">
                    <option value="0">��ʼ</option>
                    <option value="1">�</option>
                    <option value="2">·��</option>
                    <option value="3">����</option>
                    </select></span>
               </dd>
           </dl>
            <dl>
               <dt><%=WF_STEP_TPL.Attribute.STEP_NAME.ZhName %>��</dt><%--������--%>
               <dd><span id="stepName">
                    <input id="txtSTEP_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt>����޶���ֱ��ͨ����</dt><%--״̬--%>
               <dd><span>               
                    <select id="Select2" runat="server" ck="{need:0,len:2,type:0}">
                    <option value="1">��</option>
                    <option value="2">��</option>
                    </select></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.STEP_TYPE.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="Select1" runat="server" ck="{need:0,len:2,type:0}">
                    <option value="1">�</option>
                    <option value="2">·��</option>
                    </select></span>
               </dd>
           </dl>
           <asp:Literal ID="litMore" runat="server"></asp:Literal>
           <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.CONDITION.ZhName %>��</dt><%--����˲�������--%>
               <dd><span>
               
                    <textarea id="txtSHOW_CONDITION" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WF_STEP_TPL.Attribute.FORMULAR.ZhName %>��</dt><%--����˲���������ʽ--%>
               <dd><span>
               
                    <textarea id="txtSHOW_FORMULA" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:0,len:350,type:0}" /></span>
               </dd>
           </dl>
          
           <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.LIFE_TIME.ZhName %>��</dt><%--�������--%>
               <dd><span>
               <!--����-->
                    <input id='txtWF_STEP_TPL_LIFE_TIME' type='text' runat='server' ck='{type:1,min:0,max:4,need:0}'/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WF_STEP_TPL.Attribute.TIME_UNIT.ZhName %>��</dt><%--ʱ�䵥λ--%>
               <dd><span>
               <!--����-->
                    <input id='txtWF_STEP_TPL_TIME_UNIT' type='text' runat='server' ck='{type:1,min:0,max:4,need:0}'/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.ISPASS_NO_OBJ.ZhName %>��</dt><%--����޶���ֱ��--%>
               <dd><span>
               
                    <input id='txtWF_STEP_TPL_ISPASS_NO_OBJ' type='checkbox' class='ckb' runat='server' /></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.ISALLOW_GOTO.ZhName %>��</dt><%--�������ƽ�--%>
               <dd><span>
               
                    <input id='txtWF_STEP_TPL_ISALLOW_GOTO' type='checkbox' class='ckb' runat='server' /></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.ISALLOW_CHANGE_CHECKERS.ZhName %>��</dt><%--ʵ�����������--%>
               <dd><span>
               
                    <input id='txtWF_STEP_TPL_ISALLOW_CHANGE_CHECKERS' type='checkbox' class='ckb' runat='server' /></span>
               </dd>
           </dl>

           <dl>
               <dt><%=WF_STEP_TPL.Attribute.NOTE.ZhName %>��</dt><%--��ע--%>
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WF_STEP_TPL.Attribute.BACK_TYPE.ZhName %>��</dt><%--���·�������--%>
               <dd><span>
                    <select id="txtBACK_TYPE" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
            <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.ISALLOW_EDIT.ZhName %>��</dt><%--������˺��޸�--%>
               <dd><span>
               
                    <input id='txtISALLOW_EDIT' type='checkbox' class='ckb' runat='server' /></span>
               </dd>
           </dl>
            <dl class = "">
               <dt><%=WF_STEP_TPL.Attribute.ISSTOP_EDIT.ZhName %>��</dt><%--��ֹ�����޸�--%>
               <dd><span>
               
                    <input id='txtISSTOP_EDIT' type='checkbox' class='ckb' runat='server' /></span>
               </dd>
           </dl>
           <dl class ="hide">
               <dt><%=WF_STEP_TPL.Attribute.NOTICE_MBR.ZhName %>��</dt><%--���·�������--%>
               <dd><span>
                    <selStaffs:wucSelStaffs ID="wucSelStaff1" runat="server" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
     
   </div>
</div>
</asp:Content>