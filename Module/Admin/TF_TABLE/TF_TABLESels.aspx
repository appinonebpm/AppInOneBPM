<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="TF_TABLESels.aspx.cs" Inherits="TF_TABLESels" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
    <script type="text/javascript">$(function () { Sels_Load(); });</script>
    <style type="text/css">
    #divList tbody tr td{ cursor:pointer;}
    .lrlayout .left{border:none;}
   </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
 <div class="main">
    <input id="hidCondition" type="hidden" runat="server" />
    <input id="hidOld" type="hidden" runat="server" />
    <input id="hidInitIDS" type="hidden" runat="server" />
    <div class="titnav">
       <dl><dt><b><%#title %>��ѡ</b></dt><dd></dd></dl>
    </div>
    <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
     <div class="topfind">
         
            <dl colname="TB_ID">
               <dt><%=TF_TABLE.Attribute.TB_ID.ZhName %>��</dt><!--��ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_NAME">
               <dt><%=TF_TABLE.Attribute.TB_NAME.ZhName %>��</dt><!--����-->
               <dd><span>
                
                    <input id="txtTB_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WF_TB_NAME">
               <dt><%=TF_TABLE.Attribute.WF_TB_NAME.ZhName %>��</dt><!--���̱���-->
               <dd><span>
                
                    <input id="txtWF_TB_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CH_NAME">
               <dt><%=TF_TABLE.Attribute.CH_NAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtCH_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="M_TB_ID">
               <dt><%=TF_TABLE.Attribute.M_TB_ID.ZhName %>��</dt><!--����ID-->
               <dd><span>
                
                    <input id="txtM_TB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_TABLE.Attribute.SORT_NO.ZhName %>��</dt><!--���-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_TYPE">
               <dt><%=TF_TABLE.Attribute.TB_TYPE.ZhName %>��</dt><!--������-->
               <dd><span>
               
                    <select id="txtTB_TYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=TF_TABLE.Attribute.NOTE.ZhName %>��</dt><!--��ע-->
               <dd><span>
               
                    <input id="txtNOTE" type="text" runat="server"/>

               </span></dd>
        </dl>
        
            <dl colname="CREATED">
               <dt><%=TF_TABLE.Attribute.CREATED.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtCREATED" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DB_SRC">
               <dt><%=TF_TABLE.Attribute.DB_SRC.ZhName %>��</dt><!--����Դ-->
               <dd><span>
                
                    <input id="txtDB_SRC" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="MENU_NAME">
               <dt><%=TF_TABLE.Attribute.MENU_NAME.ZhName %>��</dt><!--ģ��˵���-->
               <dd><span>
                
                    <input id="txtMENU_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KEY_NAME">
               <dt><%=TF_TABLE.Attribute.KEY_NAME.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtKEY_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="KEY_TYPE">
               <dt><%=TF_TABLE.Attribute.KEY_TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtKEY_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="API_NAME">
               <dt><%=TF_TABLE.Attribute.API_NAME.ZhName %>��</dt><!--API������-->
               <dd><span>
                
                    <input id="txtAPI_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_REPORT">
               <dt><%=TF_TABLE.Attribute.ALLOW_REPORT.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtALLOW_REPORT" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_ACTIVITY">
               <dt><%=TF_TABLE.Attribute.ALLOW_ACTIVITY.ZhName %>��</dt><!--����-->
               <dd><span>
                
                    <input id="txtALLOW_ACTIVITY" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="MODIFY_HIS">
               <dt><%=TF_TABLE.Attribute.MODIFY_HIS.ZhName %>��</dt><!--�����ֶ���ʷ-->
               <dd><span>
                
                    <input id="txtMODIFY_HIS" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_USER_AREA">
               <dt><%=TF_TABLE.Attribute.ALLOW_USER_AREA.ZhName %>��</dt><!--�����û����ֲ�-->
               <dd><span>
                
                    <input id="txtALLOW_USER_AREA" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ALLOW_PUBLIC">
               <dt><%=TF_TABLE.Attribute.ALLOW_PUBLIC.ZhName %>��</dt><!--�����ڿͻ������վ ��ѡ��ʹ���Զ�������ͨ�� Salesforce �ͻ������վʹ�á�-->
               <dd><span>
                
                    <input id="txtALLOW_PUBLIC" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="TB_NAMESPACE">
               <dt><%=TF_TABLE.Attribute.TB_NAMESPACE.ZhName %>��</dt><!--�����ռ�ǰ׺-->
               <dd><span>
                
                    <input id="txtTB_NAMESPACE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="INSTALL_STAT">
               <dt><%=TF_TABLE.Attribute.INSTALL_STAT.ZhName %>��</dt><!--����״̬-->
               <dd><span>
                
                    <input id="txtINSTALL_STAT" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="ADD_NOTE_FILE">
               <dt><%=TF_TABLE.Attribute.ADD_NOTE_FILE.ZhName %>��</dt><!--��ӱ�ע�͸���-->
               <dd><span>
                
                    <input id="txtADD_NOTE_FILE" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>
        
            <dl colname="HAS_WF">
               <dt><%=TF_TABLE.Attribute.HAS_WF.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtHAS_WF" type="checkbox" runat="server" class="ckbs" />
               </span></dd>
        </dl>     
        <dl class="btn"><dd>
        <a href="#" class="btn"><asp:Button ID="btnFind" runat="server" Text="��ѯ" OnClick="btnFind_Click" /></a>
        <a href="#" class="btn"><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "ȷ��ѡ��") %>" onclick="selok();" /></a>
        <a href="#" class="btn"><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "���") %>" /></a>
        </dd></dl>
        <div class="clear"></div>
    </div>    
    <div class="lrlayout">
    <div class="left" style="width:150px;height:400px;">
       <select id="selectedlist" multiple="multiple" style="color:Blue;width:100%;height:100%;">
       </select>
    </div>
    <div class="right" style="margin-left:152px;height:400px;">
    <div class="tblist" id="divList">
       <table cellpadding="0" cellspacing="0">
             <thead>
                <tr>
                    <td><input type="checkbox" id="ckSelAll" name="all" value='<%=LanguageService.GetLanguageString("ChooseAll", "ȫѡ") %>' onclick='_selAll(this);'/><%=LanguageService.GetLanguageString("Choose", "ѡ��") %></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_ID._ZhName %><!--��ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAME._ZhName %><!--����--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.WF_TB_NAME._ZhName %><!--���̱���--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.CH_NAME._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.M_TB_ID._ZhName %><!--����ID--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.SORT_NO._ZhName %><!--���--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_TYPE._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.NOTE._ZhName %><!--��ע--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.CREATED._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.DB_SRC._ZhName %><!--����Դ--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.MENU_NAME._ZhName %><!--ģ��˵���--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_NAME._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.KEY_TYPE._ZhName %><!--��������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.API_NAME._ZhName %><!--API������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_REPORT._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_ACTIVITY._ZhName %><!--����--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.MODIFY_HIS._ZhName %><!--�����ֶ���ʷ--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_USER_AREA._ZhName %><!--�����û����ֲ�--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ALLOW_PUBLIC._ZhName %><!--�����ڿͻ������վ ��ѡ��ʹ���Զ�������ͨ�� Salesforce �ͻ������վʹ�á�--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.TB_NAMESPACE._ZhName %><!--�����ռ�ǰ׺--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.INSTALL_STAT._ZhName %><!--����״̬--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.ADD_NOTE_FILE._ZhName %><!--��ӱ�ע�͸���--></td>
                    
                    
                    <td><%=TF_TABLE.Attribute.HAS_WF._ZhName %><!--��������--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_TABLE)Container.DataItem).TB_ID %>" /></td>
                     
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).WF_TB_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CH_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).M_TB_ID %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(TF_TABLE.Attribute.TB_TYPE, ((TF_TABLE)Container.DataItem).TB_TYPE)%></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((TF_TABLE)Container.DataItem).NOTE) %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).CREATED %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).DB_SRC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MENU_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).KEY_TYPE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).API_NAME %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_REPORT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_ACTIVITY %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).MODIFY_HIS %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_USER_AREA %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ALLOW_PUBLIC %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).TB_NAMESPACE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).INSTALL_STAT %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).ADD_NOTE_FILE %></td>
                    
                    
                    <td><%#((TF_TABLE)Container.DataItem).HAS_WF %></td>
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
     </div>
 </div>
</asp:Content>
