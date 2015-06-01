<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_REQUEST_DETAILSels.aspx.cs" Inherits="WEC_REQUEST_DETAILSels" %>
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
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ID.ZhName %>��</dt><!--��ϸID-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TID">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TID.ZhName %>��</dt><!--�ظ�ID-->
               <dd><span>
               
                    <input id="txtTID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TITLE">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TITLE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_ID">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtSORT_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PICURL">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.PICURL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE_ID">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID.ZhName %>��</dt><!--ҵ������-->
               <dd><span>
               
                    <select id="txtTYPE_ID" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="TYPE_VALUE">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE.ZhName %>��</dt><!--ҵ��ֵ-->
               <dd><span>
               
                    <input id="txtTYPE_VALUE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
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
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.ID._ZhName %><!--��ϸID--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.TID._ZhName %><!--�ظ�ID--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.TITLE._ZhName %><!--����--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.SORT_ID._ZhName %><!--����--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.PICURL._ZhName %><!--ͼƬ��ַ--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.TYPE_ID._ZhName %><!--ҵ������--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.TYPE_VALUE._ZhName %><!--ҵ��ֵ--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_REQUEST_DETAIL.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_REQUEST_DETAIL)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TID %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).SORT_ID %></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).PICURL %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_REQUEST_DETAIL.Attribute.TYPE_ID, ((WEC_REQUEST_DETAIL)Container.DataItem).TYPE_ID)%></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).TYPE_VALUE %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_REQUEST_DETAIL.Attribute.STATUS, ((WEC_REQUEST_DETAIL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_REQUEST_DETAIL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
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
