<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/2/20
  Time: 15:40
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="${ctxStatic}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/assets/js/amazeui.swiper.min.js"></script>
    <script src="${ctxStatic}/scripts/miniui/miniui.js"type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/boot.js"type="text/javascript"></script>
    <link rel="stylesheet" href="${ctxStatic}/scripts/miniui/themes/bootstrap/skin.css" />
    <title>农林交流网</title>
    <meta name="keywords" content="农业,农业网站,农业种植,农业资讯,农业电商,电商平台,种植,种植专家,专业农业信息商务平台,一站式农业服务平台">
    <link href="${ctxStatic}/css/base.css" type="text/css" rel="stylesheet">
    <link href="${ctxStatic}/css/text.css" type="text/css" rel="stylesheet">
    <link href="${ctxStatic}/css/lis.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="${ctxStatic}/assets/css/amazeui.swiper.min.css"/>
    <link href="${ctxStatic}/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css" />
    <link href="${ctxStatic}/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css" />
    <script src="${ctxStatic}/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
    <script src="${ctxStatic}/AmazeUI-2.4.2/assets/js/amazeui.min.js"></script>

<body>

<style type="text/css">
    .am-slides li>img{
        width: 500px ;
        height: 500px;
    }
</style>
<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member">欢迎， <c:if test="${empty user}"><span class="f_red">游客</span><a href="${path}/logincheck/tologin">请登录</a> | <a href="${path}/logincheck/sigin">免费注册</a></c:if>
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
    <div class="sz_logobox" style="height:100px;padding:5px 0px 5px;">
        <div class="sz_logo">
            <a href="#"><img src="${ctxStatic}/img/03-21-27-30-1.png" alt="种立方" data-bd-imgshare-binded="1"></a>
        </div>
        <div class="sz_logo_ad" style="padding-top:20px;"><img src="${ctxStatic}/img/LOGO_ad.png" alt="种立方" data-bd-imgshare-binded="1"></div>
        <div style="display:none; float:left;"><img src="${ctxStatic}/img/LOGO_ad.jpg" alt="" data-bd-imgshare-binded="1"></div>
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
<div class="fullSlide">

        <!--轮播 -->
        <div class="am-slider am-slider-default scoll" data-am-flexslider id="demo-slider-0">
            <ul class="am-slides">
                <li class="banner1"><a href="introduction.html"><img src="../images/ad1.jpg" /></a></li>
                <li class="banner2"><a><img src="${ctxStatic}/image/dy.png" style="width: 500px;height: 500px;vertical-align:middle"/></a></li>
                <li class="banner3"><a><img src="${ctxStatic}/image/dz.png" style="width: 500px;height: 500px"/></a></li>
                <li class="banner4"><a><img src="${ctxStatic}/image/tp.png" style="width: 500px;height: 500px"/></a></li>
            </ul>

        <div class="clear"></div>
        </div>
    </div>
    <span class="prev" style="opacity: 0.5; display: inline;"></span> <span class="next" style="opacity: 0.5; display: inline;"></span>
</div>
<div class="sz_contentBg">
    <div class="sz_contentbox">
        <div class="sz_box3_left sz_fl alphaW" style="position: absolute;top:-450px; left:0;">
            <div class="sz_submenu_title deepGreen"><span>产品分类</span></div>
            <div class="all-sort-list sz_catMenu">
                <div class="item cm">
                    <h3 class="catT">
                        <p><a href="#" class="catLink"><span style="color:#99CC00">蔬菜种子</span></a></p>
                        <p><a href="#" target="_blank">叶菜类</a><a href="#" target="_blank">根菜类</a></p><i></i></h3>
                    <div class="item-list clearfix">
                        <div class="subitem">
                            <dl class="fore1">
                                <dt><a href="#" target="_blank">叶菜类</a></dt>

                            </dl>
                            <dl class="fore2">
                                <dt><a href="#" target="_blank">根菜类</a></dt>

                            </dl>
                            <dl class="fore3">
                                <dt><a href="#" target="_blank">茎菜类</a></dt>

                            </dl>
                            <dl class="fore4">
                                <dt><a href="#" target="_blank">花菜类</a></dt>

                            </dl>
                            <dl class="fore5">
                                <dt><a href="#" target="_blank">果菜类</a></dt>

                            </dl>
                            <dl class="fore6">
                                <dt><a href="#" target="_blank">其它</a></dt>

                            </dl>
                        </div>
                    </div>
                </div>
                <div class="item cm">
                    <h3 class="catT">
                        <p><a href="#" class="catLink"><span style="color:#99CC00">大田种子</span></a></p>
                        <p><a href="#" target="_blank">粮食种子</a><a href="#" target="_blank">经济作物</a></p><i></i></h3>
                    <div class="item-list clearfix">
                        <div class="subitem">
                            <dl class="fore1">
                                <dt><a href="#" target="_blank">粮食种子</a></dt>

                            </dl>
                            <dl class="fore2">
                                <dt><a href="#" target="_blank">经济作物</a></dt>

                            </dl>
                            <dl class="fore3">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=242" target="_blank">其它</a></dt>

                            </dl>
                        </div>
                    </div>
                </div>
                <div class="item cm">
                    <h3 class="catT">
                        <p><a href="http://www.zlf168.com/sell/list.php?catid=128" class="catLink"><span style="color:#99CC00">盆栽苗木</span></a></p>
                        <p><a href="http://www.zlf168.com/sell/list.php?catid=186" target="_blank">乔木</a><a href="http://www.zlf168.com/sell/list.php?catid=187" target="_blank">灌木</a></p><i></i></h3>
                    <div class="item-list clearfix">
                        <div class="subitem">
                            <dl class="fore1">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=186" target="_blank">乔木</a></dt>

                            </dl>
                            <dl class="fore2">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=187" target="_blank">灌木</a></dt>

                            </dl>
                            <dl class="fore3">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=243" target="_blank">其它</a></dt>

                            </dl>
                        </div>
                    </div>
                </div>
                <div class="item cm">
                    <h3 class="catT">
                        <p><a href="http://www.zlf168.com/sell/list.php?catid=244" class="catLink"><span style="color:#99CC00">种植基地</span></a></p>
                        <p><a href="http://www.zlf168.com/sell/list.php?catid=245" target="_blank">蔬菜基地</a><a href="http://www.zlf168.com/sell/list.php?catid=246" target="_blank">水果基地</a></p><i></i></h3>
                    <div class="item-list clearfix">
                        <div class="subitem">
                            <dl class="fore1">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=245" target="_blank">蔬菜基地</a></dt>

                            </dl>
                            <dl class="fore2">
                                <dt><a href="http://www.zlf168.com/sell/list.php?catid=246" target="_blank">水果基地</a></dt>

                            </dl>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="sz_box3_right sz_fr sz_specialFr" style="position:absolute; top:-450px; right:0">
            <div class="sz_regbox"><a href="http://www.zlf168.com/member/login.php" rel="nofollow" class="login_link">登录</a><a href="http://www.zlf168.com/member/register.php" rel="nofollow" class="reg_link">注册</a><a href="http://www.zlf168.com/member/my.php" rel="nofollow">发布信息</a></div>
            <div class="sz_notice">
                <div class="sz_submenu_title">
                    <div class="pro_num">产品总数：<i>156</i></div><span>平台公告</span></div>
                <ul>
                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-15</span><a href="http://www.zlf168.com/announce/20.html" target="_blank" title="立方商城即将上线，敬请期待！"><span style="color:#FF0000">立方商城即将上线，敬请期待！</span></a></li>
                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/announce/18.html" target="_blank" title="种立方-最具价值的种业服务平台上线啦！！！"><span style="color:#FF0000">种立方-最具价值的种业服务平台上线啦！！！</span></a></li>
                </ul>
                <div class="sz_expert">
                    <div class="sz_t2"><a href="http://www.zlf168.com/">更多&gt;&gt;</a><span>特邀专家</span></div>
                    <div class="sz_expert_intro">
                        <a href="http://www.zlf168.com/#"><img src="${pageContext.request.contextPath}/static/img/sz03.jpg" alt="" data-bd-imgshare-binded="1"></a>
                        <p><a href="http://www.zlf168.com/#"><b>胡乐平</b></a><br>水果技术专家<br>中国农业大学教授</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="sz_bigbox">
            <div class="sz_box2_col sz_box2_big">
                <div class="sz_t4"><span>供求资讯</span></div>
                <div class="sz_supplybox">
                    <ul>
                        <li class="one">
                            <div class="sz_t5"><a href="http://www.zlf168.com/sell/">更多&gt;&gt;</a><span>供应</span></div>
                            <ul>
                                <!--<li><a href="#" class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="#" target="_blank">紫米</a></li>-->
                                <ul>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;11-22</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=201" target="_blank" title="大量甘蔗供应">大量甘蔗供应</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;10-26</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=200" target="_blank" title="供应精致浓作物花生，玉米，大豆，棉花">供应精致浓作物花生，玉米，大豆，棉花</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-13</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=199" target="_blank" title="无斑油麦菜">无斑油麦菜</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-13</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=198" target="_blank" title="黄樱1号樱桃番茄">黄樱1号樱桃番茄</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-13</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=197" target="_blank" title="银绿芥蓝">银绿芥蓝</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-26</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=196" target="_blank" title="供应茄子——春茄绿龙">供应茄子——春茄绿龙</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;06-20</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=186" target="_blank" title="供应短棒早冠丝瓜">供应短棒早冠丝瓜</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;06-20</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=185" target="_blank" title="供应早皱王丝瓜">供应早皱王丝瓜</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;06-20</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=184" target="_blank" title="供应新早佳丝瓜">供应新早佳丝瓜</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;06-20</span><a class="orangeLink" target="_blank">[供应]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/sell/show.php?itemid=183" target="_blank" title="供应改良早杂8号">供应改良早杂8号</a></li>
                                </ul>
                            </ul>
                        </li>
                        <li>
                            <div class="sz_t5"><a href="http://www.zlf168.com/buy/">更多&gt;&gt;</a><span>求购</span></div>
                            <ul>
                                <!--<li><a href="#" class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="#">紫米</a></li>-->
                                <ul>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=30" target="_blank" title="求购红果番茄种子">求购红果番茄种子</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=29" target="_blank" title="求购油麦菜种子">求购油麦菜种子</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=28" target="_blank" title="求购豆角种子">求购豆角种子</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=27" target="_blank" title="求购西芹">求购西芹</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=26" target="_blank" title="求购生菜种子">求购生菜种子</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=25" target="_blank" title="长期求购粉果番茄">长期求购粉果番茄</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;07-25</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=24" target="_blank" title="求购青椒种子">求购青椒种子</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;04-08</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=19" target="_blank" title="求购萝卜">求购萝卜</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;03-07</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=18" target="_blank" title="求购水稻">求购水稻</a></li>
                                    <li><span class="f_r px11 infodate" style="float:right;">&nbsp;02-26</span><a class="brownLink" target="_blank">[求购]</a>&nbsp;&nbsp;<a href="http://www.zlf168.com/buy/show.php?itemid=17" target="_blank" title="求购番茄种子">求购番茄种子</a></li>
                                </ul>
                            </ul>
                        </li>
                    </ul>
                </div>
            </div>
            <div class="sz_box2_right">
                <div class="sz_adbox2" style="height:354px;">
                    <a href="http://www.zlf168.com/#" target="_blank"><img src="${pageContext.request.contextPath}/static/img/newad3.jpg" width="220" height="64" alt="" data-bd-imgshare-binded="1"></a>
                    <a href="http://www.zlf168.com/#" target="_blank"><img src="${pageContext.request.contextPath}/static/img/newad4.jpg" width="220" height="64" alt="" data-bd-imgshare-binded="1"></a>
                    <a href="http://www.zlf168.com/#" target="_blank"><img src="${pageContext.request.contextPath}/static/img/newad2.jpg" width="220" height="64" alt="" data-bd-imgshare-binded="1"></a>
                    <!--              <a href="#"><img src="images/newad1.jpg" alt="" /></a>
<a href="#"><img src="images/newad2.jpg" alt="" /></a>
<a href="#"><img src="images/newad3.jpg" alt="" /></a>
<a href="#"><img src="images/newad4.jpg" alt="" /></a>
<a href="#"><img src="images/newad2.jpg" alt="" /></a>-->
                </div>
            </div>
            <div class="clear"></div>
        </div>

        <div class="sz_bigbox">
            <div class="whiteBg">
                <div class="sz_t1">
                    <div class="sz_link_more"><a href="http://www.zlf168.com/sell/">更多&gt;&gt;</a></div><span>名优产品</span></div>
                <div class="sz_proIn">
                    <div class="sz_prolist">
                        <ul style="width: 1395px;">
                            <!--<li><a href="#" target="_blank"><img src="images/sz10.jpg" alt="" /></a><p><a href="#">墨西哥牛油果</a></p></li>-->
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=196" target="_blank">
                                    <a src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201608/26/10-16-23-61-1.jpg.thumb.jpg" width="100" height="100" alt="供应茄子——春茄绿龙" data-bd-imgshare-binded="1">
                                </a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=196" title="供应茄子——春茄绿龙" target="_blank">供应茄子——春茄绿龙</a></p>

                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=39" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201605/17/16-50-12-51-22.jpg.thumb.jpg" width="100" height="100" alt="胡萝卜0.5元/斤" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=39" title="胡萝卜0.5元/斤" target="_blank"><span style="color:#FF0000">胡萝卜0.5元/斤</span></a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=26" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/18/14-53-04-87-1.png.thumb.png" width="100" height="100" alt="有樟子松20厘米苗供应" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=26" title="有樟子松20厘米苗供应" target="_blank">有樟子松20厘米苗供应</a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=20" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/18/11-38-47-12-1.jpg.thumb.jpg" width="100" height="100" alt="金叶复叶槭我国三北、江浙、华南地区均可种植" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=20" title="金叶复叶槭我国三北、江浙、华南地区均可种植" target="_blank">金叶复叶槭我国三北、江浙、华南地区均</a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=18" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/18/11-19-00-43-1.jpg.thumb.jpg" width="100" height="100" alt="百慕大草皮密度适中耐旱性强" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=18" title="百慕大草皮密度适中耐旱性强" target="_blank"><span style="color:#FF0000">百慕大草皮密度适中耐旱性强</span></a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=15" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/18/09-22-32-65-1.jpg.thumb.jpg" width="100" height="100" alt="美国巨型特大南瓜种子批发" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=15" title="美国巨型特大南瓜种子批发" target="_blank">美国巨型特大南瓜种子批发</a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=9" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/14/14-57-00-33-1.jpg.thumb.jpg" width="100" height="100" alt="综合性状极优的苦瓜种子金船8号F1" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=9" title="综合性状极优的苦瓜种子金船8号F1" target="_blank">综合性状极优的苦瓜种子金船8号F1</a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=8" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/14/14-42-25-37-1.jpg.thumb.jpg" width="100" height="100" alt="青杂三号湖北嘉鱼县" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=8" title="青杂三号湖北嘉鱼县" target="_blank">青杂三号湖北嘉鱼县</a></p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/sell/show.php?itemid=6" target="_blank"><img src="${pageContext.request.contextPath}/static/img/lazy.gif" class="lazy" original="http://www.zlf168.com/file/upload/201508/14/14-10-16-14-1.jpg.thumb.jpg" width="100" height="100" alt="高端大粉果—爱美特" data-bd-imgshare-binded="1"></a>
                                <p><a href="http://www.zlf168.com/sell/show.php?itemid=6" title="高端大粉果—爱美特" target="_blank">高端大粉果—爱美特</a></p>
                            </li>
                        </ul>
                    </div>
                    <div class="Slidebtn brandbt_prev"></div>
                    <div class="Slidebtn brandbt_next"></div>
                </div>
            </div>
        </div>
        <div class="sz_adbox">

            <div id="slide_a4" class="slide" style="width:1200px;height:120px;">
                <a href="http://www.zlf168.com/###" target="_self" id="slide_a4_url"><img src="${pageContext.request.contextPath}/static/img/15-56-55-67-1.jpg" width="1200" height="120" id="slide_a4_img" data-bd-imgshare-binded="1"></a>
                <div style="width:1192px;height:20px;overflow:hidden;zIndex:3;position:relative;margin-top:-20px;padding:0 4px 0 4px;text-align:right;"><span id="slide_a4_no_0" style="padding:1px 5px 1px 5px;margin-left:1px;cursor:pointer;font-size:12px;color:#FFFFFF;background:#FF7E00;">1</span></div>
            </div>

        </div>
        <div class="sz_bigbox">
            <div class="whiteBg">
                <div class="sz_t1">
                    <div class="sz_link_more"><a href="http://www.zlf168.com/video/" target="_blank">更多&gt;&gt;</a></div><span>专家课堂</span></div>
                <div class="sz_comIn">
                    <div class="sz_comlist">
                        <ul style="width: 460px;">
                            <li>
                                <a href="http://www.zlf168.com/know/expert-htm-itemid-11.html"><img src="${pageContext.request.contextPath}/static/img/19-11-42-58-1.png" alt="" data-bd-imgshare-binded="1"></a>
                                <p><b><a href="http://www.zlf168.com/know/expert-htm-itemid-11.html">叶亮</a></b></p>
                                <p>叶菜</p>
                            </li>
                            <li>
                                <a href="http://www.zlf168.com/know/expert-htm-itemid-6.html"><img src="${pageContext.request.contextPath}/static/img/08-30-04-47-1.png" alt="" data-bd-imgshare-binded="1"></a>
                                <p><b><a href="http://www.zlf168.com/know/expert-htm-itemid-6.html">陈满盈</a></b></p>
                                <p>茄果类蔬菜育种和栽培</p>
                            </li>
                            <!--<li><a href="http://www.zlf168.com/video/"><img src="http://www.zlf168.com/api/avatar/show.php?username=&amp;size=middle" alt="" /></a><p><b>陈满盈</b></p><p>茄果类蔬菜育种和栽培</p></li>-->
                        </ul>
                    </div>
                    <div class="Slidebtn brandbt_prev"></div>
                    <div class="Slidebtn brandbt_next"></div>
                </div>
            </div>
        </div>

        <div class="sz_bigbox">
            <div class="sz_t4"><a href="http://www.zlf168.com/news/list.php?catid=72">农业资讯</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=74">种植技术</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=75">致富有道</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=240">惠农政策</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=374">展会知识</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=375">人物访谈</a> <b>|</b> <a href="http://www.zlf168.com/news/list.php?catid=376">社会焦点</a><span>行业新闻</span></div>
            <div class="whiteBg">
                <div class="sz_infoList">
                    <ul>

                        <li>
                            <div class="sz_t6"><a href="http://www.zlf168.com/news/list.php?catid=72">农业资讯</a></div>
                            <div class="infoPic" style="display:none;"><img src="${pageContext.request.contextPath}/static/img/sz24.jpg" alt="" data-bd-imgshare-binded="1"></div>
                            <ul>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;11-01</span><a href="http://www.zlf168.com/news/show.php?itemid=1780" target="_blank" title="关于种子包装二维码的一切！">关于种子包装二维码的一切！</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1778" target="_blank" title="2000多个农作物新产品新成果亮相全国种子“双交会”">2000多个农作物新产品新成果亮相全国种子“双交会”</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1777" target="_blank" title="去年我国推广节水农业技术面积1180万亩">去年我国推广节水农业技术面积1180万亩</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1776" target="_blank" title="“十三五”我国将加大粮食援藏工作力度">“十三五”我国将加大粮食援藏工作力度</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1775" target="_blank" title="南方水稻黑条萎缩病致500亩杂交水稻遭殃">南方水稻黑条萎缩病致500亩杂交水稻遭殃</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1774" target="_blank" title="绝密！粮食降价将改变中国农业格局">绝密！粮食降价将改变中国农业格局</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1768" target="_blank" title="农业部：确保农产品初加工补助政策实施阳光操作">农业部：确保农产品初加工补助政策实施阳光操作</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1767" target="_blank" title="国庆节前&quot;菜篮子&quot;量足价稳 猪肉价格年内料难抬头">国庆节前"菜篮子"量足价稳 猪肉价格年内料难抬头</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1766" target="_blank" title="43家农批市场1500亿的生意被搬到网上！关于农业B2B你真的懂么？">43家农批市场1500亿的生意被搬到网上！关于农业B2B你真的懂么？</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1765" target="_blank" title="种子法配套规章7大疑问，农业部种子管理局给出权威解读！">种子法配套规章7大疑问，农业部种子管理局给出权威解读！</a></li>
                            </ul>
                        </li>

                        <li>
                            <div class="sz_t6"><a href="http://www.zlf168.com/news/list.php?catid=74">种植技术</a></div>
                            <div class="infoPic" style="display:none;"><img src="${pageContext.request.contextPath}/static/img/sz24.jpg" alt="" data-bd-imgshare-binded="1"></div>
                            <ul>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-30</span><a href="http://www.zlf168.com/news/show.php?itemid=1779" target="_blank" title="高粱地下害虫防治">高粱地下害虫防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1773" target="_blank" title="高粱细菌性斑点病的防治">高粱细菌性斑点病的防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1772" target="_blank" title="高粱矮花叶病（高粱红条病）的防治">高粱矮花叶病（高粱红条病）的防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1771" target="_blank" title="高粱大斑病的防治">高粱大斑病的防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1770" target="_blank" title="高粱苗枯病的防治">高粱苗枯病的防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-29</span><a href="http://www.zlf168.com/news/show.php?itemid=1769" target="_blank" title="高粱黑葱花霉根腐病的防治">高粱黑葱花霉根腐病的防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1763" target="_blank" title="橄榄木虱、粉虱的综合防治">橄榄木虱、粉虱的综合防治</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1762" target="_blank" title="油橄榄嫁接方法">油橄榄嫁接方法</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1761" target="_blank" title="橄榄果园的合理施肥">橄榄果园的合理施肥</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;09-28</span><a href="http://www.zlf168.com/news/show.php?itemid=1760" target="_blank" title="油橄榄修剪方法">油橄榄修剪方法</a></li>
                            </ul>
                        </li>

                        <li>
                            <div class="sz_t6"><a href="http://www.zlf168.com/news/list.php?catid=75">致富有道</a></div>
                            <div class="infoPic" style="display:none;"><img src="${pageContext.request.contextPath}/static/img/sz24.jpg" alt="" data-bd-imgshare-binded="1"></div>
                            <ul>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;03-22</span><a href="http://www.zlf168.com/news/show.php?itemid=313" target="_blank" title="鸡茶共生 生态农业甜头多">鸡茶共生 生态农业甜头多</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;03-07</span><a href="http://www.zlf168.com/news/show.php?itemid=203" target="_blank" title="他将黑豆卖到全世界，如何将冷门产品变畅销？">他将黑豆卖到全世界，如何将冷门产品变畅销？</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;02-22</span><a href="http://www.zlf168.com/news/show.php?itemid=146" target="_blank" title="贵州巧读“山字经” 特色生态农业拓宽致富路">贵州巧读“山字经” 特色生态农业拓宽致富路</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;01-05</span><a href="http://www.zlf168.com/news/show.php?itemid=59" target="_blank" title="青海：高原蔬菜生态 “菜园子”富了村">青海：高原蔬菜生态 “菜园子”富了村</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-25</span><a href="http://www.zlf168.com/news/show.php?itemid=26" target="_blank" title="李树缀满富裕果">李树缀满富裕果</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-25</span><a href="http://www.zlf168.com/news/show.php?itemid=25" target="_blank" title="300吨油饼&quot;大餐&quot; 喂出抢手猕猴桃">300吨油饼"大餐" 喂出抢手猕猴桃</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-25</span><a href="http://www.zlf168.com/news/show.php?itemid=23" target="_blank" title="千米山上放养黑山猪">千米山上放养黑山猪</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-25</span><a href="http://www.zlf168.com/news/show.php?itemid=22" target="_blank" title="农业订单让青冈农民尝到甜头">农业订单让青冈农民尝到甜头</a></li>
                                <li><span class="f_r px11 infodate" style="float:right;">&nbsp;08-25</span><a href="http://www.zlf168.com/news/show.php?itemid=21" target="_blank" title="曾国藩：一勤天下无难事">曾国藩：一勤天下无难事</a></li>
                            </ul>
                        </li>
                    </ul>
                    <div class="clear"></div>
                </div>
            </div>
        </div>


    </div>

    <div class="sz_bigbox">
        <div class="clear"></div>
    </div>
</div>
</div>
</div>

</div>
</div>
<div class="bobar">
    <div class="company_desc">
        <ul>
            <li><img src="${pageContext.request.contextPath}/static/img/cm1.png" alt="" data-bd-imgshare-binded="1"></li>
            <li><img src="${pageContext.request.contextPath}/static/img/cm2.png" alt="" data-bd-imgshare-binded="1"></li>
            <li><img src="${pageContext.request.contextPath}/static/img/cm3.png" alt="" data-bd-imgshare-binded="1"></li>
            <li><img src="${pageContext.request.contextPath}/static/img/cm4.png" alt="" data-bd-imgshare-binded="1"></li>
            <li><img src="${pageContext.request.contextPath}/static/img/cm5.png" alt="" data-bd-imgshare-binded="1"></li>
        </ul>
        <div class="clear"></div>
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


<script  type="text/javascript">
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


</script>

</body>

</html>