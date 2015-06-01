<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_KNMAEdit" CodeFile="KM_KNMAEdit.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
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
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
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
        
           <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_ID.ZhName %>��</dt><%--֪ʶ��ʶ--%>
               <dd><span>
                
                    <input id="txtKNMA_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.KNMA_NAME.ZhName %>��</dt><%--֪ʶ����--%>
               <dd><span>
                
                    <input id="txtKNMA_NAME" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.P_KNMA_ID.ZhName %>��</dt><%--����ID--%>
               <dd><span>
                
                    <input id="txtP_KNMA_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CONTENT.ZhName %>��</dt><%--֪ʶ����--%>
               <dd><span>
                
                    <input id="txtCONTENT" type="text" runat="server" ck="{need:0,len:16,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CLASS_ID.ZhName %>��</dt><%--֪ʶ���--%>
               <dd><span>
               
                    <select id="txtCLASS_ID" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.UP_TYPE.ZhName %>��</dt><%--�ϴ��ĵ�����--%>
               <dd><span>
               
                    <select id="txtUP_TYPE" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EA_SIGN.ZhName %>��</dt><%--������־--%>
               <dd><span>
               
                    <select id="txtEA_SIGN" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.AUTHOR.ZhName %>��</dt><%--����--%>
               <dd><span>
                
                    <input id="txtAUTHOR" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.SORT_NO.ZhName %>��</dt><%--���--%>
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" ck="{need:0,len:2147483647,type:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.DEPT_ID.ZhName %>��</dt><%--���ű��--%>
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" ck="{need:0,len:50,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.ADD_TIME.ZhName %>��</dt><%--�ļ�¼��ʱ��--%>
               <dd><span>
               
                    <input id="txtADD_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_TIME.ZhName %>��</dt><%--�ļ��༭ʱ��--%>
               <dd><span>
               
                    <input id="txtEDIT_TIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:0,len:100,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.PATH_ID.ZhName %>��</dt><%--�ϼ����--%>
               <dd><span>
                
                    <input id="txtPATH_ID" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CAN_EDIT.ZhName %>��</dt><%--����ͬ�༭--%>
               <dd><span>
               
                    <select id="txtCAN_EDIT" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.CAN_COMMENTS.ZhName %>��</dt><%--��������--%>
               <dd><span>
               
                    <select id="txtCAN_COMMENTS" runat="server" ck="{need:0,len:10,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.ADD_USER.ZhName %>��</dt><%--¼����--%>
               <dd><span>
                
                    <input id="txtADD_USER" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EDIT_USER.ZhName %>��</dt><%--�༭��--%>
               <dd><span>
               
                    <FCKV2:FCKeditor ID="txtEDIT_USER" runat="server" Height="250" Width="400" ToolbarSet="Basic" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.S_LEVEL.ZhName %>��</dt><%--��ȫ����--%>
               <dd><span>
                
                    <input id="txtS_LEVEL" type="text" runat="server" ck="{need:0,len:10,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP1.ZhName %>��</dt><%--�Զ���1--%>
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP2.ZhName %>��</dt><%--�Զ���2--%>
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP3.ZhName %>��</dt><%--�Զ���3--%>
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=KM_KNMA.Attribute.EXP4.ZhName %>��</dt><%--�Զ���4--%>
               <dd><span>
                
                    <input id="txtEXP4" type="text" runat="server" ck="{need:0,len:40,type:0}"/></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
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