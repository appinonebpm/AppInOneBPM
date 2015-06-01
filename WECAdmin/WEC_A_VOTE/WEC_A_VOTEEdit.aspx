<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTEEdit.aspx.cs" Inherits="WEC_A_VOTEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           //var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
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
<%--<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>--%>
<div class="form" id="divForm">
       <div>
        
           <dl >
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>��</dt><%--���--%>
               <dd><span>
               <!--����-->
                    <input id="txtID" type="text" runat="server" ck="{type:1,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl >
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>��</dt><%--���ںű��--%>
               <dd><span>
               <!--����-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,max:18,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>��</dt><%--�ؼ���--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtKEYWORD.ClientID%>');
                        });
                    </script>
                    <input id="txtKEYWORD" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>��</dt><%--ͶƱ����--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtTITLE.ClientID%>');
                        });
                    </script>
                    <input id="txtTITLE" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>��</dt><%--ͶƱͼƬ--%>
               <dd><span>
                             
                    <script type="text/javascript">
                        $(function () {
                            var smImage = new creatSmImage('#btntxtPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidtxtPICURL.ClientID%>');
                        });
                    </script>
                    <div class="controls">
					    <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btntxtPICURL">ѡ��ͼ�ķ���</a></span>  �����С(��720��400)
                        <input type="hidden" id="hidtxtPICURL" runat="server" />
                    </div></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>��</dt><%--ͶƱ˵��--%>
               <dd><span>
               
                    <script type="text/javascript">
                        $(function () {
                            var kindEditor = new creatKindEditor('#<%=txtINSTRUCTION.ClientID%>');
                        });
                    </script>
                    <input id="txtINSTRUCTION" type="text"  runat="server" style="width:668px;height:230px;" ck="{need:1,len:500,type:0}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>��</dt><%--ͼƬ��ʾ--%>
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>��</dt><%--�Ƿ��ѡ--%>
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>��</dt><%--��ѡ����--%>
               <dd><span>
               <!--����-->
                    <input id="txtSELECT_NUM" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>��</dt><%--ʱ������--%>
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:500,type:3}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>��</dt><%--ͶƱ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtRESULT" type="text" runat="server" ck="{type:1,min:0,max:4,need:1}"/></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>��</dt><%--�Ƿ����--%>
               <dd><span>
               
                    <select id="txtSHARE" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>��</dt><%--���--%>
               <dd><span>
               
                    <select id="txtKIND" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
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