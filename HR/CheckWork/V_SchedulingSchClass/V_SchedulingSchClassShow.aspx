<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="V_SchedulingSchClassShow" CodeFile="V_SchedulingSchClassShow.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
<script src="../../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
   </div>
    <div class="form" id="divForm">
       <div>
        
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchName.ZhName %>��</dt><%--SchName--%>
               <dd>
                
                    <asp:Label id="txtSchName" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.LateMinutes.ZhName %>��</dt><%--LateMinutes--%>
               <dd>
                
                    <asp:Label id="txtLateMinutes" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EarlyMinutes.ZhName %>��</dt><%--EarlyMinutes--%>
               <dd>
                
                    <asp:Label id="txtEarlyMinutes" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckIn.ZhName %>��</dt><%--CheckIn--%>
               <dd>
                
                    <input type="checkbox" id="txtCheckIn" runat="server" />
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOut.ZhName %>��</dt><%--CheckOut--%>
               <dd>
                
                    <input type="checkbox" id="txtCheckOut" runat="server" />
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.Color.ZhName %>��</dt><%--Color--%>
               <dd>
                
                    <asp:Label id="txtColor" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.IsOverTime.ZhName %>��</dt><%--IsOverTime--%>
               <dd>
                
                    <input type="checkbox" id="txtIsOvertime" runat="server" />
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchYear.ZhName %>��</dt><%--Year--%>
               <dd>
                
                    <asp:Label id="txtYear" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchMonth.ZhName %>��</dt><%--Month--%>
               <dd>
                
                    <asp:Label id="txtMonth" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchDay.ZhName %>��</dt><%--Day--%>
               <dd>
                
                    <asp:Label id="txtDay" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchType.ZhName %>��</dt><%--Type--%>
               <dd>
                
                    <asp:Label id="txtType" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.SchClassid.ZhName %>��</dt><%--SchClassid--%>
               <dd>
                
                    <asp:Label id="txtSchClassid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.StartHour.ZhName %>��</dt><%--StartHour--%>
               <dd>
                
                    <asp:Label id="txtStartHour" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.StartMin.ZhName %>��</dt><%--StartMin--%>
               <dd>
                
                    <asp:Label id="txtStartMin" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EndHour.ZhName %>��</dt><%--EndHour--%>
               <dd>
                
                    <asp:Label id="txtEndHour" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.EndMin.ZhName %>��</dt><%--EndMin--%>
               <dd>
                
                    <asp:Label id="txtEndMin" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour1.ZhName %>��</dt><%--CheckInHour1--%>
               <dd>
                
                    <asp:Label id="txtCheckInHour1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin1.ZhName %>��</dt><%--CheckInMin1--%>
               <dd>
                
                    <asp:Label id="txtCheckInMin1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInHour2.ZhName %>��</dt><%--CheckInHour2--%>
               <dd>
                
                    <asp:Label id="txtCheckInHour2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckInMin2.ZhName %>��</dt><%--CheckInMin2--%>
               <dd>
                
                    <asp:Label id="txtCheckInMin2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour1.ZhName %>��</dt><%--CheckOutHour1--%>
               <dd>
                
                    <asp:Label id="txtCheckOutHour1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin1.ZhName %>��</dt><%--CheckOutMin1--%>
               <dd>
                
                    <asp:Label id="txtCheckOutMin1" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutMin2.ZhName %>��</dt><%--CheckOutMin2--%>
               <dd>
                
                    <asp:Label id="txtCheckOutMin2" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=V_SchedulingSchClass.Attribute.CheckOutHour2.ZhName %>��</dt><%--CheckOutHour2--%>
               <dd>
                
                    <asp:Label id="txtCheckOutHour2" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>