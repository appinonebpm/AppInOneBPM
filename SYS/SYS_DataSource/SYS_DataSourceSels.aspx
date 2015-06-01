<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_DATASOURCESels" CodeFile="SYS_DATASOURCESels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
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
               <dt><%=SYS_DATASOURCE.Attribute.ID.ZhName %>��</dt><!--�Զ���ʶ-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SourceConnectString">
               <dt><%=SYS_DATASOURCE.Attribute.SourceConnectString.ZhName %>��</dt><!--����Դ�����ַ���-->
               <dd><span>
                
                    <input id="txtSourceConnectString" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SourceType">
               <dt><%=SYS_DATASOURCE.Attribute.SourceType.ZhName %>��</dt><!--����Դ����-->
               <dd><span>
                
                    <input id="txtSourceType" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SourceName">
               <dt><%=SYS_DATASOURCE.Attribute.SourceName.ZhName %>��</dt><!--����Դ���-->
               <dd><span>
                
                    <input id="txtSourceName" type="text" runat="server"/>
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
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.ID._ZhName %><!--�Զ���ʶ--></td>
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceConnectString._ZhName %><!--����Դ�����ַ���--></td>
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceType._ZhName %><!--����Դ����--></td>
                    
                    
                    <td><%=SYS_DATASOURCE.Attribute.SourceName._ZhName %><!--����Դ���--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((SYS_DATASOURCE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceConnectString %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceType %></td>
                    
                    
                    <td><%#((SYS_DATASOURCE)Container.DataItem).SourceName %></td>
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
