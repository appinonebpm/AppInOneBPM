<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_ArticleSel.aspx.cs" Inherits="WEC_ArticleSel" %>
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
         
            <dl colname="ID">
               <dt><%=WEC_Article.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CID">
               <dt><%=WEC_Article.Attribute.CID.ZhName %>��</dt><!--��Ŀ���-->
               <dd><span>
               
                    <input id="txtCID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_Article.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TITLE">
               <dt><%=WEC_Article.Attribute.TITLE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtTITLE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="DES">
               <dt><%=WEC_Article.Attribute.DES.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <textarea id="txtDES" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="CONTENT">
               <dt><%=WEC_Article.Attribute.CONTENT.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtCONTENT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="URL">
               <dt><%=WEC_Article.Attribute.URL.ZhName %>��</dt><!--������ַ-->
               <dd><span>
               
                    <textarea id="txtURL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="PIC_URL">
               <dt><%=WEC_Article.Attribute.PIC_URL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <textarea id="txtPIC_URL" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="MODEL_ID">
               <dt><%=WEC_Article.Attribute.MODEL_ID.ZhName %>��</dt><!--ģ����-->
               <dd><span>
               
                    <input id="txtMODEL_ID" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_Article.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td><%=WEC_Article.Attribute.CID._ZhName %></td><!--��Ŀ���-->
                    
                    
                    <td><%=WEC_Article.Attribute.AID._ZhName %></td><!--���ںű��-->
                    
                    
                    <td><%=WEC_Article.Attribute.TITLE._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_Article.Attribute.DES._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_Article.Attribute.CONTENT._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_Article.Attribute.URL._ZhName %></td><!--������ַ-->
                    
                    
                    <td><%=WEC_Article.Attribute.PIC_URL._ZhName %></td><!--ͼƬ��ַ-->
                    
                    
                    <td><%=WEC_Article.Attribute.MODEL_ID._ZhName %></td><!--ģ����-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_Article)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).TITLE %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).DES %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).CONTENT %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).URL %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).PIC_URL %></td>
                    
                    
                    <td><%#((WEC_Article)Container.DataItem).MODEL_ID %></td>
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

