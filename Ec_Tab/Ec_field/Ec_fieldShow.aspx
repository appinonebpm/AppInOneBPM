<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldShow.aspx.cs" Inherits="Ec_fieldShow" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
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
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>��</dt><%--�ֶ�ID--%>
               <dd>
               
                    <asp:Label id="txtFieldid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>��</dt><%--ģ��ID--%>
               <dd>
               
                    <asp:Label id="txtTabid" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtColumnname" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtTablename" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>��</dt><%--��������--%>
               <dd>
               
                    <asp:Label id="txtGeneratedtype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>��</dt><%--�ؼ�����--%>
               <dd>
               
                    <asp:Label id="txtUitype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>��</dt><%--�ֶ���--%>
               <dd>
               
                    <asp:Label id="txtFieldname" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>��</dt><%--�ֶα�ǩ--%>
               <dd>
               
                    <asp:Label id="txtFieldlabel" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>��</dt><%--ֻ��--%>
               <dd>
               
                    <asp:Label id="txtReadonly" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Presence.ZhName %>��</dt><%--�Ƿ����--%>
               <dd>
               
                    <asp:Label id="txtPresence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Selected.ZhName %>��</dt><%--�Ƿ�ѡ��--%>
               <dd>
               
                    <asp:Label id="txtSelected" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>��</dt><%--��󳤶�--%>
               <dd>
               
                    <asp:Label id="txtMaximumlength" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>��</dt><%--˳���--%>
               <dd>
               
                    <asp:Label id="txtSequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Block.ZhName %>��</dt><%--���ֱ��--%>
               <dd>
               
                    <asp:Label id="txtBlock" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>��</dt><%--״̬--%>
               <dd>
               
                    <asp:Label id="txtDisplaytype" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>��</dt><%--������o���Ǳ�--%>
               <dd>
               
                    <asp:Label id="txtTypeofdata" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>��</dt><%--�Ƿ���ٴ���--%>
               <dd>
               
                    <asp:Label id="txtQuickcreate" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>��</dt><%--���ٴ����Ĵ���--%>
               <dd>
               
                    <asp:Label id="txtQuickcreatesequence" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>��</dt><%--����--%>
               <dd>
               
                    <asp:Label id="txtInfo_type" runat="server"></asp:Label>
               </dd>
             </dl>
             <dl>
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>��</dt><%--�ؼ�����--%>
               <dd>
               
                    <asp:Label id="txtCtrlType" runat="server"></asp:Label>
               </dd>
             </dl>
       </div>
    </div>

</div>
</asp:Content>