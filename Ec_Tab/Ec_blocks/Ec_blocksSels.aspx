<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_blocksSels.aspx.cs" Inherits="Ec_blocksSels" %>
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
         
            <dl colname="Blockid">
               <dt><%=Ec_blocks.Attribute.Blockid.ZhName %>��</dt><!--Blockid-->
               <dd><span>
               
                    <input id="txtBlockid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tabid">
               <dt><%=Ec_blocks.Attribute.Tabid.ZhName %>��</dt><!--ģ��id-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Blocklabel">
               <dt><%=Ec_blocks.Attribute.Blocklabel.ZhName %>��</dt><!--��ʾ��������-->
               <dd><span>
               
                    <input id="txtBlocklabel" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Sequence">
               <dt><%=Ec_blocks.Attribute.Sequence.ZhName %>��</dt><!--��ʾ˳��-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Show_title">
               <dt><%=Ec_blocks.Attribute.Show_title.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtShow_title" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Visible">
               <dt><%=Ec_blocks.Attribute.Visible.ZhName %>��</dt><!--�Ƿ�ɼ�-->
               <dd><span>
               
                    <input id="txtVisible" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Create_view">
               <dt><%=Ec_blocks.Attribute.Create_view.ZhName %>��</dt><!--Create_-->
               <dd><span>
               
                    <input id="txtCreate_view" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Edit_view">
               <dt><%=Ec_blocks.Attribute.Edit_view.ZhName %>��</dt><!--Edit_vi-->
               <dd><span>
               
                    <input id="txtEdit_view" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Detail_view">
               <dt><%=Ec_blocks.Attribute.Detail_view.ZhName %>��</dt><!--Detail_-->
               <dd><span>
               
                    <input id="txtDetail_view" type="text" runat="server"/>
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
                    
                    
                    <td><%=Ec_blocks.Attribute.Blockid._ZhName %><!--Blockid--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Tabid._ZhName %><!--ģ��id--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Blocklabel._ZhName %><!--��ʾ��������--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Sequence._ZhName %><!--��ʾ˳��--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Show_title._ZhName %><!--����--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Visible._ZhName %><!--�Ƿ�ɼ�--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Create_view._ZhName %><!--Create_--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Edit_view._ZhName %><!--Edit_vi--></td>
                    
                    
                    <td><%=Ec_blocks.Attribute.Detail_view._ZhName %><!--Detail_--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((Ec_blocks)Container.DataItem).Blockid %>" /></td>
                     
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blockid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Blocklabel %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Show_title %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Visible %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Create_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Edit_view %></td>
                    
                    
                    <td><%#((Ec_blocks)Container.DataItem).Detail_view %></td>
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
