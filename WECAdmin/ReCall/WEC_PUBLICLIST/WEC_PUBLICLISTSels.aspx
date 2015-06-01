<%@ Page Title="��ѡҳ��Ի���" Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_PUBLICLISTSels.aspx.cs" Inherits="WEC_PUBLICLISTSels" %>
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
    <script src="../../Lib/Mdl/Sels.js" type="text/javascript"></script>
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
         
            <dl colname="AID">
               <dt><%=WEC_PUBLICLIST.Attribute.AID.ZhName %>��</dt><!--���ں�ID-->
               <dd><span>
               
                    <input id="txtAID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="USER_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.USER_ID.ZhName %>��</dt><!--�û�ID-->
               <dd><span>
               
                    <input id="txtUSER_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PLC_NAME">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_NAME.ZhName %>��</dt><!--���ں�����-->
               <dd><span>
               
                    <input id="txtPLC_NAME" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PLC_SOURCEID">
               <dt><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID.ZhName %>��</dt><!--ԭʼID-->
               <dd><span>
               
                    <input id="txtPLC_SOURCEID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="WECHAT_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.WECHAT_ID.ZhName %>��</dt><!--΢�ź�-->
               <dd><span>
               
                    <input id="txtWECHAT_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="AVATAR_URL">
               <dt><%=WEC_PUBLICLIST.Attribute.AVATAR_URL.ZhName %>��</dt><!--ͼƬ��ַ-->
               <dd><span>
               
                    <input id="txtAVATAR_URL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="API_KEY">
               <dt><%=WEC_PUBLICLIST.Attribute.API_KEY.ZhName %>��</dt><!--API��ַ-->
               <dd><span>
               
                    <input id="txtAPI_KEY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TOKEN">
               <dt><%=WEC_PUBLICLIST.Attribute.TOKEN.ZhName %>��</dt><!--TOKEN-->
               <dd><span>
               
                    <input id="txtTOKEN" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="LOCATION">
               <dt><%=WEC_PUBLICLIST.Attribute.LOCATION.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtLOCATION" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="EMAIL">
               <dt><%=WEC_PUBLICLIST.Attribute.EMAIL.ZhName %>��</dt><!--����-->
               <dd><span>
               
                    <input id="txtEMAIL" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="FUNS">
               <dt><%=WEC_PUBLICLIST.Attribute.FUNS.ZhName %>��</dt><!--��˿��-->
               <dd><span>
               
                    <input id="txtFUNS" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="TYPE">
               <dt><%=WEC_PUBLICLIST.Attribute.TYPE.ZhName %>��</dt><!--��������-->
               <dd><span>
               
                    <input id="txtTYPE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="START_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.START_DAY.ZhName %>��</dt><!--��ʼʱ��-->
               <dd><span>
               
                    <input id="txtSTART_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="END_DAY">
               <dt><%=WEC_PUBLICLIST.Attribute.END_DAY.ZhName %>��</dt><!--����ʱ��-->
               <dd><span>
               
                    <input id="txtEND_DAY" type="text" readonly="readonly" onclick="setday(this)" runat="server" />
               </span></dd>
        </dl>
        
            <dl colname="STATUS">
               <dt><%=WEC_PUBLICLIST.Attribute.STATUS.ZhName %>��</dt><!--״̬-->
               <dd><span>
               
                    <input id="txtSTATUS" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="PACKAGE_ID">
               <dt><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID.ZhName %>��</dt><!--�ײ�����-->
               <dd><span>
               
                    <input id="txtPACKAGE_ID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="IS_NEWS">
               <dt><%=WEC_PUBLICLIST.Attribute.IS_NEWS.ZhName %>��</dt><!--��ע�ظ�����-->
               <dd><span>
               
                    <select id="txtIS_NEWS" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_REPLAY">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY.ZhName %>��</dt><!--Ĭ����ƥ��ظ�-->
               <dd><span>
               
                    <input id="txtDEFAULT_REPLAY" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="DEFAULT_REPLAY_FALG">
               <dt><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG.ZhName %>��</dt><!--�Ƿ���-->
               <dd><span>
               
                    <select id="txtDEFAULT_REPLAY_FALG" runat="server">
                    </select>
               </span></dd>
        </dl>
        
            <dl colname="LBS_DISTANCE">
               <dt><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE.ZhName %>��</dt><!--Ĭ��LBS��ѯ-->
               <dd><span>
               
                    <input id="txtLBS_DISTANCE" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="APPID">
               <dt><%=WEC_PUBLICLIST.Attribute.APPID.ZhName %>��</dt><!--APPID-->
               <dd><span>
               
                    <input id="txtAPPID" type="text" runat="server"/>
               </span></dd>
        </dl>
        
            <dl colname="APPSESECRET">
               <dt><%=WEC_PUBLICLIST.Attribute.APPSESECRET.ZhName %>��</dt><!--APPSECR-->
               <dd><span>
               
                    <input id="txtAPPSESECRET" type="text" runat="server"/>
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
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.AID._ZhName %><!--���ں�ID--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.USER_ID._ZhName %><!--�û�ID--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PLC_NAME._ZhName %><!--���ں�����--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PLC_SOURCEID._ZhName %><!--ԭʼID--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.WECHAT_ID._ZhName %><!--΢�ź�--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.AVATAR_URL._ZhName %><!--ͼƬ��ַ--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.API_KEY._ZhName %><!--API��ַ--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.TOKEN._ZhName %><!--TOKEN--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.LOCATION._ZhName %><!--����--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.EMAIL._ZhName %><!--����--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.FUNS._ZhName %><!--��˿��--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.TYPE._ZhName %><!--��������--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.START_DAY._ZhName %><!--��ʼʱ��--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.END_DAY._ZhName %><!--����ʱ��--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.STATUS._ZhName %><!--״̬--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.PACKAGE_ID._ZhName %><!--�ײ�����--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.IS_NEWS._ZhName %><!--��ע�ظ�����--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY._ZhName %><!--Ĭ����ƥ��ظ�--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG._ZhName %><!--�Ƿ���--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.LBS_DISTANCE._ZhName %><!--Ĭ��LBS��ѯ--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.APPID._ZhName %><!--APPID--></td>
                    
                    
                    <td><%=WEC_PUBLICLIST.Attribute.APPSESECRET._ZhName %><!--APPSECR--></td>
                </tr>
            </thead>
            <tbody>
                 <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                    <ItemTemplate>
                     <tr>
                     <td><input id="chkSel" type="checkbox" runat="server" onclick="selThis(this);" value="<%#((WEC_PUBLICLIST)Container.DataItem).AID %>" /></td>
                     
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).AID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).USER_ID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PLC_NAME %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PLC_SOURCEID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).WECHAT_ID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).AVATAR_URL %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).API_KEY %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TOKEN %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LOCATION %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).EMAIL %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).FUNS %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).TYPE %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).START_DAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).END_DAY.ToString("yyyy-MM-dd HH:mm") %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).STATUS %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).PACKAGE_ID %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_PUBLICLIST.Attribute.IS_NEWS, ((WEC_PUBLICLIST)Container.DataItem).IS_NEWS)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY %></td>
                    
                    
                    <td><%#formhelper.GetOptionText(WEC_PUBLICLIST.Attribute.DEFAULT_REPLAY_FALG, ((WEC_PUBLICLIST)Container.DataItem).DEFAULT_REPLAY_FALG)%></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).LBS_DISTANCE %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPID %></td>
                    
                    
                    <td><%#((WEC_PUBLICLIST)Container.DataItem).APPSESECRET %></td>
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
