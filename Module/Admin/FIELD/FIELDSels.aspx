<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="TF_TB_FIELDSels2" CodeFile="FIELDSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows(); Sels_Load();
        });
    </script>
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
     <div class="topfindl">
         
            <dl colname="FIELD_ID">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_ID.ZhName %>��</dt><!--ID-->
               <dd><span>
                
                    <input id="txtFIELD_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FIELD_NAME">
               <dt><%=TF_TB_FIELD.Attribute.FIELD_NAME.ZhName %>��</dt><!--�ֶ���-->
               <dd><span>
                
                    <input id="txtFIELD_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FIELD_TYPE">
               <dt></dt><!--�ֶ�����-->
               <dd><span>
               
                    <select id="txtFIELD_TYPE" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="DB_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.DB_TYPE.ZhName %>��</dt><!--��Ӧ��������-->
               <dd><span>
                
                    <input id="txtDB_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IS_NULL">
               <dt><%=TF_TB_FIELD.Attribute.IS_NULL.ZhName %>��</dt><!--IS_NULL-->
               <dd><span>
                
                    <input id="txtIS_NULL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=TF_TB_FIELD.Attribute.NOTE.ZhName %>��</dt><!--������-->
               <dd><span>
                
                    <input id="txtNOTE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_VAL">
               <dt><%=TF_TB_FIELD.Attribute.DEFAULT_VAL.ZhName %>��</dt><!--Ĭ��ֵ-->
               <dd><span>
                
                    <input id="txtDEFAULT_VAL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TB_ID">
               <dt><%=TF_TB_FIELD.Attribute.TB_ID.ZhName %>��</dt><!--������ID-->
               <dd><span>
                
                    <input id="txtTB_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="CTRL_TYPE">
               <dt><%=TF_TB_FIELD.Attribute.CTRL_TYPE.ZhName %>��</dt><!--Ĭ�Ͽؼ�����-->
               <dd><span>
                
                    <input id="txtCTRL_TYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="SORT_NO">
               <dt><%=TF_TB_FIELD.Attribute.SORT_NO.ZhName %>��</dt><!--���-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server"/>
               </span></dd>
        </dl>     
        <dl><dt>&nbsp;</dt><dd class="btn">
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
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.FIELD_ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.FIELD_NAME._ZhName %><!--�ֶ���--></td>
                    
                    
                   <%-- <td><%=TF_TB_FIELD.Attribute.FIELD_TYPE._ZhName %><!--�ֶ�����--></td>
                    --%>
                    
                    <td><%=TF_TB_FIELD.Attribute.DB_TYPE._ZhName %><!--��Ӧ��������--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.IS_NULL._ZhName %><!--IS_NULL--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.NOTE._ZhName %><!--������--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.DEFAULT_VAL._ZhName %><!--Ĭ��ֵ--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.TB_ID._ZhName %><!--������ID--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.CTRL_TYPE._ZhName %><!--Ĭ�Ͽؼ�����--></td>
                    
                    
                    <td><%=TF_TB_FIELD.Attribute.SORT_NO._ZhName %><!--���--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %>" /></td>
                     
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_ID %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).FIELD_NAME %></td>
                    
            <%--        
                    <td><%#formhelper.GetOptionText(TF_TB_FIELD.Attribute.FIELD_TYPE, ((TF_TB_FIELD)Container.DataItem).FIELD_TYPE)%></td>
                    
                    --%>
                    <td><%#((TF_TB_FIELD)Container.DataItem).DB_TYPE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).IS_NULL %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).DEFAULT_VAL %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).TB_ID %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).CTRL_TYPE %></td>
                    
                    
                    <td><%#((TF_TB_FIELD)Container.DataItem).SORT_NO %></td>
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
