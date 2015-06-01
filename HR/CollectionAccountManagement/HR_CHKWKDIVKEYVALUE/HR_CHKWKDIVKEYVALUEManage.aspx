<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="HR_CHKWKDIVKEYVALUEManage2" CodeFile="HR_CHKWKDIVKEYVALUEManage.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <script src="../../../Lib/Mdl/Manager.js" type="text/javascript"></script>
 <script src="../../../Lib/JScript/MyResize.js" type="text/javascript"></script>
<script type="text/javascript">
    var manager = new ListManager();
    $(function () {
        manager.initBodyRows();
        manager.initFindDL();
        //manager.initPageSizeEvt("txtPageNum");
        bindWinResize(40);
    });
</script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<input id="hidCondition" type="hidden" runat="server" />
<div class="main">
   <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>
   <div class="warn"><asp:Literal ID="litWarn" runat="server"></asp:Literal></div>
   <div class="topfind"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl colname="HR_CHKWKDIVKEYVALUE.GroupId">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.ZhName %>��</dt><!--��ID-->
               <dd><span>
                
                    <input id="txtGroupId" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.DeviceID">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.ZhName %>��</dt><!--�豸ID-->
               <dd><span>
                
                    <input id="txtDeviceID" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.AIOTableName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.ZhName %>��</dt><!--AIO����-->
               <dd><span>
                
                    <input id="txtAIOTableName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.AIOKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.ZhName %>��</dt><!--AIO�ؼ��ֶ���-->
               <dd><span>
                
                    <input id="txtAIOKeyFieldName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.OtherKeyFieldName">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.ZhName %>��</dt><!--����ϵͳ�ؼ��ֶ���-->
               <dd><span>
                
                    <input id="txtOtherKeyFieldName" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.AIOKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.ZhName %>��</dt><!--AIO�ؼ��ֶ�ֵ-->
               <dd><span>
                
                    <input id="txtAIOKeyValue" type="text" runat="server" />
               </span></dd>
               
        </dl>
         
            <dl colname="HR_CHKWKDIVKEYVALUE.OtherKeyValue">
               <dt><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.ZhName %>��</dt><!--����ϵͳ�ؼ��ֶ�ֵ-->
               <dd><span>
                
                    <input id="txtOtherKeyValue" type="text" runat="server" />
               </span></dd>
               
        </dl>
         <dl class="btn"><dd>
                <span><asp:Button ID="btnFind" runat="server" Text="��ѯ" onclick="btnFind_Click" /></span>
               <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"/></span>
               </dd></dl>
         <div class="clear"></div>
    </div>
    <div class="tool">
        <ul>
            <li><span><input power="newHR_CHKWKDIVKEYVALUE" id="btn_New" type="button" value="�½�" onclick="manager.newRecord('HR_CHKWKDIVKEYVALUEEdit.aspx');" /></span></li>
            <li><span><input power="editHR_CHKWKDIVKEYVALUE" id="btn_Edit" type="button" value="�½�" onclick="manager.editRecord('HR_CHKWKDIVKEYVALUEEdit.aspx');" /></span></li>
<%--            <li><span class="btn"><input power="newHR_CHKWKDIVKEYVALUE" id="btn_NewSub" type="button" value="�½��¼�" onclick="manager.newRecord('STORAGEEdit.aspx','PID');" /></span></li>--%>
            <li><span><input id="btn_Dels" type="button" value="ɾ��" onclick="manager.delBySelIDS('HR_CHKWKDIVKEYVALUEBack.aspx');" /></span></li>
        </ul>
        <ol>
            <li><b>ÿҳ��ʾ</b></li>
            <li><input id="txtPageSize" type="text" runat="server" style="width:25px;" /><b>��</b></li>
            <li><span><asp:Button ID="Button4" runat="server" Text="����" OnClick="btnSetPageSize_Click" /></span></li>
            <li class="colist hide"><a onclick="_hideColsSel(this);">������</a><ol id="ol1"></ol></li>
        </ol>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="OtherKeyFieldName">
                    <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
                   <%-- <td><a href="HR_CHKWKDIVKEYVALUEManage.aspx" id="a_top" runat="server"><b>����</b></a></td>--%>
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.GroupId._ZhName %></td><!--��ID-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.DeviceID._ZhName %></td><!--�豸ID-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOTableName._ZhName %></td><!--AIO����-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyFieldName._ZhName %></td><!--AIO�ؼ��ֶ���-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyFieldName._ZhName %></td><!--����ϵͳ�ؼ��ֶ���-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.AIOKeyValue._ZhName %></td><!--AIO�ؼ��ֶ�ֵ-->
                    
                    
                    <td data="{colname:'<%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue.LongName%>',show:1}"><%=HR_CHKWKDIVKEYVALUE.Attribute.OtherKeyValue._ZhName %></td><!--����ϵͳ�ؼ��ֶ�ֵ-->
                </tr>
            </thead>
            <tbody TPL="yes" class="hide">
            <tr>
             <td class="first"><input type="checkbox" onclick="_selAll(this);" /></td>
            
            <td>{GroupId}</td>
            
            <td>{DeviceID}</td>
            
            <td>{AIOTableName}</td>
            
            <td>{AIOKeyFieldName}</td>
            
            <td>{OtherKeyFieldName}</td>
            
            <td>{AIOKeyValue}</td>
            
            <td>{OtherKeyValue}</td>
            </tr>
            </tbody>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="first"><input type="checkbox" value="<%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName%>" /></td>
                   <%-- <td><%#showLeftLinks(((HR_CHKWKDIVKEYVALUE)Container.DataItem).PATH, ((HR_CHKWKDIVKEYVALUE)Container.DataItem).PNAME, Container.ItemIndex)%></td>--%>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).GroupId %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).DeviceID %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOTableName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyFieldName %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).AIOKeyValue %></td>
                    
                    
                    <td><%#((HR_CHKWKDIVKEYVALUE)Container.DataItem).OtherKeyValue %></td>
                    
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
        <WebCtrl:AspNetPager ID="aspPager" runat="server" onpagechanged="aspPager_PageChanged"></WebCtrl:AspNetPager>
    </div>
</div>
</asp:Content>