<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="Show.aspx.cs" Inherits="Show" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core"%>
<%@ Import Namespace="AgileFrame.Common"%>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<base target="_self"/>
    <style>
        a {
          color: #0088cc;
          text-decoration: none;
        }

        a:hover,
        a:focus {
          color: #005580;
          text-decoration: underline;
        }
        .pagination {
          margin: 20px 0;
        }

        .pagination ul {
          display: inline-block;
          *display: inline;
          margin-bottom: 0;
          margin-left: 0;
          -webkit-border-radius: 4px;
             -moz-border-radius: 4px;
                  border-radius: 4px;
          *zoom: 1;
          -webkit-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
             -moz-box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
                  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
        }

        .pagination ul > li {
          display: inline;
        }

        .pagination ul > li > a,
        .pagination ul > li > span {
          float: left;
          padding: 4px 12px;
          line-height: 20px;
          text-decoration: none;
          background-color: #ffffff;
          border: 1px solid #dddddd;
          border-left-width: 0;
        }

        .pagination ul > li > a:hover,
        .pagination ul > li > a:focus,
        .pagination ul > .active > a,
        .pagination ul > .active > span {
          background-color: #f5f5f5;
        }

        .pagination ul > .active > a,
        .pagination ul > .active > span {
          color: #999999;
          cursor: default;
        }

        .pagination ul > .disabled > span,
        .pagination ul > .disabled > a,
        .pagination ul > .disabled > a:hover,
        .pagination ul > .disabled > a:focus {
          color: #999999;
          cursor: default;
          background-color: transparent;
        }

        .pagination ul > li:first-child > a,
        .pagination ul > li:first-child > span {
          border-left-width: 1px;
          -webkit-border-bottom-left-radius: 4px;
                  border-bottom-left-radius: 4px;
          -webkit-border-top-left-radius: 4px;
                  border-top-left-radius: 4px;
          -moz-border-radius-bottomleft: 4px;
          -moz-border-radius-topleft: 4px;
        }

        .pagination ul > li:last-child > a,
        .pagination ul > li:last-child > span {
          -webkit-border-top-right-radius: 4px;
                  border-top-right-radius: 4px;
          -webkit-border-bottom-right-radius: 4px;
                  border-bottom-right-radius: 4px;
          -moz-border-radius-topright: 4px;
          -moz-border-radius-bottomright: 4px;
        }

        .pagination-centered {
          text-align: center;
        }

        .pagination-right {
          text-align: right;
        }

        .pagination-large ul > li > a,
        .pagination-large ul > li > span {
          padding: 11px 19px;
          font-size: 17.5px;
        }

        .pagination-large ul > li:first-child > a,
        .pagination-large ul > li:first-child > span {
          -webkit-border-bottom-left-radius: 6px;
                  border-bottom-left-radius: 6px;
          -webkit-border-top-left-radius: 6px;
                  border-top-left-radius: 6px;
          -moz-border-radius-bottomleft: 6px;
          -moz-border-radius-topleft: 6px;
        }

        .pagination-large ul > li:last-child > a,
        .pagination-large ul > li:last-child > span {
          -webkit-border-top-right-radius: 6px;
                  border-top-right-radius: 6px;
          -webkit-border-bottom-right-radius: 6px;
                  border-bottom-right-radius: 6px;
          -moz-border-radius-topright: 6px;
          -moz-border-radius-bottomright: 6px;
        }

        .pagination-mini ul > li:first-child > a,
        .pagination-small ul > li:first-child > a,
        .pagination-mini ul > li:first-child > span,
        .pagination-small ul > li:first-child > span {
          -webkit-border-bottom-left-radius: 3px;
                  border-bottom-left-radius: 3px;
          -webkit-border-top-left-radius: 3px;
                  border-top-left-radius: 3px;
          -moz-border-radius-bottomleft: 3px;
          -moz-border-radius-topleft: 3px;
        }

        .pagination-mini ul > li:last-child > a,
        .pagination-small ul > li:last-child > a,
        .pagination-mini ul > li:last-child > span,
        .pagination-small ul > li:last-child > span {
          -webkit-border-top-right-radius: 3px;
                  border-top-right-radius: 3px;
          -webkit-border-bottom-right-radius: 3px;
                  border-bottom-right-radius: 3px;
          -moz-border-radius-topright: 3px;
          -moz-border-radius-bottomright: 3px;
        }

        .pagination-small ul > li > a,
        .pagination-small ul > li > span {
          padding: 2px 10px;
          font-size: 11.9px;
        }

        .pagination-mini ul > li > a,
        .pagination-mini ul > li > span {
          padding: 0 6px;
          font-size: 10.5px;
        }

    </style>
<script type="text/javascript">
    $(function () {
        $("#base").click(function () {
            $(".baseInfo").toggleClass("hide");
            $("#baseImg").toggleClass("showUp"); 
          
        });

       
    });
</script>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<div class="main" id="divC" runat="server">
    <div class="titnav">
    <dl><dt><b><%=title %></b></dt></dl>
   </div>

   <div id="base" class="showTitle">
   <span id ="baseInfoTitle">������Ϣ</span><span id="baseImg" class="showImg"></span>
   </div>
    <div class="baseInfo">
        <%=getInput() %>
    </div>
  <div class="clear"></div>
        <%=getSubForm()%>
   
   <div class="bottomtool">
      <ul>
    <li><span class="btn"><input onclick="window.close();" lang="CloseWin" value="�ر�" type="button" /></span></li>
</ul>
   </div>
</div>
</asp:Content>