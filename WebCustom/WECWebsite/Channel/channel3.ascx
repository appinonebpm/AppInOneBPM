﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="channel3.ascx.cs" Inherits="WECWebsite_Channel_channel3" %>

<%--<link rel="stylesheet" type="text/css" href="http://stc.shengyt.com/css/template/shengyt-ui-1-1.css?2014-03-07-1" media="all" />
<link rel="stylesheet" type="text/css" href="http://stc.shengyt.com/css/template/home-2.css?2014-03-07-1" media="all" />--%>
<script type="text/javascript">
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/shengyt-ui-1-1.css?r=' + Math.random() + '"" media="all" />');
    document.write('<link rel="stylesheet" type="text/css" href="<%=preUrl %>themes/wec/template/css/home-2.css?r=' + Math.random() + '"" media="all" />');
   
    </script>




<style>
	body{background: #ffffff;}
	.shengyt-copyright{color:#000;}
	.shengyt-list-item-summary{ line-height:28px; color:#333;}
</style>

<div class="shengyt-page" style="display:block; padding-bottom:48px;">
		<!--
	幻灯片管理
	-->
	<div style="-webkit-transform:translate3d(0,0,0);">
		<div id="banner_box" class="box_swipe">
			<ul>
            <%=navigation %>
								<%--	<li>
												<a onclick="return false;">
																<img src="http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324183359_28718.gif" alt="荷兰皇室招待习近平夫妇国宴菜单曝光(组图)" style="width:100%;" />
								</a>
					</li>
									<li>
													<a href="/weisite/detail?pid=98816&bid=202577&wechatid=fromUsername&did=400898&from=list&wxref=mp.weixin.qq.com">
																	<img src="http://img.shengyt.com/static/91/ec/c5/image/20140324/20140324183430_98719.jpg" alt="你我皆“键人”，汉字会死吗？" style="width:100%;" />
								</a>
					</li>--%>
							</ul>
			<ol>
									<li class="on"></li>
									<li ></li>
							</ol>
		</div>
	</div>
		<script>
		    $(function () {
		        new Swipe(document.getElementById('banner_box'), {
		            speed: 500,
		            auto: 3000,
		            callback: function () {
		                var lis = $(this.element).next("ol").children();
		                lis.removeClass("on").eq(this.index).addClass("on");
		            }
		        });
		    });
	</script>
<br/><header>
        <div class="snower">
            <script type="text/javascript"></script>
            <script type="text/javascript" src="http://stc.shengyt.com/src/template/snower.js"></script>
        </div>
    </header>     		<!--
		用户分类管理
		-->
		<div class="shengyt-content">
            <div class="shengyt-list">
            <%=mainvalue %>
                										<%--	<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298053&wxref=mp.weixin.qq.com" class="shengyt-list-item">
					                        <div class="shengyt-list-item-bg">
                            <div class="shengyt-list-item-image" style="background-image:url(http://stc.shengyt.com//img/template/lib/home-300300.jpg?v=2014-03-07-1?=2014-03-07-1)"></div>
                            <div class="shengyt-list-item-box">
                                <div class="shengyt-list-item-line">
                                    <div class="shengyt-list-item-title">12</div>
                                    <div class="shengyt-list-item-summary">123</div>
                                </div>
                            </div>
                        </div>
                    </a>
                											<a href="/weisite/list?pid=98816&bid=202577&wechatid=fromUsername&ltid=298054&wxref=mp.weixin.qq.com" class="shengyt-list-item">
					                        <div class="shengyt-list-item-bg">
                            <div class="shengyt-list-item-image" style="background-image:url(http://stc.shengyt.com//img/template/lib/home-300300.jpg?v=2014-03-07-1?=2014-03-07-1)"></div>
                            <div class="shengyt-list-item-box">
                                <div class="shengyt-list-item-line">
                                    <div class="shengyt-list-item-title">23</div>
                                    <div class="shengyt-list-item-summary">23</div>
                                </div>
                            </div>
                        </div>
                    </a>--%>
                            </div>
        </div>
    </div>