<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_XX_MESSAGESel.aspx.cs" Inherits="WEC_XX_MESSAGESel" %>
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
               <dt><%=WEC_XX_MESSAGE.Attribute.ID.ZhName %>��</dt><!--���-->
               <dd><span>
               
                    <input id="txtID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="OPENID">
               <dt><%=WEC_XX_MESSAGE.Attribute.OPENID.ZhName %>��</dt><!--΢��ID-->
               <dd><span>
               
                    <input id="txtOPENID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="TYPE">
               <dt><%=WEC_XX_MESSAGE.Attribute.TYPE.ZhName %>��</dt><!--��Ϣ����-->
               <dd><span>
               
                    <select id="txtTYPE" runat="server" >
                    </select>
               </span></dd>
        </dl>
         
            <dl colname="S_CONTENT">
               <dt><%=WEC_XX_MESSAGE.Attribute.S_CONTENT.ZhName %>��</dt><!--��Ϣ����(nv-->
               <dd><span>
               
                    <textarea id="txtS_CONTENT" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl colname="ADDTIME">
               <dt><%=WEC_XX_MESSAGE.Attribute.ADDTIME.ZhName %>��</dt><!--���ʱ��-->
               <dd><span>
               
                    <input id="txtADDTIME" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="ISCOLLECT">
               <dt><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT.ZhName %>��</dt><!--�Ƿ��ղ�-->
               <dd><span>
               
                    <input id="txtISCOLLECT" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LATITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LATITUDE.ZhName %>��</dt><!--γ��-->
               <dd><span>
               
                    <input id="txtLATITUDE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="LONGITUDE">
               <dt><%=WEC_XX_MESSAGE.Attribute.LONGITUDE.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtLONGITUDE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PRECISION">
               <dt><%=WEC_XX_MESSAGE.Attribute.PRECISION.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtPRECISION" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CITY">
               <dt><%=WEC_XX_MESSAGE.Attribute.CITY.ZhName %>��</dt><!--�û����ڳ���-->
               <dd><span>
               
                    <input id="txtCITY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="PROVINCE">
               <dt><%=WEC_XX_MESSAGE.Attribute.PROVINCE.ZhName %>��</dt><!--�û�����ʡ-->
               <dd><span>
               
                    <input id="txtPROVINCE" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="COUNTRY">
               <dt><%=WEC_XX_MESSAGE.Attribute.COUNTRY.ZhName %>��</dt><!--�û����ڹ���-->
               <dd><span>
               
                    <input id="txtCOUNTRY" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="HEADIMGURL">
               <dt><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL.ZhName %>��</dt><!--�û�ͷ�����-->
               <dd><span>
               
                    <input id="txtHEADIMGURL" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="CHANNELID">
               <dt><%=WEC_XX_MESSAGE.Attribute.CHANNELID.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtCHANNELID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl colname="AID">
               <dt><%=WEC_XX_MESSAGE.Attribute.AID.ZhName %>��</dt><!--���ںű��-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server" />
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
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ID._ZhName %></td><!--���-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.OPENID._ZhName %></td><!--΢��ID-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.TYPE._ZhName %></td><!--��Ϣ����-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.S_CONTENT._ZhName %></td><!--��Ϣ����(nv-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ADDTIME._ZhName %></td><!--���ʱ��-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.ISCOLLECT._ZhName %></td><!--�Ƿ��ղ�-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LATITUDE._ZhName %></td><!--γ��-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.LONGITUDE._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PRECISION._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CITY._ZhName %></td><!--�û����ڳ���-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.PROVINCE._ZhName %></td><!--�û�����ʡ-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.COUNTRY._ZhName %></td><!--�û����ڹ���-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.HEADIMGURL._ZhName %></td><!--�û�ͷ�����-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.CHANNELID._ZhName %></td><!--����-->
                    
                    
                    <td><%=WEC_XX_MESSAGE.Attribute.AID._ZhName %></td><!--���ںű��-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="repCus" runat="server">
                    <ItemTemplate>
                     <tr>
                       
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).OPENID %></td>
                    
                    
                    <td><%#FormHelper.GetText(WEC_XX_MESSAGE.Attribute.TYPE, ((WEC_XX_MESSAGE)Container.DataItem).TYPE)%></td>
                    
                    <!--HTML-->
                     <td><%#HtmlHelper.GetSummary(((WEC_XX_MESSAGE)Container.DataItem).S_CONTENT) %></td>
                    
                    
                    <td><%#(((WEC_XX_MESSAGE)Container.DataItem).ADDTIME == DateTime.MinValue) ? "" : ((WEC_XX_MESSAGE)Container.DataItem).ADDTIME.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).ISCOLLECT %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LATITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).LONGITUDE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PRECISION %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CITY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).PROVINCE %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).COUNTRY %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).HEADIMGURL %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).CHANNELID %></td>
                    
                    
                    <td><%#((WEC_XX_MESSAGE)Container.DataItem).AID %></td>
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

