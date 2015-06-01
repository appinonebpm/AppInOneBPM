<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTOMERSels" CodeFile="CUSTOMERSels.aspx.cs" %>
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
         
            <dl colname="CompanyName">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyName.ZhName %>��</dt><!--��˾����-->
               <dd><span>
                
                    <input id="txtCompanyName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CompanyAddress">
               <dt><%=CRM_CUSTOMER.Attribute.CompanyAddress.ZhName %>��</dt><!--��˾��ַ-->
               <dd><span>
                
                    <input id="txtCompanyAddress" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopName">
               <dt><%=CRM_CUSTOMER.Attribute.ShopName.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopNameURL">
               <dt><%=CRM_CUSTOMER.Attribute.ShopNameURL.ZhName %>��</dt><!--������ַ-->
               <dd><span>
                
                    <input id="txtShopNameURL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CustSex">
               <dt><%=CRM_CUSTOMER.Attribute.CustSex.ZhName %>��</dt><!--�Ա�-->
               <dd><span>
                
                    <input id="txtCustSex" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Birthday">
               <dt><%=CRM_CUSTOMER.Attribute.Birthday.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtBirthday" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="WangWangId">
               <dt><%=CRM_CUSTOMER.Attribute.WangWangId.ZhName %>��</dt><!--����ID-->
               <dd><span>
                
                    <input id="txtWangWangId" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CustQQ">
               <dt><%=CRM_CUSTOMER.Attribute.CustQQ.ZhName %>��</dt><!--QQ����-->
               <dd><span>
                
                    <input id="txtCustQQ" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LastEditors">
               <dt><%=CRM_CUSTOMER.Attribute.LastEditors.ZhName %>��</dt><!--���༭��-->
               <dd><span>
                
                    <input id="txtLastEditors" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LoadHighSeasTime">
               <dt><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime.ZhName %>��</dt><!--���빫��ʱ��-->
               <dd><span>
               
                    <input id="txtLoadHighSeasTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="Cus_Id">
               <dt><%=CRM_CUSTOMER.Attribute.Cus_Id.ZhName %>��</dt><!--�ͻ�����-->
               <dd><span>
                
                    <input id="txtCus_Id" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl><dt>&nbsp;</dt><dd class="btn">
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
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CompanyName._ZhName %><!--��˾����--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CompanyAddress._ZhName %><!--��˾��ַ--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.ShopName._ZhName %><!--��������--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.ShopNameURL._ZhName %><!--������ַ--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CustSex._ZhName %><!--�Ա�--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.Birthday._ZhName %><!--����--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.WangWangId._ZhName %><!--����ID--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.CustQQ._ZhName %><!--QQ����--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.LastEditors._ZhName %><!--���༭��--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.LoadHighSeasTime._ZhName %><!--���빫��ʱ��--></td>
                    
                    
                    <td><%=CRM_CUSTOMER.Attribute.Cus_Id._ZhName %><!--�ͻ�����--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((CRM_CUSTOMER)Container.DataItem).Cus_Id %>" /></td>
                     
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CompanyName %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CompanyAddress %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).ShopNameURL %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CustSex %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).Birthday.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).WangWangId %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).CustQQ %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).LastEditors %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).LoadHighSeasTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUSTOMER)Container.DataItem).Cus_Id %></td>
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
