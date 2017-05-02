<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/10
  Time: 15:33
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
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                <h2 style="color: #0B61A4;text-align: center;margin-top: 50px">我的交易中心</h2>
                <div style="padding:20px 50px 20px 50px;">

                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div >
                            <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-add" onclick="add()">新增</a>
                                            <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                                        </td>
                                        <td style="white-space:nowrap;">
                                            <input id="rankType" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                                   value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                            <input id="key" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                            <a class="mini-button" onclick="search()">查询</a>
                                        </td>
                                    </tr>
                                </table>

                        <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="我的购物车">
                            <div id="datagrid1" class="mini-datagrid" style="height:320px;" multiSelect="false"
                                 url="${path}/Goodscheck/findUserShoppingCar"  idField="id" allowResize="true" >
                                <div property="columns">
                                    <div type="indexcolumn" ></div>
                                    <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderers" cellStyle="padding:0;" >操作</div>
                                    <div field="stateStr" width="120" headerAlign="center" align="center" >购物车状态</div>
                                    <div field="goodstitle" width="120" headerAlign="center" align="center" >商品名称</div>
                                    <div field="typeStr" width="120" headerAlign="center"  showCellTip="false" align="center">商品类型</div>
                                    <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">商品数量</div>
                                    <div field="addcardate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">加入购物车日期</div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                        <hr style="border:none;border-top:4px groove skyblue; margin-top: 20px" />
                        <div class="mini-toolbar" style="border-bottom:0;padding:0px;margin-top: 10px">
                            <table style="width:100%;">
                                <tr>
                                    <td style="width:100%;">
                                        <a class="mini-button" iconCls="icon-add" onclick="add()">新增</a>
                                        <a class="mini-button" iconCls="icon-remove" onclick="removes()">删除</a>
                                    </td>
                                    <td style="white-space:nowrap;">
                                        <input id="rankType2" class="mini-combobox" style="width:120px;" textField="typeValue" valueField="typeId"
                                               value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                        <input id="key2" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                        <a class="mini-button" onclick="searchs()">查询</a>
                                    </td>
                                </tr>
                            </table>

                        <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="我的订单">
                            <div id="datagrid" class="mini-datagrid" style="height:320px;" multiSelect="false"
                                 url="${path}/Goodscheck/findOrdersByPage?op=2"  idField="id" allowResize="true" >
                                <div property="columns">
                                    <div type="indexcolumn" ></div>
                                    <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
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

<div id="editWindow" class="mini-window" title="修改购物车" style="width:500px;"
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
                <td style="width:150px;"><input class="mini-textbox" id="nametd" readonly="true" disabled="false"></td>
            </tr>

            <tr>
                <td style="width:120px;">当前用户账号：</td>
                <td style="width:150px;">${userinfo.name}</td>
            </tr>
            <tr>
                <td style="width:120px;">修改加入购物车商品数量：</td>
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

<div id="editWindow2" class="mini-window" title="付款订单" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform2" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">付款时请检查自己余额是否充足</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">订单的商品名称：</td>
                <td style="width:150px;"><input class="mini-textbox" id="nametd2" readonly="true" disabled="false"></td>
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
                <td style="width:120px;">订单的购物数量：</td>
                <td style="width:130px;"><input class="mini-textbox" id="num2">斤</td>
            </tr>
            <tr>
                <td style="width:120px;">订单的购物总价：</td>
                <td style="width:130px;"><input class="mini-textbox" id="total">元</td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:showCheckPwd()">付款</a>
                    <a class="Cancel_Button" href="javascript:cancels()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<div id="checkpwd" class="mini-window" title="支付密码" style="width:400px;"
     showModal="true" allowResize="true" allowDrag="true">

    <input class="mini-hidden" name="id"/>
    <div  class="form" >
        <table style="width:100%;">
            <tr>
                <td style="width:120px;">请输入当前用户密码</td>
                <td style="width:150px;"><input class="mini-password" id="pwd" name="pwd" required="true"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:yes()">确定</a>
                    <a class="Cancel_Button" href="javascript:cancelpwd()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>

</html>
<script type="text/javascript">
    mini.parse();
    var grid = mini.get("datagrid1");
    grid.load();
    var grids = mini.get("datagrid");
    grids.load();
    $(function(){
        var jsonData = [{'typeId':'1','typeValue':'购物车状态'},{'typeId':'2','typeValue':'商品名称'},{'typeId':'3','typeValue':'商品类型'}];
        var jsonDatas = [{'typeId':'1','typeValue':'订单状态'},{'typeId':'2','typeValue':'订单商品名称'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');
        mini.get('rankType2').setData(jsonDatas);
        mini.get('rankType2').setValue('1');
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
    });

    //订单列表操作
    function onActionRenderer(e){
        var state = e.record.state;
        if(state == 0 ){
            return '<span class="f_b f_orange"><a href="javascript:shows()" style="color: #0b93d9">查看</a></span>';
        }
        if(state == 1 ){
            return '<span class="f_b f_orange"><a href="javascript:edits()" style="color: orangered">付款</a></span>';
        }
        if(state == 2){
            return '<span class="f_b f_orange"><a href="javascript:getGoods()" style="color: red">确定收货</a></span>';
        }
        if(state == 3){
            return '<span class="f_b f_orange"><a href="javascript:evaluate()" style="color: #0b93d9">评价</a></span>';
        }
        if(state == 4){
            return '<span class="f_b f_orange"><a href="javascript:" style="color: silver">已完成交易</a></span>';
        }
    }

    //购物车列表操作
    function onActionRenderers(e){
        return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看&nbsp;&nbsp;</a>|'+'<a href="javascript:edit()" style="color: orangered">&nbsp;&nbsp;编辑&nbsp;&nbsp;</a>|'+'<a href="javascript:buy()" style="color: orangered">&nbsp;&nbsp;付款</a></span>';
    }


    //购物车条件搜索
    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
    }
    //订单条件搜索
    function searchs() {
        var rankType = mini.get('rankType2').getValue();
        var key = mini.get("key2").getValue();
        grids.load({key: key,rankType:rankType});
    }
    //查看购物车
    function show(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的购物车！");
            return;
        }
        $.ajax({
            url:"${path}/Goodscheck/getGoodsid",
            type:"get",
            async:false,
            data:{"id":id},
            success:function(text){
                if(text != null && text != ""){
                    location.href="${path}/Goodscheck/toshowgoods?id="+text;
                }
            }
        });
    }
    //查看订单
    function shows(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单！");
            return;
        }
        $.ajax({
            url:"${path}/Goodscheck/checkOrder",
            type:"get",
            async:false,
            data:{"orderid":id},
            success:function(text){
                if(text != null && text != ""){
                    location.href="${path}/Goodscheck/toshowOrders?orderid="+text;
                }
            }
        });
    }
    //显示购物车修改信息
    function newRow() {
        var editWindow = mini.get("editWindow");
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
            var name = row.goodstitle;
        }else{
            mini.alert("请选择要查看的购物车！");
            return;
        }
        editWindow.show();
        mini.get("nametd").setValue(name);
    }

    //显示购物车修改信息
    function newRows() {
        var editWindow = mini.get("editWindow2");
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
            var name = row.goodstitle;
            var total = row.total;
            var num = row.num;
            //后台获取当前用户余额
            $.ajax({
                url:"${path}/Goodscheck/getBalance",
                type:"post",
                success:function(text){
                    mini.get("balance").setValue(text);
                }
            });
        }else{
            mini.alert("请选择要查看的订单！");
            return;
        }
        editWindow.show();
        mini.get("nametd2").setValue(name);
        mini.get("num2").setValue(num);
        mini.get('total').setValue(total);
    }

    //取消显示
    function cancel(){
        var editWindow = mini.get("editWindow");
        editWindow.hide();
    }
    function cancels(){
        var editWindow = mini.get("editWindow2");
        editWindow.hide();
    }

    //编辑购物车
    function edit(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
            var name = row.goodstitle;
        }else{
            mini.alert("请选择要编辑的购物车！");
            return;
        }
        newRow();
    }

    //支付弹框
    function edits(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
            var name = row.goodstitle;
        }else{
            mini.alert("请选择要付款的订单！");
            return;
        }
        newRows();
    }

    //新增购物车/订单
    function add(){
        location.href="${path}/Goodscheck/getGoodsPage?pageIndex=0&pageSize=6";
    }
    //删除购物车
    function remove(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的购物车！");
            return;
        }
        $.ajax({
            url:"${path}/Goodscheck/removeShopcart",
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
    //删除订单
    function removes(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的订单！");
            return;
        }
        mini.confirm("您确认删除当前订单吗？","提示",function(btn) {
            if (btn == "ok") {
                $.ajax({
                    url:"${path}/Goodscheck/removeOrder",
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
        });

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
    // 保存按钮
    function addshopcart(){
        var num = mini.get('num').getValue();
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
            var goodsid = row.goodsid;
        }else{
            mini.alert("请选择要修改的购物车！");
            return;
        }
        $.ajax({
            url:"${path}/Goodscheck/updateShopcart",
            data:{"id":id,"num":num,"goodsid":goodsid},
            success:function(text){
                if(text=="ok"){
                    mini.alert("修改成功！");
                    cancel();
                    location.reload();
                }
            }
        });
    }

    function addOrder(){
        var row = mini.get("datagrid").getSelected();
        if(row) {
            var id = row.id;
        }else{
            mini.alert("请选择要支付的订单！");
        }
        var balance = mini.get("balance").getValue();
        var total = mini.get("total").getValue();
        if(parseInt(balance)>=parseInt(total)){
           var t= balance = balance - total;
            var state = 0;
            $.ajax({
                url:"${path}/Goodscheck/updateOrder",
                data:{"state":state,"orderid":id,"balance":t},
                async:false,
                success:function(text){
                    if(text == "ok"){
                        mini.alert("支付成功！");
                        cancels();
                        location.reload();
                    }
                }

            });
        }else{
            mini.alert("支付失败，您余额不足！");
        }
    }


    function buy(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var goodsid = row.goodsid;
            var num = row.num;
            location.href="${path}/Goodscheck/toBought?id="+goodsid+"&num="+num;
        }else{
            mini.alert("请选择要修改的购物车！");
            return;
        }
    }

    //校验密码弹框
    function showCheckPwd() {
        var editWindow = mini.get("checkpwd");
        editWindow.show();
    }

    function cancelpwd(){
        var editWindow = mini.get("checkpwd");
        editWindow.hide();
        mini.get('pwd').setValue("");
    }

    function yes(){
        var pwd = mini.get("pwd").getValue();
        $.ajax({
            url:"${path}/Goodscheck/checkPWd",
            data:{"pwd":pwd},
            async:false,
            type:"post",
            success:function(data){
                if(data == "ok"){
                   addOrder();
                    cancelpwd();
                    mini.get('pwd').setValue("");
                }else if(data == "03"){
                    mini.alert("密码错误！");
                    mini.get('pwd').setValue("");
                    cancelpwd();
                }else if(data == "02"){
                    mini.alert("网络开了点小差，请稍后再试。。。");
                    mini.get('pwd').setValue("");
                    cancelpwd();
                }
            }
        });

    }

    function getGoods(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单！");
            return;
        }
        mini.confirm("确认收货后就不能在进行订单操作，您确定继续吗？","提示",function(btn) {
            if (btn == "ok") {
                $.ajax({
                    url:"${path}/Goodscheck/getGoods",
                    type:"post",
                    async:false,
                    data:{"id":id},
                    success:function(text){
                        if(text == "ok"){
                            mini.confirm("收货完成，是否现在去评价商品","提示",function(btn) {
                                if (btn == "ok"){
                                    location.href="${path}/Goodscheck/toEvaluate?orderid="+id;
                                }else{
                                    location.reload();
                                }
                            });
                        }
                    }

                });
            }
        });
    }

    function evaluate(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单！");
            return;
        }
        location.href="${path}/Goodscheck/toEvaluate?orderid="+id;

    }

    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);
</script>