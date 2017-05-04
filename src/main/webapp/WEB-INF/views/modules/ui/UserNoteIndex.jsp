<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/6
  Time: 12:52
  To change this template use File | Settings | File Templates.
  用户个人帖子中心
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <script src="${ctxStatic}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/miniui/miniui.js"type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/boot.js"type="text/javascript"></script>
    <script src="${ctxStatic}/js/nl.js"type="text/javascript" charset="utf-8"></script>
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

    ul{
        list-style:none;
    }
    .test_ul li{
        float:left;
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
<div class="sz_contentBg">
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                <h2 style="color: #0B61A4;text-align: center;margin-top: 50px">个人帖子中心</h2>
                <div style="padding:20px 50px 20px 50px;">

                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div >
                            <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                                 showCollapseButton="true"  collapseOnTitleClick="true" title="我的帖子" >
                                <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                    <table style="width:100%;">
                                        <tr>
                                            <td style="width:100%;">
                                                <a class="mini-button" iconCls="icon-add" onclick="add()">新增</a>
                                                <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                                            </td>
                                            <td style="white-space:nowrap;">
                                                <input id="rankType" class="mini-combobox" style="width:80px;" textField="typeValue" valueField="typeId"
                                                       value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                                <input id="key" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                                <a class="mini-button" onclick="search()">查询</a>
                                            </td>
                                        </tr>
                                    </table>
                                </div>

                            <div id="datagrid1" class="mini-datagrid" style="height:300px;"
                                            url="${path}/Tiezicheck/findUserNote"  idField="id" allowResize="true">
                                <div property="columns">
                                    <div type="indexcolumn" ></div>
                                    <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderers" cellStyle="padding:0;" >操作</div>
                                    <div field="type" width="120" headerAlign="center" align="center" >帖子类型</div>
                                    <div field="stateStr" width="120" headerAlign="center" align="center" >帖子状态</div>
                                    <div field="title" width="120" headerAlign="center"  showCellTip="false" align="center">标题</div>
                                    <div field="content" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">大致内容</div>
                                    <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">浏览数</div>
                                    <div field="postdate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">发帖日期</div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                         showCollapseButton="true"  collapseOnTitleClick="true" title="我的回复信息" >
                        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                            <table style="width:100%;">
                                <tr>
                                    <td style="white-space:nowrap;">
                                        <input id="rankType2" class="mini-combobox" style="width:120px;" textField="typeValue" valueField="typeId"
                                               value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                        <input id="key2" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                        <a class="mini-button" onclick="searchs()">查询</a>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="datagrid2" class="mini-datagrid" style="height:300px;"
                             url="${path}/Tiezicheck/findUserMsg"  idField="id" allowResize="true">
                            <div property="columns">
                                <div type="indexcolumn" ></div>
                                <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
                                <div field="noteName" width="120" headerAlign="center" align="center" >回复帖子标题</div>
                                <div field="loustr" width="120" headerAlign="center" align="center">回复楼层</div>
                                <div field="msg" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">回复内容</div>
                                <div field="createDate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">回复日期</div>
                            </div>
                        </div>
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
</html>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
    grid.load();
    var grid2 = mini.get("datagrid2");
    grid2.load();
    $(function(){
        var jsonData = [{'typeId':'1','typeValue':'帖子类型'},{'typeId':'2','typeValue':'帖子标题'},{'typeId':'3','typeValue':'帖子内容'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');

        var jsonDatas = [{'typeId':'2','typeValue':'回复内容'}];
        mini.get('rankType2').setData(jsonDatas);
        mini.get('rankType2').setValue('2');

        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
    });

    //我的帖子操作
    function onActionRenderers(e){
        return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看&nbsp;&nbsp;</a>'+'<a href="javascript:edit()" style="color: orangered">&nbsp;&nbsp;编辑</a></span>';
    }

    //我的回复操作
    function onActionRenderer(e){
        return '<span class="f_b f_orange"><a href="javascript:showMsg()" style="color: #0b93d9">查看&nbsp;&nbsp;</a>'+'<a href="javascript:removeMsg()" style="color: orangered">&nbsp;&nbsp;删除</a></span>';
    }
    //我的帖子查询
    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
    }

    //我的回复查询
    function searchs() {
        var rankType = mini.get('rankType2').getValue();
        var key = mini.get("key2").getValue();
        grid2.load({key: key,rankType:rankType});
    }

    function show(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的帖子！");
            return;
        }
        location.href="${path}/Tiezicheck/gettiezi?id="+id+"&pageIndex=0&pageSize=20";
    }

    function edit(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要编辑的帖子！");
            return;
        }
        location.href="${path}/Tiezicheck/toUpdateNote?id="+id;
    }

    function add(){
        location.href="${path}/Tiezicheck/toAddTiezi";
    }

    function remove(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的帖子！");
            return;
        }
        $.ajax({
            url:"${path}/Tiezicheck/removeNote",
            data:{"id":id},
            type:"get",
            async:false,
            success : function(text){
                if(text == "ok"){
                    mini.alert("删除成功！");
                    location.reload();
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

    //查看回复信息
    function showMsg() {
        var row = mini.get("datagrid2").getSelected();
        if(row){
            var id = row.noteid;
        }else{
            mini.alert("请选择要查看的回复信息！");
            return;
        }
        location.href="${path}/Tiezicheck/gettiezi?id="+id+"&pageIndex=0&pageSize=20";
    }

    //删除回复信息
    function removeMsg() {
        var row = mini.get("datagrid2").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的回复信息！");
            return;
        }
        mini.confirm("回复信息删除后无法还原，您确定要删除吗？","提示",function(btn) {
            if(btn =="ok"){
                $.ajax({
                    url:"${path}/Tiezicheck/removUserMsg",
                    data:{"id":id},
                    async:false,
                    type:"post",
                    success:function (text) {
                        if (text == "ok"){
                            mini.alert("操作成功！");
                            location.reload();
                        }
                    }
                });
            }
        });

    }

    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);
</script>