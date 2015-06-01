<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_APPSels.aspx.cs" Inherits="SYS_APPSels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
         
            <dl colname="APP_ID">
               <dt><%=SYS_APP.Attribute.APP_ID.ZhName %>��</dt><!--APP_ID-->
               <dd><span>
               
                    <input id='txtAPP_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="APP_NAME">
               <dt><%=SYS_APP.Attribute.APP_NAME.ZhName %>��</dt><!--APP_NAM-->
               <dd><span>
               
                    <input id='txtAPP_NAME' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="APP_LABEL">
               <dt><%=SYS_APP.Attribute.APP_LABEL.ZhName %>��</dt><!--Ӧ��ϵͳ��-->
               <dd><span>
               
                    <input id='txtAPP_LABEL' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_URL">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL.ZhName %>��</dt><!--�ڲ���ҳ��ַ-->
               <dd><span>
               
                    <input id='txtDEFAULT_URL' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_URL_NAME">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL_NAME.ZhName %>��</dt><!--�ڲ���ҳ����-->
               <dd><span>
               
                    <input id='txtDEFAULT_URL_NAME' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="IsBigSystem">
               <dt><%=SYS_APP.Attribute.IsBigSystem.ZhName %>��</dt><!--�Ƿ����ϵͳ-->
               <dd><span>
               
                    <select id='txtIsBigSystem' runat='server'>
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="Note">
               <dt><%=SYS_APP.Attribute.Note.ZhName %>��</dt><!--��ע-->
               <dd><span>
               
                    <input id='txtNote' type='text' runat='server'/>

               </span></dd>
        </dl>
        
            <dl colname="APP_IMG">
               <dt><%=SYS_APP.Attribute.APP_IMG.ZhName %>��</dt><!--ͼ��-->
               <dd><span>
               
                    <input id='txtAPP_IMG' type='text' runat='server'/>
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
                    
                    
                    <td><%=SYS_APP.Attribute.APP_ID._ZhName %><!--APP_ID--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.APP_NAME._ZhName %><!--APP_NAM--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.APP_LABEL._ZhName %><!--Ӧ��ϵͳ��--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.DEFAULT_URL._ZhName %><!--�ڲ���ҳ��ַ--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.DEFAULT_URL_NAME._ZhName %><!--�ڲ���ҳ����--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.IsBigSystem._ZhName %><!--�Ƿ����ϵͳ--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.Note._ZhName %><!--��ע--></td>
                    
                    
                    <td><%=SYS_APP.Attribute.APP_IMG._ZhName %><!--ͼ��--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((SYS_APP)Container.DataItem).APP_ID %>" /></td>
                     
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_ID %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_NAME %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_LABEL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL_NAME %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(SYS_APP.Attribute.IsBigSystem, ((SYS_APP)Container.DataItem).IsBigSystem)%></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((SYS_APP)Container.DataItem).Note) %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_IMG %></td>
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
