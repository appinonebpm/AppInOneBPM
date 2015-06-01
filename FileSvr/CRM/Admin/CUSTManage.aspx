<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="CRM_CUSTManage" CodeFile="CUSTManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>

<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="CRM_CUST.Cus_ID">
               <dt><%=CRM_CUST.Attribute.Cus_ID.ZhName %>��</dt><!--�ͻ����-->
               <dd><span>
                
                    <input id="txtCus_ID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Cus_Name">
               <dt><%=CRM_CUST.Attribute.Cus_Name.ZhName %>��</dt><!--�ͻ�����-->
               <dd><span>
                
                    <input id="txtCus_Name" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Job">
               <dt><%=CRM_CUST.Attribute.Job.ZhName %>��</dt><!--�ͻ�ְλ-->
               <dd><span>
               
                    <input id="txtJob" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.RelationTxt">
               <dt><%=CRM_CUST.Attribute.RelationTxt.ZhName %>��</dt><!--�ͻ���ϵ����-->
               <dd><span>
                
                    <input id="txtRelationTxt" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Recorder">
               <dt><%=CRM_CUST.Attribute.Recorder.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtRecorder" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.MobPhone">
               <dt><%=CRM_CUST.Attribute.MobPhone.ZhName %>��</dt><!--�ֻ�-->
               <dd><span>
                
                    <input id="txtMobPhone" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Phone">
               <dt><%=CRM_CUST.Attribute.Phone.ZhName %>��</dt><!--��ϵ�绰-->
               <dd><span>
                
                    <input id="txtPhone" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.ContactName">
               <dt><%=CRM_CUST.Attribute.ContactName.ZhName %>��</dt><!--��ϵ������-->
               <dd><span>
                
                    <input id="txtContactName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.ShopName">
               <dt><%=CRM_CUST.Attribute.ShopName.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtShopName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.ShopAddr">
               <dt><%=CRM_CUST.Attribute.ShopAddr.ZhName %>��</dt><!--�����ַ-->
               <dd><span>
                
                    <input id="txtShopAddr" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.QQ">
               <dt><%=CRM_CUST.Attribute.QQ.ZhName %>��</dt><!--QQ����-->
               <dd><span>
                
                    <input id="txtQQ" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.WW">
               <dt><%=CRM_CUST.Attribute.WW.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtWW" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Email">
               <dt><%=CRM_CUST.Attribute.Email.ZhName %>��</dt><!--�ʼ���ַ-->
               <dd><span>
                
                    <input id="txtEmail" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Address">
               <dt><%=CRM_CUST.Attribute.Address.ZhName %>��</dt><!--��ϸ��ַ-->
               <dd><span>
                
                    <input id="txtAddress" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Trade">
               <dt><%=CRM_CUST.Attribute.Trade.ZhName %>��</dt><!--��ҵ-->
               <dd><span>
                
                    <input id="txtTrade" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.Type">
               <dt><%=CRM_CUST.Attribute.Type.ZhName %>��</dt><!--���-->
               <dd><span>
                
                    <input id="txtType" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.State">
               <dt><%=CRM_CUST.Attribute.State.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtState" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.IsSign">
               <dt><%=CRM_CUST.Attribute.IsSign.ZhName %>��</dt><!--�Ƿ�ǩԼ-->
               <dd><span>
               
                    <select id="txtIsSign" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.AddTime">
               <dt><%=CRM_CUST.Attribute.AddTime.ZhName %>��</dt><!--¼��ʱ��-->
               <dd><span>
               
                    <input id="txtAddTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.EditTime">
               <dt><%=CRM_CUST.Attribute.EditTime.ZhName %>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtEditTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.PATH">
               <dt><%=CRM_CUST.Attribute.PATH.ZhName %>��</dt><!--PATH-->
               <dd><span>
               
                    <input id="txtPATH" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="CRM_CUST.PNAME">
               <dt><%=CRM_CUST.Attribute.PNAME.ZhName %>��</dt><!--PNAME-->
               <dd><span>
               
                    <input id="txtPNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl><dt></dt><dd class="btn">
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input id="btn_New" type="button" value="�½�" onclick="manager.newRecord('CRM_CUSTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="NewStaff" id="Button2" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('CRM_CUSTBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="Cus_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td><a href="CRM_CUSTManage.aspx" id="a_top" runat="server"><b>����</b></a></td>
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Cus_ID.LongName%>',show:1}"><%=CRM_CUST.Attribute.Cus_ID._ZhName %></td><!--�ͻ����-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Cus_Name.LongName%>',show:1}"><%=CRM_CUST.Attribute.Cus_Name._ZhName %></td><!--�ͻ�����-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Job.LongName%>',show:1}"><%=CRM_CUST.Attribute.Job._ZhName %></td><!--�ͻ�ְλ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.RelationTxt.LongName%>',show:1}"><%=CRM_CUST.Attribute.RelationTxt._ZhName %></td><!--�ͻ���ϵ����-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Recorder.LongName%>',show:1}"><%=CRM_CUST.Attribute.Recorder._ZhName %></td><!--������-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.MobPhone.LongName%>',show:1}"><%=CRM_CUST.Attribute.MobPhone._ZhName %></td><!--�ֻ�-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Phone.LongName%>',show:1}"><%=CRM_CUST.Attribute.Phone._ZhName %></td><!--��ϵ�绰-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.ContactName.LongName%>',show:1}"><%=CRM_CUST.Attribute.ContactName._ZhName %></td><!--��ϵ������-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.ShopName.LongName%>',show:1}"><%=CRM_CUST.Attribute.ShopName._ZhName %></td><!--��������-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.ShopAddr.LongName%>',show:1}"><%=CRM_CUST.Attribute.ShopAddr._ZhName %></td><!--�����ַ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.QQ.LongName%>',show:1}"><%=CRM_CUST.Attribute.QQ._ZhName %></td><!--QQ����-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.WW.LongName%>',show:1}"><%=CRM_CUST.Attribute.WW._ZhName %></td><!--��������-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Email.LongName%>',show:1}"><%=CRM_CUST.Attribute.Email._ZhName %></td><!--�ʼ���ַ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Address.LongName%>',show:1}"><%=CRM_CUST.Attribute.Address._ZhName %></td><!--��ϸ��ַ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Trade.LongName%>',show:1}"><%=CRM_CUST.Attribute.Trade._ZhName %></td><!--��ҵ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.Type.LongName%>',show:1}"><%=CRM_CUST.Attribute.Type._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.State.LongName%>',show:1}"><%=CRM_CUST.Attribute.State._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.IsSign.LongName%>',show:1}"><%=CRM_CUST.Attribute.IsSign._ZhName %></td><!--�Ƿ�ǩԼ-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.AddTime.LongName%>',show:1}"><%=CRM_CUST.Attribute.AddTime._ZhName %></td><!--¼��ʱ��-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.EditTime.LongName%>',show:1}"><%=CRM_CUST.Attribute.EditTime._ZhName %></td><!--�޸�ʱ��-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.PATH.LongName%>',show:1}"><%=CRM_CUST.Attribute.PATH._ZhName %></td><!--PATH-->
                    
                    
                    <td data="{colname:'<%=CRM_CUST.Attribute.PNAME.LongName%>',show:1}"><%=CRM_CUST.Attribute.PNAME._ZhName %></td><!--PNAME-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((CRM_CUST)Container.DataItem).Cus_ID%>" /></td>
                    <td><%#showLeftLinks(((CRM_CUST)Container.DataItem).PATH, ((CRM_CUST)Container.DataItem).PNAME, Container.ItemIndex)%></td>
                    
                    
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
                    
                    
                    <td><%#FormHelper.GetText(CRM_CUST.Attribute.State, ((CRM_CUST)Container.DataItem).State)%></td>
                    
                    
                    <td><%#FormHelper.GetText(CRM_CUST.Attribute.IsSign, ((CRM_CUST)Container.DataItem).IsSign)%></td>
                    
                    
                    <td><%#(((CRM_CUST)Container.DataItem).AddTime == DateTime.MinValue) ? "" : ((CRM_CUST)Container.DataItem).AddTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((CRM_CUST)Container.DataItem).EditTime == DateTime.MinValue) ? "" : ((CRM_CUST)Container.DataItem).EditTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PATH %></td>
                    
                    
                    <td><%#((CRM_CUST)Container.DataItem).PNAME %></td>
                    
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    <div class="path-url hide">
        <strong>��ǰ·����</strong><asp:Literal ID="litPathLink" runat="server"></asp:Literal>
    </div>
    <div class="pages">
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>