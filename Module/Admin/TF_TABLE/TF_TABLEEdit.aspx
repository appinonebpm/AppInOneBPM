<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEEdit.aspx.cs" Inherits="TF_TABLEEdit" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>
 <script src="../../Lib/JScript/formCheck2012.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/Detail.js" type="text/javascript"></script>
 <script src="../../Lib/MyDP/selDate.js" type="text/javascript"></script>
 <script type="text/javascript">
       $(function () {

           var checker = new formChecker({btnIDS: 'btnOK,btnSave' });
       });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>
<div class="tool">
<ul>
    <li><span><asp:Button ID="btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
</div>
<div class="form" id="divForm">
       <div>
       <asp:Literal ID="LitWF" runat="server" EnableViewState="false">
            <!--ѭ��1-->
                <tr><td class='lbl'><label>{�ֶ�������}��</label></td>");
                    <td colspan='3' class='long'>
                   <!--Switch-->
                        <!--Case InputString--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:{�ֶ�js����ö��},min:0,max:{�ֶα�ǩ����},need:{�ֶ��Ƿ����}}"/></span>
                        <!--Case CheckBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--ͼƬ�ϴ�-->
<span><input id="File1" name="{�ֶοؼ���}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--�ĵ��ϴ�-->
<span><input name="{�ֶοؼ���}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML����-->
<span><textarea cols="80" rows="6" name="{�ֶοؼ���}" ck="{type:{�ֶ�js����ö��},min:0,max:{�ֶα�ǩ����},need:{�ֶ��Ƿ����}}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:3,need:{�ֶ��Ƿ����}}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--����ʱ��-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:3,need:{�ֶ��Ƿ����}}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:1,min:{�ֶ���Сֵ},max:{�ֶ����ֵ},need:{�ֶ��Ƿ����}}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:2,min:{�ֶ���Сֵ},max:{�ֶ����ֵ},need:{�ֶ��Ƿ����}}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--ѡ����-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--ѡ�񱾱��¼-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--ѡ��Ա��-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--�����б�-->
<span><select name="{����ĸ��д�ֶ���}"><!--options--></select></span>
                        
                        <!--Case Text--><!--���ı�����-->
<span><textarea cols="80" rows="6" name="{�ֶοؼ���}" ck="{type:{�ֶ�js����ö��},min:0,max:3000,need:{�ֶ��Ƿ����}}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </td></tr>
            <!--����ѭ��1-->
       </asp:Literal>
       <asp:Literal ID="Lit_Finder" runat="server" EnableViewState="false">
            <!--ѭ��1-->
                    <dl colname="{����ĸ��д����}.{����ĸ��д�ֶ���}">
                    <dt>{�ֶ�������}��</dt><dd>
                   <!--Switch-->
                        <!--Case InputString--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:{�ֶ�js����ö��},min:0,max:{�ֶα�ǩ����},need:{�ֶ��Ƿ����}}"/></span>
                        <!--Case CheckBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--ͼƬ�ϴ�-->
<span><input id="{�ֶοؼ���}" name="{�ֶοؼ���}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--�ĵ��ϴ�-->
<span><input name="{�ֶοؼ���}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML����-->
<span><textarea cols="80" rows="6" name="{�ֶοؼ���}" ck="{type:{�ֶ�js����ö��},min:0,max:{�ֶα�ǩ����},need:{�ֶ��Ƿ����}}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:3,need:{�ֶ��Ƿ����}}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--����ʱ��-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:3,need:{�ֶ��Ƿ����}}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:1,min:{�ֶ���Сֵ},max:{�ֶ����ֵ},need:{�ֶ��Ƿ����}}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--����-->
<span><input value="{VALUE}" name="{�ֶοؼ���}" type="text" ck="{type:2,min:{�ֶ���Сֵ},max:{�ֶ����ֵ},need:{�ֶ��Ƿ����}}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--ѡ����-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--ѡ�񱾱��¼-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--ѡ��Ա��-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{�ֶοؼ���}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--�����б�-->
<span><select name="{����ĸ��д�ֶ���}"><!--options--></select></span>
                        
                        <!--Case Text--><!--���ı�����-->
<span><textarea cols="80" rows="6" name="{�ֶοؼ���}" ck="{type:{�ֶ�js����ö��},min:0,max:3000,need:{�ֶ��Ƿ����}}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </dd>
                 </dl>
            <!--����ѭ��1-->
       </asp:Literal>
       </div>
       <div class="clear"></div>
    </div>
   <div class="tool">
      <ul>
    <li><span><asp:Button ID="_btnOK" runat="server" Text="�����˳�"
                onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><asp:Button ID="_btnSave" runat="server" Text="����"
            onclick="btnOK_Click"/></span></li>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>