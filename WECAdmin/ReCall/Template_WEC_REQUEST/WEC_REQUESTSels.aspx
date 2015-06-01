<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUESTSels.aspx.cs" Inherits="WEC_REQUESTSels" %>
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
         
            <dl colname="TID">
               <dt><%=WEC_REQUEST.Attribute.TID.ZhName %>��</dt><!--�ظ�ID-->
               <dd><span>
               
                    <input id="txtTID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_REQUEST.Attribute.AID.ZhName %>��</dt><!--���ں�ID-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KEYWORD">
               <dt><%=WEC_REQUEST.Attribute.KEYWORD.ZhName %>��</dt><!--�ؼ���-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MATCH_TYPE">
               <dt><%=WEC_REQUEST.Attribute.MATCH_TYPE.ZhName %>��</dt><!--ƥ������-->
               <dd><span>
               
                    <select id="txtMATCH_TYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="MEMO">
               <dt><%=WEC_REQUEST.Attribute.MEMO.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtMEMO" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KIND">
               <dt><%=WEC_REQUEST.Attribute.KIND.ZhName %>��</dt><!--�ظ�����-->
               <dd><span>
               
                    <select id="txtKIND" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_REQUEST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_REQUEST.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
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
                    
                    
                    <td><%=WEC_REQUEST.Attribute.TID._ZhName %><!--�ظ�ID--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.AID._ZhName %><!--���ں�ID--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.KEYWORD._ZhName %><!--�ؼ���--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.MATCH_TYPE._ZhName %><!--ƥ������--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.MEMO._ZhName %><!--����--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.KIND._ZhName %><!--�ظ�����--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_REQUEST.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_REQUEST)Container.DataItem).TID %>" /></td>
                     
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).TID %></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).KEYWORD %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_REQUEST.Attribute.MATCH_TYPE, ((WEC_REQUEST)Container.DataItem).MATCH_TYPE)%></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).MEMO %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_REQUEST.Attribute.KIND, ((WEC_REQUEST)Container.DataItem).KIND)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_REQUEST.Attribute.STATUS, ((WEC_REQUEST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_REQUEST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
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
