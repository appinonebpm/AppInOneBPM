<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" Inherits="KM_PART_STRUManageNew" CodeFile="KM_PART_STRUManageNew.aspx.cs" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <script src="../../Lib/JScript/MyJsCore.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/manage.js" type="text/javascript"></script>
 <script src="../../Lib/Mdl/detail.js" type="text/javascript"></script>
<script type="text/javascript">

    $(function () {
        //alert(window.location.pathname);
        managePara.listID = "tbList";
        managePara.colselCID = "olAllColCBS";
        managePara.cookieName = "KM_PART_STRUHidCols";
        managePara.cookieOut = 12;//Сʱ
        _initBodyRow();
        _initHeadRow();

        _initColHideByNames(getCookie(managePara.cookieName) || "", false);

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
   <div class="topnav">
      <dl>
      <dt><a onclick="openNextArea(this);"></a><b>��ѯ</b></dt>
      <dd><span><asp:Button ID="btn_Find" runat="server" Text="��ѯ" onclick="btnFind_Click" Width="51" /></span>
            <span><input id="btnClear" type="button" value="���" onclick="_topFindClear(this);"  style="width:60px;"/></span></dd>
      </dl>
   </div>
   <div class="topfind hide"><!--��Ҫ��ȥʱ���� style="display:none;"-->        
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_ID.ZhName %>��</dt><!--PART_ID-->
               <dd><span>
                
                    <input id="txtPART_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_NAME.ZhName %>��</dt><!--PART_NAME-->
               <dd><span>
                
                    <input id="txtPART_NAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.K_PART_ID.ZhName %>��</dt><!--K_PART_ID-->
               <dd><span>
                
                    <input id="txtK_PART_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CONTENT.ZhName %>��</dt><!--PART_CONTENT-->
               <dd><span>
               
                    <textarea id="txtPART_CONTENT" cols="1" rows="1" style="height:80px;width:450px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_CLASS_ID.ZhName %>��</dt><!--PART_CLASS_ID-->
               <dd><span>
                
                    <input id="txtPART_CLASS_ID" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_EA_SIGN.ZhName %>��</dt><!--PART_EA_SIGN-->
               <dd><span>
                
                    <input id="txtPART_EA_SIGN" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_AUTHOR.ZhName %>��</dt><!--PART_AUTHOR-->
               <dd><span>
                
                    <input id="txtPART_AUTHOR" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.PART_IS_READ.ZhName %>��</dt><!--PART_IS_READ-->
               <dd><span>
                
                    <input id="txtPART_IS_READ" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SORT_NO.ZhName %>��</dt><!--SORT_NO-->
               <dd><span>
                
                    <input id="txtSORT_NO" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.IDPATH.ZhName %>��</dt><!--IDPATH-->
               <dd><span>
               
                    <textarea id="txtIDPATH" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.KNAME.ZhName %>��</dt><!--KNAME-->
               <dd><span>
               
                    <textarea id="txtKNAME" class="smalltextarea" cols="1" rows="1" style="height:20px;width:300px;overflow:hidden;" 
                            runat="server"  />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SNAME.ZhName %>��</dt><!--SNAME-->
               <dd><span>
                
                    <input id="txtSNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.RNAME.ZhName %>��</dt><!--RNAME-->
               <dd><span>
                
                    <input id="txtRNAME" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SUB_NUM.ZhName %>��</dt><!--SUB_NUM-->
               <dd><span>
                
                    <input id="txtSUB_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM.ZhName %>��</dt><!--SUBOBJECT_NUM-->
               <dd><span>
                
                    <input id="txtSUBOBJECT_NUM" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.USE_FLAG.ZhName %>��</dt><!--USE_FLAG-->
               <dd><span>
                
                    <input id="txtUSE_FLAG" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP1.ZhName %>��</dt><!--EXP1-->
               <dd><span>
                
                    <input id="txtEXP1" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP2.ZhName %>��</dt><!--EXP2-->
               <dd><span>
                
                    <input id="txtEXP2" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP3.ZhName %>��</dt><!--EXP3-->
               <dd><span>
                
                    <input id="txtEXP3" type="text" runat="server" />
               </span></dd>
        </dl>
         
            <dl>
               <dt><%=KM_PART_STRU.Attribute.EXP4.ZhName %>��</dt><!--EXP4-->
               <dd><span>
                
                    <input id="txtEXP4" type="text" runat="server" />
               </span></dd>
        </dl>
    </div>  
    <div class="topnav">
    <dl><dt><a onclick="openNextArea(this);" class="opened"></a><b>�б�</b></dt>
    <dd>
        <span><input id="btn_New" type="button" value="�½�" onclick="_newRecord('tbList','KM_PART_STRUEdit.aspx');" /></span>
        <span><input id="btn_Dels" type="button" value="ɾ��" onclick="_delBySelKeyIDS('KM_PART_STRUBack.aspx');" /></span>
    </dd></dl>
     <ul>
      <li class="colist"><a onclick="_hideColsSel(this);">������</a><ol id="olAllColCBS"></ol></li>
     <li>
      <span>ÿҳ��ʾ</span>
        <span class="txt"><input id="txtPageNum" type="text" runat="server" style="width:30px;" /></span><span>��</span>
        <span><asp:Button ID="btnSetPageNum" runat="server" Text="����" OnClick="btnSetPageNum_Click" /></span>
     </li>
    </ul>
    </div>
    <div class="tblist">
         <table cellpadding="0" cellspacing="0" id="tbList">
            <thead>
                <tr keyname="PART_ID">
                    <td class="ckb"><input type="checkbox" onclick="selAll(this);" /></td>
                    <td class="links" style="width:110px;">
                    <a class="hide" href="KM_PART_STRUEdit.aspx?PART_ID={PART_ID}">�༭</a>
                    <a class="hide" href="KM_PART_STRUBack.aspx?DelPART_ID={PART_ID}">ɾ��</a>
                    <a class="hide" href="KM_PART_STRUShow.aspx?PART_ID={PART_ID}">��ϸ</a>
                    </td>
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_ID.FieldName%>"><%=KM_PART_STRU.Attribute.PART_ID._ZhName %></td><!--PART_ID-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_NAME.FieldName%>"><%=KM_PART_STRU.Attribute.PART_NAME._ZhName %></td><!--PART_NAME-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.K_PART_ID.FieldName%>"><%=KM_PART_STRU.Attribute.K_PART_ID._ZhName %></td><!--K_PART_ID-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_CONTENT.FieldName%>"><%=KM_PART_STRU.Attribute.PART_CONTENT._ZhName %></td><!--PART_CONTENT-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_CLASS_ID.FieldName%>"><%=KM_PART_STRU.Attribute.PART_CLASS_ID._ZhName %></td><!--PART_CLASS_ID-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_EA_SIGN.FieldName%>"><%=KM_PART_STRU.Attribute.PART_EA_SIGN._ZhName %></td><!--PART_EA_SIGN-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_AUTHOR.FieldName%>"><%=KM_PART_STRU.Attribute.PART_AUTHOR._ZhName %></td><!--PART_AUTHOR-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.PART_IS_READ.FieldName%>"><%=KM_PART_STRU.Attribute.PART_IS_READ._ZhName %></td><!--PART_IS_READ-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.SORT_NO.FieldName%>"><%=KM_PART_STRU.Attribute.SORT_NO._ZhName %></td><!--SORT_NO-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.IDPATH.FieldName%>"><%=KM_PART_STRU.Attribute.IDPATH._ZhName %></td><!--IDPATH-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.KNAME.FieldName%>"><%=KM_PART_STRU.Attribute.KNAME._ZhName %></td><!--KNAME-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.SNAME.FieldName%>"><%=KM_PART_STRU.Attribute.SNAME._ZhName %></td><!--SNAME-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.RNAME.FieldName%>"><%=KM_PART_STRU.Attribute.RNAME._ZhName %></td><!--RNAME-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.SUB_NUM.FieldName%>"><%=KM_PART_STRU.Attribute.SUB_NUM._ZhName %></td><!--SUB_NUM-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.SUBOBJECT_NUM.FieldName%>"><%=KM_PART_STRU.Attribute.SUBOBJECT_NUM._ZhName %></td><!--SUBOBJECT_NUM-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.USE_FLAG.FieldName%>"><%=KM_PART_STRU.Attribute.USE_FLAG._ZhName %></td><!--USE_FLAG-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.EXP1.FieldName%>"><%=KM_PART_STRU.Attribute.EXP1._ZhName %></td><!--EXP1-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.EXP2.FieldName%>"><%=KM_PART_STRU.Attribute.EXP2._ZhName %></td><!--EXP2-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.EXP3.FieldName%>"><%=KM_PART_STRU.Attribute.EXP3._ZhName %></td><!--EXP3-->
                    
                    
                    <td colname="<%=KM_PART_STRU.Attribute.EXP4.FieldName%>"><%=KM_PART_STRU.Attribute.EXP4._ZhName %></td><!--EXP4-->
                </tr>
            </thead>
            <tbody>
                <asp:Repeater ID="repList" runat="server" onitemdatabound="repList_ItemDataBound">
                <ItemTemplate>
                <tr>
                    <td class="ckb"><input type="checkbox" value="<%#((KM_PART_STRU)Container.DataItem).PART_ID%>" /></td>
                    <td>
                    <a href="KM_PART_STRUEdit.aspx?PART_ID=<%#((KM_PART_STRU)Container.DataItem).PART_ID %>">�༭</a>
                    <a href="KM_PART_STRUBack.aspx?DelPART_ID=<%#((KM_PART_STRU)Container.DataItem).PART_ID %>">ɾ��</a>
                    <a href="KM_PART_STRUShow.aspx?PART_ID=<%#((KM_PART_STRU)Container.DataItem).PART_ID %>">��ϸ</a>
                    </td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_NAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).K_PART_ID %></td>
                    
                    
                     <td><%#AgileFrame.Core.WebSystem.HtmlHelper.GetSummary(((KM_PART_STRU)Container.DataItem).PART_CONTENT) %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_CLASS_ID %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_EA_SIGN %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_AUTHOR %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).PART_IS_READ %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SORT_NO %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).IDPATH %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).KNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).RNAME %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUB_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).SUBOBJECT_NUM %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).USE_FLAG %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP1 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP2 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP3 %></td>
                    
                    
                    <td><%#((KM_PART_STRU)Container.DataItem).EXP4 %></td>
                    
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
</asp:Content>