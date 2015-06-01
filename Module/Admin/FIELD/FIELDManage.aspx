<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDManage2" CodeFile="FIELDManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
  <script type="text/javascript">
      function load_DivShowHide() {
          //������
          var divs = $("div.grp");
          var aObjs = divs.find("a");
          for (var a = 0; a < aObjs.length; a++) {
              var aObj = $(aObjs[a]);
              //              var tps = aObj.attr("showtypes")
              //              var hidObj;
              //              if (tps != undefined) {
              //                  hidObj = $(tps)[0];
              //              }              
              aObj.bind("click", aObj, function (e) {
                  hidObj = e.data.parent().parent().parent().next(); //�����б仯
                  var txt = e.data.text();
                  if (txt == "չ��") {
                      hidObj.show(); e.data.text("����");

                  } else {
                      hidObj.hide(); e.data.text("չ��");
                  }
              });

              aObj.parent().parent().bind("dblclick", aObj, function (e) {
                  hidObj = e.data.parent().parent().parent().next(); //�����б仯
                  var txt = e.data.text();
                  if (txt == "չ��") {
                      hidObj.show(); e.data.text("����");

                  } else {
                      hidObj.hide(); e.data.text("չ��");
                  }
              });
          }
      }
  </script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        load_DivShowHide();
        manager.initBodyRows();
        manager.initFindDL();
//        //manager.initPageSizeEvt("txtPageNum");
//        bindWinResize(50);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav grp">
    <dl><dt><b>�ֶ��б� <font color="blue"><%=title%></font>
        <asp:Button ID="btnSyn" runat="server" Text="����Դͬ��" onclick="btnSyn_Click"/>
            </b></dt><dd><a>����</a></dd></dl>
   </div>
   <div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
    <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="TF_TB_FIELD.FIELD_NAME">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>��</dt><!--�ֶ���-->
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TB_FIELD.FIELD_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.DB_TYPE.ZhName %>��</dt><!--�ֶ�����-->
               <dd><span>
               
                    <select id="txtFIELD_TYPE" runat="server" >
                    </select>
               </span></dd>
               
        </dl>
            <dl colname="TF_TB_FIELD.IS_NULL">
               <dt><%=TF_TB_FIELD.Attribute.IS_NULL.ZhName %>��</dt><!--IS_NULL-->
               <dd><span>
                
                    <input id="txtIS_NULL" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="TF_TB_FIELD.NOTE">
               <dt>������</dt><!--������-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dt></dt><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
       <%-- <ul id="ulBtns" runat="server">
            <li><span><input power="newTF_TB_FIELD" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('TF_TB_FIELDEdit.aspx');" /></span></li>
            <li><span><input power="editTF_TB_FIELD" id="btn_Edit" type="button" value="�޸�" onclick="manager.editRecord('TF_TB_FIELDEdit.aspx');" /></span></li>
            <li><span><input power="delTF_TB_FIELD" id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('TF_TB_FIELDBack.aspx');" /></span></li>
        </ul>--%>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="FIELD_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %></td><!--���-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_ID.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %></td><!--ID-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_NAME.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %></td><!--�ֶ���-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.NOTE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.NOTE._ZhName %></td><!--������-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DB_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %></td><!--�ֶ�����-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.IS_NULL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %></td><!--IS_NULL-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DEFAULT_VAL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %></td><!--Ĭ��ֵ-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %></td><!--Ĭ�Ͽؼ�����-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID%>" /></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %><%#checkDB(((TF_TB_FIELD)Container.DataItem),tbObj)%></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL==1?"����":"������" %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    <td><%#dicCtrlType[((TF_TB_FIELD)Container.DataItem).CTRL_TYPE]%></td>
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
    <div class="titnav grp">
     <dl><dt><b>Ĭ���ֶ�</b></dt><dd><a>չ��</a></dd></dl>
    </div>
    <div class="hide">
     <div class="tblist hide2">
         <table cellpadding="0" cellspacing="0">
            <thead>
                <tr keyname="FIELD_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.SORT_NO.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %></td><!--���-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_ID.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %></td><!--ID-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.FIELD_NAME.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %></td><!--�ֶ���-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.NOTE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.NOTE._ZhName %></td><!--������-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DB_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %></td><!--�ֶ�����-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.IS_NULL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %></td><!--IS_NULL-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.DEFAULT_VAL.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %></td><!--Ĭ��ֵ-->
                    <td data="{colname:'<%=TF_TB_FIELD.Attribute.CTRL_TYPE.LongName%>',show:1}"><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %></td><!--Ĭ�Ͽؼ�����-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repDefault" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID%>" /></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL==1?"����":"������" %></td>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    <td><%#dicCtrlType[((TF_TB_FIELD)Container.DataItem).CTRL_TYPE]%></td>
                </tr>
                </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
    </div>
    </div>
    <div class="titnav grp">
     <dl><dt><b>���ڽӿ�����</b></dt><dd><a>չ��</a></dd></dl>
    </div>
      <div class="hide">
         <div class="tblist" style="height:80px;">
             <table cellpadding="0" cellspacing="0">
                <thead>
                    <tr>
                    <th class="first">&nbsp;</th>
                    <th>����</th>
                    <th>Ա�����</th>
                  <%--  <th>���ڴ���</th>--%>
                    <th>��������</th>
                    <th>����������ʼʱ��</th>
                    <th>������������ʱ��</th>
                    <th>������ʼʱ��</th>
                    <th>��������ʱ��</th>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="repFangAn" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                    <tr>
                        <td class="first">&nbsp;</td>
                        <td><input name="txtTableName" type="text" value="<%#Eval("*TableName")%>" /></td>
                        <td><input name="txtUserId" type="text" value="<%#Eval("UserId")%>" /></td>
                       <%-- <td><input name="txtTYPE" type="text" value="<%#Eval("TYPE")%>" /></td>--%>
                        <td><input name="txtCheckOWA" type="text" value="<%#Eval("CheckOWA")%>" /></td>
                        <td><input name="txtUnWorkStartTime" type="text" value="<%#Eval("UnWorkStartTime")%>" /></td>
                        <td><input name="txtUnWorkEndTime" type="text" value="<%#Eval("UnWorkEndTime")%>" /></td>
                        <td><input name="txtOnWorkStartTime" type="text" value="<%#Eval("OnWorkStartTime")%>" /></td>
                        <td><input name="txtOnWorkEndTime" type="text" value="<%#Eval("OnWorkEndTime")%>" /></td>
                    </tr>
                    </ItemTemplate>
                    </asp:Repeater>
                </tbody>
             </table>
        </div>
        <div class="tool" style="height:80px;">
            <span><asp:Button ID="btnSaveFangAn" runat="server" Text="����ӿڷ���" 
                 onclick="btnSaveFangAn_Click" /></span>
        </div>
    </div>
</div>
</asp:Content>