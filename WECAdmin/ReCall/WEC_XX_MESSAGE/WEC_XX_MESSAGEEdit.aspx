<%@ Page Language="C#" MasterPageFile="~/Themes/Blank.master" AutoEventWireup="true" CodeFile="WEC_XX_MESSAGEEdit.aspx.cs" Inherits="WEC_XX_MESSAGEEdit" Async="true" %>
<%@ Import Namespace="AgileFrame.Core" %>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.Model" %>
<%@ Import Namespace="AgileFrame.Core.WebSystem"%>
<%@ Import Namespace="AgileFrame.Orm.PersistenceLayer.BLL.Base" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
 <base target="_self"/>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphBody" Runat="Server">
<script src="<%=WebHelper.GetAppPath()%>Lib/JQuery/ajaxfileupload.js"></script>
<style>
       .res
       {
          
             padding-left:50px;
             padding-right:50px; 
       }
      .left
      {
         text-align:left;       
      }
      .right
      {
          text-align:right;  
       }
       .res_div
       {
           text-align:center;
       }
       .img
       {
           width:100px;
           height:100px;
           }
</style>
<input id="hidSelReals" name="hidSelReals" type="hidden" runat="server" />
<div class="main">
 <div class="titnav">
    <dl><dt><b>�ͷ��ظ�</b></dt></dl>
 </div>
<div class="warn">
<asp:Label ID="litWarn" runat="server" Text="" Visible="false"></asp:Label>
</div>

<div class="form" id="divForm">
        
       <div class="clear"></div>
    </div>
   <div id="content">
  
    <% 
        string openid = HttpUtil.GetReqStrValue("openid");
        string username = HttpUtil.GetReqStrValue("username");
        V_R_MESSAGE conf = new V_R_MESSAGE();
        conf.OPENID = openid;
       // conf.TYPE = 2;
        conf.af_WhereSQL = " AND ADDTIME > DATEADD(DAY,-2,GETDATE())";
        List<V_R_MESSAGE> lists = BLLTable<V_R_MESSAGE>.Select(new V_R_MESSAGE(),conf);
        int i = 0;
        V_R_MESSAGE next_message=new V_R_MESSAGE();
        foreach (V_R_MESSAGE message in lists)
        {
                i++;
                if(i<lists.Count){
                     next_message=lists[i-1];
                }
                if (message.CHANNELID > 0)
                {
                %>
               <div><%=message.ADDTIME + "<br/> " + "�û�"+username+"ɨ��������"+message.CHANNELID%></div>><br/>
               <%  
                }
                    
                else
                {
                    if (message.R_CONTENT != null && !message.Equals(""))
                    {
                        if (message.ID == next_message.ID)
                        {
                            if (message.R_TYPE == null || message.R_TYPE == 0)
                            {
                               %>
                               <div class="res right"><%=message.HF_ADDTIME + "<br/> " + message.R_CONTENT%></div><br/>
                               <% 
                              }
                            else if (message.R_TYPE == 1)
                            {
                                 %>
                               <div class="res right"><%=message.HF_ADDTIME + "<br/> " + "<img class=\"img\" src=\"" + WebHelper.GetAppPath() + message.R_CONTENT + "\"/>"%></div><br/>
                               <%
                             }
                        }
                        else
                        {
                             if(message.TYPE==2){
                        %>
                        
                                <div class="res left"><%=message.ADDTIME + "<br/> " + message.S_CONTENT %></div><br/>
                       <% 
                                    }
                             else if (message.TYPE == 3)
                             {
                              %>
                                
                                <div class="res left"><%=message.ADDTIME + "<br/> " + "<img class=\"img\" src=\""+message.S_CONTENT+"\"/>"%></div><br/>
                               <% 
                             }
                           if (message.R_TYPE == null || message.R_TYPE == 0)
                            {
                               %>
                               <div class="res right"><%=message.HF_ADDTIME + "<br/> " + message.R_CONTENT%></div><br/>
                               <% 
                              }
                            else if (message.R_TYPE == 1)
                            {
                                 %>
                                 <div class="res right"><%=message.HF_ADDTIME + "<br/> " + "<img class=\"img\" src=\""+WebHelper.GetAppPath()+message.R_CONTENT+"\"/>"%></div><br/>
                                <%
                             }   
                        }
                    }
                    else
                    {
                     if(message.TYPE==2){
                        %>
                        
                                <div class="res left"><%=message.ADDTIME + "<br/> " + message.S_CONTENT %></div><br/>
                       <% 
                        }
                       else if (message.TYPE == 3)
                          {
                              %>
                                
                                <div class="res left"><%=message.ADDTIME + "<br/> " + "<img class=\"img\" src=\""+message.S_CONTENT+"\"/>"%></div><br/>
                       <% 
                             
                             }
                    }
                 }
          }
       %>
       <script>
           var lastid = '<%=lists[lists.Count-1].ID%>';
           setInterval(function () {
               $.ajax({
                   type: "post",
                   url: "WEC_XX_MESSAGEBack.aspx",
                   dataType: "json",
                   data: { openid: '<%=HttpUtil.GetReqStrValue("openid")%>', lastid: lastid },
                   success: function (data) {
                       //alert(data["response"]);
                       lastid = data["last_id"];

                       if (data["response"] != "") {
                           $("#content").append(data["response"]);
                           $("body").scrollTop($("body").height());
                       }


                   },
                   error: function (msg, a, b) {
                       alert(a);
                       console.log(b);
                   }
               });
           }, 1000);

           $(function () {
               $("body").scrollTop($("body").height());
               $("#fs").click(function () {
                   $.ajax({
                       type: "post",
                       url: "WEC_XX_MESSAGEShow.aspx",
                       dataType: "json",
                       data: { openid: '<%=HttpUtil.GetReqStrValue("openid")%>', message: $("#message").get()[0].value, type: $("#type").val() },
                       success: function (data) {
                           //console.log($("#content").append("<div>aaaaaaaaaaaaaa</div>"));
                           if (data["res"] != "") {
                               $("#content").append(data["res"]);
                           }
                           $("#message").val("");
                           $("body").scrollTop($("body").height());
                       },
                       error: function (msg, a, b) {
                           console.log(msg);
                           console.log(b);
                       }
                   });
               });
               $("#pic_fs").click(function () {
                   alert("aaaaaaaaaaaaaaaaaaa");
                   $.ajaxFileUpload(
                   {
                       url: 'WEC_XX_MESSAGEShow.aspx?type=1&openid=<%=HttpUtil.GetReqStrValue("openid")%>',            //��Ҫ���ӵ���������ַ
                       secureuri: false,
                       fileElementId: 'ctl00_cphBody_fileUp',                        //�ļ�ѡ����id����
                       dataType: 'JSON',                                     //���������صĸ�ʽ��������json
                       success: function (data, status)            //�൱��java��try������÷�
                       {

                           if (data != "") {
                               $("#content").append(data);

                           }
                           $("body").scrollTop($("body").height());
                           $("#ctl00_cphBody_imgBanner").attr("src", "");
                       },
                       error: function (data, status, e)            //�൱��java��catch������÷�
                       {
                           alert("aaaaaaaaaaaaaa:" + e);

                       }
                   });

                   //                   $.ajax({
                   //                       type: "post",
                   //                       url: "WEC_XX_MESSAGEShow.aspx",
                   //                       dataType: "json",
                   //                       data: { openid: '<%=HttpUtil.GetReqStrValue("openid")%>', message: $("#message").get()[0].value, type: $("#type").val(), filepath: $("#ctl00_cphBody_fileUp").val(), src: $("#ctl00_cphBody_imgBanner").attr("src") },
                   //                       success: function (data) {
                   //                           //console.log($("#content").append("<div>aaaaaaaaaaaaaa</div>"));
                   //                           if (data["res"] != "") {
                   //                               $("#content").append(data["res"]);
                   //                           }
                   //                           $("#message").val("");
                   //                           $("body").scrollTop($("body").height());
                   //                       },
                   //                       error: function (msg, a, b) {
                   //                           console.log(msg);
                   //                           console.log(b);
                   //                       }
                   //                   });


               });
               $("#type").change(function () {

                   if (this.value == 0) {
                       $("#text_div").removeClass("hide");
                       $("#pic_div").addClass("hide");
                       $("#voice_div").addClass("hide");
                       $("#video_div").addClass("hide");
                       $("#music_div").addClass("hide");
                       $("#news_div").addClass("hide");
                   } else if (this.value == 1) {
                       $("#text_div").addClass("hide");
                       $("#pic_div").removeClass("hide");
                       $("#voice_div").addClass("hide");
                       $("#video_div").addClass("hide");
                       $("#music_div").addClass("hide");
                       $("#news_div").addClass("hide");
                   } else if (this.value == 2) {
                       $("#text_div").addClass("hide");
                       $("#pic_div").addClass("hide");
                       $("#voice_div").removeClass("hide");
                       $("#video_div").addClass("hide");
                       $("#music_div").addClass("hide");
                       $("#news_div").addClass("hide");
                   } else if (this.value == 3) {
                       $("#text_div").addClass("hide");
                       $("#pic_div").addClass("hide");
                       $("#voice_div").addClass("hide");
                       $("#video_div").removeClass("hide");
                       $("#music_div").addClass("hide");
                       $("#news_div").addClass("hide");
                   } else if (this.value == 4) {
                       $("#text_div").addClass("hide");
                       $("#pic_div").addClass("hide");
                       $("#voice_div").addClass("hide");
                       $("#video_div").addClass("hide");
                       $("#music_div").removeClass("hide");
                       $("#news_div").addClass("hide");
                   } else if (this.value == 5) {
                       $("#text_div").addClass("hide");
                       $("#pic_div").addClass("hide");
                       $("#voice_div").addClass("hide");
                       $("#video_div").addClass("hide");
                       $("#music_div").addClass("hide");
                       $("#news_div").removeClass("hide");
                   }
                   $("body").scrollTop($("body").height());
               });

               $("#<%=fileUp.ClientID%>").change(function () {

                   onUploadImgChange(this, '<%=imgBanner.ClientID%>', 100, 100, "<%=WebHelper.GetAppPath()%>");
               });
           });
       </script>
       
   </div>
    <div>
   �ظ����ͣ�<select id="type">
                <option value="0">�ı��ظ�</option>
                <option value="1">ͼƬ�ظ�</option>
                <option value="2">�����ظ�</option>
                <option value="3">��Ƶ�ظ�</option>
                <option value="4">���ֻظ�</option>
                <option value="5">ͼ�Ļظ�</option>    
            </select>
   </div>
  <div id="text_div" >
   �ı��ظ���<textarea id="message" name="responseMessage" rows="10" cols="30" ></textarea>&nbsp;
   <span ><input type="button" value="����" id="fs"
                 style="width:70px;height:30px;"/></span></div>
   </div>
   <div class="hide res_div" id="pic_div">
   ͼƬ�ظ���<span>
            <img id="imgBanner" runat=server  class="preview_pic"/>
            <asp:FileUpload ID="fileUp" runat="server" style = " border:none" />
                <input type="button" value="����" id="pic_fs"
                 style="width:70px;height:30px;"/></span>
   </div>
   <div class="hide res_div" id="voice_div">
   �����ظ���<embed src="���������ֵ�ַ" align="baseline" border="0" width="100%" height="25"
        type="application/x-mplayer2"     pluginspage="http://www.microsoft.com/isapi/redir.dll?prd=windows&sbp=mediaplayer&ar=media&sba=plugin&" name="MediaPlayer" autostart="1" defaultframe="datawindow">
    </embed><span><input type="button" value="����" id="voice_fs"
                 style="width:70px;height:30px;"/></span>
   </div>
   <div class="hide res_div" id="video_div">
   ��Ƶ�ظ���<select id="res_video">
             </select><span><input type="button" value="����" id="video_fs"
                 style="width:70px;height:30px;"/></span>
   </div>
   <div class="hide res_div" id="music_div">
   ���ֻظ���<select id="music" >
             </select><span><input type="button" value="����" id="music_fs"
                 style="width:70px;height:30px;"/></span>
   </div>
   <div class="hide res_div" id="news_div">
   ͼ�Ļظ���<select id="news">
             </select><span><input type="button" value="����" id="news_fs"
                 style="width:70px;height:30px;"/></span>
   </div>
 
</asp:Content>