<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_C_CHANNELlISTManage.aspx.cs" Inherits="WEC_C_CHANNELlISTManage" %>
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
        $("#display_search").click(function () {
            $(".topfind").toggleClass("hide");   if($("#display_search").val()=="��ʾ��ѯ")$("#display_search").val("���ز�ѯ");else $("#display_search").val("��ʾ��ѯ"); 
        });
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
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="WEC_C_CHANNELlIST.ID" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.AID" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.STATUS" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.ADDTIME" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.NAME">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.URL" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.URL.ZhName %>��</dt><!--����url-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.REMARK" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.REMARK.ZhName %>��</dt><!--������ע-->
               <dd><span>
               
                    <input id="txtREMARK" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.CATEGORY_ID">
               <dt><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtCATEGORY_ID" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.QRCODE" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.QRCODE.ZhName %>��</dt><!--��ά����ʽ-->
               <dd><span>
               
                    <input id="txtQRCODE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.NOTE" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.NOTE.ZhName %>��</dt><!--��ע��Ϣ-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.ADDRESS" class="hide">
               <dt><%=WEC_C_CHANNELlIST.Attribute.ADDRESS.ZhName %>��</dt><!--�������ڵ���-->
               <dd><span>
               
                    <input id="txtADDRESS" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_C_CHANNELlIST.TYPE">
               <dt><%=WEC_C_CHANNELlIST.Attribute.TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
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
            <li><span><input power="newWEC_C_CHANNELlIST" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_C_CHANNELlISTEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_C_CHANNELlIST" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_C_CHANNELlISTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_C_CHANNELlIST" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_C_CHANNELlISTBack.aspx');" /></span></li>
             <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
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
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                   <%-- 
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.AID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.AID._ZhName %></td><!--���ںű��-->--%>

                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.NAME.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.NAME._ZhName %></td><!--��������-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.URL.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.URL._ZhName %></td><!--����url-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.REMARK.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.REMARK._ZhName %></td><!--������ע-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.CATEGORY_ID._ZhName %></td><!--��������-->
                    
                    
                   <%-- <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.QRCODE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.QRCODE._ZhName %></td><!--��ά����ʽ-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.NOTE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.NOTE._ZhName %></td><!--��ע��Ϣ-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ADDRESS.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ADDRESS._ZhName %></td><!--�������ڵ���-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.TYPE.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.TYPE._ZhName %></td><!--��������-->

                     <td >����</td><!--��������-->

                      <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.STATUS.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                    <td data="{colname:'<%=WEC_C_CHANNELlIST.Attribute.ADDTIME.LongName%>',show:1}"><%=WEC_C_CHANNELlIST.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_C_CHANNELlIST)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_C_CHANNELlIST)Container.DataItem).PATH, ((WEC_C_CHANNELlIST)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                <%--    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).AID %></td>--%>
     
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NAME %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).CATEGORY_ID %></td>
                    
                    
                   <%-- <td><%#((WEC_C_CHANNELlIST)Container.DataItem).QRCODE %></td>--%>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((WEC_C_CHANNELlIST)Container.DataItem).ADDRESS %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.TYPE, ((WEC_C_CHANNELlIST)Container.DataItem).TYPE)%></td>

                    <td><a href ="<%#((WEC_C_CHANNELlIST)Container.DataItem).FILEPATH %>" >����</a></td>

                    <td><%#FormHelper.GetText(WEC_C_CHANNELlIST.Attribute.STATUS, ((WEC_C_CHANNELlIST)Container.DataItem).STATUS)%></td>
                    
                    
                    <td><%#(((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_C_CHANNELlIST)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
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