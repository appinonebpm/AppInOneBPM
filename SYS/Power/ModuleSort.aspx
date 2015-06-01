<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="sys_MenuInfoSort" Title="ģ������" CodeFile="ModuleSort.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script src="../../Lib/JQuery/jquery-1.3.2.min.js" type="text/javascript"></script>
<script type="text/javascript">
function checkValue(me){
    if(me.value!=""){
        if(!/^(\d{1,9}.\d{1,3})|\d{1,9}$/.test(me.value)){
              alert("���������֣�");
              $(me).addClass("need")
              me.value="";txts[i].focus();return false;
        }
    }
}
function beforeSort(){
    var hid=$("#hidSortInfo");
    var txts=$("#tbodylist").find("input");
    var mid="";var val="";
    var info="";
    for(var i=0;i<txts.length;i++){
        mid=txts[i].id.split('_')[1];
        val=txts[i].value;
        if(val==""){
            alert("��������ţ�");
            txts[i].focus();return false;
        }
        if(info!=""){
            info+="|";
        }
        info+=mid+","+val;
    } 
    hid.val(info);
    return true;
}
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="topnav">
  <dl><dt><b>ģ������</b></dt><dd></dd></dl>
    <input id="hidSortInfo" name="hidSortInfo" type="hidden" />
</div>
<div class="tblist">
    <table cellpadding="0" cellspacing="0">
         <thead>
            <tr>
               <td>ԭ���</td>
               <td>ģ����</td>
               <td>����ҳ��</td>
               <td>״̬</td>
               <td>�����</td>
            </tr>
         </thead>
         <tbody id="tbodylist">
               <asp:Repeater ID="repList" runat="server">
                   <ItemTemplate>
                   <tr>
                      <td><%#((SYS_MODULE)Container.DataItem).SORT_NO%></td>
                      <td><%#((SYS_MODULE)Container.DataItem).MDL_NAME%></td>
                      <td><%#((SYS_MODULE)Container.DataItem).PAGE_URL%></td>
                      <td><%#((SYS_MODULE)Container.DataItem).USE_FLAG == "1" ? "ʹ����" : "����"%></td>
                      <td>
                          <input id='txt_<%#((SYS_MODULE)Container.DataItem).MDL_ID%>' value='<%#((SYS_MODULE)Container.DataItem).SORT_NO%>' type="text" style="width:50px;" onblur="checkValue(this);" /></td>
                   </tr>
                  </ItemTemplate>
              </asp:Repeater>
          </tbody>
      </table>
</div>
<div class="tool">
<p><span><asp:Button ID="btnOK" runat="server" Text="ȷ��" onclick="btnOK_Click" OnClientClick="return beforeSort();" Width="51" /></span></p>

</div>
</asp:Content>


