<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldManage.aspx.cs" Inherits="Ec_fieldManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
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
         
            <dl colname="Ec_field.Fieldid">
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>��</dt><!--�ֶ�ID-->
               <dd><span>
               
                    <input id="txtFieldid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Tabid">
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>��</dt><!--ģ��ID-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Columnname">
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtColumnname" type="text" runat="server"  ck="{len:30,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Tablename">
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Generatedtype">
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtGeneratedtype" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Uitype">
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>��</dt><!--�ؼ�����-->
               <dd><span>
               
                    <select id="txtUitype" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Fieldname">
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>��</dt><!--�ֶ���-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Fieldlabel">
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>��</dt><!--�ֶα�ǩ-->
               <dd><span>
               
                    <input id="txtFieldlabel" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Readonly">
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>��</dt><!--ֻ��-->
               <dd><span>
               
                    <select id="txtReadonly" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Presence">
               <dt><%=Ec_field.Attribute.Presence.ZhName %>��</dt><!--�Ƿ����-->
               <dd><span>
               
                    <select id="txtPresence" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Selected">
               <dt><%=Ec_field.Attribute.Selected.ZhName %>��</dt><!--�Ƿ�ѡ��-->
               <dd><span>
               
                    <select id="txtSelected" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Maximumlength">
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>��</dt><!--��󳤶�-->
               <dd><span>
               
                    <input id="txtMaximumlength" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Sequence">
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>��</dt><!--˳���-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Block">
               <dt><%=Ec_field.Attribute.Block.ZhName %>��</dt><!--���ֱ��-->
               <dd><span>
               
                    <input id="txtBlock" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Displaytype">
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Typeofdata">
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>��</dt><!--������o���Ǳ�-->
               <dd><span>
               
                    <input id="txtTypeofdata" type="text" runat="server"  ck="{len:100,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Quickcreate">
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>��</dt><!--�Ƿ���ٴ���-->
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Quickcreatesequence">
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>��</dt><!--���ٴ����Ĵ���-->
               <dd><span>
               
                    <input id="txtQuickcreatesequence" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.Info_type">
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtInfo_type" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="Ec_field.CtrlType">
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>��</dt><!--�ؼ�����-->
               <dd><span>
               
                    <select id="txtCtrlType" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newEc_field" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('Ec_fieldEdit.aspx');" /></span></li>
            <li><span><input power="editEc_field" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('Ec_fieldEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newEc_field" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('Ec_fieldBack.aspx');" /></span></li>
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
                <tr keyname="Fieldid">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldid.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldid._ZhName %></td><!--�ֶ�ID-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Tabid.LongName%>',show:1}"><%=Ec_field.Attribute.Tabid._ZhName %></td><!--ģ��ID-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Columnname.LongName%>',show:1}"><%=Ec_field.Attribute.Columnname._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Tablename.LongName%>',show:1}"><%=Ec_field.Attribute.Tablename._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Generatedtype.LongName%>',show:1}"><%=Ec_field.Attribute.Generatedtype._ZhName %></td><!--��������-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Uitype.LongName%>',show:1}"><%=Ec_field.Attribute.Uitype._ZhName %></td><!--�ؼ�����-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldname.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldname._ZhName %></td><!--�ֶ���-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Fieldlabel.LongName%>',show:1}"><%=Ec_field.Attribute.Fieldlabel._ZhName %></td><!--�ֶα�ǩ-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Readonly.LongName%>',show:1}"><%=Ec_field.Attribute.Readonly._ZhName %></td><!--ֻ��-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Presence.LongName%>',show:1}"><%=Ec_field.Attribute.Presence._ZhName %></td><!--�Ƿ����-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Selected.LongName%>',show:1}"><%=Ec_field.Attribute.Selected._ZhName %></td><!--�Ƿ�ѡ��-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Maximumlength.LongName%>',show:1}"><%=Ec_field.Attribute.Maximumlength._ZhName %></td><!--��󳤶�-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Sequence.LongName%>',show:1}"><%=Ec_field.Attribute.Sequence._ZhName %></td><!--˳���-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Block.LongName%>',show:1}"><%=Ec_field.Attribute.Block._ZhName %></td><!--���ֱ��-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Displaytype.LongName%>',show:1}"><%=Ec_field.Attribute.Displaytype._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Typeofdata.LongName%>',show:1}"><%=Ec_field.Attribute.Typeofdata._ZhName %></td><!--������o���Ǳ�-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Quickcreate.LongName%>',show:1}"><%=Ec_field.Attribute.Quickcreate._ZhName %></td><!--�Ƿ���ٴ���-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Quickcreatesequence.LongName%>',show:1}"><%=Ec_field.Attribute.Quickcreatesequence._ZhName %></td><!--���ٴ����Ĵ���-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.Info_type.LongName%>',show:1}"><%=Ec_field.Attribute.Info_type._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=Ec_field.Attribute.CtrlType.LongName%>',show:1}"><%=Ec_field.Attribute.CtrlType._ZhName %></td><!--�ؼ�����-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((Ec_field)Container.DataItem).Fieldid%>" /></td>
                   <%-- <td><%#showLeftLinks(((Ec_field)Container.DataItem).PATH, ((Ec_field)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tabid %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Columnname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Tablename %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Generatedtype %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Uitype, ((Ec_field)Container.DataItem).Uitype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldname %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Fieldlabel %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Readonly, ((Ec_field)Container.DataItem).Readonly)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Presence, ((Ec_field)Container.DataItem).Presence)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Selected, ((Ec_field)Container.DataItem).Selected)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Maximumlength %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Sequence %></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Block %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Displaytype, ((Ec_field)Container.DataItem).Displaytype)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Typeofdata %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Quickcreate, ((Ec_field)Container.DataItem).Quickcreate)%></td>
                    
                    
                    <td><%#((Ec_field)Container.DataItem).Quickcreatesequence %></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.Info_type, ((Ec_field)Container.DataItem).Info_type)%></td>
                    
                    
                    <td><%#FormHelper.GetText(Ec_field.Attribute.CtrlType, ((Ec_field)Container.DataItem).CtrlType)%></td>
                    
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