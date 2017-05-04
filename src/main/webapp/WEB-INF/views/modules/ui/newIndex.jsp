<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/4/1
  Time: 11:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <script src="${ctxStatic}/scripts/jquery-1.6.2.min.js" type="text/javascript" charset="utf-8"></script>
    <script src="${ctxStatic}/scripts/miniui/miniui.js"type="text/javascript" charset="utf-8"></script>
    <script src="${ctxStatic}/scripts/boot.js"type="text/javascript" charset="utf-8"></script>
    <script src="${ctxStatic}/js/nl.js"type="text/javascript" charset="utf-8"></script>
    <link rel="stylesheet" href="${ctxStatic}/scripts/miniui/themes/bootstrap/skin.css" />


    <title>农林交流网</title>
    <link href="${ctxStatic}/css/base.css" type="text/css" rel="stylesheet">
    <link href="${ctxStatic}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="${ctxStatic}/assets/css/amazeui.min.css"/>
    <script src="${ctxStatic}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctxStatic}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

</head>
<style type="text/css">
     body{padding-bottom:50px;}
    .footer{height:50px;position:absolute;bottom:0px;left:23%;}

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

    ul{
        list-style:none;
    }
    .test_ul li{
        float:left;
    }


</style>


<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎， <c:if test="${empty user}"><span class="f_red">游客</span><a href="${path}/logincheck/tologin">请登录</a> | <a href="${path}/logincheck/sigin">免费注册</a></c:if>
            <c:if test="${!empty user}"><c:if test="${!empty level}"><a style="color: #7f2a0c;font-style: italic">${level}</a></c:if>${img} ${user}&nbsp;| <c:if test="${empty Admin}"><a href="${path}/logincheck/toUserIndex" > 个人中心</a></c:if>
                <c:if test="${!empty Admin}"><a href="${path}/logincheck/siginAdmin">新增管理员</a>&nbsp;| <a href="${path}/logincheck/toAdminIndex" > 个人中心</a></c:if>&nbsp;|
                <a onclick="logout()" href="#">退出登录</a></c:if>

        </div>
        <div class="m head_s" id="destoon_space"></div>
        <div class="m">
            <div id="search_tips" style="display:none;"></div>
        </div>
        <div class="m">
            <div id="search_module" style="display:none;margin-left:1025px;margin-top:88px;"  >
                <a href="javascript:void(0);" onclick="">资讯</a><a href="javascript:void(0);" >供应</a><a href="javascript:void(0);">求购</a><a href="javascript:void(0);" >品牌</a><a href="javascript:void(0);" >商家库</a><a href="javascript:void(0);" >展会</a><a href="javascript:void(0);" >专家课堂</a> </div>
        </div>

    </div>
</div>
<div class="sz_bg1">
    <div class="sz_logobox">
        <div class="sz_logo">
            <a href="http://www.zlf168.com/"><img src="${ctxStatic}/img/03-21-27-30-1.png" alt="种立方" data-bd-imgshare-binded="1"></a>
        </div>
        <ul class="test_ul">
            <li>
                <div class="sz_logo_ad">
                    <img src="${ctxStatic}/img/LOGO_ad.png" alt="种立方" data-bd-imgshare-binded="1">
                </div>
            </li>
            <li>
                <div style="width: 250px;margin-left: 80px;margin-top: 20px">
                    <marquee><b id="nowDateInfo"></b></marquee>
                </div>
            </li>
            <li>
                <div><iframe name="weather_inc" src="http://i.tianqi.com/index.php?c=code&id=2&num=3" width="440" height="70" frameborder="0" marginwidth="0" marginheight="0" scrolling="no"></iframe></div>
            </li>
        </ul>


    </div>

</div>
<div class="sz_menubg">
    <div class="sz_menu">
        <ul>
            <li><a href="${path}/logincheck/index"><span>首页</span></a></li>
            <li><a href="http://pfsc.agri.cn/pfsc/jgzs/reportHtml.html"><span>资讯</span></a></li>
            <li><a href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6"><span>供应</span></a></li>
            <li><a href="${path}/Tiezicheck/toTieziIndex"><span>帖子</span></a></li>
            <li><a href="http://pfscnew.agri.gov.cn/scdt/"><span>市场动态</span></a></li>
            <li><a href="http://jgsb.agri.cn/controller?SERVICE_ID=MARKET_INFO_REPORTS_SEARCH_SERVICE&login_result_sign=nologin"><span>价格报送</span></a></li>
            <li><a href=""><span>展会</span></a></li>
            <li><a href="${path}/classescheck/toclassesIndex"><span>专家课堂</span></a></li>
        </ul>
    </div>
</div>
<div id="body" style="margin-top: 20px;padding: 5px;">
    <!-- 左侧导航栏 -->
    <div style="border: 1px solid silver;width: 300px;height: 500px;float: left;margin-left: 12%;">
        <div data-am-widget="list_news" class="am-list-news am-list-news-default" style="background: #EEEEEE">
            <!--列表标题-->
            <div class="am-list-news-hd am-cf">
                <!--带更多链接-->
                <a href="${path}/Tiezicheck/toTieziIndex" class="">
                    <h2>最新帖子</h2>
                    <span class="am-list-news-more am-fr">更多 &raquo;</span>
                </a>
            </div>

            <div class="am-list-news-bd">
                <!-- 最新帖子展示情况，最多显示6条 -->
                <ul class="am-list">
                    <c:forEach items="${notes}" var="note">
                    <li class="am-g am-list-item-dated">
                        <div style="margin-top: 20px"><a href="javascript:void(0)" onclick="show(this)" id="${note.id }" class="am-list-item-hd ">${note.title}</a>
                            <span class="am-list-date">${note.postdateStr}</span></div>
                        <br>
                    </li>
                    </c:forEach>

                </ul>
            </div>

        </div>

    </div>

    <!-- 中间图片轮播 -->
    <div style="width: 800px;height: 500px;float: left;margin-left: 20px">
        <div class="fullSlide" style="background: white;">
            <!--轮播 -->
            <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
                <ul class="am-slides">
                    <c:if test="${simgs eq null}">
                        <li class="banner2" ><a style="position: relative;display: block"><img src="${ctxStatic}/img/s1.jpg" style="width: 800px;height: 500px"/>
                            <b style="position: absolute;left: 0;top: 30%;z-index: 10;padding-left: 80px;width: 100%;overflow: hidden;">
                                <span style="position: relative;z-index: 1;font-size: 30px">农林交流网——一站式农业交流平台</span>
                                <div style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;filter: blur(74px);background-color: #6b6b6b;z-index: 0"></div>
                            </b></a></li>
                        <li class="banner3" ><a><img src="${ctxStatic}/img/s2.jpg" style="width: 800px;height: 500px"/>
                            <b style="position: absolute;left: 0;top: 30%;z-index: 10;padding-left: 80px;width: 100%;overflow: hidden;">
                                <span style="position: relative;z-index: 1;font-size: 30px">推动农林业现代化建设，致力于打造一个属于农林种植户自己的交流平台</span>
                                <div style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;filter: blur(74px);background-color: #6b6b6b;z-index: 0"></div>
                            </b>
                        </a></li>
                    </c:if>
                    <c:if test="${simgs ne null}">
                    <c:forEach items="${simgs}" var="simg" varStatus="status">
                    <li class="banner1" >
                        <a style="position: relative;display: block">${simg.img}
                        <b style="position: absolute;left: 0;top: 30%;z-index: 10;padding-left: 80px;width: 100%;overflow: hidden;">
                            <span style="position: relative;z-index: 1;font-size: 30px">${simg.yl}</span>
                            <div style="position: absolute;left: 0;top: 0;width: 100%;height: 100%;filter: blur(74px);background-color: #6b6b6b;z-index: 0"></div>
                        </b></a>
                    </li>
                    <%--<li class="banner2" ><a><img src="${ctxStatic}/img/s1.jpg" style="width: 800px;height: 500px"/></a></li>--%>
                    <%--<li class="banner3" ><a><img src="${ctxStatic}/img/s2.jpg" style="width: 800px;height: 500px"/></a></li>--%>
                    <%--<li class="banner4" ><a><img src="${ctxStatic}/img/s3.jpg" style="width: 800px;height: 500px"/></a></li>--%>
                    </c:forEach>
                    </c:if>
                </ul>

                <div class="clear"></div>

            </div>
            <span class="prev" style="opacity: 0.5; display: inline;"></span> <span class="next" style="opacity: 0.5; display: inline;"></span>
        </div>

    </div>

    <!--右侧导航栏-->
    <div style="width: 300px;height: 500px;float: left;margin-left: 20px;margin-top: -8px">
        <section data-am-widget="accordion" class="am-accordion am-accordion-default" data-am-accordion='{ "multiple": true }'>
            <c:forEach items="${sysns}" var="sysn">
            <dl class="am-accordion-item ">
                <dt class="am-accordion-title">
                    ${sysn.title}
                </dt>
                <dd class="am-accordion-bd am-collapse am-in">
                    <!-- 规避 Collapase 处理有 padding 的折叠内容计算计算有误问题， 加一个容器 -->
                    <div class="am-accordion-content">
                       ${sysn.content}
                    </div>
                </dd>
            </dl>
            </c:forEach>

        </section>

    </div>
</div>


<div data-am-widget="header"
        class="am-header am-header-default" style="margin-top: 28%">
    <h1 class="am-header-title">
        <a href="#title-link" class="">
            <i class="am-icon-shopping-basket am-icon-fw">&nbsp;&nbsp;商品信息</i>
        </a>
    </h1>

    <div class="am-header-right am-header-nav">
        <form class="am-topbar-form am-topbar-left am-form-inline" role="search" >
            <div class="am-form-group">
                <input type="text" id="searchname" class="am-form-field am-input-sm" placeholder="搜索">
            </div>
        </form>
        <a href="javascript:void(0)" onclick="searchs()" ><i class="am-header-icon am-icon-search am-icon-fw" style="margin-top: 10px"></i></a>
    </div>
</div>

<div style="width: 1480px;height: 500px;margin-top: 20px;margin-left: 14%;padding: 35px">
    <div style="margin-left: 1300px"><a href="javascript:void(0)" onclick="showAllGoods()">更多商品信息</a></div>
    <c:forEach items="${goods}" var="goods" varStatus="status">
        <div style="width: 350px;height: auto;float: left;">
            <table width="100%" cellpadding="5" cellspacing="5" style="text-align: left">
                <tbody>
                <tr>
                    <td><div style="width: 240px;height: 180px;">${goods.photo}</div></td>

                </tr>
                <tr> <td class="f_dblue">商品序号：<span class="f_b f_orange">#${status.index+1}</span></td></tr>
                <tr>
                    <td class="f_dblue" >商品名：<span class="f_b f_orange">${goods.name}</span></td>
                </tr>
                <tr>
                    <td class="f_dblue" id="type">类型：<span class="f_b f_orange">${goods.typeStr}</span></td>
                </tr>
                <tr>
                    <td class="f_dblue" id="price">单价：<span class="f_b f_orange">￥${goods.price}</span></td>
                </tr>
                <tr>
                    <td class="f_dblue" >自买家付款之日起  <span class="f_b f_orange">3</span> 天内发货</td>

                </tr>
                <tr>
                    <td class="f_dblue" id="address">所在地：<span class="f_b f_orange">${goods.address}</span></td>

                </tr>
                <tr>
                    <td class="f_dblue">有效期至：<span class="f_b f_orange"><c:if test="${goods.state eq 0}">长期有效</c:if>
                                <c:if test="${goods.state eq 1 || goods.state eq 2}">已失效</c:if></span></td>

                </tr>
                <tr>
                    <td class="f_dblue">最后更新：<span class="f_b f_orange">${goods.postDateStr}</span></td>

                </tr>
                <tr>
                    <td width="80" class="f_dblue">商品数量：<span class="f_b f_orange">${goods.num}
                                <c:if test="${goods.type eq '0' ||goods.type eq '1' }">斤</c:if>
                                <c:if test="${goods.type eq '2'}">株</c:if>
                                 <c:if test="${goods.type eq '3'}">个</c:if></span></td>

                </tr>
                <tr>
                    <td colspan="2"><button class="c_bt" id="${goods.name}" onclick="showgoods(this)">查看详情</button>&nbsp;&nbsp; <c:if test="${goods.show != '1'}"><button id="${goods.name}" style="margin-left: 30px" class="c_bt" onclick="bought(this)">立即购买</button></c:if></td>
                </tr>
                </tbody></table>
        </div>
    </c:forEach>
</div>




<footer class="footer">
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
</strong></footer>




</body>

<script charset="utf-8" type="text/javascript">
    $(function(){
        document.onkeydown = function(e){
            var ev = document.all ? window.event : e;
            if(ev.keyCode==13) {
                searchs();
            }
        }
    });

    var data = '${uid}';
    function logout(){
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
    //查看帖子
    function show(e) {
        var id = e.id;
        location.href="${path}/Tiezicheck/gettiezi?id="+id+"&pageIndex=0&pageSize=20";
    }

    //查看商品详细信息
    function showgoods(e){
        $.ajax({
            url:"${path}/Goodscheck/showgoodsInfo",
            data:{"title": e.id},
            async:false,
            type: 'post',
            scriptCharset: 'utf-8',
            success :function(text){
                if(text !=null ||text !=""){
                    location.href="${path}/Goodscheck/toshowgoods?id="+text;
                }
            }

        });
    }

    function  bought(e){
        $.ajax({
            url:"${path}/Goodscheck/showgoodsInfo",
            data:{"title": e.id},
            async:false,
            type: 'post',
            scriptCharset: 'utf-8',
            success :function(text){
                if(text !=null ||text !=""){
                    location.href="${path}/Goodscheck/toBought?id="+text;
                }
            }

        });
    }

    //更多商品信息
    function showAllGoods(){
        location.href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6";
    }

    function searchs(){
        var name = $('#searchname').val();
        if (name == "" || name ==null){
            return;
        }
        location.href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6&name="+ encodeURI(encodeURI(name));
    }


    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);
</script>
</html>

