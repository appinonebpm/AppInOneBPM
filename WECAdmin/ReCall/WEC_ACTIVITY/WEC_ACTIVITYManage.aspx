<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ACTIVITYManage.aspx.cs" Inherits="WEC_ACTIVITYManage" %>
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
        //bindWinResize(500);
        try{
            $("#display_search").click(function () {
                $(".topfind").toggleClass("hide");   if($("#display_search").val()=="��ʾ��ѯ")$("#display_search").val("���ز�ѯ");else $("#display_search").val("��ʾ��ѯ");     
            });

            $("a").click(function () {
                var a_id = $($(this).parent().siblings()[0]).children("[type=checkbox]").val();
                location.href = "../WEC_ACTIVITY_SNCODE/WEC_ACTIVITY_SNCODEManage.aspx?a_id=" + a_id;
            });
        }catch(e){}
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

            <dl colname="WEC_ACTIVITY.ID">
               <dt><%=WEC_ACTIVITY.Attribute.ID.ZhName %>��</dt><!--���(ID)-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd></dl>
         
            <dl colname="WEC_ACTIVITY.AID">
               <dt><%=WEC_ACTIVITY.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.KEYWORD">
               <dt><%=WEC_ACTIVITY.Attribute.KEYWORD.ZhName %>��</dt><!--�ؼ���(NAM-->
               <dd><span>
               
                    <input id="txtKEYWORD" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.INSTRUCTION.ZhName %>��</dt><!--�ɹ�����ȯ˵��-->
               <dd><span>
               
                    <input id="txtINSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TIME">
               <dt><%=WEC_ACTIVITY.Attribute.TIME.ZhName %>��</dt><!--�ʱ��-->
               <dd><span>
               
                    <input id="txtTIME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.START_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.START_PICURL.ZhName %>��</dt><!--2-���ʼͼ-->
               <dd><span>
               
                    <input id="txtSTART_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.WIN_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_PICURL.ZhName %>��</dt><!--�н�����ʾ��ͷ-->
               <dd><span>
               
                    <input id="txtWIN_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.OUT_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.OUT_PICURL.ZhName %>��</dt><!--�н�ͼƬ������-->
               <dd><span>
               
                    <input id="txtOUT_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_THEME">
               <dt><%=WEC_ACTIVITY.Attribute.END_THEME.ZhName %>��</dt><!--3-�������-->
               <dd><span>
               
                    <input id="txtEND_THEME" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_PICURL">
               <dt><%=WEC_ACTIVITY.Attribute.END_PICURL.ZhName %>��</dt><!--3-�����ͼ-->
               <dd><span>
               
                    <input id="txtEND_PICURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_ONE.ZhName %>��</dt><!--��Ʒ���1-->
               <dd><span>
               
                    <input id="txtTYPE_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_ONE.ZhName %>��</dt><!--ͼƬ��ַ1-->
               <dd><span>
               
                    <input id="txtPIC_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_ONE.ZhName %>��</dt><!--�Ż�ȯ����1-->
               <dd><span>
               
                    <input id="txtNAME_ONE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_ONE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_ONE.ZhName %>��</dt><!--�Ż�ȯ����1-->
               <dd><span>
               
                    <input id="txtNUM_ONE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_TWO.ZhName %>��</dt><!--��Ʒ���2-->
               <dd><span>
               
                    <input id="txtTYPE_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_TWO.ZhName %>��</dt><!--ͼƬ��ַ2-->
               <dd><span>
               
                    <input id="txtPIC_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_TWO.ZhName %>��</dt><!--�Ż�ȯ����2-->
               <dd><span>
               
                    <input id="txtNAME_TWO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_TWO">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_TWO.ZhName %>��</dt><!--�Ż�ȯ����2-->
               <dd><span>
               
                    <input id="txtNUM_TWO" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_THREE.ZhName %>��</dt><!--��Ʒ���3-->
               <dd><span>
               
                    <input id="txtTYPE_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_THREE.ZhName %>��</dt><!--ͼƬ��ַ3-->
               <dd><span>
               
                    <input id="txtPIC_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_THREE.ZhName %>��</dt><!--�Ż�ȯ����3-->
               <dd><span>
               
                    <input id="txtNAME_THREE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_THREE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_THREE.ZhName %>��</dt><!--�Ż�ȯ����3-->
               <dd><span>
               
                    <input id="txtNUM_THREE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FOUR.ZhName %>��</dt><!--��Ʒ���4-->
               <dd><span>
               
                    <input id="txtTYPE_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FOUR.ZhName %>��</dt><!--ͼƬ��ַ4-->
               <dd><span>
               
                    <input id="txtPIC_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FOUR.ZhName %>��</dt><!--�Ż�ȯ����4-->
               <dd><span>
               
                    <input id="txtNAME_FOUR" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_FOUR">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FOUR.ZhName %>��</dt><!--�Ż�ȯ����4-->
               <dd><span>
               
                    <input id="txtNUM_FOUR" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_FIVE.ZhName %>��</dt><!--��Ʒ���5-->
               <dd><span>
               
                    <input id="txtTYPE_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_FIVE.ZhName %>��</dt><!--ͼƬ��ַ5-->
               <dd><span>
               
                    <input id="txtPIC_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_FIVE.ZhName %>��</dt><!--�Ż�ȯ����5-->
               <dd><span>
               
                    <input id="txtNAME_FIVE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_FIVE">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_FIVE.ZhName %>��</dt><!--�Ż�ȯ����5-->
               <dd><span>
               
                    <input id="txtNUM_FIVE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TYPE_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.TYPE_SIX.ZhName %>��</dt><!--��Ʒ���6-->
               <dd><span>
               
                    <input id="txtTYPE_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PIC_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.PIC_SIX.ZhName %>��</dt><!--ͼƬ��ַ6-->
               <dd><span>
               
                    <input id="txtPIC_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NAME_SIX.ZhName %>��</dt><!--�Ż�ȯ����6-->
               <dd><span>
               
                    <input id="txtNAME_SIX" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUM_SIX">
               <dt><%=WEC_ACTIVITY.Attribute.NUM_SIX.ZhName %>��</dt><!--�Ż�ȯ����6-->
               <dd><span>
               
                    <input id="txtNUM_SIX" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CONFIRM_PWD">
               <dt><%=WEC_ACTIVITY.Attribute.CONFIRM_PWD.ZhName %>��</dt><!--�ҽ�����-->
               <dd><span>
               
                    <input id="txtCONFIRM_PWD" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SN_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.SN_RENAME.ZhName %>��</dt><!--SN��������Ϊ-->
               <dd><span>
               
                    <input id="txtSN_RENAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.TEL_RENAME">
               <dt><%=WEC_ACTIVITY.Attribute.TEL_RENAME.ZhName %>��</dt><!--�ֻ���������-->
               <dd><span>
               
                    <input id="txtTEL_RENAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SHOW_NUM">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_NUM.ZhName %>��</dt><!--�齱ҳ���Ƿ���-->
               <dd><span>
               
                    <input id="txtSHOW_NUM" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SN_CODE">
               <dt><%=WEC_ACTIVITY.Attribute.SN_CODE.ZhName %>��</dt><!--SN����������-->
               <dd><span>
               
                    <input id="txtSN_CODE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NAME">
               <dt><%=WEC_ACTIVITY.Attribute.NAME.ZhName %>��</dt><!--�����-->
               <dd><span>
               
                    <input id="txtNAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CONTENT">
               <dt><%=WEC_ACTIVITY.Attribute.CONTENT.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INFO">
               <dt><%=WEC_ACTIVITY.Attribute.INFO.ZhName %>��</dt><!--�˵��-->
               <dd><span>
               
                    <input id="txtINFO" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.USE_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.USE_INSTRUCTION.ZhName %>��</dt><!--�һ�ȯʹ��˵��-->
               <dd><span>
               
                    <input id="txtUSE_INSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.END_INSTRUCTION">
               <dt><%=WEC_ACTIVITY.Attribute.END_INSTRUCTION.ZhName %>��</dt><!--�����˵��-->
               <dd><span>
               
                    <input id="txtEND_INSTRUCTION" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.STATUS">
               <dt><%=WEC_ACTIVITY.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <select id="txtSTATUS" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.ADDTIME">
               <dt><%=WEC_ACTIVITY.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.FOR_PEOPLE">
               <dt><%=WEC_ACTIVITY.Attribute.FOR_PEOPLE.ZhName %>��</dt><!--������Ⱥ-->
               <dd><span>
               
                    <input id="txtFOR_PEOPLE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PROBABILITY">
               <dt><%=WEC_ACTIVITY.Attribute.PROBABILITY.ZhName %>��</dt><!--�н�����-->
               <dd><span>
               
                    <input id="txtPROBABILITY" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NUMBER_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.NUMBER_TIMES.ZhName %>��</dt><!--ÿ����������-->
               <dd><span>
               
                    <input id="txtNUMBER_TIMES" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.MOST_NUM_TIMES">
               <dt><%=WEC_ACTIVITY.Attribute.MOST_NUM_TIMES.ZhName %>��</dt><!--ÿ��ÿ������-->
               <dd><span>
               
                    <input id="txtMOST_NUM_TIMES" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.KIND">
               <dt><%=WEC_ACTIVITY.Attribute.KIND.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <select id="txtKIND" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.INFORMATION">
               <dt><%=WEC_ACTIVITY.Attribute.INFORMATION.ZhName %>��</dt><!--�ҽ���Ϣ-->
               <dd><span>
               
                    <input id="txtINFORMATION" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.WIN_INFO.ZhName %>��</dt><!--�н���ʾ-->
               <dd><span>
               
                    <input id="txtWIN_INFO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.NO_WIN_INFO">
               <dt><%=WEC_ACTIVITY.Attribute.NO_WIN_INFO.ZhName %>��</dt><!--δ�н���ʾ-->
               <dd><span>
               
                    <input id="txtNO_WIN_INFO" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SHOW_WIN_USRE">
               <dt><%=WEC_ACTIVITY.Attribute.SHOW_WIN_USRE.ZhName %>��</dt><!--��ʾ����-->
               <dd><span>
               
                    <input id="txtSHOW_WIN_USRE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.PLAY_AUDIO">
               <dt><%=WEC_ACTIVITY.Attribute.PLAY_AUDIO.ZhName %>��</dt><!--����ѡ��-->
               <dd><span>
               
                    <input id="txtPLAY_AUDIO" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.MP3_URL">
               <dt><%=WEC_ACTIVITY.Attribute.MP3_URL.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtMP3_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.RULES">
               <dt><%=WEC_ACTIVITY.Attribute.RULES.ZhName %>��</dt><!--�����-->
               <dd><span>
               
                    <input id="txtRULES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.SYSTEM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.SYSTEM_SCORE.ZhName %>��</dt><!--ÿ��ϵͳ��ֵ-->
               <dd><span>
               
                    <input id="txtSYSTEM_SCORE" type="text" runat="server"  ck="{len:4,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_ACTIVITY.CUSTOM_SCORE">
               <dt><%=WEC_ACTIVITY.Attribute.CUSTOM_SCORE.ZhName %>��</dt><!--ÿ���Զ����ֵ-->
               <dd><span>
               
                    <input id="txtCUSTOM_SCORE" type="text" runat="server"  ck="{len:4,type:1}" />
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
            <li><span><input power="newWEC_ACTIVITY" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_ACTIVITYEdit.aspx?kind=<%=kind%>');" /></span></li>
            <li><span><input power="editWEC_ACTIVITY" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_ACTIVITYEdit.aspx?kind=<%=kind%>');" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_ACTIVITY" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_ACTIVITYBack.aspx');" /></span></li>
            <li><span><input type="button" value="��ʾ��ѯ" id="display_search"/></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist" >
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="Manage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>                       
                        <%                        
                          if ("1".Equals(kind)||"0".Equals(kind)||"2".Equals(kind)||"5".Equals(kind))
                          {
                         %>
                               <td >�����</td>                    
                    
                               <td >�ؼ���</td>                    
                    
                               <td >��Ч��������</td>
                       
                               <td >�������</td>

                               <td>��ʼʱ��/����ʱ��</td>
                               
                               <td>������Ⱥ</td>

                               <td>״̬</td>

                               <td>����</td>
                         <%
                          }
                         %>
                
            </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_ACTIVITY)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_ACTIVITY)Container.DataItem).PATH, ((WEC_ACTIVITY)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    <%    
                        if ("1".Equals(kind)||"0".Equals(kind)||"2".Equals(kind)||"5".Equals(kind))
                          {
                         %>
                               <td><%#((WEC_ACTIVITY)Container.DataItem).NAME %></td>
                    
                               <td><%#((WEC_ACTIVITY)Container.DataItem).KEYWORD %></td>
                    
                    
                               <td><%#((WEC_ACTIVITY)Container.DataItem).JOIN_NUM %></td>
                       
                               <td><%#((WEC_ACTIVITY)Container.DataItem).SCAN_NUM %></td>

                               <td><%#((WEC_ACTIVITY)Container.DataItem).TIME %></td>
                               
                               <td><%#((WEC_ACTIVITY)Container.DataItem).FOR_PEOPLE %></td>

                               <td><%#FormHelper.GetText(WEC_ACTIVITY.Attribute.STATUS, ((WEC_ACTIVITY)Container.DataItem).STATUS)%></td>

                               <td><a href="javascript:;">SN�����</a></td>
                         <%
                          }
                         %>
                    
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