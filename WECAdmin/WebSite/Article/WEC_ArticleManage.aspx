<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ArticleManage.aspx.cs" Inherits="WEC_ArticleManage" %>
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
         
            <dl colname="WEC_Article.ID" class="hide">
               <dt><%=WEC_Article.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.CID" class="hide">
               <dt><%=WEC_Article.Attribute.CID.ZhName %>��</dt><!--��Ŀ���-->
               <dd><span>
               
                    <input id="txtCID" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.AID" class="hide">
               <dt><%=WEC_Article.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"  ck="{len:18,type:1}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.TITLE">
               <dt><%=WEC_Article.Attribute.TITLE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server"  ck="{len:50,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.DES">
               <dt><%=WEC_Article.Attribute.DES.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtDES" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.CONTENT" class="hide">
               <dt><%=WEC_Article.Attribute.CONTENT.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server"  ck="{len:3000,type:0}" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.URL" class="hide">
               <dt><%=WEC_Article.Attribute.URL.ZhName %>��</dt><!--������ַ-->
               <dd><span>
               
                    <input id="txtURL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.PIC_URL" class="hide">
               <dt><%=WEC_Article.Attribute.PIC_URL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtPIC_URL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="WEC_Article.MODEL_ID" class="hide">
               <dt><%=WEC_Article.Attribute.MODEL_ID.ZhName %>��</dt><!--ģ����-->
               <dd><span>
               
                    <input id="txtMODEL_ID" type="text" runat="server"  ck="{len:18,type:1}" />
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
            <li><span><input power="newWEC_Article" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('WEC_ArticleEdit.aspx?DeptID=<%=deptid %>','','1',900,700);" /></span></li>
            <li><span><input power="editWEC_Article" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('WEC_ArticleEdit.aspx?DeptID=<%=deptid %>','','1',900,700);" /></span></li>
<%--            <li><span class="btn"><input power="newWEC_Article" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('WEC_ArticleBack.aspx');" /></span></li>
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
                    
                    
                   <%-- <td data="{colname:'<%=WEC_Article.Attribute.ID.LongName%>',show:1}"><%=WEC_Article.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.CID.LongName%>',show:1}"><%=WEC_Article.Attribute.CID._ZhName %></td><!--��Ŀ���-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.AID.LongName%>',show:1}"><%=WEC_Article.Attribute.AID._ZhName %></td><!--���ںű��-->
                    --%>
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.TITLE.LongName%>',show:1}"><%=WEC_Article.Attribute.TITLE._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.DES.LongName%>',show:1}"><%=WEC_Article.Attribute.DES._ZhName %></td><!--����-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.URL.LongName%>',show:1}"><%=WEC_Article.Attribute.URL._ZhName %></td><!--������ַ-->
                    
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.PIC_URL.LongName%>',show:1}"><%=WEC_Article.Attribute.PIC_URL._ZhName %></td><!--ͼƬ��ַ-->
                  <%--  
                    
                    <td data="{colname:'<%=WEC_Article.Attribute.MODEL_ID.LongName%>',show:1}"><%=WEC_Article.Attribute.MODEL_ID._ZhName %></td><!--ģ����-->--%>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((WEC_Article)Container.DataItem).ID%>" /></td>
                   <%-- <td><%#showLeftLinks(((WEC_Article)Container.DataItem).PATH, ((WEC_Article)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                   <%-- <td><%#((WEC_Article)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).AID %></td>--%>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).DES %></td>
  

                    <td><%#((WEC_Article)Container.DataItem).URL %></td>
                    
                    
                    <td><img style="width:50px;height:50px;" src="<%#((WEC_Article)Container.DataItem).PIC_URL %>" /></td>
  <%--                  
                    
                    <td><%#((WEC_Article)Container.DataItem).MODEL_ID %></td>
                    --%>
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