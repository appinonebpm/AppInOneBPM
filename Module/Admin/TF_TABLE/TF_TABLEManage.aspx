<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLEManage.aspx.cs" Inherits="TF_TABLEManage" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.hide_DL();
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
        <%=initValue %>
        $('#txtTB_NAME').val('name1');        
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<input id="hidVal" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server" EnableViewState="false"></asp:Literal></div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->
        <asp:Literal ID="Lit_Finder" runat="server" EnableViewState="false">
            <!--ѭ��1-->
                    <dl colname="{����ĸ��д����}.{����ĸ��д�ֶ���}">
                    <dt>{�ֶ�������}��</dt><dd>
                   <!--Switch-->
                        <!--Case InputString--><!--����-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:0,min:0,max:50,need:0}"/></span>
                        <!--Case CheckBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case FileUpImage--><!--ͼƬ�ϴ�-->
<span><input id="{CtrlNAME}" name="{CtrlNAME}" type="file" style="width:150px;height:18px;" exdfile=".jpg|.gif|.png|.jpeg|.bmp|.ico" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case FileUpUpDoc--><!--�ĵ��ϴ�-->
<span><input name="{CtrlNAME}" type="file" style="width:150px;" exdfile=".txt|.doc|.docx|.xls|.ppt|.rar|.zip" onchange="selFileChg(this);"/>
<label style="display:inline;">{VALUE}</label>{REUPBTN}</span>
                        
                        <!--Case HTML--><!--HTML����-->
<span><textarea cols="80" rows="6" name="{CtrlNAME}" ck="{type:0,min:0,max:3600,need:0}">{VALUE}</textarea></span>
                        
                        <!--Case InputDate--><!--����-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:3,need:0}" onclick="setday(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDateTime--><!--����ʱ��-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:3,need:0}" onclick="setdatetime(this);" readonly="readonly"/></span>
                        
                        <!--Case InputDecimal--><!--����-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:1,min:0,max:99999999,need:0}" {CAL_FORMULA}/></span>
                        
                        <!--Case InputNumber--><!--����-->
<span><input value="{VALUE}" name="{CtrlNAME}" type="text" ck="{type:2,min:0,max:99999999,need:0}" {CAL_FORMULA}/></span>
                        
                        <!--Case OpenSelDept--><!--ѡ����-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selDept(this);" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelExistsRec--><!--ѡ�񱾱��¼-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selExistsRec(this,'{SEL_TB_INFO}');" value="" style="float:left;" /></span>
                        
                        <!--Case OpenSelStaff--><!--ѡ��Ա��-->
<span><input readonly="readonly" type="text" name="{NAME}_TXT" style="width:70%;float:left;" value="{VALUE}_TXT"/>
<input type="hidden" name="{CtrlNAME}" value="{VALUE}" />
<input class="sel" type="button" onclick="selStaff(this);" value="" style="float:left;" /></span>
                        
                        <!--Case RadioBoxList--><!--��ѡ�б��-->
<span class="ckbs">{INITHTML}</span>
                        
                        <!--Case SelectDrop--><!--�����б�-->
<span><select name="{����ĸ��д�ֶ���}"><!--options--></select></span>
                        
                        <!--Case Text--><!--���ı�����-->
<span><textarea cols="80" rows="6" name="{CtrlNAME}" ck="{type:0,min:0,max:3000,need:0}">{VALUE}</textarea></span>
                        
                    <!--EndSwitch-->
                    </dd>
                 </dl>
            <!--����ѭ��1-->
       </asp:Literal>
           <dl class="btn"><dd>
                <%--<span><input name="btnFind" type="submit" value="��ѯ"  /></span>--%>
                <asp:Button ID="btnFind" Text="��ѯ" runat="server" onclick="btnFind_Click" />
                <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
           <asp:Literal ID="Lit_FinderButton" runat="server" EnableViewState="false"> 
           <!--ѭ��2-->
                <!--Ȩ�޿��Ƶİ�ť-->
           <!--����ѭ��2-->
           </asp:Literal> 
           </dd></dl>
       <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><b>��ͼ:</b></li><li><a href="?tab=all">����</a></li>
            <asp:Literal ID="Lit_View" runat="server" EnableViewState="false">
            
            <!--ѭ��2-->
            <li>����1��ͼ</li>
            <li>����2��ͼ</li>
            <li>����3��ͼ</li>
            <li>����4��ͼ</li>
            <!--����ѭ��2-->
            
            </asp:Literal> 

            <li>
            <select><option value="">������ͼ</option><option value="">�༭��ͼ</option><option value="">������ͼ</option>
            <option value="">ɾ����ͼ</option>
            <option value="">������ͼ˳��</option></select>
            </li>
        </ul>
        <ol>
            
        </ol>
    </div>

    <div class="tool">    
        <asp:Literal ID="Lit_ToolLeftButton" runat="server" EnableViewState="false">        
            <ul>
               <li><a> �鿴��Χ: </a></li>
               <li><select><option value="">��������</option><option value="" selected>�Ҵ���������</option><option value="">����������</option>
                <option value="">"***��"������</option></select></li>
            <!--ѭ��2-->
                <li><span><input power="newTF_TABLE" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('TF_TABLEEdit.aspx');" /></span></li>
                <li><span><input power="editTF_TABLE" id="btn_Edit" type="button" value="�༭" onclick="manager.editRecord('TF_TABLEEdit.aspx');" /></span></li>
    <%--            <li><span class="btn"><input power="newTF_TABLE" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
                <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('TF_TABLEBack.aspx');" /></span></li>
                <li><span>                
                    <select><option value="">�����޸�</option><option value="">����ɾ��</option><option value="">�޸ĸ�����</option>
                    <option value="">�ϲ�����</option>
                    <option value="">����������</option>
                    <option value="">�������ʼ�</option>
                    </select>
                </span></li>
            <!--����ѭ��2-->
            </ul>
   </asp:Literal>         
            <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" name="txtPageSize" type="text" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="btnSetPageSize" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
      </div>
    
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
            <!-- Table Headers -->
               <asp:Literal ID="Lit_ListHeader" runat="server" EnableViewState="false">
                <tr keyname="TB_ID">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                <!--ѭ��3-->
                <td data="{colname:'[{����ĸ��д����}.{����ĸ��д�ֶ���}.LongName]',show:1}">{�ֶ�������}</td>
                <!--����ѭ��3-->                
                </tr>
                    </asp:Literal>                    
            </thead>   
            <!-- Table Contents -->
             <asp:Literal ID="Lit_RepList" runat="server" EnableViewState="false">         
            <tbody>             
             <!--ѭ��1-->
                <tr>
                    <td class="first"><input type="checkbox" value="[{����ĸ��д����}.{��һ������ĸ��д�ֶ���}]" /></td>               
               <!--ѭ��4-->
                   <%--<td><%#showLeftLinks([TF_TABLE.PATH], [TF_TABLE.PNAME], ItemIndex)%></td>--%>
                   <!--Switch-->
                     <!--Case InputString--><!--����-->
                    <td>{�ֶ�ֵ}</td>

                    <!--Case SelectDrop--><!--�����б�-->
                    <td>{�ֶ�ֵ}</td>

                    <!--Case Text--><!--���ı�����-->
                     <td>{�ֶ�ֵ}</td>
                    <!--EndSwitch-->
                <!--����ѭ��4-->
            </tr>
            <!--����ѭ��1-->   
            </tbody>            
            </asp:Literal>
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