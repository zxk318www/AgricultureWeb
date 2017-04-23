<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/2/22
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
            <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，<span class="f_red">客人</span> | <a href="${path}/logincheck/tologin">请登录</a>  | <a href="">忘记密码?</a></div>
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
                <div class="left_box">
                    <h2 style="color: #0B61A4;margin-left: 45%;margin-top: 50px">注册新用户</h2>
                    <div style="padding:20px 50px 20px 50px;">
                        <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                            <span class="f_b">
                    » 已经注册过了？请<a href="${path}/logincheck/tologin" class="b">点这里登录</a>&nbsp;
                     » 忘记了密码？请<a href="javascript:newRow()" class="b">点这里找回</a>&nbsp;
                </span>
                            <br>
                            <span class="f_gray">请认真、仔细地填写以下信息，严谨的个人信息有助于您获得别人的信任，结交潜在的商业伙伴，获取商业机会！<span class="f_red">*</span>为必填项</span>
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
                                        <input type="radio" name="regid" value="6" id="g_6" onclick="reg(1);" checked=""><label for="g_6"> 普通用户</label>&nbsp;&nbsp;&nbsp;&nbsp;
                                            <span>
                                        <input type="radio" name="regid" value="5" id="g_5" onclick="reg(0);"><label for="g_5"> 会员用户</label>
                                        </span>
                                    </td>
                                </tr>
                                </tbody>
                            </table>
                            <table cellpadding="5" cellspacing="5" width="100%">
                                <tbody>
                                <td class="tl">用户(会员)名 <span class="f_red">*</span></td>
                                <td width="220"><input type="text" class="mini-textbox" style="width:200px;" name="username" id="username"  required="true" requiredErrorText="登录名不能为空" onvalidation="check"
                                                       vtype="english;rangeLength:5,10;">
                                </td>
                                </tr>

                                <td class="tl">登录密码 <span class="f_red">*</span></td>
                                <td><input type="password" class="mini-password" style="width:200px;" name="password" id="password"
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
                                    <textarea  name="article.content1" class="kindeditor" tools="basic" style="width:10%;height: 310px"></textarea>
                                </div>

                            </table>
                            <div class="reg_title">个人信息</div>
                            <table cellpadding="5" cellspacing="5" width="100%">
                                <tbody>
                                <td class="tl">真实姓名 <span class="f_red">*</span></td>
                                <td width="220">
                                    <input type="text" class="mini-textbox" style="width:100px;" name="name" id="name" required="true" requiredErrorText="真实姓名不能为空" onvalidation="onChineseValidation">
                                    <input type="radio" name="sex" value="1" checked="" id="gender_1"><label for="gender_1"> 先生</label>
                                    <input type="radio" name="sex" value="2" id="gender_2"><label for="gender_2"> 女士</label>
                                    </tr>
                                </td>
                                <td class="tl">证件号码 <span class="f_red">*</span></td>
                                <td><input type="text" class="mini-textbox" style="width:200px;" name="idCard" id="idCard" required="true" requiredErrorText="证件号码不能为空" onvalidation="onIDCardsValidation"></td>

                                    </tr>
                                <td class="tl">年龄 </td>
                                <td><input type="text" class="mini-textbox" style="width:200px;" name="age" id="age"  vtype="range:18,100" ></td>

                                    </tr>


                                <td class="tl">手机号码 <span class="f_red">*</span></td>
                                <td><input type="text" class="mini-textbox" style="width:200px;" name="moblie" id="moblie" required="true" requiredErrorText="手机号码不能为空" onvalidation="phoneValidation"></td>
                                <td>
                                    <span id="dmobile" class="f_red"></span>&nbsp;
                                </td>
                                </tr>

                                <td class="tl">座机号码 </td>
                                <td><input type="text" class="mini-textbox" style="width:200px;" name="phone" id="phone" ></td>

                                </tr>

                                <td class="tl">收件地址 <span class="f_red">*</span></td>
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
                            <td width="300"><input name="button" value="同意以下服务条款，注册" class="reg_Bt" onclick="sigin()"></td>
                            <td>&nbsp;</td>
                        </tr>
                        </tbody>
                    </table>
                    </form>
                    <br>
                    <div style="width:700px;height:100px;overflow-y:scroll;border:#9DBFDA 1px solid;background:#FAFAFA;margin:auto;line-height:180%;padding:10px;" id="agreement">
                        <center class="px14 f_b">请阅读本站服务条款</center>
                        欢迎阅读种立方服务条款协议(下称“本协议”)。本协议阐述之条款和条件适用于您使用种立方所提供的在企业间(B-TO-B)电子市场中进行贸易和交流的各种工具和服务(下称“服务”)。 <br> 1. 接受条款。<br> 以任何方式进入种立方网站即表示您同意自己已经与种立方订立本协议，且您将受本协议的条款和条件(“条款”) 约束。种立方可随时自行全权决定更改“条款”。如“条款”有任何变更，种立方将在其网站上刊载公告，通知予您。如您不同意相关变更，必须停止使用“服务”。经修订的“条款”一经在种立方网站的公布后，立即自动生效。您应在第一次登录后仔细阅读修订后的“条款”，并有权选择停止继续使用“服务”；一旦您继续使用“服务”，则表示您已接受经修订的“条款”，当您与种立方发生争议时，应以最新的服务协议为准。除另行明确声明外，任何使“服务”范围扩大或功能增强的新内容均受本协议约束。除非经种立方的授权高层管理人员签订书面协议，本协议不得另行作出修订。<br><br> 2.谁可使用种立方网站？ <br> “服务”仅供能够根据相关法律订立具有法律约束力的合约的个人或公司使用。因此，您的年龄必须在十八周岁或以上，才可使用本公司服务。如不符合本项条件，请勿使用“服务”。种立方可随时自行全权决定拒绝向任何人士提供“服务”。“服务”不会提供给被暂时或永久中止资格的种立方会员。 <br><br> 3. 收费。<br> 本公司保留在根据第1条通知您后，收取“服务”费用的权利。您因进行交易、向本公司获取有偿服务或接触本公司服务器而发生的所有应纳税赋，以及相关硬件、软件、通讯、网络服务及其他方面的费用均由您自行承担。本公司保留在无须发出书面通知，仅在种立方网站公示的情况下，暂时或永久地更改或停止部分或全部“服务”的权利。
                        <br><br> 4.种立方网站仅作为交易地点。 <br> 本公司网站仅作为用户物色交易对象，就货物和服务的交易进行协商，以及获取各类与贸易相关的服务的地点。但是，本公司不能控制交易所涉及的物品的质量、安全或合法性，商贸信息的真实性或准确性，以及交易方履行其在贸易协议项下的各项义务的能力。本公司不能也不会控制交易各方能否履行协议义务。此外，您应注意到，与外国国民、未成年人或以欺诈手段行事的人进行交易的风险是客观存在的。 <br><br> 5.您的资料和供买卖的物品。 <br> “您的资料”包括您在注册、交易或列举物品过程中、在任何公开信息场合或通过任何电子邮件形式，向本公司或其他用户提供的任何资料，包括数据、文本、软件、音乐、声响、照片、图画、影像、词句或其他材料。您应对“您的资料”负全部责任，而本公司仅作为您在网上发布和刊登“您的资料”的被动渠道。但是，倘若本公司认为“您的资料”可能使本公司承担任何法律或道义上的责任，或可能使本公司 (全部或部分地) 失去本公司的互联网服务供应商或其他供应商的服务，或您未在种立方规定的期限内登录或再次登录网站，则本公司可自行全权决定对“您的资料”采取本公司认为必要或适当的任何行动，包括但不限于删除该类资料。您特此保证，您对提交给种立方的“您的资料”拥有全部权利，包括全部版权。您确认，种立方没有责任去认定或决定您提交给本公司的资料哪些是应当受到保护的，对享有“服务”的其他用户使用“您的资料”，本公司也不必负责。 <br><br> 5.1 注册义务。 <br> 如您在种立方网站注册，您同意：
                        <br> (a) 根根据种立方网站刊载的会员资料表格的要求，提供关于您或贵公司的真实、准确、完整和反映当前情况的资料；<br> (b) 维持并及时更新会员资料，使其保持真实、准确、完整和反映当前情况。倘若您提供任何不真实、不准确、不完整或不能反映当前情况的资料，或种立方有合理理由怀疑该等资料不真实、不准确、不完整或不能反映当前情况，种立方有权暂停或终止您的注册身份及资料，并拒绝您在目前或将来对“服务”(或其任何部份) 以任何形式使用。如您代表一家公司或其他法律主体在本公司登记，则您声明和保证，您有权使该公司或其他法律主体受本协议“条款”约束。 <br><br> 5.2 会员注册名、密码和保密。 <br> 在登记过程中，您将选择会员注册名和密码。您须自行负责对您的会员注册名和密码保密，且须对您在会员注册名和密码下发生的所有活动承担责任。您同意：
                        <br> (a) 如发现任何人未经授权使用您的会员注册名或密码，或发生违反保密规定的任何其他情况，您会立即通知种立方；<br> (b) 确保您在每个上网时段结束时，以正确步骤离开网站。种立方不能也不会对因您未能遵守本款规定而发生的任何损失或损毁负责。 <br><br> 5.3 关于您的资料的规则。<br> 您同意，“您的资料”和您供在种立方网站上交易的任何“物品”（泛指一切可供依法交易的、有形的或无形的、以各种形态存在的某种具体的物品，或某种权利或利益，或某种票据或证券，或某种服务或行为。本协议中“物品”一词均含此义） <br><br> a. 不会有欺诈成份，与售卖伪造或盗窃无涉； <br> b. 不会侵犯任何第三者对该物品享有的物权，或版权、专利、商标、商业秘密或其他知识产权，或隐私权、名誉权； <br> c. 不会违反任何法律、法规、条例或规章 (包括但不限于关于规范出口管理、贸易配额、保护消费者、不正当竞争或虚假广告的法律、法规、条例或规章)；<br> d. 不会含有诽谤（包括商业诽谤）、非法恐吓或非法骚扰的内容；<br> e. 不会含有淫秽、或包含任何儿童色情内容； <br> f. 不会含有蓄意毁坏、恶意干扰、秘密地截取或侵占任何系统、数据或个人资料的任何病毒、伪装破坏程序、电脑蠕虫、定时程序炸弹或其他电脑程序； <br> g. 不会直接或间接与下述各项货物或服务连接，或包含对下述各项货物或服务的描述：<br>

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
                <td style="width:150px;"><input type="radio" name="regids" value="1" checked="" id="genders_1" onclick="sw()"><label for="gender_1"> 用户</label>&nbsp;
                    &nbsp;<input type="radio" name="regids" value="2" id="genders_2" onclick="sw()"><label for="gender_1"  > 管理员</label></td>
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
            var jsonData = [{'typeId':'1','typeValue':'证件号码'},{'typeId':'2','typeValue':'手机号码'}];
            mini.get('rankType').setData(jsonData);
            mini.get('rankType').setValue('1');
        });

        //下拉框数据转换
        function sw(){
            var jsonData = null;
            var regid = $('input[name=regids]:checked').val();
            if(regid==1){
                jsonData = [{'typeId':'1','typeValue':'证件号码'},{'typeId':'2','typeValue':'手机号码'}];
            }else{
                jsonData = [{'typeId':'1','typeValue':'工号'},{'typeId':'2','typeValue':'手机号码'}];
            }
            mini.get('rankType').setData(jsonData);
            mini.get('rankType').setValue('1');
        }


        //校验两次密码一致性
        function checkpwd(e){
            var password = mini.get('password').getValue();
            if(e.value != password){
                if(e.isValid){
                    e.errorText = "两次密码不一致，请重新输入";
                    e.isValid = false;
                }
            }
        }

        function  sigin(){
            var username = mini.get('username').getValue();
            var form = new mini.Form("#sigin-form");
            form.validate();
            if (form.isValid() == false) return;
            var regid = $('input[name=regid]:checked').val();
            var sex = $('input[name=sex]:checked').val();
            var data = form.getData();      //获取表单多个控件的数据
            var json = mini.encode(data);   //序列化成JSON
            var img = editor.html();
            $.ajax({
                url: "${path}/logincheck/checksigin?regid="+regid+"&sex="+sex,
                type: "post",
                data: { "submitData": json ,"img":img},
                success: function (text) {

                       if(text == "01"){

                           mini.confirm("注册成功！是否现在登录？",'提示',function(opr){
                               if(opr == 'ok'){
                                   location.href="${path}/logincheck/tologin?username="+username;
                               }
                           });
                       }else{
                           mini.alert(text);
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
                height:300,
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
            var regid = $('input[name=regids]:checked').val();
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

        /*自定义vtype*/
        mini.VTypes["englishErrorText"] = "请输入英文或数字";
        mini.VTypes["english"] = function (v) {
            var re = new RegExp("^[0-9a-zA-Z\_]+$");
            if (re.test(v)) return true;
            return false;
        }

        //只能输入中文
        function onChineseValidation(e) {
            if (e.isValid) {
                if (isChinese(e.value) == false) {
                    e.errorText = "必须输入中文";
                    e.isValid = false;
                }else{
                    e.isValid = true;
                }
            }
        }

        /* 是否汉字 */
        function isChinese(v) {
            var re = new RegExp("^[\u4e00-\u9fa5]+$");
            if (re.test(v)) return true;
            return false;
        }

        //页面身份证正则表达表验证
        function onIDCardsValidation(e) {
            if (e.isValid) {
                var pattern = /\d*/;
                if (e.value.length < 15 || e.value.length > 18 || pattern.test(e.value) == false) {
                    e.errorText = "必须输入15~18位数字";
                    e.isValid = false;
                }
            }
        }

        //页面手机号码验证
        function phoneValidation(e){
            if (e.isValid) {
                var pattern = /\d*/;
                if (e.value.length < 11 || e.value.length > 13 || pattern.test(e.value) == false) {
                    e.errorText = "必须输入11~13位数字";
                    e.isValid = false;
                }
            }
        }
    </script>
</html>