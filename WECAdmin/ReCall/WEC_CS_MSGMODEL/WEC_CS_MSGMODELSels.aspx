<%@ Page Title="多选页面对话框" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_MSGMODELSels.aspx.cs" Inherits="WEC_CS_MSGMODELSels" %>
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
       <dl><dt><b><%#title %>多选</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="ID">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ID.ZhName %>：</dt><!--编号-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_CS_MSGMODEL.Attribute.AID.ZhName %>：</dt><!--公众号编号-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ADDTIME.ZhName %>：</dt><!--添加时间-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_CS_MSGMODEL.Attribute.STATUS.ZhName %>：</dt><!--状态-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="MODELCONTENT">
               <dt><%=WEC_CS_MSGMODEL.Attribute.MODELCONTENT.ZhName %>：</dt><!--模板内容(占位-->
               <dd><span>
               
                    <input id="txtMODELCONTENT" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="查询" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "确定选择") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "清空") %>" /></a>
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
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "全选") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "选择") %></td>
                    
                    
                    <td><%=WEC_CS_MSGMODEL.Attribute.ID._ZhName %><!--编号--></td>
                    
                    
                    <td><%=WEC_CS_MSGMODEL.Attribute.AID._ZhName %><!--公众号编号--></td>
                    
                    
                    <td><%=WEC_CS_MSGMODEL.Attribute.ADDTIME._ZhName %><!--添加时间--></td>
                    
                    
                    <td><%=WEC_CS_MSGMODEL.Attribute.STATUS._ZhName %><!--状态--></td>
                    
                    
                    <td><%=WEC_CS_MSGMODEL.Attribute.MODELCONTENT._ZhName %><!--模板内容(占位--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_CS_MSGMODEL)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_CS_MSGMODEL.Attribute.STATUS, ((WEC_CS_MSGMODEL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).MODELCONTENT %></td>
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
