<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/2/24
  Time: 15:34
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

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/themes/default/default.css" />

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.css" />

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/kindeditor.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/lang/zh_CN.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.js"></script>
</head>
<style type="text/css">
    .tl {
        width: 150px;
        text-align: right;
        padding-right: 20px;
    }

    .reg_title {
        border-bottom: #CCCCCC 1px solid;
        font-weight: bold;
        padding: 0 0 10px 10px;
        margin: 15px 55px 0 55px;
        font-size: 14px;
        color: #FF6600;
    }

    .reg_inp {
        border: #7F9DB9 1px solid;
        padding: 3px 0 3px 0;
    }

    .tips div {
        line-height: 22px;
        padding: 8px 10px 8px 35px;
    }

    .f_b {
        font-weight: bold;
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
        <div class="sz_fr" id="destoon_member">欢迎，<span class="f_red">客人</span> | <a href="${path}/logincheck/tologin">请登录</a>  | <a href="">忘记密码?</a></div>
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
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <h2 style="color: #0B61A4;margin-left: 45%;margin-top: 50px">管理员登记</h2>
                <div style="padding:20px 50px 20px 50px;">
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <br>
                        <span class="f_gray">请认真、仔细地填写以下信息！&nbsp;&nbsp; <span class="f_red">*</span>为必填项</span>
                    </div>
                    <br>
                    <form  id="sigin-form" >
                        <input name="action" type="hidden" id="action" value="8ba062ed3a5729960aa263b9b85a0aeb">
                        <input name="forward" type="hidden" value="http://www.zlf168.com/">
                        <div class="reg_title">帐户信息</div>
                        <table cellpadding="5" cellspacing="5" width="100%">
                            <tbody>
                            <tr>
                                <td class="tl">用户类型 <span class="f_red">*</span></td>
                                <td>
                                    <span>
                                          <a style="color: #0000aa ;font-size: large;font-style: italic">管理员</a>
                                    </span>
                                </td>

                            </tr>
                            </tbody>
                        </table>
                        <table cellpadding="5" cellspacing="5" width="100%">
                            <tbody>
                            <td class="tl">工号：</td>
                            <td><input type="password" class="mini-textbox" style="width:200px;" name="gh" id="gh" enabled="false"></td>
                            <td><a class="mini-button" id="ghspan"  id="ghspan"  plain="false" style="color: #9a161a" >工号请妥善保管！</a></td>
                            </tr>
                            <td class="tl">管理员登录名 <span class="f_red">*</span></td>
                            <td width="220"><input type="text" class="mini-textbox" style="width:200px;" name="uname" id="uname"  required="true" requiredErrorText="登录名不能为空" onvalidation="check" >
                            </td>
                            </tr>
                            <td class="tl">登录密码 <span class="f_red">*</span></td>
                            <td><input type="password" class="mini-password" style="width:200px;" name="pwd" id="pwd"
                                       required="true" requiredErrorText="登录密码不能为空"  vtype="minLength:5" minLengthErrorText="密码不能少于5个字符"></td>
                            <td>

                                <span id="dpassword" class="f_red"></span>&nbsp;
                            </td>
                            </tr>

                            <td class="tl">重复输入密码 <span class="f_red">*</span></td>
                            <td><input type="password" class="mini-password" style="width:200px;" size="30" name="post[cpassword]" id="cpassword"
                                       required="true" requiredErrorText="重复密码不能为空" vtype="minLength:5" minLengthErrorText="密码不能少于5个字符" onvalidation="checkpwd"></td>
                            <td>
                            </td>
                            </tr>
                            </tbody>
                        </table>
                        <table cellpadding="5" cellspacing="5" width="100%" >
                            <div style="margin-left: 180px">
                                上传头像
                                <textarea  name="article.content1" class="kindeditor" tools="basic" style="width:10%;height: 200px"></textarea>
                            </div>

                        </table>
                        <div class="reg_title">个人信息</div>
                        <table cellpadding="5" cellspacing="5" width="100%">
                            <tbody>
                            <td class="tl">真实姓名 <span class="f_red">*</span></td>
                            <td width="220">
                                <input type="text" class="mini-textbox" style="width:100px;" name="name" id="name" required="true" requiredErrorText="真实姓名不能为空">
                                <input type="radio" name="sex" value="1" checked="" id="gender_1"><label for="gender_1"> 先生</label>
                                <input type="radio" name="sex" value="2" id="gender_2"><label for="gender_2"> 女士</label>
                                </tr>
                            </td>


                            <td class="tl">手机号码 <span class="f_red">*</span></td>
                            <td><input type="text" class="mini-textbox" style="width:200px;" name="phone" id="phone" required="true" requiredErrorText="手机号码不能为空" onvalidation="check"></td>
                            <td>
                                <span id="dmobile" class="f_red"></span>&nbsp;
                            </td>
                            </tr>


                            <td class="tl">联系地址 <span class="f_red">*</span></td>
                            <td><input type="text" class="mini-textbox" style="width:200px;" name="address" id="address" required="true" requiredErrorText="收件地址不能为空"></td>
                            <td>

                                <span id="addressspan" class="f_red"></span>&nbsp;
                            </td>
                            </tr>
                            </tbody>
                        </table>

                        </tr>
                        </tbody>
                        </table>
                    </form>

                    <table cellpadding="5" cellspacing="5" width="100%">
                        <tbody>
                        <td>
                            <span id="dcaptcha" class="f_red"></span>&nbsp;
                        </td>
                        </tr>
                        <tr>
                            <td class="tl">&nbsp;</td>
                            <td width="200"><input name="button" value="注册管理员" class="reg_Bt" onclick="sigin()" style="width: 180px;" ></td>
                            <td>&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                    <br>
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

<script  type="text/javascript">
    mini.parse();
    $(function(){
        mini.get('ghspan').hide();

    });
    //校验两次密码一致性
    function checkpwd(e){
        var password = mini.get('pwd').getValue();
        if(e.value != password){
            if(e.isValid){
                e.errorText = "两次密码不一致，请重新输入";
                e.isValid = false;
            }
        }
    }

    function  sigin(){
        var username = mini.get('uname').getValue();
        var form = new mini.Form("#sigin-form");
        form.validate();
        if (form.isValid() == false) return;
        var data = form.getData();      //获取表单多个控件的数据
        var json = mini.encode(data);   //序列化成JSON
        var img = editor.html();
        $.ajax({
            url: "${path}/logincheck/checkAdminsigin",
            type: "post",
            data: { "submitData": json,"img":img },
            async:true,
            success: function (text) {
                if(text != "01"){
                    mini.get('gh').setValue(text);
                    mini.get('ghspan').show();
                    mini.confirm("注册成功！是否现在登录？ 当前注册管理员工号为："+text+"。请妥善保管该工号！",'提示',function(opr){
                        if(opr == 'ok'){
                            location.href="${path}/logincheck/tologin?username="+username;
                        }
                    });
                }else{
                    mini.alert("当前管理员已登记！");
                }


            }
        });
    }

    function check(e){
        var data = e.value;
        var btn = $(this).attr("name");

        $.ajax({
            url:"${path}/logincheck/checkname",
            type:"post",
            data:{"data":data,"btn":btn},
            success:function(text){
                if(text!=null && text!=""){
                    mini.alert(text);
                    mini.get(btn).setValue("");
                }
            }
        });
    }

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
            height:100,
            width:"50%",
            items: [
                'image']
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


</script>
</html>