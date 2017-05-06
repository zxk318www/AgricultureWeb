<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/7
  Time: 11:03
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

</style>


<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，<c:if test="${userinfo != null}"><c:if test="${userinfo.level eq 5 }"><a style="color: #7f2a0c;font-style: italic">尊贵的会员用户：</a></c:if>${img} ${userinfo.name}</c:if>
            <c:if test="${admininfo!=null}">${img} ${admininfo.name}</c:if><a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
<link href="${ctxStatic}/css/login.css" type="text/css" rel="stylesheet">
<div class="sz_contentBg" >
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <c:if test="${userinfo.id ne '11111'}">
                    <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                    <a style="float: right;margin-right: 72px;margin-top: 15px" class="mini-button" iconCls="icon-add" href="${path}/Goodscheck/toaddGoods">新增商品</a>
                    <a style="float: right;margin-right: 30px;margin-top: 15px" class="mini-button" iconCls="icon-user" href="${path}/Goodscheck/tomygoodsIndex">我的商品</a>
                </c:if>
                <div style="padding:20px 50px 20px 50px;height: 1000px;">
                    <h1 style="text-align: center;margin-top: 30px">商品展示中心</h1>
                <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;margin-bottom: 20px"></div >

                    <input id="rankType" class="mini-combobox" style="width:120px;" textField="typeValue" valueField="typeId"
                           value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                    <input id="goodsname" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                    <a class="mini-button" onclick="search()">查询</a>

              <div style="margin-left: 45px;">
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
            </div>
                <div style="text-align: center;margin-top: 100px;margin-bottom: 20px;margin-left: 38%">
                    <ul class="test_ul">
                        <li><a href="javascript:" onclick="page(${pageIndex},${pageSize},'pre');">&#171; --上一页--&nbsp;&nbsp;</a></li>
                        <li><a >第${pageIndex+1}页</a></li>
                        <li><a href="javascript:" onclick="page(${pageIndex},${pageSize},'next');">&nbsp;&nbsp;--下一页-- &#187; </a></li>
                    </ul><br>

                </div>
                <p style="margin-left: 38%;margin-bottom: 50px">--每页显示 ${pageSize}条--共${totalgoods}条商品信息-- </p>
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




</body>

<script charset="utf-8" type="text/javascript">
    mini.parse();
    $(function(){

        var jsonData = [{'typeId':'-1','typeValue':'请选择商品类型'},{'typeId':'0','typeValue':'水果'},{'typeId':'1','typeValue':'蔬菜'},{'typeId':'2','typeValue':'农林'},{'typeId':'3','typeValue':'其他'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('-1');

        <c:if test="${admininfo eq null}">
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
        </c:if>
        <c:if test="${admininfo ne null}">
        var ms = '${admininfo.id}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
        </c:if>
    });
    //分页浏览
    function page(pageIndex,pageSize,key){
        var pages = '${totalpages}';
        if(pageIndex<=pages && pageIndex >0){
            if(key == "pre"){
                location.href="${path}/Goodscheck/getGoodsPage?pageIndex="+(pageIndex-1)+"&pageSize="+pageSize+"&type="+ '${ranktype}'+"&name="+encodeURI(encodeURI('${name}'));
            }
        }
        if(pageIndex<pages-1 && pageIndex >=0){
            if(key == "next"){
                location.href="${path}/Goodscheck/getGoodsPage?pageIndex="+(pageIndex+1)+"&pageSize="+pageSize+"&type="+ '${ranktype}'+"&name="+encodeURI(encodeURI('${name}'));
            }
        }

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

    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);

    function search(){
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("goodsname").getValue();
        if(rankType == '-1'){
            rankType = "";
        }
        location.href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6&type="+ rankType+"&name="+encodeURI(encodeURI(key));
    }
</script>
</html>

