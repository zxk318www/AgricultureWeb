<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/2/21
  Time: 11:34
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>

<html>
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
    .code
    {
        background:url(${ctxStatic}/image/cb.png);
        font-family:Arial;
        font-style:italic;
        color: #00a9e0;
        font-size:30px;
        border:0;
        padding:2px 3px;
        letter-spacing:3px;
        font-weight:bolder;
        float:left;
        cursor:pointer;
        width:150px;
        height:60px;
        line-height:60px;
        text-align:center;
        vertical-align:middle;
    }
    .kbq{
        font-family:Arial;
        font-style:italic;
        font-size:30px;
        border:0;
        padding:2px 3px;
        letter-spacing:3px;
        font-weight:bolder;
        float:left;
        cursor:pointer;
        width:150px;
        height:60px;
        line-height:60px;
        text-align:center;
        vertical-align:middle;
    }
    a
    {
        text-decoration:none;
        font-size:12px;
        color:#288bc4;
    }
    a:hover
    {
        text-decoration:underline;
    }

</style>

<body>
<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，<span class="f_red">客人</span> |<a href="${path}/logincheck/sigin">免费注册</a> </div>
        <div class="m head_s" id="destoon_space"></div>

    </div>
</div>

<div class="sz_bg1">
    <div class="sz_logobox">
        <div class="sz_logo">
            <a href="#"><img src="${ctxStatic}/img/03-21-27-30-1.png" alt="种立方" data-bd-imgshare-binded="1"></a>
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
<style type="text/css">
    .tips {
        position: absolute;
        z-index: 100;
        width: 300px;
        background: url('${ctxStatic}/image/tips_bg.gif') no-repeat 0 bottom;
        overflow: hidden;
        margin: -5px 0 0 -10px;
    }

    .tips div {
        background: url('${ctxStatic}/image/tips_top.gif') no-repeat;
        line-height: 22px;
        padding: 8px 10px 8px 35px;
    }
</style>

<link href="${ctxStatic}/css/login.css" type="text/css" rel="stylesheet">
<br>
<div class="sz_contentBg">
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="sz_loginBox">
                <div class="login-ad">
                    <img src="${ctxStatic}/img/login-ad.png" data-bd-imgshare-binded="1">
                </div>

                <div class="login-form" id="login-form">
                    <h1>用户登录</h1>
                    <div>
                        <input name="forward" type="hidden" id="forward" >
                        <div class="usertxt">登录名：</div>
                            <input class="mini-textbox" name="username" id="username" value='${username}' style="width:290px" required="true" requiredErrorText="登录名不能为空"  onvaluechanged="clearPwd">
                             <br>
                        <div class="passwordtxt" style="margin-top: 2px">密码：</div>

                            <input name="password" class="mini-password" type="password"  style="width:290px;" id="password" vtype="minLength:5" required="true" minLengthErrorText="密码不能少于5个字符">
                        <div class="passwordtxt" style="margin-top: 2px">验证码：</div>
                        <input name="password" class="mini-password" type="password"  style="width:290px;" id="yzm" vtype="minLength:5" required="true" onvalidation="checkYzm">
                           <div class="code" id="checkCode" onclick="createCode()" ></div><br>
                           <div class="kbq"><a href="#" onclick="createCode()">看不清换一张</a></div>


                        <div class="forget">
                           <div style="margin-top: 10px"><input  class="mini-checkbox"  value="1" id="cookietime" checked=""><label for="cookietime">记住我</label>  <a class="New_Button" style="margin-left: 15px" href="javascript:newRow()">忘记密码?</a></div>

                        </div>
                        <input class="userloginbut but" id="login" type="submit"  value=" 登 录 " onclick="login()">

                    </div><br>
                </div>
                <div class="clear"></div>
            </div>
        </div>

    </div>
</div>
<br>
<br>

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
</strong>
<div id="hm_" class="hm-t-container">
    <div class="hm-t-map-card" style="width: 500px; display: none; bottom: 2px;">
        <div class="hm-t-map-card-info">
            <table>
                <tbody>
                <tr>
                    <td class="hm-t-map-card-info-table-index">名称：</td>
                    <td class="hm-t-map-card-info-table-content">农林交流网</td>
                </tr>
                <tr>
                    <td class="hm-t-map-card-info-table-index">地址：</td>
                    <td class="hm-t-map-card-info-table-content">江苏省徐州市富春路1号徐州工程学院</td>
                </tr>
                <tr>
                    <td class="hm-t-map-card-info-table-index">电话：</td>
                    <td class="hm-t-map-card-info-table-content">013685****01</td>
                </tr>
                <tr>
                    <td class="hm-t-map-card-info-table-index">简介：</td>
                    <td class="hm-t-map-card-info-table-content">种立方集种子商家,种植基地,农业专家,媒体等资源于一体,拥有最新的农业资讯,展会,供求信息发布,企业网站,品牌,产品宣传，专家课堂等功能,的一个一站式农业服务平台,咨询热线</td>
                </tr>
                </tbody>
            </table>
        </div>
        <div id="hm_t_map" class="hm-t-map-card-map" style="width: 500px; height: 360px;"><iframe scrolling="no" frameborder="0" style="width: 100%; height: 100%;"></iframe></div>
        <div class="hm-t-map-card-map-link" style="width: 500px;"><img src="${ctxStatic}/img/bigMapIcon.jpg" data-bd-imgshare-binded="1"></div>
    </div>
    <div class="hm-t-side-arrow hm-t-map-card-side-arrow" style="display: none;"></div>

</div>


<!-- 忘记密码找回弹框 -->

<div id="editWindow" class="mini-window" title="找回密码" style="width:270px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">请输入所要找回密码的登录账户，请至少填写一项基本信息</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">账户类型：</td>
                <td style="width:150px;"><input type="radio" name="regid" value="1" checked="" id="gender_1" onclick="sw()"><label for="gender_1"> 用户</label>&nbsp;
                    &nbsp;<input type="radio" name="regid" value="2" id="gender_2" onclick="sw()"><label for="gender_1"  > 管理员</label></td>
            </tr>

            <tr>
                <td style="width:120px;">登录帐号：</td>
                <td style="width:150px;"><input name="loginname" id="loginname" class="mini-textbox" onenter="onKeyEnter" /></td>
            </tr>
            <tr>
                <td><input id="rankType" class="mini-combobox" style="width:80px;" textField="typeValue" valueField="typeId"
                       value="typeId" showNullItem="false" allowInput="false" onvaluechanged="search" valueFromSelect=“true”/></td>
                <td style="width:150px;"><input class="mini-textbox" id="content"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:getPwd()">找回</a>
                    <a class="Cancel_Button" href="javascript:cancel()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<div id="progressWindow" class="mini-window" title="正在找回。。。" style="width:270px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="pwdform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <div>
                <div id="p1" class="mini-progressbar" value="0" style="width: 100%"></div>

            </div>
        </table>
    </div>
</div>

<div id="pwdWindow" class="mini-window" title="找回成功！" style="width:270px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="pwdshow" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <div id="pwdtext">
               <td style="width:120px;">当前账户密码：</td>
                <td style="width:150px;"><input name="pwd" id="pwd" class="mini-textbox"  enabled="false" /></td>
            </div>
        </table>
    </div>
</div>

<div id="resultWindow" class="mini-window" title="找回失败！" style="width:270px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="show" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <div>
                <td style="width:120px;">找回失败：</td>
                <td style="width:150px;"><input name="result" id="result" class="mini-textbox" value="请正确填写信息" enabled="false" /></td>
            </div>
        </table>
    </div>
</div>


<script  type="text/javascript">
    mini.parse();
    $(function(){
        document.onkeydown = function(e){
            var ev = document.all ? window.event : e;
            if(ev.keyCode==13) {
                login();
            }
        }
        var jsonData = [{'typeId':'1','typeValue':'证件号码'},{'typeId':'2','typeValue':'手机号码'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');

        createCode();
    });

    //下拉框数据转换
    function sw(){
        var jsonData = null;
        var regid = $('input[name=regid]:checked').val();
        if(regid==1){
            jsonData = [{'typeId':'1','typeValue':'证件号码'},{'typeId':'2','typeValue':'手机号码'}];
        }else{
            jsonData = [{'typeId':'1','typeValue':'工号'},{'typeId':'2','typeValue':'手机号码'}];
        }
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');
    }

    //清除密码
    function clearPwd(){
        mini.get('password').setValue("");
    }


    //登录
    function login(){
        if(!checkYzm()){
            return;
        }
        var bar = mini.get("p1");
        bar.setValue(bar.getValue() + 10);
        var form = new mini.Form("#login-form");
        form.validate();
        if (form.isValid() == false) return;

        var username = mini.get('username').getValue();
        var password = mini.get('password').getValue();
        var cookietime = mini.get('cookietime').getValue();
        $.ajax({
            url : "${path}/logincheck/login?username=" +  username + "&password="+password+"&cookietime="+cookietime,
            type : "get",
            success : function(data) {
                if(data != null && data !=""){
                    if(data == "01"){
                        mini.alert("密码错误");
                        createCode();
                    }
                    if(data == "02"){
                        mini.alert("登录成功");

                        location.href="${path}/logincheck/index?username="+username;
                    }
                }else{
                    mini.alert("没有该用户，请注册！");
                }
            }
        });
    }

    //忘记密码弹框
    function newRow() {
        var editWindow = mini.get("editWindow");
        editWindow.show();
    }

    function cancel(){
        var editWindow = mini.get("editWindow");
        editWindow.hide();
    }

    //找回密码方法
    function getPwd(){
       var loginname = mini.get('loginname').getValue();
       var rank =  mini.get('rankType').getValue();
       var content =  mini.get('content').getValue();
        //进度条
        var progressWindow = mini.get("progressWindow");
        progressWindow.show();
        var pwdWindow = mini.get('pwdWindow');
        var resultWindow = mini.get("resultWindow");
        var regid = $('input[name=regid]:checked').val();
        var bar = mini.get('p1');

        $.ajax({
            url:"${path}/logincheck/getPwd",
            type:"get",
            data:{"loginname":loginname,"rank":rank,"content":content,"regid":regid},
            success : function(text){
                if(text!="00"){
                    if(bar.getValue()<=100) {
                        setInterval(function () {
                            bar.setValue(bar.getValue() + 10);
                        }, 500);
                    }
                        progressWindow.hide();
                        pwdWindow.show();
                        mini.get('pwd').setValue(text);
                }else{
                    if(bar.getValue()==50){
                    setInterval(function(){
                        bar.setValue(bar.getValue()+10);
                    },1500);
                    }
                    progressWindow.hide();
                    resultWindow.show();
                }
            }
        });
    }

    //产生验证码
    var code;
    function createCode()
    {
        code = "";
        var codeLength = 6; //验证码的长度
        var checkCode = document.getElementById("checkCode");
        var codeChars = new Array(0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
            'a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z',
            'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z'); //所有候选组成验证码的字符，当然也可以用中文的
        for(var i = 0; i < codeLength; i++)
        {
            var charNum = Math.floor(Math.random() * 52);
            code += codeChars[charNum];
        }
        if(checkCode)
        {
            checkCode.className = "code";
            checkCode.innerHTML = code;
        }
    }
    function checkYzm()
    {
        var inputCode=mini.get("yzm").getValue();
        if(inputCode.length <= 0)
        {
            mini.alert("请输入验证码！");
            return false;
        }
        else if(inputCode.toUpperCase() != code.toUpperCase())
        {
            mini.alert("验证码输入有误！");
            createCode();
        }else{
            return true;
        }
    }

</script>
</body>


</html>