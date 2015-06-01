<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTSels" CodeFile="CUSTSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
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
         
            <dl colname="Cus_ID">
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>��</dt><!--�ͻ����-->
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Cus_Name">
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>��</dt><!--�ͻ�����-->
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Job">
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>��</dt><!--�ͻ�ְλ-->
               <dd><span>
               
                    <input id="txtJob" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="RelationTxt">
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>��</dt><!--�ͻ���ϵ����-->
               <dd><span>
                
                    <input id="txtRelationTxt" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Recorder">
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MobPhone">
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>��</dt><!--�ֻ�-->
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Phone">
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>��</dt><!--��ϵ�绰-->
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ContactName">
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>��</dt><!--��ϵ������-->
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopName">
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ShopAddr">
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>��</dt><!--�����ַ-->
               <dd><span>
                
                    <input id="txtShopAddr" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="QQ">
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>��</dt><!--QQ����-->
               <dd><span>
                
                    <input id="txtQQ" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WW">
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtWW" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Email">
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>��</dt><!--�ʼ���ַ-->
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Address">
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>��</dt><!--��ϸ��ַ-->
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Trade">
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>��</dt><!--��ҵ-->
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Type">
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>��</dt><!--���-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="State">
               <dt><%=CRM_CUST.Attribute.State.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtState" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="IsSign">
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>��</dt><!--�Ƿ�ǩԼ-->
               <dd><span>
               
                    <select id="txtIsSign" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="AddTime">
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>��</dt><!--¼��ʱ��-->
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="EditTime">
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="PATH">
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>��</dt><!--PATH-->
               <dd><span>
               
                    <input id="txtPATH" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PNAME">
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>��</dt><!--PNAME-->
               <dd><span>
               
                    <input id="txtPNAME" type="text" runat="server"/>
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
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_ID._ZhName %><!--�ͻ����--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Cus_Name._ZhName %><!--�ͻ�����--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Job._ZhName %><!--�ͻ�ְλ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.RelationTxt._ZhName %><!--�ͻ���ϵ����--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Recorder._ZhName %><!--������--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.MobPhone._ZhName %><!--�ֻ�--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Phone._ZhName %><!--��ϵ�绰--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ContactName._ZhName %><!--��ϵ������--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopName._ZhName %><!--��������--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.ShopAddr._ZhName %><!--�����ַ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.QQ._ZhName %><!--QQ����--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.WW._ZhName %><!--��������--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Email._ZhName %><!--�ʼ���ַ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Address._ZhName %><!--��ϸ��ַ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Trade._ZhName %><!--��ҵ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.Type._ZhName %><!--���--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.State._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.IsSign._ZhName %><!--�Ƿ�ǩԼ--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.AddTime._ZhName %><!--¼��ʱ��--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.EditTime._ZhName %><!--�޸�ʱ��--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.PATH._ZhName %><!--PATH--></td>
                    
                    
                    <td><%=CRM_CUST.Attribute.PNAME._ZhName %><!--PNAME--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((CRM_CUST)Container.DataItem).Cus_ID %>" /></td>
                     
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_ID %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Cus_Name %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).Job) %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((CRM_CUST)Container.DataItem).RelationTxt) %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Recorder %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).MobPhone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Phone %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ContactName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopName %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).ShopAddr %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).QQ %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).WW %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Email %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Address %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Trade %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).Type %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(CRM_CUST.Attribute.State, ((CRM_CUST)Container.DataItem).State)%></td>
                    
                    
                    <td><%#formhelper.GetOptionText(CRM_CUST.Attribute.IsSign, ((CRM_CUST)Container.DataItem).IsSign)%></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).AddTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).EditTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PNAME %></td>
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
