<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_A_VOTESels.aspx.cs" Inherits="WEC_A_VOTESels" %>
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
               <dt><%=WEC_A_VOTE.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_A_VOTE.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_A_VOTE.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_A_VOTE.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="KEYWORD">
               <dt><%=WEC_A_VOTE.Attribute.KEYWORD.ZhName %>��</dt><!--�ؼ���-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="TITLE">
               <dt><%=WEC_A_VOTE.Attribute.TITLE.ZhName %>��</dt><!--ͶƱ����-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="PICURL">
               <dt><%=WEC_A_VOTE.Attribute.PICURL.ZhName %>��</dt><!--ͶƱͼƬ-->
               <dd><span>
               
                    <input id="txtPICURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="INSTRUCTION">
               <dt><%=WEC_A_VOTE.Attribute.INSTRUCTION.ZhName %>��</dt><!--ͶƱ˵��-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="PIC_SHOW">
               <dt><%=WEC_A_VOTE.Attribute.PIC_SHOW.ZhName %>��</dt><!--ͼƬ��ʾ-->
               <dd><span>
               
                    <select id="txtPIC_SHOW" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="IS_RADIO">
               <dt><%=WEC_A_VOTE.Attribute.IS_RADIO.ZhName %>��</dt><!--�Ƿ��ѡ-->
               <dd><span>
               
                    <select id="txtIS_RADIO" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="SELECT_NUM">
               <dt><%=WEC_A_VOTE.Attribute.SELECT_NUM.ZhName %>��</dt><!--��ѡ����-->
               <dd><span>
               
                    <input id="txtSELECT_NUM" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TIME">
               <dt><%=WEC_A_VOTE.Attribute.TIME.ZhName %>��</dt><!--ʱ������-->
               <dd><span>
               
                    <input id="txtTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="RESULT">
               <dt><%=WEC_A_VOTE.Attribute.RESULT.ZhName %>��</dt><!--ͶƱ���-->
               <dd><span>
               
                    <input id="txtRESULT" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SHARE">
               <dt><%=WEC_A_VOTE.Attribute.SHARE.ZhName %>��</dt><!--�Ƿ����-->
               <dd><span>
               
                    <select id="txtSHARE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="KIND">
               <dt><%=WEC_A_VOTE.Attribute.KIND.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <select id="txtKIND" runat="server">
                    </select>
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
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ID._ZhName %><!--���--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.AID._ZhName %><!--���ںű��--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KEYWORD._ZhName %><!--�ؼ���--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TITLE._ZhName %><!--ͶƱ����--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PICURL._ZhName %><!--ͶƱͼƬ--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.INSTRUCTION._ZhName %><!--ͶƱ˵��--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.PIC_SHOW._ZhName %><!--ͼƬ��ʾ--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.IS_RADIO._ZhName %><!--�Ƿ��ѡ--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SELECT_NUM._ZhName %><!--��ѡ����--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.TIME._ZhName %><!--ʱ������--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.RESULT._ZhName %><!--ͶƱ���--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.SHARE._ZhName %><!--�Ƿ����--></td>
                    
                    
                    <td><%=WEC_A_VOTE.Attribute.KIND._ZhName %><!--���--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_A_VOTE)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).AID %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.STATUS, ((WEC_A_VOTE)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).ADDTIME %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).KEYWORD) %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).TITLE) %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).PICURL %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_A_VOTE)Container.DataItem).INSTRUCTION) %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.PIC_SHOW, ((WEC_A_VOTE)Container.DataItem).PIC_SHOW)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.IS_RADIO, ((WEC_A_VOTE)Container.DataItem).IS_RADIO)%></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).SELECT_NUM %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).TIME %></td>
                    
                    
                    <td><%#((WEC_A_VOTE)Container.DataItem).RESULT %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.SHARE, ((WEC_A_VOTE)Container.DataItem).SHARE)%></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_A_VOTE.Attribute.KIND, ((WEC_A_VOTE)Container.DataItem).KIND)%></td>
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
