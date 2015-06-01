<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTEdit.aspx.cs" Inherits="WEC_REQUESTEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script type="text/javascript">
       $(function () {
           var checker = new formChecker({ btnIDS: 'btnOK,btnSave' });
           var smImage = new creatSmImage('#btnPICURL', '#<%=txtPICURL.ClientID%>', '#<%=hidPICURL.ClientID%>');
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
        
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.TID.ZhName %>��</dt><%--�ظ�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtTID" type="text" runat="server" ck="{type:0,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>��</dt><%--���ں�ID--%>
               <dd><span>
               <!--����-->
                    <input id="txtAID" type="text" runat="server" ck="{type:0,min:0,max:18,need:0}"/></span>
               </dd>
           </dl>
           <% if (!kind.Equals("0"))
              { %>
           <dl>
               <dt><%=WEC_REQUEST.Attribute.KEYWORD.ZhName%>��</dt><%--�ؼ���--%>
               <dd><span>
               <!--����-->
                    <input id="txtKEYWORD" type="text" runat="server" ck="{type:0,min:0,max:50,need:1}"/></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST.Attribute.MATCH_TYPE.ZhName%>��</dt><%--ƥ������--%>
               <dd><span>
               
                    <select id="txtMATCH_TYPE" runat="server" ck="{need:1,len:4,type:1}">
                    </select></span>
               </dd>
           </dl>
           <% } %>
           <dl>
               <dt><%=WEC_REQUEST.Attribute.MEMO.ZhName %>��</dt><%--����--%>
               <dd>
               <!--����-->
                    
                    <% if (kind.Equals("5"))
                       { %>
                   <div class="controls">
					    <img id="txtPICURL" runat="server" style="max-height:100px;vertical-align: middle;">
                        <span class="insertimage"><a id="btnPICURL">ѡ��ͼƬ</a></span> 
                        <input type="hidden" id="hidPICURL" runat="server" />
                    </div>
                     <% }
                       else
                       { %>
                     <input id="txtMEMO" type="text" runat="server" ck="{type:0,min:0,max:3000,need:0}"/></span>
                      <% } %>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.KIND.ZhName %>��</dt><%--�ظ�����--%>
               <dd><span>
               
                    <select id="txtKIND" runat="server" ck="{need:1,len:4,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl>
               <dt><%=WEC_REQUEST.Attribute.STATUS.ZhName %>��</dt><%--״̬--%>
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" ck="{need:1,len:4,type:0}">
                    </select></span>
               </dd>
           </dl>
           <dl class = "hide">
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>��</dt><%--���ʱ��--%>
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" ck="{need:1,len:8,type:3}" /></span>
               </dd>
           </dl>
       </div>
       <div class="clear"></div>
    </div>
   <div class="bottomtool">
      <ul>
    <% if (!kind.Equals("0"))
        { %>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <% } %>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <% if (!kind.Equals("0"))
               { %>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
    <%}%>
</ul>
   </div>
</div>
</asp:Content>