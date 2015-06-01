<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_SchClassSels" CodeFile="HR_SchClassSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
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
     <div class="topfindl">
         
            <dl colname="SchClassid">
               <dt><%=HR_SchClass.Attribute.SchClassid.ZhName %>��</dt><!--��α��-->
               <dd><span>
                
                    <input id="txtSchClassid" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SchName">
               <dt><%=HR_SchClass.Attribute.SchName.ZhName %>��</dt><!--���ʱ������-->
               <dd><span>
                
                    <input id="txtSchName" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StartHour">
               <dt><%=HR_SchClass.Attribute.StartHour.ZhName %>��</dt><!--��ʼʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtStartHour" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StartMin">
               <dt><%=HR_SchClass.Attribute.StartMin.ZhName %>��</dt><!--��ʼʱ�����-->
               <dd><span>
                
                    <input id="txtStartMin" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EndHour">
               <dt><%=HR_SchClass.Attribute.EndHour.ZhName %>��</dt><!--����ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtEndHour" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EndMin">
               <dt><%=HR_SchClass.Attribute.EndMin.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
                
                    <input id="txtEndMin" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LateMinutes">
               <dt><%=HR_SchClass.Attribute.LateMinutes.ZhName %>��</dt><!--�Ƴٵ�������-->
               <dd><span>
                
                    <input id="txtLateMinutes" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EarlyMinutes">
               <dt><%=HR_SchClass.Attribute.EarlyMinutes.ZhName %>��</dt><!--�����˷�����-->
               <dd><span>
                
                    <input id="txtEarlyMinutes" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckIn">
               <dt><%=HR_SchClass.Attribute.CheckIn.ZhName %>��</dt><!--�ϰ�ǩ��-->
               <dd><span>
                
                    <input id="txtCheckIn" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="CheckOut">
               <dt><%=HR_SchClass.Attribute.CheckOut.ZhName %>��</dt><!--�°�ǩ��-->
               <dd><span>
                
                    <input id="txtCheckOut" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="CheckInHour1">
               <dt><%=HR_SchClass.Attribute.CheckInHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInMin1">
               <dt><%=HR_SchClass.Attribute.CheckInMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckInMin1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInHour2">
               <dt><%=HR_SchClass.Attribute.CheckInHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckInHour2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckInMin2">
               <dt><%=HR_SchClass.Attribute.CheckInMin2.ZhName %>��</dt><!--����ǩ��ʱ�����(int(4))-->
               <dd><span>
                
                    <input id="txtCheckInMin2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutHour1">
               <dt><%=HR_SchClass.Attribute.CheckOutHour1.ZhName %>��</dt><!--��ʼǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutMin1">
               <dt><%=HR_SchClass.Attribute.CheckOutMin1.ZhName %>��</dt><!--��ʼǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin1" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutHour2">
               <dt><%=HR_SchClass.Attribute.CheckOutHour2.ZhName %>��</dt><!--����ǩ��ʱ��Сʱ-->
               <dd><span>
                
                    <input id="txtCheckOutHour2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CheckOutMin2">
               <dt><%=HR_SchClass.Attribute.CheckOutMin2.ZhName %>��</dt><!--����ǩ��ʱ�����-->
               <dd><span>
                
                    <input id="txtCheckOutMin2" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="Color">
               <dt><%=HR_SchClass.Attribute.Color.ZhName %>��</dt><!--��ʾ��ɫ-->
               <dd><span>
                
                    <input id="txtColor" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IsOverTime">
               <dt><%=HR_SchClass.Attribute.IsOverTime.ZhName %>��</dt><!--����Ӱ�-->
               <dd><span>
                
                    <input id="txtIsOvertime" type="checkbox" runat="server" class="ckbs" />
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
                    
                    
                    <td><%=HR_SchClass.Attribute.SchClassid._ZhName %><!--��α��--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.SchName._ZhName %><!--���ʱ������--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.StartHour._ZhName %><!--��ʼʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.StartMin._ZhName %><!--��ʼʱ�����--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.EndHour._ZhName %><!--����ʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.EndMin._ZhName %><!--����ʱ��--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.LateMinutes._ZhName %><!--�Ƴٵ�������--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.EarlyMinutes._ZhName %><!--�����˷�����--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckIn._ZhName %><!--�ϰ�ǩ��--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOut._ZhName %><!--�°�ǩ��--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInHour1._ZhName %><!--��ʼǩ��ʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInMin1._ZhName %><!--��ʼǩ��ʱ�����--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInHour2._ZhName %><!--����ǩ��ʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckInMin2._ZhName %><!--����ǩ��ʱ�����(int(4))--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutHour1._ZhName %><!--��ʼǩ��ʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutMin1._ZhName %><!--��ʼǩ��ʱ�����--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutHour2._ZhName %><!--����ǩ��ʱ��Сʱ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.CheckOutMin2._ZhName %><!--����ǩ��ʱ�����--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.Color._ZhName %><!--��ʾ��ɫ--></td>
                    
                    
                    <td><%=HR_SchClass.Attribute.IsOverTime._ZhName %><!--����Ӱ�--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_SchClass)Container.DataItem).SchClassid %>" /></td>
                     
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchClassid %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).SchName %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartHour %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).StartMin %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EndHour %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EndMin %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).LateMinutes %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).EarlyMinutes %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckIn %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOut %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInMin1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInHour2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckInMin2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutMin1 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutHour2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).CheckOutMin2 %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).Color %></td>
                    
                    
                    <td><%#((HR_SchClass)Container.DataItem).IsOverTime %></td>
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
