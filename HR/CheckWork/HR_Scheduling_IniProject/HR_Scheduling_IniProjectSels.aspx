<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_Scheduling_IniProjectSels2" CodeFile="HR_Scheduling_IniProjectSels.aspx.cs" %>
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
         
            <dl colname="ID">
               <dt><%=HR_Scheduling_IniProject.Attribute.ID.ZhName %>��</dt><!--ID-->
               <dd><span>
                
                    <input id="txtID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SelBanciId">
               <dt><%=HR_Scheduling_IniProject.Attribute.SelBanciId.ZhName %>��</dt><!--��ѡ���-->
               <dd><span>
                
                    <input id="txtSelBanciId" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="XiuXi">
               <dt><%=HR_Scheduling_IniProject.Attribute.XiuXi.ZhName %>��</dt><!--��Ϣ��-->
               <dd><span>
                
                    <input id="txtXiuXi" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WorkDayType">
               <dt><%=HR_Scheduling_IniProject.Attribute.WorkDayType.ZhName %>��</dt><!--�����Ű�����-->
               <dd><span>
               
                    <input id="txtWorkDayType" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StartTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.StartTime.ZhName %>��</dt><!--��ʼ����-->
               <dd><span>
               
                    <input id="txtStartTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="EndTime">
               <dt><%=HR_Scheduling_IniProject.Attribute.EndTime.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtEndTime" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="FuGaiOrZengBu">
               <dt><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu.ZhName %>��</dt><!--���ɷ�ʽ{-->
               <dd><span>
                
                    <input id="txtFuGaiOrZengBu" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="StaffID">
               <dt><%=HR_Scheduling_IniProject.Attribute.StaffID.ZhName %>��</dt><!--StaffID-->
               <dd><span>
                
                    <input id="txtStaffID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DeptID">
               <dt><%=HR_Scheduling_IniProject.Attribute.DeptID.ZhName %>��</dt><!--DeptID-->
               <dd><span>
                
                    <input id="txtDeptID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="OrgID">
               <dt><%=HR_Scheduling_IniProject.Attribute.OrgID.ZhName %>��</dt><!--OrgID-->
               <dd><span>
                
                    <input id="txtOrgID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ProjectName">
               <dt><%=HR_Scheduling_IniProject.Attribute.ProjectName.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtProjectName" type="text" runat="server"/>
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
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.SelBanciId._ZhName %><!--��ѡ���--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.XiuXi._ZhName %><!--��Ϣ��--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.WorkDayType._ZhName %><!--�����Ű�����--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.StartTime._ZhName %><!--��ʼ����--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.EndTime._ZhName %><!--��������--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.FuGaiOrZengBu._ZhName %><!--���ɷ�ʽ{--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.StaffID._ZhName %><!--StaffID--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.DeptID._ZhName %><!--DeptID--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.OrgID._ZhName %><!--OrgID--></td>
                    
                    
                    <td><%=HR_Scheduling_IniProject.Attribute.ProjectName._ZhName %><!--��������--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((HR_Scheduling_IniProject)Container.DataItem).ID %>" /></td>
                     
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).SelBanciId %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).XiuXi %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).WorkDayType %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).StartTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).EndTime.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).FuGaiOrZengBu %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).StaffID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).DeptID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).OrgID %></td>
                    
                    
                    <td><%#((HR_Scheduling_IniProject)Container.DataItem).ProjectName %></td>
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
