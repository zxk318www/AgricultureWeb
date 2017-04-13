<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/4/5
  Time: 16:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <script src="${ctxStatic}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/miniui/miniui.js"type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/boot.js"type="text/javascript"></script>

    <link rel="stylesheet" href="${ctxStatic}/scripts/miniui/themes/bootstrap/skin.css" />
    <link href="${ctxStatic}/videojs/css/video-js.css" rel="stylesheet">
    <script src="${ctxStatic}/videojs/js/video.min.js"></script>

    <title>农林交流网</title>
    <link href="${ctxStatic}/css/base.css" type="text/css" rel="stylesheet">
</head>
<style type="text/css">

    .tips div {
        line-height: 22px;
        padding: 8px 10px 8px 35px;
    }
    a.b:link,
    a.b:visited,
    a.b:active {
        color: #0085eb;
        text-decoration: none;
    }

    a.b:hover {
        color: #FF6600;
    }
</style>


<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member">欢迎，<c:if test="${userinfo != null}"><c:if test="${userinfo.level eq 5 }"><a style="color: #7f2a0c;font-style: italic">尊贵的会员用户：</a></c:if>${img} ${userinfo.name}</c:if>
            <c:if test="${admininfo!=null}">${img} ${admininfo.name}</c:if>
            <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
        <div class="m head_s" id="destoon_space"></div>
        <div class="m">
            <div id="search_tips" style="display:none;"></div>
        </div>
        <div class="m">
            <div id="search_module" style="display:none; margin-left:1025px; margin-top:88px;">
                <a href="javascript:void(0);" >资讯</a><a href="javascript:void(0);" >供应</a><a href="javascript:void(0);" >求购</a><a href="javascript:void(0);" >品牌</a><a href="javascript:void(0);" >商家库</a><a href="javascript:void(0);" >展会</a><a href="javascript:void(0);" >专家课堂</a> </div>
        </div>

    </div>
</div>
<div class="sz_bg1">
    <div class="sz_logobox">
        <div class="sz_logo">
            <a href="http://www.zlf168.com/"><img src="${ctxStatic}/img/03-21-27-30-1.png" alt="种立方" data-bd-imgshare-binded="1"></a>
        </div>
        <div class="sz_logo_ad"><img src="${ctxStatic}/img/LOGO_ad.png" alt="种立方" data-bd-imgshare-binded="1"></div>
        <div style="display:none; float:left;"><img src="${ctxStatic}/img/LOGO_ad.png" alt="种立方" data-bd-imgshare-binded="1"></div>

    </div>
</div>
<div class="sz_menubg">
    <div class="sz_menu">
        <ul>
            <li><a href="${path}/logincheck/index"><span>首页</span></a></li>
            <li><a href="http://pfsc.agri.cn/pfsc/jgzs/reportHtml.html"><span>资讯</span></a></li>
            <li><a href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6"><span>供应</span></a></li>
            <li><a href="${path}/Tiezicheck/toTieziIndex"><span>帖子</span></a></li>
            <li><a href=""><span>品牌</span></a></li>
            <li><a href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6"><span>商家库</span></a></li>
            <li><a href=""><span>展会</span></a></li>
            <li><a href="${path}/classescheck/toclassesIndex"><span>专家课堂</span></a></li>
        </ul>
    </div>
</div>
<link href="${ctxStatic}/css/login.css" type="text/css" rel="stylesheet">
<div class="sz_contentBg">
    <div class="sz_contentbox" style="width: 1200px">
        <!-- 左导航栏 -->
        <div style="float: left;border: 1px solid silver;width: 130px;height: 600px;padding: 10px;margin: 10px">
            <h2>视频目录</h2>
            <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
            <hr style="height:10px;border:none;border-top:10px groove skyblue;" />
            <c:forEach items="${classeslist }" var="classes">
                <a id="${classes.id}" href="javascript:void(0);" onclick="play(this)">${classes.title }</a><br>
            </c:forEach>
        </div>
        <!-- 视频播放窗口 -->
        <div style="float: left;border: 1px solid silver;width: 800px;height: 600px;padding: 10px;margin: 10px;background-color: #929292">
            <div style="color: black">正在播放的是：<a id="title" style="color:#000;"></a></div>
            <video id="my-video" class="video-js vjs-default-skin" controls preload="none" width="800" height="580" preload="meta"
                   poster="${ctxStatic}/img/np.png"
                    data-setup="{}">
                <source src="${videourl}" type='video/mp4' />
            </video>
        </div>
        <!-- 右导航栏 -->
        <div style="float: left;border: 1px solid silver;width: 130px;height: 600px;padding: 10px;margin: 10px">
            <h2>视频内容</h2>
            <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
            <hr style="height:10px;border:none;border-top:10px groove skyblue;" />
            <div id="content"></div>
        </div>

    </div>


    <div class="sz_footer">
        <div class="sz_footctbox">
            <p class="footmenu"><a href="">网站首页</a>
                <span>|</span> <a href="">关于我们</a>
                <span>|</span> <a href="">联系方式</a>
                <span>|</span> <a href="">使用协议</a>
                <span>|</span> <a href="">版权隐私</a>
                <span>|</span> <a href="">网站地图</a>
                <span>|</span> <a href="">排名推广</a>
                <span>|</span> <a href="">广告服务</a> <span>|</span> <a href="">网站留言</a></p>
            <p class="sz_copyright"><span>备案号：©2017 13计1 Zhangsnke All Rights Reserved</span><span>13计1 张锡柯</span><br><span>电话:13685****01</span><span>联系地址:江苏省徐州市富春路1号徐州工程学院<strong>

            </strong></span></p>
        </div><strong>
    </strong></div><strong>
    <div class="m" style="display:none;">
        <div class="b10">&nbsp;</div>
        <div class="foot_page">
            <a href="${path}/logincheck/index">网站首页</a>
            <span>|</span> <a href="">关于我们</a>
            <span>|</span> <a href="">联系方式</a>
            <span>|</span> <a href="">使用协议</a>
            <span>|</span> <a href="">版权隐私</a>
            | <a href="">网站地图</a>
            | <a href="">排名推广</a>
            | <a href="">广告服务</a> | <a href="">网站留言</a> | <a href="">RSS订阅</a> | <a href="" target="_blank" rel="nofollow">苏ICP备17038***号</a></div>
    </div>
    <div class="m" style="display:none;">
        <div class="foot">
            <div id="copyright">©2017 13计1 Zhangsnke All Rights Reserved</div>
            <div id="powered"><a href="" target="_blank">Powered by 农林交流网</a></div>
        </div>
    </div>
    <div class="oTop" style="display: none;"></div>
</strong></div>


<script> videojs.options.flash.swf = "${ctxStatic}/videojs/video-js.swf"; </script>
</body>





</html>
<script type="text/javascript">
    mini.parse();

    $(function(){
        videojs.options.flash.swf = "video-js.swf";
    });

    var myPlayer = videojs('my-video');
    videojs("my-video").ready(function(){
        var myPlayer = this;
        myPlayer.play();
    });

    function logout(){
        var data = '${userinfo.uid}';
        var datas = '${admininfo.uid}';
        if(data ==""||data ==null){
            data = datas;
        }
        $.ajax({
            url : "${path}/logincheck/logout",
            type:"get",
            data:{"uid":data},
            success : function(text){
                if(text == "01"){
                    location.href="${ctx}/logout";
                }
            }

        });
    }

    function play(e){
        var videoid = e.id;
        $.ajax({
            url:"${path}/classescheck/findClassesVideo",
            data:{"id":videoid},
            type:"post",
            async:false,
            success:function (data) {
                myPlayer.src(data.video);
                myPlayer.play();
                $("#title").text(data.title);
                $("#content").html(data.content);
            }
        });
    }

</script>