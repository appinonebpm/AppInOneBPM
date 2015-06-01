<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Ec_fieldSel.aspx.cs" Inherits="Ec_fieldSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });

    function selThis_B(tds) {
        var tdObj = $(tds[0]);
        var aObj = tdObj.find("a");
        if (aObj.length > 0) {
            _selERR = "����ѡ�����ӽڵ�����ݣ�";
            _selOK = false;
        }
    }
    function selOK_B(id) {
        //alert(id);
        $("input[id$='hidSelID']").val(id);
        //alert($("input[id$='hidSelID']").val());
        __doPostBack("ctl00$cphBody$LinkButton1", "");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
      <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click"></asp:LinkButton><input id="hidSelID" runat="server" type="hidden" />
  </div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="Fieldid">
               <dt><%=Ec_field.Attribute.Fieldid.ZhName %>��</dt><!--�ֶ�ID-->
               <dd><span>
               
                    <input id="txtFieldid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tabid">
               <dt><%=Ec_field.Attribute.Tabid.ZhName %>��</dt><!--ģ��ID-->
               <dd><span>
               
                    <input id="txtTabid" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Columnname">
               <dt><%=Ec_field.Attribute.Columnname.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtColumnname" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Tablename">
               <dt><%=Ec_field.Attribute.Tablename.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTablename" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Generatedtype">
               <dt><%=Ec_field.Attribute.Generatedtype.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtGeneratedtype" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Uitype">
               <dt><%=Ec_field.Attribute.Uitype.ZhName %>��</dt><!--�ؼ�����-->
               <dd><span>
               
                    <select id="txtUitype" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Fieldname">
               <dt><%=Ec_field.Attribute.Fieldname.ZhName %>��</dt><!--�ֶ���-->
               <dd><span>
               
                    <input id="txtFieldname" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Fieldlabel">
               <dt><%=Ec_field.Attribute.Fieldlabel.ZhName %>��</dt><!--�ֶα�ǩ-->
               <dd><span>
               
                    <input id="txtFieldlabel" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Readonly">
               <dt><%=Ec_field.Attribute.Readonly.ZhName %>��</dt><!--ֻ��-->
               <dd><span>
               
                    <select id="txtReadonly" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Presence">
               <dt><%=Ec_field.Attribute.Presence.ZhName %>��</dt><!--�Ƿ����-->
               <dd><span>
               
                    <select id="txtPresence" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Selected">
               <dt><%=Ec_field.Attribute.Selected.ZhName %>��</dt><!--�Ƿ�ѡ��-->
               <dd><span>
               
                    <select id="txtSelected" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Maximumlength">
               <dt><%=Ec_field.Attribute.Maximumlength.ZhName %>��</dt><!--��󳤶�-->
               <dd><span>
               
                    <input id="txtMaximumlength" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Sequence">
               <dt><%=Ec_field.Attribute.Sequence.ZhName %>��</dt><!--˳���-->
               <dd><span>
               
                    <input id="txtSequence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Block">
               <dt><%=Ec_field.Attribute.Block.ZhName %>��</dt><!--���ֱ��-->
               <dd><span>
               
                    <input id="txtBlock" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Displaytype">
               <dt><%=Ec_field.Attribute.Displaytype.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtDisplaytype" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Typeofdata">
               <dt><%=Ec_field.Attribute.Typeofdata.ZhName %>��</dt><!--������o���Ǳ�-->
               <dd><span>
               
                    <input id="txtTypeofdata" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Quickcreate">
               <dt><%=Ec_field.Attribute.Quickcreate.ZhName %>��</dt><!--�Ƿ���ٴ���-->
               <dd><span>
               
                    <select id="txtQuickcreate" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Quickcreatesequence">
               <dt><%=Ec_field.Attribute.Quickcreatesequence.ZhName %>��</dt><!--���ٴ����Ĵ���-->
               <dd><span>
               
                    <input id="txtQuickcreatesequence" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="Info_type">
               <dt><%=Ec_field.Attribute.Info_type.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtInfo_type" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="CtrlType">
               <dt><%=Ec_field.Attribute.CtrlType.ZhName %>��</dt><!--�ؼ�����-->
               <dd><span>
               
                    <select id="txtCtrlType" runat="server" >
                    </select>
               </span></dd>
        </dl>
         <dl class="btn"><dd>
         <span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span>
         </dd></dl>
    </div> 

        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=Ec_field.Attribute.Fieldid._ZhName %></td><!--�ֶ�ID-->
                    
                    
                    <td><%=Ec_field.Attribute.Tabid._ZhName %></td><!--ģ��ID-->
                    
                    
                    <td><%=Ec_field.Attribute.Columnname._ZhName %></td><!--����-->
                    
                    
                    <td><%=Ec_field.Attribute.Tablename._ZhName %></td><!--����-->
                    
                    
                    <td><%=Ec_field.Attribute.Generatedtype._ZhName %></td><!--��������-->
                    
                    
                    <td><%=Ec_field.Attribute.Uitype._ZhName %></td><!--�ؼ�����-->
                    
                    
                    <td><%=Ec_field.Attribute.Fieldname._ZhName %></td><!--�ֶ���-->
                    
                    
                    <td><%=Ec_field.Attribute.Fieldlabel._ZhName %></td><!--�ֶα�ǩ-->
                    
                    
                    <td><%=Ec_field.Attribute.Readonly._ZhName %></td><!--ֻ��-->
                    
                    
                    <td><%=Ec_field.Attribute.Presence._ZhName %></td><!--�Ƿ����-->
                    
                    
                    <td><%=Ec_field.Attribute.Selected._ZhName %></td><!--�Ƿ�ѡ��-->
                    
                    
                    <td><%=Ec_field.Attribute.Maximumlength._ZhName %></td><!--��󳤶�-->
                    
                    
                    <td><%=Ec_field.Attribute.Sequence._ZhName %></td><!--˳���-->
                    
                    
                    <td><%=Ec_field.Attribute.Block._ZhName %></td><!--���ֱ��-->
                    
                    
                    <td><%=Ec_field.Attribute.Displaytype._ZhName %></td><!--״̬-->
                    
                    
                    <td><%=Ec_field.Attribute.Typeofdata._ZhName %></td><!--������o���Ǳ�-->
                    
                    
                    <td><%=Ec_field.Attribute.Quickcreate._ZhName %></td><!--�Ƿ���ٴ���-->
                    
                    
                    <td><%=Ec_field.Attribute.Quickcreatesequence._ZhName %></td><!--���ٴ����Ĵ���-->
                    
                    
                    <td><%=Ec_field.Attribute.Info_type._ZhName %></td><!--����-->
                    
                    
                    <td><%=Ec_field.Attribute.CtrlType._ZhName %></td><!--�ؼ�����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
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
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

