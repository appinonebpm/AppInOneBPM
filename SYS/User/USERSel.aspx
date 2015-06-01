<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="SYS_USERSel" CodeFile="USERSel.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self" />
    <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
    <script type="text/javascript">
        var selectedID = "";
        var selinfo = "";
        $(function () {
            var trs = $("#tbody-rows").find("tr");
            for (var i = 0; i < trs.length; i++) {
                var trObj = $(trs[i]);
                trObj.bind("click", trObj, function (e) {
                    selThis(e.data, trs);
                });
                trObj.bind("dblclick", trObj, function (e) { //��Ϊѡ����ʱ��Ч��˫��ֱ��ѡ���У����رմ���
                    selThis(e.data, trs);
                    selok();
                });
            }
        });

        /*ѡ�в�����*/
        function selok() {
            if (selinfo == "") {
                alert('������ѡ��һ��');
                return;
            }
            if (window.opener != null) {
                if (opener.getSelInfo(selinfo)) {
                    opener.getSelInfo(selinfo);
                    window.opener = null;
                    window.open('', '_self');
                    window.close();
                }
            } else {
                if (window.location.search.indexOf("ifr=") != -1) {
                    if (parent.getSelInfo) {
                        parent.getSelInfo(selinfo);
                    }
                    if (parent.closeIfrWin) {
                        parent.closeIfrWin();
                    }
                } else {
                    window.returnValue = selinfo; //����һ��JSON��ʽ���ַ����� alert(window.returnValue);
                    window.close();
                }
            }
        }

        function selThis(el, trs) {
            var tds = el.children();
            selectedID = $(tds[0]).text();
            selinfo = "({ID:'" + selectedID + "',Name:'" + $(tds[1]).text() + "'})"; //ѡ��td��һ��
            //alert(selinfo);
            trs.removeClass("sel");
            el.addClass("sel");
        }        
   </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
  <div class="topnav">
      <dl>
      <dt><a onclick="openNextArea(this);"></a><b>��ѯ</b></dt>
      <dd><span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span></dd>
      <span><input id="btnSelOK" type="button" onclick="selok();" style="width:60px;" value="ȷ��ѡ��" /></span>
      </dl>
   </div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_ID.ZhName %>��</dt><!--�û���ʶ-->
               <dd><span>
                
                    <input id="txtUSER_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_NAME.ZhName %>��</dt><!--�û���-->
               <dd><span>
                
                    <input id="txtUSER_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.PASS.ZhName %>��</dt><!--����-->
               <dd><span>
                
                    <input id="txtPASS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.EMAIL.ZhName %>��</dt><!--�ڲ��ʼ�-->
               <dd><span>
                
                    <input id="txtEMAIL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.LOGIN_IPS.ZhName %>��</dt><!--�ɵ�¼IP��ַ����-->
               <dd><span>
                
                    <input id="txtLOGIN_IPS" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USE_FLAG.ZhName%>��</dt><!--״̬��־-->
               <dd><span>
               
                    <select id="txtSTATE_FLAG" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.EDITTIME.ZhName%>��</dt><!--�޸�ʱ��-->
               <dd><span>
               
                    <input id="txtEDITIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.ADDTIME.ZhName %>��</dt><!--¼��ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=SYS_USER.Attribute.USER_TYPE.ZhName %>��</dt><!--�û�����-->
               <dd><span>
               
                    <select id="txtUSER_TYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
    </div> 

        <div class="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    
                    
                    <td><%=SYS_USER.Attribute.USER_ID._ZhName %></td><!--�û���ʶ-->
                    
                    
                    <td><%=SYS_USER.Attribute.USER_NAME._ZhName %></td><!--�û���-->
                    
                    
                    <td><%=SYS_USER.Attribute.PASS._ZhName %></td><!--����-->
                    
                    
                    <td><%=SYS_USER.Attribute.EMAIL._ZhName %></td><!--�ڲ��ʼ�-->
                    
                    
                    <td><%=SYS_USER.Attribute.LOGIN_IPS._ZhName %></td><!--�ɵ�¼IP��ַ����-->
                    
                    
                    <td><%=SYS_USER.Attribute.USE_FLAG._ZhName%></td><!--״̬��־-->
                    
                    
                    <td><%=SYS_USER.Attribute.EDITTIME._ZhName%></td><!--�޸�ʱ��-->
                    
                    
                    <td><%=SYS_USER.Attribute.ADDTIME._ZhName %></td><!--¼��ʱ��-->
                    
                    
                    <td><%=SYS_USER.Attribute.USER_TYPE._ZhName %></td><!--�û�����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_USER)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).USER_NAME %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).PASS %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((SYS_USER)Container.DataItem).LOGIN_IPS %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USE_FLAG, ((SYS_USER)Container.DataItem).USE_FLAG)%></td>
                    
                    
                    <td><%#(((SYS_USER)Container.DataItem).EDITTIME == DateTime.MinValue) ? "" : ((SYS_USER)Container.DataItem).EDITTIME.ToString("yyyy-MM-dd HH:mm")%></td>
                    
                    
                    <td><%#(((SYS_USER)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((SYS_USER)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#FormHelper.GetText(SYS_USER.Attribute.USER_TYPE, ((SYS_USER)Container.DataItem).USER_TYPE)%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        <div class="pages">
           <WebCtrl:AspNetPager ID="aspPager" runat="server" 
         onpagechanged="aspPager_PageChanged">
     </WebCtrl:AspNetPager>
        </div>
</asp:Content>

