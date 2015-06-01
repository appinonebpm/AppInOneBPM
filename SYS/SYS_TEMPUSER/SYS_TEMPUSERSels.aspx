<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_TEMPUSERSels.aspx.cs" Inherits="SYS_TEMPUSERSels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
    <script src="../../Lib/Mdl/Sels.js" type="text/javascript"></script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>��ѡ</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="ID">
               <dt><%=SYS_TEMPUSER.Attribute.ID.ZhName %>��</dt><!--ID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NAME">
               <dt><%=SYS_TEMPUSER.Attribute.NAME.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CONAME">
               <dt><%=SYS_TEMPUSER.Attribute.CONAME.ZhName %>��</dt><!--��λ-->
               <dd><span>
               
                    <input id="txtCONAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PHONE">
               <dt><%=SYS_TEMPUSER.Attribute.PHONE.ZhName %>��</dt><!--�ֻ�����-->
               <dd><span>
               
                    <input id="txtPHONE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IP">
               <dt><%=SYS_TEMPUSER.Attribute.IP.ZhName %>��</dt><!--IP-->
               <dd><span>
               
                    <input id="txtIP" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=SYS_TEMPUSER.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="LOGINNAME">
               <dt><%=SYS_TEMPUSER.Attribute.LOGINNAME.ZhName %>��</dt><!--��¼��-->
               <dd><span>
               
                    <input id="txtLOGINNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PWD">
               <dt><%=SYS_TEMPUSER.Attribute.PWD.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtPWD" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="USER_ID">
               <dt><%=SYS_TEMPUSER.Attribute.USER_ID.ZhName %>��</dt><!--�û����-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="��ѯ" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "ȷ��ѡ��") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "���") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "ȫѡ") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "ѡ��") %></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.NAME._ZhName %><!--����--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.CONAME._ZhName %><!--��λ--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.PHONE._ZhName %><!--�ֻ�����--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.IP._ZhName %><!--IP--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.LOGINNAME._ZhName %><!--��¼��--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.PWD._ZhName %><!--����--></td>
                    
                    
                    <td><%=SYS_TEMPUSER.Attribute.USER_ID._ZhName %><!--�û����--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((SYS_TEMPUSER)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).CONAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).IP %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).LOGINNAME %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).PWD %></td>
                    
                    
                    <td><%#((SYS_TEMPUSER)Container.DataItem).USER_ID %></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
        </table>
    </div>
    <div class="pages">
         <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
     </div>
     </div>
     </div>
 </div>
</asp:Content>
