<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_DEFAULTRESPONSESels.aspx.cs" Inherits="WEC_CS_DEFAULTRESPONSESels" %>
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
         
            <dl colname="ID">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="STARTTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME.ZhName %>��</dt><!--��ʼʱ��-->
               <dd><span>
               
                    <input id="txtSTARTTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="ENDTIME">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtENDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="MSGCONTENT">
               <dt><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT.ZhName %>��</dt><!--��Ϣ����-->
               <dd><span>
               
                    <input id="txtMSGCONTENT" type="text" runat="server"/>
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
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ID._ZhName %><!--���--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.AID._ZhName %><!--���ںű��--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.STARTTIME._ZhName %><!--��ʼʱ��--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.ENDTIME._ZhName %><!--����ʱ��--></td>
                    
                    
                    <td><%=WEC_CS_DEFAULTRESPONSE.Attribute.MSGCONTENT._ZhName %><!--��Ϣ����--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_CS_DEFAULTRESPONSE.Attribute.STATUS, ((WEC_CS_DEFAULTRESPONSE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).STARTTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).ENDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_CS_DEFAULTRESPONSE)Container.DataItem).MSGCONTENT %></td>
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
