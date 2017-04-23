<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/2
  Time: 9:26
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
            <c:if test="${admininfo!=null}">${img} ${admininfo.name}</c:if> <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
<div class="sz_contentBg" >
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">

                <c:if test="${admininfo eq null && userinfo.id ne '11111'}"><a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a></c:if>
                <c:if test="${admininfo ne null }"><a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toAdminIndex">返回个人中心</a></c:if>

                <!--标题 -->
                <h2 style="color: #0B61A4;text-align: center;margin-top: 50px">查看【&nbsp;${title}&nbsp;】帖子</h2>
                <div style="padding:20px 50px 20px 50px;">
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;"></div>
                    <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
                    <br>
                    <table>
                        <tr>
                            <td style="width:120px;"><div style="font-weight: bold;font-size: 15px">帖子标题:</div></td>
                            <td style="width:180px;margin-left: 50px"><div style="font-style: italic;font-size:18px ">${title}</div></td>
                            <td style="width:120px;margin-left: 80px"><div style="font-weight: bold;font-size: 15px">帖子浏览数:</div></td>
                            <td style="width:120px;margin-left: 50px"><div style="font-style: italic;font-size:18px ">${num}</div></td>
                            <td style="width:120px;margin-left: 30px"><div style="font-weight: bold;font-size: 15px">发帖人:</div></td>
                            <td style="width:120px;margin-left: 30px"><div style="font-style: italic;font-size:18px ">${uname}</div></td>
                            <td style="width:120px;margin-left: 30px"><div style="font-weight: bold;font-size: 15px">发帖时间:</div></td>
                            <td style="width:180px;margin-left: 30px"><div style="font-style: italic;font-size:15px ">${postdate}</div></td>
                        </tr>
                    </table>
                    <div style="background:#FAFAFA;padding:10px 20px;line-height:24px;"></div>
                    <hr style="height:10px;border:none;border-top:10px groove skyblue;" />
                    <table style="border-bottom: 1px solid slategrey">
                        <tr>
                          <td style="border-right:1px solid slategrey ; width: 5%"><div style="width: 100px;height: auto">
                              <h2>内容</h2>
                          </div></td>
                            <td style="margin-left: 15px;height: 100%;width: 95%"><span style="margin-left: 20px;font-size: 15px">${content}</span></td>
                        </tr>
                    </table>
                    <table style="border-top:  2px solid slategrey;width: 100%">
                        <tr style="width:100%;">

                            <td style="width:95%;"></td>
                            <td style="width: 5%"> <a style="margin-right: 0px;font-size: 18px;font-style: oblique;color: #0000aa" href="javascript:void(0);" onclick="naver('text')">
                                <strong>回复</strong></a></td>

                        </tr>
                    </table>
                   <div id="mainContent">
                    <hr style="height:10px;border:none;border-top:10px groove skyblue;margin-top: 3px" />
                    <c:forEach items="${msglist }" var="msg">
                        <hr style="height:1px;border:none;border-top:1px dashed #0066CC;" />
                        <br>
                        <p style="margin-top: 15px;border-top:  3px solid slategrey;" dateFormat="yyyy-MM-dd HH:mm"> 回复时间:&nbsp;${msg.createDateStr} &nbsp;&nbsp;   ${msg.loustr}</p>

                        <table style="border-bottom: 3px solid slategrey;border-top:  1px solid slategrey;width: 100%;height:100px;">
                            <tr >
                                <td style="border-right:1px solid slategrey ;width: 5%">
                                    <div style="width: 100px;height: auto" >
                                    ${msg.msgphoto}<br>
                                        <c:if test="${msg.hy eq 1}"><span style="color: red">会员用户: </span><br></c:if>
                                        <c:if test="${msg.hy eq 0}">用户:<br></c:if>
                                        <span style="margin-left: 10px">${msg.uname}</span>

                                </div></td>
                                <td style="width: 95%;background: ghostwhite" id="txta" ><div class="send" style="margin-left: 10px" >${msg.msg}</div></td>

                            </tr>
                        </table>
                    </c:forEach>
                    <hr style="height:10px;border:none;border-top:10px groove skyblue;margin-top: 3px;margin-bottom: 10px" />


                </div>
                <div style="text-align: center;margin-top: 10px;margin-bottom: 20px;margin-left: 35%">
                    <ul class="test_ul">
                        <li><a href="${path}/Tiezicheck/gettiezi?id=${id }&op=1&pageIndex=0&pageSize=20">&#171; --首页--&nbsp;&nbsp;</a></li>
                        <li><a href="javascript:" onclick="page(${pageIndex},${pageSize},'pre');">上一页--&nbsp;&nbsp;</a></li>
                        <li><a >第${pageIndex+1}页</a></li>
                        <li><a href="javascript:" onclick="page(${pageIndex},${pageSize},'next');">&nbsp;&nbsp;--下一页 </a></li>
                        <li><a href="${path}/Tiezicheck/gettiezi?id=${id }&op=1&pageIndex=${totalpages-1}&pageSize=20">&nbsp;&nbsp;--尾页-- &#187; </a></li>
                    </ul><br>

                </div>
                <p style="margin-left: 38%;margin-bottom: 50px">--每页显示 ${pageSize}条--共${totalgoods}条回复信息-- </p>
            </div>

                    <div id="text" style="margin-top: 10px;">
                        <input  value="刷新" class="mini-button"  iconCls="icon-reload" onclick="refresh();"/>
                        <span><-在提交回复前请刷新页面</span>

                    <textarea  name="article.content1" class="kindeditor" tools="basic" style="width:100%;"></textarea>


                            <div style="text-align:center;padding:8px;">
                                <input id="bc" type="button" class="mini-button-success" value="回复" onclick="save();"/>
                                <input type="button" class="mini-button-warning" value="取消" style="margin-left: 25px" onclick="cancel()"/>
                            </div>

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




</body>

<script charset="utf-8" type="text/javascript">
    $(function(){
        //返回顶部
        var oTop = document.getElementById("to_top");
        var screenw = document.documentElement.clientWidth || document.body.clientWidth;
        var screenh = document.documentElement.clientHeight || document.body.clientHeight;
        oTop.style.left = screenw - oTop.offsetWidth +"px";
        oTop.style.top = screenh - oTop.offsetHeight + "px";
        window.onscroll = function(){
            var scrolltop = document.documentElement.scrollTop || document.body.scrollTop;
            oTop.style.top = screenh - oTop.offsetHeight + scrolltop +"px";
        }

        oTop.onclick = function(){
            document.documentElement.scrollTop = document.body.scrollTop =0;
        }
        <c:if test="${admininfo eq null}">
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }</c:if>
        <c:if test="${admininfo ne null}">
        var ms = '${admininfo.id}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }

        </c:if>

    });
    var editor = null;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="article.content1"]', {
            resizeType : 1,//只支持纵向拉伸
            uploadJson : '${ctxStatic}/kindeditor-4.1.7/jsp/upload_json.jsp',
            fileManagerJson : '${ctxStatic}/kindeditor-4.1.7/jsp/file_manager_json.jsp',
            allowFileManager : true, //允许管理上传文件
            allowImageUpload: true,//允许图片上传
            HtmlEncode:true,
            afterUpload:function(){this.sync();},//图片上传后，内容同步到textarea
            afterBlur:function(){this.sync();},// 失去焦点后，将上传的图片同步到textarea
            items : [
                'fontname','fontsize', '|','forecolor', 'hilitecolor','bold', 'italic','underline',
                'removeformat','|', 'justifyleft','justifycenter', 'justifyright','insertorderedlist',
                'insertunorderedlist','|', 'emoticons','link','media','|','image','baidumap']
        });

        prettyPrint();
    });

    function showWindow() {
        mini.get("win1").show();
    }

    function save() {
        <c:if test="${userinfo.id ne '11111'}">
        var text = editor.html();
        if(text==null ||text == ""){
            mini.alert("请输入内容！");
            return;
        }
        var noteid = '${noteid}';
        var uid = '${userinfo.uid}';
        $.ajax({
            url:"${path}/Tiezicheck/saveMsg",
            data:{"msg":text,"noteid":noteid,"uid":uid},
            type: 'post',
            scriptCharset: 'utf-8',
            async:false,
            beforeSend  : function(){$('#bc').prop('disabled',"true");location.reload();},
            complete:function(){$('#bc').prop('disabled',"false");},
            success : function(text){
                if (text =="ok"){
                    mini.alert("回复成功！");
                    location.reload();
                }
            }

        });
        //游客提醒！
        </c:if>
        <c:if test="${userinfo.id eq '11111'}">
            mini.confirm("您还未注册，是否现在注册？","注册提示",function(btn){
                if (btn=="ok"){
                    location.href="${path}/logincheck/sigin";
                }
            });

        </c:if>

    }

    //锚点定位
    function naver(id){
        var obj = document.getElementById(id);
        var oPos = obj.offsetTop;
        return window.scrollTo(0, oPos-36);
    }
    //取消操作
    function cancel(){
        editor.html("");
    }

    function refresh(){
        location.reload();
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


    //分页浏览
    function page(pageIndex,pageSize,key){
        var id = '${id}';
        var pages = '${totalpages}';
        if(pageIndex<=pages && pageIndex >0){
            if(key == "pre"){
                location.href="${path}/Tiezicheck/gettiezi?id="+id+"&op=1&pageIndex="+(pageIndex-1)+"&pageSize="+pageSize;
            }
        }
        if(pageIndex<pages-1 && pageIndex >=0){
            if(key == "next"){
                location.href="${path}/Tiezicheck/gettiezi?id="+id+"&op=1&pageIndex="+(pageIndex+1)+"&pageSize="+pageSize;
            }
        }

    }
</script>
</html>
