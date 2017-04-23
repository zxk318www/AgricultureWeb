<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/1
  Time: 10:21
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
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，<c:if test="${userinfo.level eq 5 }"><a style="color: #7f2a0c;font-style: italic">尊贵的会员用户：</a></c:if>${img} ${userinfo.name} <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
            <li><a href="http://pfscnew.agri.gov.cn/scdt/"><span>市场动态</span></a></li>
            <li><a href="http://jgsb.agri.cn/controller?SERVICE_ID=MARKET_INFO_REPORTS_SEARCH_SERVICE&login_result_sign=nologin"><span>价格报送</span></a></li>
            <li><a href=""><span>展会</span></a></li>
            <li><a href="${path}/classescheck/toclassesIndex"><span>专家课堂</span></a></li>
        </ul>
    </div>
</div>
<link href="${ctxStatic}/css/login.css" type="text/css" rel="stylesheet">
<div class="sz_contentBg">
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div style="height: 650px ;background: #dce6f3">
                <h1 style="margin-left: 45%;margin-top: 50px">个人中心</h1>
                <div style="padding:20px 50px 20px 50px;">
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;"></div >
                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                             <li style="width: 190px"><a href="${path}/logincheck/toupdateUser"><img src="${ctxStatic}/image/mm.png"></a></li>
                             <li style="width: 190px;text-align: center">个人模块</li>
                         </ul>
                    </div>

                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                            <li style="width: 190px"><a href="${path}/Tiezicheck/toUserNoteIndex"><img src="${ctxStatic}/image/tz.png"></a></li>
                            <li style="width: 190px;text-align: center">个人帖子中心</li>
                        </ul>
                    </div>

                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                            <li style="width: 190px"><a href="${path}/Noticecheck/toNoticeIndex"><img src="${ctxStatic}/image/dz.png"></a></li>
                            <li style="width: 190px;text-align: center">通知模块</li>
                        </ul>
                    </div>

                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                            <li style="width: 190px"><a href="${path}/Tiezicheck/toTieziIndex"><img src="${ctxStatic}/image/sp.png"></a></li>
                            <li style="width: 190px;text-align: center">帖子模块</li>
                        </ul>
                    </div>
                    <br>

                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                            <li style="width: 190px"><a href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6"><img src="${ctxStatic}/image/js.png"></a></li>
                            <li style="width: 190px;text-align: center">交易模块</li>
                        </ul>
                    </div>

                    <div style="float: left;margin-left: 130px;margin-top: 30px">
                        <ul>
                            <li style="width: 190px"><a href="${path}/Goodscheck/toshoppingcartIndex"><img src="${ctxStatic}/image/sc.png"></a></li>
                            <li style="width: 190px;text-align: center">订单模块</li>
                        </ul>
                    </div>
                </div>
                </div>
            </div>

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
</body>
<script charset="utf-8" type="text/javascript">

    $(function(){
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
    });

    function logout(){
        var data = '${userinfo.uid}';
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
</html>
