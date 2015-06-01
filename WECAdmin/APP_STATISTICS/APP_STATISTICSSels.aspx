<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="APP_STATISTICSSels.aspx.cs" Inherits="APP_STATISTICSSels" %>
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
               <dt><%=APP_STATISTICS.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="AF_ADDTIME">
               <dt><%=APP_STATISTICS.Attribute.AF_ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_AF_ADDTIME' type='text' readonly='readonly' onclick='setday(this)' runat='server' />
               </span></dd>
        </dl>
        
            <dl colname="IP">
               <dt><%=APP_STATISTICS.Attribute.IP.ZhName %>��</dt><!--IP-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_IP' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="LONG">
               <dt><%=APP_STATISTICS.Attribute.LONG.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_LONG' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="LAT">
               <dt><%=APP_STATISTICS.Attribute.LAT.ZhName %>��</dt><!--γ��-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_LAT' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEVICE_SYS">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_SYS.ZhName %>��</dt><!--�豸ϵͳ-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_DEVICE_SYS' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="VER_CODE">
               <dt><%=APP_STATISTICS.Attribute.VER_CODE.ZhName %>��</dt><!--Ӧ�ð汾��-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_VER_CODE' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEVICE_MODEL">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_MODEL.ZhName %>��</dt><!--�豸�ͺ�-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_DEVICE_MODEL' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="STAFF_ID">
               <dt><%=APP_STATISTICS.Attribute.STAFF_ID.ZhName %>��</dt><!--Ա�����-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_STAFF_ID' type='text' runat='server'/>
               </span></dd>
        </dl>
        
            <dl colname="DEVICE_ID">
               <dt><%=APP_STATISTICS.Attribute.DEVICE_ID.ZhName %>��</dt><!--�豸ID-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_DEVICE_ID' type='text' runat='server'/>

               </span></dd>
        </dl>
        
            <dl colname="VER_NAME">
               <dt><%=APP_STATISTICS.Attribute.VER_NAME.ZhName %>��</dt><!--Ӧ�ð汾��-->
               <dd><span>
               
                    <input id='txtAPP_STATISTICS_VER_NAME' type='text' runat='server'/>
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
                    
                    
                    <td><%=APP_STATISTICS.Attribute.ID._ZhName %><!--���--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.AF_ADDTIME._ZhName %><!--���ʱ��--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.IP._ZhName %><!--IP--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.LONG._ZhName %><!--����--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.LAT._ZhName %><!--γ��--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_SYS._ZhName %><!--�豸ϵͳ--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.VER_CODE._ZhName %><!--Ӧ�ð汾��--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_MODEL._ZhName %><!--�豸�ͺ�--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.STAFF_ID._ZhName %><!--Ա�����--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.DEVICE_ID._ZhName %><!--�豸ID--></td>
                    
                    
                    <td><%=APP_STATISTICS.Attribute.VER_NAME._ZhName %><!--Ӧ�ð汾��--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((APP_STATISTICS)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).AF_ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).IP %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LONG %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).LAT %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_SYS %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).VER_CODE %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).DEVICE_MODEL %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).STAFF_ID %></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((APP_STATISTICS)Container.DataItem).DEVICE_ID) %></td>
                    
                    
                    <td><%#((APP_STATISTICS)Container.DataItem).VER_NAME %></td>
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
