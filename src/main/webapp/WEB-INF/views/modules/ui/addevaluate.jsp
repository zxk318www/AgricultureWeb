<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/21
  Time: 23:04
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
<div class="sz_contentBg" >
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                <div style="padding:20px 50px 20px 50px;height: auto">
                    <h1 style="margin-left: 32%;margin-top: 30px">新增商品【${goods.name}】评价</h1>
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
                                            <span class="f_b f_orange" >${goods.price}&nbsp;<c:if test="${goods.type eq '0' || goods.type eq '1'}">元/斤</c:if>
                                        <c:if test="${goods.type eq '2' }">元/株</c:if><c:if test="${goods.type eq '3' }">个</c:if></span>
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
                         showCollapseButton="true"  collapseOnTitleClick="true" title="商品评价">
                        <div style="background:#FAFAFA;padding:10px 2px 10px 2px;line-height:24px;">

                        </div >

                        <hr style="border:none;border-top:4px groove skyblue;" /><br>
                        <span style="" class="f_b f_orange">请给商品打分（1-5星，5星最优）</span>
                        <div style="margin-left: 80px">
                            <p class="all">
                                <input type="radio" name="b" value="0" checked="checked" />
                                <span>★</span>
                                <input type="radio" name="b" value="1" />
                                <span>★</span>
                                <input type="radio" name="b" value="2" />
                                <span>★</span>
                                <input type="radio" name="b" value="3" />
                                <span>★</span>
                                <input type="radio" name="b" value="4" />
                                <span>★</span>
                                <input type="radio" name="b" value="5" />
                                <span>★</span>
                            </p>
                        </div>
                        <span style="" class="f_b f_orange">请给商品评价，您的评价对于其他用户购买具有参考意义，请认真填写</span>
                        <textarea  name="article.content1" class="kindeditor" tools="basic" style="width:100%;height: 200px"></textarea></div>
                    </div>
                    <div style="margin-top: 50px"><td colspan="2" ><button style="margin-left: 40%;margin-bottom: 10px;" class="c_bt" onclick="yes()">确定</button>
                        <button style="margin-left: 30px;margin-bottom: 10px;" class="c_bt" onclick="cancel()">取消</button></td></div>

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
    mini.parse();
    $(function(){
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }

    });

    var editor = null;
    KindEditor.ready(function(K) {
        editor = K.create('textarea[name="article.content1"]', {
            resizeType : 1,//只支持纵向拉伸
            uploadJson : '${ctxStatic}/kindeditor-4.1.7/jsp/upload_json.jsp',
            fileManagerJson : '${ctxStatic}/kindeditor-4.1.7/jsp/file_manager_json.jsp',
            allowFileManager : true, //允许管理上传文件
            allowImageUpload: true,//允许图片上传
            imageUploadLimit : 10,//批量上传图片同时上传最多个数
            afterUpload:function(){this.sync();},//图片上传后，内容同步到textarea
            afterBlur:function(){this.sync();}, // 失去焦点后，将上传的图片同步到textarea
            items: [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons', 'image', 'link']
        });
        K('#chooseImage').click(function () {
            editor.loadPlugin('image', function () {
                editor.plugin.imageDialog({
                    showRemote: false,
                    imageUrl: K('#PicUrl').val(),
                    clickFn: function (url, message, error) {
                        alert("上传成功!");
                        K("#imgbox").attr("src", url);
                        K("#imgbox").show();
                        editor.hideDialog();
                    }
                });
            });
        });
        prettyPrint();
    });


    function yes(){
        var b = $("input[name='b']:checked").val();;
        var text = editor.html();
        var goodsid = '${goods.id}';
        var orderid = '${order.id}';
        $.ajax({
            url:"${path}/Goodscheck/addEvaluate",
            data:{"pf":b,"pj":text,"goodsid":goodsid,"orderid":orderid},
            type:"post",
            scriptCharset: 'utf-8',
            async:false,
            success: function (text) {
                if(text=="ok"){
                    mini.alert("评价商品已成功！");
                }
            }
                
        });
    }

    function cancel(){
        editor.html("");
    }
</script>
</html>

