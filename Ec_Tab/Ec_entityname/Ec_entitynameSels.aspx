<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_entitynameSels.aspx.cs" Inherits="Ec_entitynameSels" %>
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
         
            <dl colname="Tabid">
               <dt><%=Ec_entityname.Attribute.Tabid.ZhName %>��</dt><!--Tabid-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Modulename">
               <dt><%=Ec_entityname.Attribute.Modulename.ZhName %>��</dt><!--IsTabӢ��-->
               <dd><span>
               
                    <input id="txtModulename" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Tablename">
               <dt><%=Ec_entityname.Attribute.Tablename.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Fieldname">
               <dt><%=Ec_entityname.Attribute.Fieldname.ZhName %>��</dt><!--��NAME-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Entityidfield">
               <dt><%=Ec_entityname.Attribute.Entityidfield.ZhName %>��</dt><!--��ID-->
               <dd><span>
               
                    <input id="txtEntityidfield" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Remarks">
               <dt><%=Ec_entityname.Attribute.Remarks.ZhName %>��</dt><!--IsTab����-->
               <dd><span>
               
                    <input id="txtRemarks" type="text" runat="server"/>
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
                    
                    
                    <td><%=Ec_entityname.Attribute.Tabid._ZhName %><!--Tabid--></td>
                    
                    
                    <td><%=Ec_entityname.Attribute.Modulename._ZhName %><!--IsTabӢ��--></td>
                    
                    
                    <td><%=Ec_entityname.Attribute.Tablename._ZhName %><!--����--></td>
                    
                    
                    <td><%=Ec_entityname.Attribute.Fieldname._ZhName %><!--��NAME--></td>
                    
                    
                    <td><%=Ec_entityname.Attribute.Entityidfield._ZhName %><!--��ID--></td>
                    
                    
                    <td><%=Ec_entityname.Attribute.Remarks._ZhName %><!--IsTab����--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((Ec_entityname)Container.DataItem).Tabid %>" /></td>
                     
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Modulename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Entityidfield %></td>
                    
                    
                    <td><%#((Ec_entityname)Container.DataItem).Remarks %></td>
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
