<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="IM_PURORDERSels" CodeFile="PURORDERSels.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/Mdl/Manager.js" type="text/javascript"></script>
    <script src="../../Lib/JScript/MyOptions.js" type="text/javascript"></script>
    <script type="text/javascript">
        var manager = new ListManager({ listID: 'divList' });
        $(function () {
            manager.initBodyRows();
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
         
            <dl colname="PORD_ID">
               <dt><%=IM_PURORDER.Attribute.PORD_ID.ZhName %>��</dt><!--ID-->
               <dd><span>
                
                    <input id="txtPORD_ID" type="text" runat="server" ck="{need:1,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="PORD_NO">
               <dt><%=IM_PURORDER.Attribute.PORD_NO.ZhName %>��</dt><!--���ݱ��-->
               <dd><span>
                
                    <input id="txtPORD_NO" type="text" runat="server" ck="{need:0,len:20,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="C_DATE">
               <dt><%=IM_PURORDER.Attribute.C_DATE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtC_DATE" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="ORG_ID">
               <dt><%=IM_PURORDER.Attribute.ORG_ID.ZhName %>��</dt><!--����ID-->
               <dd><span>
                
                    <input id="txtORG_ID" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="DEPT_ID">
               <dt><%=IM_PURORDER.Attribute.DEPT_ID.ZhName %>��</dt><!--����ID-->
               <dd><span>
                
                    <input id="txtDEPT_ID" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="SUP_ID">
               <dt><%=IM_PURORDER.Attribute.SUP_ID.ZhName %>��</dt><!--��Ӧ��ID-->
               <dd><span>
                
                    <input id="txtSUP_ID" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="PERSON_HID">
               <dt><%=IM_PURORDER.Attribute.PERSON_HID.ZhName %>��</dt><!--������ID-->
               <dd><span>
                
                    <input id="txtPERSON_HID" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="TS_NO">
               <dt><%=IM_PURORDER.Attribute.TS_NO.ZhName %>��</dt><!--�˵���-->
               <dd><span>
                
                    <input id="txtTS_NO" type="text" runat="server" ck="{need:0,len:20,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="GOODES_NUM">
               <dt><%=IM_PURORDER.Attribute.GOODES_NUM.ZhName %>��</dt><!--��������-->
               <dd><span>
                
                    <input id="txtGOODES_NUM" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="ARRIVAL_DATE">
               <dt><%=IM_PURORDER.Attribute.ARRIVAL_DATE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtARRIVAL_DATE" type="text" readonly="readonly" onclick="setTime(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="PACKAGE_TYPE">
               <dt><%=IM_PURORDER.Attribute.PACKAGE_TYPE.ZhName %>��</dt><!--��װ��ʽ-->
               <dd><span>
                
                    <input id="txtPACKAGE_TYPE" type="text" runat="server" ck="{need:0,len:5,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="TS_DEPT">
               <dt><%=IM_PURORDER.Attribute.TS_DEPT.ZhName %>��</dt><!--���˵�λ-->
               <dd><span>
                
                    <input id="txtTS_DEPT" type="text" runat="server" ck="{need:0,len:250,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="PHONE">
               <dt><%=IM_PURORDER.Attribute.PHONE.ZhName %>��</dt><!--�绰-->
               <dd><span>
                
                    <input id="txtPHONE" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="COST_PEICE_FLAG">
               <dt><%=IM_PURORDER.Attribute.COST_PEICE_FLAG.ZhName %>��</dt><!--�ɱ��۲ɹ�-->
               <dd><span>
                
                    <input id="txtCOST_PEICE_FLAG" type="text" runat="server" ck="{need:0,len:2,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="STOR_ID">
               <dt><%=IM_PURORDER.Attribute.STOR_ID.ZhName %>��</dt><!--STOR_ID-->
               <dd><span>
                
                    <input id="txtSTOR_ID" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="DEDUCTION_RATE">
               <dt><%=IM_PURORDER.Attribute.DEDUCTION_RATE.ZhName %>��</dt><!--����-->
               <dd><span>
                
                    <input id="txtDEDUCTION_RATE" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="TAX_RATE">
               <dt><%=IM_PURORDER.Attribute.TAX_RATE.ZhName %>��</dt><!--TAX_RATE-->
               <dd><span>
                
                    <input id="txtTAX_RATE" type="text" runat="server" ck="{need:0,len:2147483647,dtype:1}"/>
               </span></dd>
        </dl>
        
            <dl colname="CREATER">
               <dt><%=IM_PURORDER.Attribute.CREATER.ZhName %>��</dt><!--CREATER-->
               <dd><span>
                
                    <input id="txtCREATER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="CHECKER">
               <dt><%=IM_PURORDER.Attribute.CHECKER.ZhName %>��</dt><!--CHECKER-->
               <dd><span>
                
                    <input id="txtCHECKER" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="NOTE">
               <dt><%=IM_PURORDER.Attribute.NOTE.ZhName %>��</dt><!--��ע-->
               <dd><span>
               <input id="txtNOTE" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="REMARK">
               <dt><%=IM_PURORDER.Attribute.REMARK.ZhName %>��</dt><!--ժҪ-->
               <dd><span>
               <input id="txtREMARK" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="EXP1">
               <dt><%=IM_PURORDER.Attribute.EXP1.ZhName %>��</dt><!--�Զ���1-->
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        
            <dl colname="EXP2">
               <dt><%=IM_PURORDER.Attribute.EXP2.ZhName %>��</dt><!--�Զ���2-->
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>
        <dl colname="EXP3">
               <dt><%=IM_PURORDER.Attribute.EXP3.ZhName %>��</dt><!--�Զ���3-->
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" ck="{need:0,len:50,dtype:0}"/>
               </span></dd>
        </dl>     
        <dl style="width:300px;"><dt>&nbsp;</dt><dd class="btn">
        <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" OnClick="btnFind_Click" /></span>
        <span><input id="btnSelOK" type="button" value="<%=LanguageService.GetLanguageString("SureChoose", "ȷ��ѡ��") %>" onclick="selok();" /></span>
        <span><input type="button" id="btnClear" value="<%=LanguageService.GetLanguageString("Clear", "���") %>" /></span>
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
                    
                    
                    <td><%=IM_PURORDER.Attribute.PORD_ID._ZhName %><!--ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.PORD_NO._ZhName %><!--���ݱ��--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.C_DATE._ZhName %><!--��������--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.ORG_ID._ZhName %><!--����ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.DEPT_ID._ZhName %><!--����ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.SUP_ID._ZhName %><!--��Ӧ��ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.PERSON_HID._ZhName %><!--������ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.TS_NO._ZhName %><!--�˵���--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.GOODES_NUM._ZhName %><!--��������--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.ARRIVAL_DATE._ZhName %><!--��������--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.PACKAGE_TYPE._ZhName %><!--��װ��ʽ--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.TS_DEPT._ZhName %><!--���˵�λ--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.PHONE._ZhName %><!--�绰--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.COST_PEICE_FLAG._ZhName %><!--�ɱ��۲ɹ�--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.STOR_ID._ZhName %><!--STOR_ID--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.DEDUCTION_RATE._ZhName %><!--����--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.TAX_RATE._ZhName %><!--TAX_RATE--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.CREATER._ZhName %><!--CREATER--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.CHECKER._ZhName %><!--CHECKER--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.NOTE._ZhName %><!--��ע--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.REMARK._ZhName %><!--ժҪ--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.EXP1._ZhName %><!--�Զ���1--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.EXP2._ZhName %><!--�Զ���2--></td>
                    
                    
                    <td><%=IM_PURORDER.Attribute.EXP3._ZhName %><!--�Զ���3--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((IM_PURORDER)Container.DataItem).PORD_ID %>" /></td>
                     
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PORD_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PORD_NO %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).C_DATE.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).ORG_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).DEPT_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).SUP_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PERSON_HID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TS_NO %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).GOODES_NUM %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).ARRIVAL_DATE.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PACKAGE_TYPE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TS_DEPT %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).PHONE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).COST_PEICE_FLAG %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).STOR_ID %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).DEDUCTION_RATE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).TAX_RATE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).CREATER %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).CHECKER %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).NOTE %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).REMARK %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((IM_PURORDER)Container.DataItem).EXP3 %></td>
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
