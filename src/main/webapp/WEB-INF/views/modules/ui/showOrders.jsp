<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/16
  Time: 15:22
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

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/themes/default/default.css" />

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.css" />

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/kindeditor.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/lang/zh_CN.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.js"></script>

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

    ul{
        list-style:none;
    }
    .test_ul li{
        float:left;
    }

    .all>input{opacity:0;position:absolute;width:2em;height:2em;margin:0;cursor:pointer;}
    .all>input:nth-of-type(1),
    .all>span:nth-of-type(1){display:none;}
    .all>span{font-size:2em;color:gold;
        -webkit-transition:color .8s;
        transition:color .8s;
    }
    .all>input:checked~span{color:#666;}
    .all>input:checked+span{color:gold;}
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
        <ul class="test_ul">
            <li>
                <div class="sz_logo_ad">
                    <img src="${ctxStatic}/img/LOGO_ad.png" alt="种立方" data-bd-imgshare-binded="1">
                </div>
            </li>
            <li>
                <div style="width: 400px;margin-left: 220px;margin-top: 20px">
                    <marquee><b id="nowDateInfo"></b></marquee>
                </div>
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
<link href="${ctxStatic}/css/login.css" type="text/css" rel="stylesheet">
<div class="sz_contentBg" >
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                <div style="padding:20px 50px 20px 50px;height: auto">
                    <h1 style="text-align: center;margin-top: 30px">查看【${order.id}】订单</h1>
                    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;margin-bottom: 20px"></div >

                    <div style="margin-top: 20px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                         showCollapseButton="true"  collapseOnTitleClick="true" title="***订单信息***">
                        <div style="background:#FAFAFA;padding:10px 2px 10px 2px;line-height:24px;">
                        </div>
                        <hr style="height:3px;border:none;border-top:5px groove orangered;" />
                        <div id="forms" >
                        <tr><label class="f_b f_orange" ><b>订单编号：</b></label></tr><br>
                        <tr><input style="margin-left: 50px;width: 200px" class="mini-textbox" value="${order.id}"  readonly="true" disabled="true" id="orderid"></tr><br>
                        <tr><label class="f_b f_orange" ><b>订单状态：</b></label></tr><br>
                        <tr><input style="margin-left: 50px;width: 200px" class="mini-textbox" value="${order.stateStr}"  readonly="true" disabled="true" id="state"></tr><br>
                        <tr><label class="f_b f_orange" ><b>下单时间：</b></label></tr><br>
                        <tr><input style="margin-left: 50px;width: 200px" class="mini-datepicker" format="yyyy-MM-dd HH:mm:ss"  value="${order.buydateStr}"  readonly="true" disabled="true" id="ordertime"></tr><br>
                        <tr><label class="f_b f_orange" ><b>收件人姓名：</b></label></tr><br>
                        <tr><input style="margin-left: 50px;width: 200px" class="mini-textbox" value="${order.uname}" readonly="true" disabled="true" id="uname"></tr><br>
                        <tr><label class="f_b f_orange"><b>收件人联系方式：</b></label><br></tr>
                        <tr> <label class="f_b f_orange" style="margin-left: 50px"><b>座机号：</b></label><br>
                        <tr><input style="margin-left: 100px;width: 200px" class="mini-textbox" value="${order.phone}" id="uphone"readonly="true" disabled="true" ></tr><br>
                        <label class="f_b f_orange" style="margin-left: 50px"><b>手机号：</b></label><br>
                        <input style="margin-left: 100px;width: 200px" class="mini-textbox" value="${order.moblie}" readonly="true" disabled="true" id="umoblie"></tr><br>
                        <tr><label class="f_b f_orange" ><b>收件地址：</b></label><br>
                            <input style="margin-left: 50px;width: 500px" class="mini-textbox" value="${order.address}" readonly="true" disabled="true" id="uaddress"></span>
                        </tr><br>
                    </div>
                </div>


                    <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                         showCollapseButton="true"  collapseOnTitleClick="true" title="商品基本信息" >
                        <hr style="border:none;border-top:4px groove skyblue;" /><br>
                        <ul class="test_ul">
                            <li style="margin-left: 12px" ><div id="img" style="border: 1px solid slategrey;width: 240px;height: 180px;padding: 2px">
                                ${goods.photo}
                            </div></li>
                            <li style="margin-left: 20px">
                                <div style="border: 1px solid slategrey;width: 800px;height: 180px;float: right;padding: 3px">
                                    <div style="font-size: 20px;margin-left: 40px;">
                                        <tr ><label ><b>商品编号：</b></label>
                                            <span class="f_b f_orange" id="id">${goods.id}</span>
                                        </tr><br>
                                        <tr ><label ><b>商品名称：</b></label>
                                            <span class="f_b f_orange" >${goods.name}</span>
                                        </tr><br>
                                        <tr ><label ><b>商品类型：</b></label>
                                            <span class="f_b f_orange" >${goods.typeStr}</span>
                                        </tr><br>
                                        <tr ><label ><b>商品价格：</b></label>
                                            <span class="f_b f_orange" >${goods.price}&nbsp;元/斤</span>
                                        </tr><br>
                                        <tr ><label ><b>商品状态：</b></label>
                                            <span class="f_b f_orange" >${goods.stateStr}&nbsp;状态</span>
                                        </tr><br>
                                        <tr ><label ><b>商品产地：</b></label>
                                            <span class="f_b f_orange" >${goods.address}</span>
                                        </tr><br>
                                    </div>

                                </div>
                            </li>
                        </ul>
                    </div>
                    <div style="margin-top: 20px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                         showCollapseButton="true"  collapseOnTitleClick="true" title="商品卖家信息">
                        <div style="background:#FAFAFA;padding:10px 2px 10px 2px;line-height:24px;">

                        </div >

                        <hr style="border:none;border-top:4px groove skyblue;" /><br>
                        <div style="margin-left: 80px">
                            <tr><label ><b>卖家姓名：</b></label><span class="f_b f_orange" >${goodsuserinfo.name}</span></tr><br>
                            <tr><label ><b>卖家联系方式：</b></label><br></tr>
                            <tr> <label ><b>座机号：</b></label><span class="f_b f_orange" >${goodsuserinfo.phone}</span>&nbsp;&nbsp;
                                <label ><b>手机号：</b></label><span class="f_b f_orange" >${goodsuserinfo.moblie}</span></tr><br>
                            <tr><label ><b>描述：</b></label> <span class="f_b f_orange" >${goods.miaoshu}</span>
                            </tr><br>
                        </div>

                    </div>




                </div>

            </div>
        </div>

    </div>

    <div id="to_top" style="padding:20px;  position:absolute; cursor:pointer; "><img src="${ctxStatic}/image/tp.png"></div>
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


<div id="editWindow" class="mini-window" title="加入购物车的商品数量" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">请输入所要加入购物车的商品数量</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">加入购物车的商品名称：</td>
                <td style="width:150px;">${goods.name}</td>
            </tr>

            <tr>
                <td style="width:120px;">当前用户账号：</td>
                <td style="width:150px;">${userinfo.name}</td>
            </tr>
            <tr>
                <td style="width:120px;">加入购物车商品数量：</td>
                <td style="width:150px;"><input class="mini-textbox" id="num"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:addshopcart()">确定</a>
                    <a class="Cancel_Button" href="javascript:cancel()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>


<div id="editWindows" class="mini-window" title="商品购买" style="width:400px;"
     showModal="true" allowResize="true" allowDrag="true">

    <input class="mini-hidden" name="id"/>
    <div  class="form" >
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">请输入所要购买的商品数量</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">购买的商品名称：</td>
                <td style="width:150px;">${goods.name}</td>
            </tr>

            <tr>
                <td style="width:120px;">当前用户账号：</td>
                <td style="width:150px;">${userinfo.name}</td>
            </tr>

            <tr>
                <td style="width:120px;">当前用户余额：</td>
                <td style="width:150px;"><input class="mini-textbox" id="balance" name="balance" value="${userinfo.balance}" readonly="true" disabled="true">元</td>
            </tr>
            <tr>
                <td style="width:120px;">购买的商品单价：</td>
                <td style="width:150px;">￥${goods.price}&nbsp;&nbsp;<c:if test="${goods.type eq '0' || goods.type eq '1'}">元/斤</c:if>
                    <c:if test="${goods.type eq '2' }">元/株</c:if><c:if test="${goods.type eq '3' }">个</c:if></td>
            </tr>
            <tr>
                <td style="width:120px;">购买的商品数量：</td>
                <td style="width:150px;"><input class="mini-textbox" id="nums" name="nums" onblur="jstotal()">斤</td>
            </tr>
            <tr>
                <td style="width:120px;">合计：共</td>
                <td style="width:150px;"><input class="mini-textbox" id="total" name="total" readonly="true" style="color: orangered" disabled="true">元</td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:addOrder()">确定</a>
                    <a class="Cancel_Button" href="javascript:cancels()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>



</body>

<script charset="utf-8" type="text/javascript">
    mini.parse();
    $(function(){
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
    });

    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);
</script>
</html>

