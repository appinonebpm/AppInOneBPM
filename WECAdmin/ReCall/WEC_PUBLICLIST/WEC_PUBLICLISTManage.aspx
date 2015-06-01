<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTManage.aspx.cs" Inherits="WEC_PUBLICLISTManage" %>
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
        //bindWinResize(40);
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
   <div class="topfind hide" ><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="WEC_PUBLICLIST.AID">
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>��</dt><!--���ں�ID-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.USER_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>��</dt><!--�û�ID-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.PLC_NAME">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>��</dt><!--���ں�����-->
               <dd><span>
               
                    <input id="txtPLC_NAME" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.PLC_SOURCEID">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>��</dt><!--ԭʼID-->
               <dd><span>
               
                    <input id="txtPLC_SOURCEID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.WECHAT_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>��</dt><!--΢�ź�-->
               <dd><span>
               
                    <input id="txtWECHAT_ID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.AVATAR_URL">
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtAVATAR_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.API_KEY">
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>��</dt><!--API��ַ-->
               <dd><span>
               
                    <input id="txtAPI_KEY" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.TOKEN">
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>��</dt><!--TOKEN-->
               <dd><span>
               
                    <input id="txtTOKEN" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.LOCATION">
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtLOCATION" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.EMAIL">
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.FUNS">
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>��</dt><!--��˿��-->
               <dd><span>
               
                    <input id="txtFUNS" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.TYPE">
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtTYPE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.START_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>��</dt><!--��ʼʱ��-->
               <dd><span>
               
                    <input id="txtSTART_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.END_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtEND_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.STATUS">
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <input id="txtSTATUS" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.PACKAGE_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>��</dt><!--�ײ�����-->
               <dd><span>
               
                    <input id="txtPACKAGE_ID" type="text" runat="server"  ck="{len:8,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.IS_NEWS">
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>��</dt><!--��ע�ظ�����-->
               <dd><span>
               
                    <select id="txtIS_NEWS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.DEFAULT_REPLAY">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>��</dt><!--Ĭ����ƥ��ظ�-->
               <dd><span>
               
                    <input id="txtDEFAULT_REPLAY" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.DEFAULT_REPLAY_FALG">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>��</dt><!--�Ƿ���-->
               <dd><span>
               
                    <select id="txtDEFAULT_REPLAY_FALG" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.LBS_DISTANCE">
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>��</dt><!--Ĭ��LBS��ѯ-->
               <dd><span>
               
                    <input id="txtLBS_DISTANCE" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.APPID">
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>��</dt><!--APPID-->
               <dd><span>
               
                    <input id="txtAPPID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_PUBLICLIST.APPSESECRET">
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>��</dt><!--APPSECR-->
               <dd><span>
               
                    <input id="txtAPPSESECRET" type="text" runat="server"  ck="{len:50,type:0}" />
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
            <li><span><input power="newWEC_PUBLICLIST" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_PUBLICLISTEdit.aspx');" /></span></li>
            <li><span><input power="editWEC_PUBLICLIST" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_PUBLICLISTEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_PUBLICLIST" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_PUBLICLISTBack.aspx');" /></span></li>
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
                <tr keyname="AID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    <%--<%
                        foreach (AttributeItem attr in valObj.af_AttributeItemList)
                        {
                         %>
                    <td data="{colname:'<%=attr.LongName%>',show:1}"><%=attr._ZhName%></td><!--���ں�ID-->
                         <%
                        } %>--%>
                    
<%--                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.AID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.AID._ZhName %></td><!--���ں�ID-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.USER_ID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.USER_ID._ZhName %></td><!--�û�ID-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.PLC_NAME.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.PLC_NAME._ZhName %></td><!--���ں�����-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID._ZhName %></td><!--ԭʼID-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.WECHAT_ID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.WECHAT_ID._ZhName %></td><!--΢�ź�-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.AVATAR_URL.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.AVATAR_URL._ZhName %></td><!--ͼƬ��ַ-->
                    
                    
                   <%-- <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.API_KEY.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.API_KEY._ZhName %></td><!--API��ַ-->--%>
                    
                    
                    <%--<td data="{colname:'<%=WEC_PUBLICLIST.Attribute.TOKEN.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.TOKEN._ZhName %></td><!--TOKEN-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.LOCATION.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.LOCATION._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.EMAIL.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.EMAIL._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.FUNS.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.FUNS._ZhName %></td><!--��˿��-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.TYPE.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.TYPE._ZhName %></td><!--��������-->
                    
                    
                  <%--  <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.START_DAY.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.START_DAY._ZhName %></td><!--��ʼʱ��-->--%>
                    
                    
                   <%-- <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.END_DAY.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.END_DAY._ZhName %></td><!--����ʱ��-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.STATUS.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.STATUS._ZhName %></td><!--״̬-->
                    
                    
                <%--    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID._ZhName %></td><!--�ײ�����-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.IS_NEWS.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.IS_NEWS._ZhName %></td><!--��ע�ظ�����-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY._ZhName %></td><!--Ĭ����ƥ��ظ�-->
                    
               <%--     
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG._ZhName %></td><!--�Ƿ���-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE._ZhName %></td><!--Ĭ��LBS��ѯ-->--%>
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.APPID.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.APPID._ZhName %></td><!--APPID-->
                    
                    
                    <td data="{colname:'<%=WEC_PUBLICLIST.Attribute.APPSESECRET.LongName%>',show:1}"><%=WEC_PUBLICLIST.Attribute.APPSESECRET._ZhName %></td><!--APPSECR-->

                    <td>����</td>
            </tr>
            </tbody>
            <tbody>

                    <%--<%
                        foreach (WEC_PUBLICLIST result1 in listObj)
                        {
                            %>
                            <tr>
                            <td class="first" valign="center"><input type="checkbox" value="<%=result1.AID%>" /></td>
                            <%
                            foreach (AttributeItem attr2 in valObj.af_AttributeItemList)
                            {
                         %>
                            <td><%=result1.GetValue(attr2)%></td>
                         <%}%>
                         </tr>
                        <%} %>--%>

                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first" valign="center"><input type="checkbox" value="<%#((WEC_PUBLICLIST)Container.DataItem).AID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_PUBLICLIST)Container.DataItem).PATH, ((WEC_PUBLICLIST)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
   <%--                 
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).AID%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).USER_ID %></td>--%>
                    
                    
                    <td>
                        <a href="javascript:;" onclick="parent.location.href='../../../Index.aspx?appid=2&aid=<%#((WEC_PUBLICLIST)Container.DataItem).AID %>'">
                        <%#((WEC_PUBLICLIST)Container.DataItem).PLC_NAME %>
                        </a>

                    </td>
                    
                    <td>
                        <a href="javascript:;" onclick="parent.location.href='../../../Index.aspx?appid=2&aid=<%#((WEC_PUBLICLIST)Container.DataItem).AID %>'">
                        <img style="width:50px;height:50px;"src="../../../UpLoadFiles/<%#((WEC_PUBLICLIST)Container.DataItem).USER_ID %>/<%#((WEC_PUBLICLIST)Container.DataItem).AID%>/<%#((WEC_PUBLICLIST)Container.DataItem).AVATAR_URL %>" />
                            </a>
                            </td>
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PLC_SOURCEID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).WECHAT_ID %></td>
                    
                    
                    
                    
              <%--      <td><%#((WEC_PUBLICLIST)Container.DataItem).API_KEY %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TOKEN %></td>--%>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LOCATION %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).FUNS %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TYPE %></td>
                    
                    
               <%--     <td><%#(((WEC_PUBLICLIST)Container.DataItem).START_DAY == DateTime.MinValue) ? "" : ((WEC_PUBLICLIST)Container.DataItem).START_DAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#(((WEC_PUBLICLIST)Container.DataItem).END_DAY == DateTime.MinValue) ? "" : ((WEC_PUBLICLIST)Container.DataItem).END_DAY.ToString("yyyy-MM-dd HH:mm") %></td>--%>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).STATUS==0?"δ��":"�Ѱ�" %></td>
                    
                    
                 <%--   <td><%#((WEC_PUBLICLIST)Container.DataItem).PACKAGE_ID %></td>--%>
                    
                    
                    <td><%#FormHelper.GetText(WEC_PUBLICLIST.Attribute.IS_NEWS, ((WEC_PUBLICLIST)Container.DataItem).IS_NEWS)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY %></td>
                    
                    
                  <%--  <td><%#FormHelper.GetText(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG, ((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY_FALG)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LBS_DISTANCE %></td>--%>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPSESECRET %></td>
                    <td>
                        <a href="javascript:;" onclick="parent.location.href='../../../Index.aspx?appid=2&aid=<%#((WEC_PUBLICLIST)Container.DataItem).AID %>'">����</a>
                        <a href="javascript:;" onclick="location.href=">��</a></td>

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