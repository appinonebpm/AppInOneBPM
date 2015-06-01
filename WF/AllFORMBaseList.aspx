<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_ALLBASEFORMList" CodeFile="AllFORMBaseList.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager({valIndex:1});
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);

        //һ���˵�ʱ���
        var lis = $("ul.menu").find("li");
        for (var i = 0; i < lis.length; i++) {
            var liObj = $(lis[i]);

            liObj.bind("mouseover", liObj, function (e) {
                var subUL = e.data.find("ul:first");
                var www = $(window).width() - e.data.offset().left;
                window.status = www;
                subUL.show();
                if (www < subUL.width()) {
                    subUL.css({ left: "auto", right: "-1px" });
                } else {
                    subUL.css({ right: "auto", left: "-1px" });
                }
            });
            liObj.bind("mouseleave", liObj, function (e) {
                var subUL = e.data.find("ul:first");
                subUL.hide();
            });
        }
    });

    function deleteRec() {

        if (window.confirm("��ȷ��Ҫɾ����ѡ�ļ�¼��")) {
            window.location.href = "Back.aspx?DEL_RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        }
    }

    function editRec() {
        window.location.href = "Edit.aspx?WFID=<%=wfid %>&RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        }
        //chx, wfidΪ0��ʱ�򣬴Ӽ�¼��ֱ��ȡ�� ����ID
        function checkRec() {
            window.location.href = "Check.aspx?WFID=<%=wfid %>&RECID=" + manager.getSelectedID() + "&preUrl=<%=curUrl %>";
        }
</script>
<style type="text/css">
.tblist table tbody tr td.sta0{color:#999;}
.tblist table tbody tr td.sta1{color:#009;}
.tblist table tbody tr td.sta2{color:#f00;}
.tblist table tbody tr td.sta3{color:#090;}
.tblist table tbody tr td.sta4{color:#900;}
.tblist table tbody tr td.sta5{color:#660;}
.tblist table tbody tr td em{color:#666; font-style:normal;font-size:12px;font-weight:normal;}
.tblist table tbody tr td a{color:#006;font-weight:bold;}
.tblist table tbody tr td span{margin-left:3px;}
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main">
   <div class="titnav">
       <input id="hidCondition" type="hidden" runat="server" />
    <dl><dt><b><%=title %></b></dt><dd>
  <%--  <a href="FORMList.aspx?WFID=<%=wfid %>&mine=1">�ҷ����</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=0">�����</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=1">��ͨ����</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=2">�ҷ����</a>
    <a href="FORMList.aspx?WFID=<%=wfid %>&getType=-1">�Ҳ����</a>--%>
    <ul class="menu"><li class="pretit"><b>ת����</b></li>
              <asp:Literal ID="litMenu" runat="server"></asp:Literal>
     </ul>
    </dd></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal> ����״̬����ɫ��ʶ����������ɫ��־δ��������ɫ��ʶ������</div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
        <dl colname="WF_FORMBASE.RECNO">
               <dt><%=WF_FORMBASE.Attribute.RECNO.ZhName %>��</dt><!--��¼���-->
               <dd><span>
                
                    <input id="txtRECNO" type="text" runat="server" />
               </span></dd>
               
        </dl>
       <dl colname="WF_FORMBASE.DEPT_NAME">
               <dt><%=WF_FORMBASE.Attribute.DEPT_NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtDEPT_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl colname="WF_FORMBASE.STAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.STAFF_NAME.ZhName %>��</dt><!--Ա����-->
               <dd><span>
                
                    <input id="txtSTAFF_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
        <dl colname="WF_FORMBASE.CSTAFF_NAME">
               <dt><%=WF_FORMBASE.Attribute.CSTAFF_NAME.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtCSTAFF_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>

        <dl colname="WF_FORMBASE.STATUS">
               <dt><%=WF_FORMBASE.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
           <%-- <li><span><input id="btn_Check" type="button" value="����" onclick="checkRec();" /></span></li>--%>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
        <input id="hidMoreCols" type="hidden" runat="server" />
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="RECID">
                   <th class="hide" data="{colname:'<%=WF_FORMBASE.Attribute.RECID.LongName%>',show:0}"><%=WF_FORMBASE.Attribute.RECID._ZhName %></th><!--RECID-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CSTAFF_NAME.LongName%>',show:1}"><%=WF_FORMBASE.Attribute.CSTAFF_NAME.ZhName %></th><!--��������-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.RECNAME.LongName%>',show:1}">���뵥����</th><!--RECID-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.DEPT_NAME.LongName%>',show:1}"><%=WF_FORMBASE.Attribute.DEPT_NAME.ZhName %></th><!--��������-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.ADDTIME.LongName%>',show:1}"><%=WF_FORMBASE.Attribute.ADDTIME.ZhName %></th><!--¼��ʱ��-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.ADDTIME.LongName%>',show:1}">���ʱ��</th><!--¼��ʱ��-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.STATUS.LongName%>',show:1}"><%=WF_FORMBASE.Attribute.STATUS._ZhName %></th><!--�������-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CHECK_INFO.LongName%>',show:1}">��ǰ������</th><!--�������-->
                   <th data="{colname:'<%=WF_FORMBASE.Attribute.CHECK_INFO.LongName%>',show:1}">������ʷ</th><!--�������-->
                   <%--<th>�������״̬</th><!--״̬-->--%>
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="hide"><%#((WF_FORMBASE)Container.DataItem).RECID%></td>
                    <td><%#((WF_FORMBASE)Container.DataItem).CSTAFF_NAME%></td>
                    <td><%# clickUrl(((WF_FORMBASE)Container.DataItem).STATUS, ((WF_FORMBASE)Container.DataItem).CHECK_INFO, ((WF_FORMBASE)Container.DataItem).RECID, ((WF_FORMBASE)Container.DataItem).WFID, ((WF_FORMBASE)Container.DataItem).RECNAME)%></td>
                    <td><%#((WF_FORMBASE)Container.DataItem).DEPT_NAME%></td>
                    <td><%#((WF_FORMBASE)Container.DataItem).ADDTIME%></td>
                    <td><%#((WF_FORMBASE)Container.DataItem).STATUS == "3" ? Convert.ToString( ((WF_FORMBASE)Container.DataItem).EDITIME) : ""%></td>
                    <%#showStatus(((WF_FORMBASE)Container.DataItem).STATUS, ((WF_FORMBASE)Container.DataItem).CHECK_INFO, ((WF_FORMBASE)Container.DataItem).RECID)%>
                     <td><%#showStepState(((WF_FORMBASE)Container.DataItem).CHECK_INFO, ((WF_FORMBASE)Container.DataItem).RECID)%></td>
                      <td><a onclick="window.open('checklog.aspx?wfId=<%#((WF_FORMBASE)Container.DataItem).WFID%>&procId=<%#((WF_FORMBASE)Container.DataItem).PROCID%>&recId=<%#((WF_FORMBASE)Container.DataItem).RECID%>')">�鿴</a></td>
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
</asp:Content>