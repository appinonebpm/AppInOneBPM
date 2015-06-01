<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTSels.aspx.cs" Inherits="WEC_C_CHANNELlISTSels" %>
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
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="ADDTIME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="URL">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>��</dt><!--����url-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="REMARK">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>��</dt><!--������ע-->
               <dd><span>
               
                    <input id="txtREMARK" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="QRCODE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>��</dt><!--��ά����ʽ-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>��</dt><!--��ע��Ϣ-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ADDRESS">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>��</dt><!--�������ڵ���-->
               <dd><span>
               
                    <input id="txtADDRESS" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server">
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
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %><!--���--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %><!--���ںű��--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %><!--���ʱ��--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %><!--��������--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %><!--����url--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %><!--������ע--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %><!--��������--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %><!--��ά����ʽ--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %><!--��ע��Ϣ--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %><!--�������ڵ���--></td>
                    
                    
                    <td><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %><!--��������--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_C_CHANNELlIST)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>
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
