<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTEdit.aspx.cs" Inherits="WEC_PUBLICLISTEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
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
<div class="form" id="divForm">
       <div>
        
           <dl class="hide">
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>��</dt><%--���ں�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtAID" type="text" runat="server" ck="{type:1,min:0,need:0}"/></span>
               </dd>
           </dl>
           <dl class="hide">
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>��</dt><%--�û�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtUSER_ID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>��</dt><%--���ں�����--%>
               <dd><span>
               <!--����-->
                    <input id="txtPLC_NAME" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>��</dt><%--ԭʼID--%>
               <dd><span>
               <!--����-->
                    <input id="txtPLC_SOURCEID" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>��</dt><%--΢�ź�--%>
               <dd><span>
               <!--����-->
                    <input id="txtWECHAT_ID" type="text" runat="server" ck="{type:0,min:0}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>��</dt><%--ͼƬ��ַ--%>
               <dd><span>
               
                    <textarea id="txtAVATAR_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>��</dt><%--API��ַ--%>
               <dd><span>
               
                    <textarea id="txtAPI_KEY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>��</dt><%--TOKEN--%>
               <dd><span>
               <!--����-->
                    <input id="txtTOKEN" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtLOCATION" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>��</dt><%--����--%>
               <dd><span>
               <!--����-->
                    <input id="txtEMAIL" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>��</dt><%--��˿��--%>
               <dd><span>
               <!--����-->
                    <input id="txtFUNS" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>��</dt><%--��������--%>
               <dd><span>
               <!--����-->
                    <input id="txtTYPE" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>��</dt><%--��ʼʱ��--%>
               <dd><span>
               
                    <input id="txtSTART_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>��</dt><%--����ʱ��--%>
               <dd><span>
               
                    <input id="txtEND_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               <!--����-->
                    <input id="txtSTATUS" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>��</dt><%--�ײ�����--%>
               <dd><span>
               <!--����-->
                    <input id="txtPACKAGE_ID" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>��</dt><%--��ע�ظ�����--%>
               <dd><span>
               
                    <select id="txtIS_NEWS" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>��</dt><%--Ĭ����ƥ��ظ�--%>
               <dd><span>
               
                    <textarea id="txtDEFAULT_REPLAY" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server" ck="{need:1,len:500,type:0}" /></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>��</dt><%--�Ƿ���--%>
               <dd><span>
               
                    <select id="txtDEFAULT_REPLAY_FALG" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>��</dt><%--Ĭ��LBS��ѯ--%>
               <dd><span>
               <!--����-->
                    <input id="txtLBS_DISTANCE" type="text" runat="server" ck="{type:1,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>��</dt><%--APPID--%>
               <dd><span>
               <!--����-->
                    <input id="txtAPPID" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>��</dt><%--APPSECR--%>
               <dd><span>
               <!--����-->
                    <input id="txtAPPSESECRET" type="text" runat="server" ck="{type:0,min:0,need:1}"/></span>
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