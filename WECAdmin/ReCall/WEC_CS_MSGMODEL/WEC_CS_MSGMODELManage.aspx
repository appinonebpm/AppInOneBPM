<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_CS_MSGMODELManage.aspx.cs" Inherits="WEC_CS_MSGMODELManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
        
         
            <dl colname="WEC_CS_MSGMODEL.ID">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CS_MSGMODEL.AID">
               <dt><%=WEC_CS_MSGMODEL.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CS_MSGMODEL.ADDTIME">
               <dt><%=WEC_CS_MSGMODEL.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CS_MSGMODEL.STATUS">
               <dt><%=WEC_CS_MSGMODEL.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_CS_MSGMODEL.MODELCONTENT">
               <dt>ģ�����ݣ�</dt><!--ģ������(ռλ-->
               <dd><span>
               
                    <input id="txtMODELCONTENT" type="text" runat="server"  ck="{len:16,type:0}" />
               </span></dd>
               
        </dl>

          </dl>
         
            <dl colname="WEC_CS_MSGMODEL.MODELNAME">
               <dt>ģ������</dt><!--ģ������(ռλ-->
               <dd><span>
               
                    <input id="txtMODELNAME" type="text" runat="server"  ck="{len:16,type:0}" />
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
            <li><span><input power="newWEC_CS_MSGMODEL" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_CS_MSGMODELEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_CS_MSGMODEL" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_CS_MSGMODELEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_CS_MSGMODEL" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_CS_MSGMODELBack.aspx');" /></span></li>
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
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    
                    
                    <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.ID.LongName%>',show:1}"><%=WEC_CS_MSGMODEL.Attribute.ID._ZhName %></td><!--���-->
                    
                   
                    
                    <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.AID.LongName%>',show:1}"><%=WEC_CS_MSGMODEL.Attribute.AID._ZhName %></td><!--���ںű��-->
                    
                     <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.MODELNAME.LongName%>',show:1}">ģ������</td>
                    
                    <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_CS_MSGMODEL.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
                    
                    
                    <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.STATUS.LongName%>',show:1}"><%=WEC_CS_MSGMODEL.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_CS_MSGMODEL.Attribute.MODELCONTENT.LongName%>',show:1}">ģ������</td><!--ģ������(ռλ-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_CS_MSGMODEL)Container.DataItem).ID%>" /></td>                   
                   
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).AID %></td>
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).MODELNAME %></td>
                    
                    <td><%#(((WEC_CS_MSGMODEL)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_CS_MSGMODEL)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(WEC_CS_MSGMODEL.Attribute.STATUS, ((WEC_CS_MSGMODEL)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#((WEC_CS_MSGMODEL)Container.DataItem).MODELCONTENT %></td>
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