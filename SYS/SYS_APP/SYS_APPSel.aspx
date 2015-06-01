<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="SYS_APPSel.aspx.cs" Inherits="SYS_APPSel" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%><%@ Import Namespace="AgileFrame.Common" %>
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
         
            <dl colname="APP_ID">
               <dt><%=SYS_APP.Attribute.APP_ID.ZhName %>��</dt><!--APP_ID-->
               <dd><span>
               
                    <input id='txtAPP_ID' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="APP_NAME">
               <dt><%=SYS_APP.Attribute.APP_NAME.ZhName %>��</dt><!--APP_NAM-->
               <dd><span>
               
                    <input id='txtAPP_NAME' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="APP_LABEL">
               <dt><%=SYS_APP.Attribute.APP_LABEL.ZhName %>��</dt><!--Ӧ��ϵͳ��-->
               <dd><span>
               
                    <input id='txtAPP_LABEL' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="DEFAULT_URL">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL.ZhName %>��</dt><!--�ڲ���ҳ��ַ-->
               <dd><span>
               
                    <textarea id='txtDEFAULT_URL' class='smalltextarea' cols='1' rows='1' style='height:20px;width:300px;overflow:hidden;' 
                            runat='server'  />
               </span></dd>
        </dl>
         
            <dl colname="DEFAULT_URL_NAME">
               <dt><%=SYS_APP.Attribute.DEFAULT_URL_NAME.ZhName %>��</dt><!--�ڲ���ҳ����-->
               <dd><span>
               
                    <input id='txtDEFAULT_URL_NAME' type='text' runat='server' />
               </span></dd>
        </dl>
         
            <dl colname="IsBigSystem">
               <dt><%=SYS_APP.Attribute.IsBigSystem.ZhName %>��</dt><!--�Ƿ����ϵͳ-->
               <dd><span>
               
                    <select id='txtIsBigSystem' runat='server' >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="Note">
               <dt><%=SYS_APP.Attribute.Note.ZhName %>��</dt><!--��ע-->
               <dd><span>
               
                    <textarea id='txtNote' cols='1' rows='1' style='height:80px;width:450px;overflow:hidden;' 
                            runat='server'  />
               </span></dd>
        </dl>
         
            <dl colname="APP_IMG">
               <dt><%=SYS_APP.Attribute.APP_IMG.ZhName %>��</dt><!--ͼ��-->
               <dd><span>
               
                    <input id='txtAPP_IMG' type='text' runat='server' />
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
                    
                    
                    <td><%=SYS_APP.Attribute.APP_ID._ZhName %></td><!--APP_ID-->
                    
                    
                    <td><%=SYS_APP.Attribute.APP_NAME._ZhName %></td><!--APP_NAM-->
                    
                    
                    <td><%=SYS_APP.Attribute.APP_LABEL._ZhName %></td><!--Ӧ��ϵͳ��-->
                    
                    
                    <td><%=SYS_APP.Attribute.DEFAULT_URL._ZhName %></td><!--�ڲ���ҳ��ַ-->
                    
                    
                    <td><%=SYS_APP.Attribute.DEFAULT_URL_NAME._ZhName %></td><!--�ڲ���ҳ����-->
                    
                    
                    <td><%=SYS_APP.Attribute.IsBigSystem._ZhName %></td><!--�Ƿ����ϵͳ-->
                    
                    
                    <td><%=SYS_APP.Attribute.Note._ZhName %></td><!--��ע-->
                    
                    
                    <td><%=SYS_APP.Attribute.APP_IMG._ZhName %></td><!--ͼ��-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_ID %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_NAME %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_LABEL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).DEFAULT_URL_NAME %></td>
                    
                    
                    <td><%#FormHelper.Factory(conn).GetOptionText(SYS_APP.Attribute.IsBigSystem, ((SYS_APP)Container.DataItem).IsBigSystem)%></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((SYS_APP)Container.DataItem).Note) %></td>
                    
                    
                    <td><%#((SYS_APP)Container.DataItem).APP_IMG %></td>
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

