<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/27
  Time: 10:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="refresh" content="900">
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
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，${img} ${admininfo.name} <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
<div class="sz_contentBg">
    <div class="sz_contentbox">
        <div class="sz_bigbox">
            <div class="left_box">
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toAdminIndex">返回个人中心</a>
                <h2 style="color: #0B61A4;text-align: center;margin-top: 50px">回收站模块</h2>
                <div style="padding:20px 50px 20px 50px;">

                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="商品信息回收箱"  >
                        <div >
                            <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-remove" onclick="remove1()">删除</a>
                                            <a class="mini-button" iconCls="icon-reload" onclick="reback1()">回收</a>
                                        </td>
                                        <td style="white-space:nowrap;">
                                            <input id="rankType" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                                   value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                            <input id="key" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                            <a class="mini-button" onclick="search()">查询</a>
                                        </td>
                                    </tr>
                                </table>

                                <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%;text-align: center" class="mini-panel"
                                     showCollapseButton="true"  collapseOnTitleClick="true" title="已删除的商品信息" >
                                    <div id="datagrid1" class="mini-datagrid" style="height:320px;"
                                         url="${path}/Goodscheck/findDeleteGoodsPage"  idField="id" allowResize="true">
                                        <div property="columns">
                                            <div type="indexcolumn" ></div>
                                            <div field="id" width="120"  headerAlign="center" align="center" >商品编号</div>
                                            <div field="name" width="120" headerAlign="center"  showCellTip="false" align="center">商品名称</div>
                                            <div field="typeStr" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">商品类型</div>
                                            <div field="price" width="100" renderer="onGenderRenderer" align="center" allowSort="true" headerAlign="center">商品价格</div>
                                            <div field="postdate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">发布日期</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </div>
                        <hr style="border:none;border-top:4px groove skyblue; margin-top: 20px" />

                        <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="用户信息回收箱" >
                        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">

                            <table style="width:100%;">
                                <tr>
                                    <td style="width:100%;">
                                        <a class="mini-button" iconCls="icon-remove" onclick="remove2()">删除</a>
                                        <a class="mini-button" iconCls="icon-reload" onclick="reback2()">回收</a>

                                        <span style="color: #00a9e0">当前只能回收用户基本信息，删除的帖子和交易请到相应模块进行回收</span>
                                    </td>
                                    <td style="white-space:nowrap;">
                                        <input id="rankType1" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                               value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                        <input id="key1" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                        <a class="mini-button" onclick="search1()">查询</a>
                                    </td>

                                </tr>
                            </table>

                            <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                                 showCollapseButton="true"  collapseOnTitleClick="true" title="用户信息">
                                <div id="datagrid2" class="mini-datagrid" style="height:320px;" multiSelect="true"
                                     url="${path}/logincheck/findDeleteUserPage"  idField="id" allowResize="true" >
                                    <div property="columns">
                                        <div field="id" width="120"  headerAlign="center" align="center" >用户编号</div>
                                        <div field="username" width="120" headerAlign="center"  showCellTip="false" align="center">用户登录名</div>
                                        <div field="ulStr" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">用户类型</div>
                                        <div field="llogindate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">用户上次上线时间</div>
                                        <div field="deletedate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">删除时间</div>
                                    </div>
                                </div>
                            </div>
                            </div>
                        </div>

                        <hr style="border:none;border-top:4px groove skyblue; margin-top: 20px" />

                        <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="帖子信息回收箱" >
                        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">

                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-remove" onclick="remove3()">删除</a>
                                            <a class="mini-button" iconCls="icon-reload" onclick="reback3()">回收</a>
                                        </td>
                                        <td style="white-space:nowrap;">
                                            <input id="rankType2" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                                   value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                            <input id="key2" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                            <a class="mini-button" onclick="search2()">查询</a>
                                        </td>
                                    </tr>
                                </table>

                                <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                                     showCollapseButton="true"  collapseOnTitleClick="true" title="帖子信息">
                                    <div id="datagrid3" class="mini-datagrid" style="height:320px;" multiSelect="true"
                                         url="${path}/Tiezicheck/findDeleteTieZi"  idField="id" allowResize="true" >
                                        <div property="columns">
                                            <div type="indexcolumn" ></div>
                                            <div field="type" width="120"  headerAlign="center" align="center" >帖子类型</div>
                                            <div field="title" width="120" headerAlign="center"  showCellTip="false" align="center">标题</div>
                                            <div field="content" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">大致内容</div>
                                            <div field="uid" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">发帖人</div>
                                            <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">浏览数</div>
                                            <div field="postdate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">发帖日期</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <hr style="border:none;border-top:4px groove skyblue; margin-top: 20px" />

                        <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="订单信息回收箱" >
                        <div class="mini-toolbar" style="border-bottom:0;padding:0px;">

                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-remove" onclick="remove4()">删除</a>
                                            <a class="mini-button" iconCls="icon-reload" onclick="reback4()">回收</a>
                                        </td>
                                        <td style="white-space:nowrap;">
                                            <input id="rankType3" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                                   value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                            <input id="key3" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                            <a class="mini-button" onclick="search3()">查询</a>
                                        </td>
                                    </tr>
                                </table>

                                <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                                     showCollapseButton="true"  collapseOnTitleClick="true" title="订单信息">
                                    <div id="datagrid4" class="mini-datagrid" style="height:320px;" multiSelect="true"
                                         url="${path}/Goodscheck/findDeleteOrders"  idField="id" allowResize="true" >
                                        <div property="columns">
                                            <div type="indexcolumn" ></div>
                                            <div field="stateStr" width="120" headerAlign="center" align="center" >订单状态</div>
                                            <div field="id" width="150" headerAlign="center" align="center" >订单编号</div>
                                            <div field="goodstitle" width="120" headerAlign="center" align="center" >订单商品名称</div>
                                            <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">订单商品数量（斤）</div>
                                            <div field="total" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">订单总价（元）</div>
                                            <div field="buydate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">下单日期</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
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


</html>
<script type="text/javascript">
    mini.parse();
    var grid1 = mini.get("datagrid1");
    grid1.load();
    var grid2 = mini.get("datagrid2");
    grid2.load();
    var grid3 = mini.get("datagrid3");
    grid3.load();
    var grid4 = mini.get("datagrid4");
    grid4.load();
    $(function(){
        var jsonData = [{'typeId':'1','typeValue':'商品编号'},{'typeId':'2','typeValue':'商品名称'},{'typeId':'3','typeValue':'商品类型'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');

        var jsonData1 = [{'typeId':'1','typeValue':'用户编号'},{'typeId':'2','typeValue':'用户登录名'},{'typeId':'3','typeValue':'用户类型'}];
        mini.get('rankType1').setData(jsonData1);
        mini.get('rankType1').setValue('1');

        var jsonData2 = [{'typeId':'1','typeValue':'帖子类型'},{'typeId':'2','typeValue':'标题'},{'typeId':'3','typeValue':'大致内容'},{'typeId':'4','typeValue':'发帖人'}];
        mini.get('rankType2').setData(jsonData2);
        mini.get('rankType2').setValue('1');

        var jsonData3 = [{'typeId':'1','typeValue':'订单状态'},{'typeId':'2','typeValue':'订单编号'},{'typeId':'3','typeValue':'订单商品名称'}];
        mini.get('rankType3').setData(jsonData3);
        mini.get('rankType3').setValue('1');

        var ms = '${admininfo.name}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }

    });


    //被删除的商品信息条件查找
    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid1.load({key: key,rankType:rankType});
    }

    //被删除的用户信息条件查找
    function search1() {
        var rankType = mini.get('rankType1').getValue();
        var key = mini.get("key1").getValue();
        grid2.load({key: key,rankType:rankType});
    }

    //被删除的帖子信息条件查找
    function search2() {
        var rankType = mini.get('rankType2').getValue();
        var key = mini.get("key2").getValue();
        grid3.load({key: key,rankType:rankType});
    }

    //被删除的订单信息条件查找
    function search3() {
        var rankType = mini.get('rankType3').getValue();
        var key = mini.get("key3").getValue();
        grid4.load({key: key,rankType:rankType});
    }


    //退出登录
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

    /*   商品信息回收      */
    //回收商品信息
    function reback1() {
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要回收的商品信息！");
            return;
        }

        $.ajax({
            url:"${path}/Goodscheck/rebackGoods",
            data:{"goodsid":id},
            async:false,
            type:"post",
            success:function (text) {
                if(text=="ok"){
                    mini.alert("回收成功！");
                    location.reload();
                }
            }
        });
    }

    //删除商品信息
    function remove1() {
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的商品信息！");
            return;
        }
        mini.confirm("您若删除后则不能还原，请确认！","提示信息",function(btn){
           if (btn=="ok"){
               $.ajax({
                   url:"${path}/Goodscheck/deleteGoods",
                   data:{"goodsid":id},
                   async:false,
                   type:"post",
                   success:function (text) {
                       if(text=="ok"){
                           mini.alert("删除成功！");
                           location.reload();
                       }
                   }
               });
           }
        });
    }

    /*  用户信息回收  */

    //用户信息回收
    function reback2() {
        var row = mini.get("datagrid2").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要回收的用户信息！");
            return;
        }

        $.ajax({
            url:"${path}/logincheck/rebackUserVo",
            data:{"uid":id},
            async:false,
            type:"post",
            success:function (text) {
                if(text=="ok"){
                    mini.alert("回收成功！");
                    location.reload();
                }
            }
        });
    }

    //删除用户信息
    function remove2() {
        var row = mini.get("datagrid2").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的用户信息！");
            return;
        }
        mini.confirm("您若删除后则不能还原，请确认！","提示信息",function(btn){
            if (btn=="ok"){
                $.ajax({
                    url:"${path}/logincheck/deleteUserVo",
                    data:{"uid":id},
                    async:false,
                    type:"post",
                    success:function (text) {
                        if(text=="ok"){
                            mini.alert("删除成功！");
                            location.reload();
                        }
                    }
                });
            }
        });
    }


    /*  帖子信息回收  */

    //帖子信息回收
    function reback3() {
        var row = mini.get("datagrid3").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要回收的帖子信息！");
            return;
        }

        $.ajax({
            url:"${path}/Tiezicheck/rebackTiezi",
            data:{"id":id},
            async:false,
            type:"post",
            success:function (text) {
                if(text=="ok"){
                    mini.alert("回收成功！");
                    location.reload();
                }
            }
        });
    }

    //删除帖子信息
    function remove3() {
        var row = mini.get("datagrid3").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的帖子信息！");
            return;
        }
        mini.confirm("您若删除后则不能还原，请确认！","提示信息",function(btn){
            if (btn=="ok"){
                $.ajax({
                    url:"${path}/Tiezicheck/realDeleteTiezi",
                    data:{"id":id},
                    async:false,
                    type:"post",
                    success:function (text) {
                        if(text=="ok"){
                            mini.alert("删除成功！");
                            location.reload();
                        }
                    }
                });
            }
        });
    }


    /*  订单信息回收  */

    //帖子信息回收
    function reback4() {
        var row = mini.get("datagrid4").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要回收的帖子信息！");
            return;
        }

        $.ajax({
            url:"${path}/Goodscheck/rebackOrders",
            data:{"orderid":id},
            async:false,
            type:"post",
            success:function (text) {
                if(text=="ok"){
                    mini.alert("回收成功！");
                    location.reload();
                }
            }
        });
    }

    //删除帖子信息
    function remove4() {
        var row = mini.get("datagrid4").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的帖子信息！");
            return;
        }
        mini.confirm("您若删除后则不能还原，请确认！","提示信息",function(btn){
            if (btn=="ok"){
                $.ajax({
                    url:"${path}/Goodscheck/deleteOrders",
                    data:{"orderid":id},
                    async:false,
                    type:"post",
                    success:function (text) {
                        if(text=="ok"){
                            mini.alert("删除成功！");
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
