<%@ Page Title="�û�ѡ��" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="WF_NEXTSTEP_TPLSel" CodeFile="NextSTEPS.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <base target="_self" />
    <script type="text/javascript">
    var manager = new ListManager({ listCID: "tblist" });
    $(function () {
        manager.initBodyRows(); Sel_Load();
    });
    function setShowCond(pamara) {
        var url = "../CondSet.aspx?" + pamara + "&r=" + Math.random();
        window.showModalDialog(url, "winCondSet", "dialogHeight=650px; dialogWidth=750px;dialogLeft:;dialogTop:; status=No;");
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server"><input id="hidCondition" type="hidden" runat="server" />

  <div class="warn">
      <asp:Literal ID="litWarn" runat="server"></asp:Literal>
  </div>
  <div class="tool">
        <am>��ڽڵ㣺</am>
        <ol>
            <li><span><input id="Button1" type="button" value="ѡ��ڵ�" onclick="manager.newRecord('STEPSels.aspx','STEP_ID=<%=stepid %>&WFID=<%=wfid %>&PROCID=<%=procid %>&STEP_TYPE=1&PATH_TYPE=1');" /></span></li>
        </ol>
    </div>
   <div class="tblist" id="Div3">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=WF_STEPATH_TPL.Attribute.STEP_ID._ZhName %></td><!--����ID-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName%></td><!--������-->
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody3">
                <asp:Repeater ID="rep0" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).STEP_ID%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).GetValue(WF_STEP_TPL.Attribute.STEP_NAME)%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
 <div class="topfind">
  <dl><dt>������ڽڵ㣺</dt><dd><select id="txtCONDITION" style="width:130px" runat="server"><%--ddlReal--%>
          <option value="0">��</option>
          <option value="1">��</option>
          <option value="2">ͨ������</option>
          <option value="3">�Զ��幫ʽ(&&||)</option>
      </select></dd></dl>
      <dl><dt>��ʽ��</dt><dd><input id="txtFORMULAR" type="text" runat="server" ck="{need:0,len:50,type:0}"/>
      </dd></dl>
      <dl class="btn"><dd> 
      <span><asp:Button ID="btnSave" runat="server" Text="����" onclick="btnSave_Click" /></span>          
      </dd></dl>
  </div>

   <div class="tool">
        <am>�����-ͨ������</am>
        <ol>
            <li><span><input id="Button2" type="button" value="ѡ��ڵ�" onclick="manager.newRecord('STEPSels.aspx','STEP_ID=<%=stepid %>&WFID=<%=wfid %>&PROCID=<%=procid %>&STEP_TYPE=2&PATH_TYPE=1');" /></span></li>
        </ol>
    </div>
        <div class="tblist" id="tblist">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=WF_STEPATH_TPL.Attribute.STEP_ID._ZhName %></td><!--����ID-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName%></td><!--������-->
                    <td><%#WF_STEPATH_TPL.Attribute.CONDITION._ZhName %></td>
                    <td><%#WF_STEPATH_TPL.Attribute.FORMULAR._ZhName %></td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody-rows">
                <asp:Repeater ID="rep1" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).NEXT_ID%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).GetValue(WF_STEP_TPL.Attribute.STEP_NAME)%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).CONDITION%> <a onclick="manager.newRecord('../CondSet.aspx','<%# getUrl(((WF_STEPATH_TPL)Container.DataItem).STEP_ID, ((WF_STEPATH_TPL)Container.DataItem).NEXT_ID) %>')" target="_blank">����</a></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).FORMULAR%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>

        <div class="tool">
        <am>�ٳ���-ͨ������</am>
        <ol>
           <li><span><input id="Button3" type="button" value="ѡ��ڵ�" onclick="manager.newRecord('STEPSels.aspx','STEP_ID=<%=stepid %>&WFID=<%=wfid %>&PROCID=<%=procid %>&STEP_TYPE=2&PATH_TYPE=3');" /></span></li>
        </ol>
    </div>
        <div class="tblist" id="Div1">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=WF_STEPATH_TPL.Attribute.STEP_ID._ZhName %></td><!--����ID-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName%></td><!--������-->
                    <td><%#WF_STEPATH_TPL.Attribute.CONDITION._ZhName %></td>
                    <td><%#WF_STEPATH_TPL.Attribute.FORMULAR._ZhName %></td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody1">
                <asp:Repeater ID="rep3" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).NEXT_ID%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).GetValue(WF_STEP_TPL.Attribute.STEP_NAME)%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).CONDITION%> <a href="../CondSet.aspx?<%# getUrl(((WF_STEPATH_TPL)Container.DataItem).STEP_ID, ((WF_STEPATH_TPL)Container.DataItem).NEXT_ID) %>" target="_blank">����</a></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).FORMULAR%></td>
                     </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>
        
        <div class="tool"  style="display:none">
        <am>��ת����</am>
        <ol>
            <li><span><input id="Button4" type="button" value="ѡ��ڵ�" onclick="manager.newRecord('STEPSels.aspx','STEP_ID=<%=stepid %>&PROCID=<%=procid %>&STEP_TYPE=1&PATH_TYPE=2');" /></span></li>
        </ol>
    </div>

        <div class="tblist" id="Div2" style="display:none">
          <table cellpadding="0" cellspacing="0">
            <thead>
                <tr>
                    <td><%=WF_STEPATH_TPL.Attribute.STEP_ID._ZhName %></td><!--����ID-->
                    <td><%=WF_STEP_TPL.Attribute.STEP_NAME._ZhName%></td><!--������-->
                    <td><%#WF_STEPATH_TPL.Attribute.CONDITION._ZhName %></td>
                    <td><%#WF_STEPATH_TPL.Attribute.FORMULAR._ZhName %></td>
                </tr>
            </thead>
            <tbody style="cursor:pointer;" id="tbody2">
                <asp:Repeater ID="rep2" runat="server">
                    <ItemTemplate>
                     <tr>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).NEXT_ID%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).GetValue(WF_STEP_TPL.Attribute.STEP_NAME)%></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).CONDITION%> <a href="../CondSet.aspx?<%# getUrl(((WF_STEPATH_TPL)Container.DataItem).STEP_ID, ((WF_STEPATH_TPL)Container.DataItem).NEXT_ID) %>" target="_blank">����</a></td>
                    <td><%#((WF_STEPATH_TPL)Container.DataItem).FORMULAR%></td>
                     </tr>   
                    </ItemTemplate>
                </asp:Repeater>
            </tbody>
         </table>
        </div>

</asp:Content>

