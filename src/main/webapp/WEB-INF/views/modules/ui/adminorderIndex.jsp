<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/23
  Time: 23:06
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
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toAdminIndex">返回个人中心</a>
                <h2 style="color: #0B61A4;text-align: center;margin-top: 50px">用户交易管理模块</h2>
                <div style="padding:20px 50px 20px 50px;">
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div >
                            <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-remove" onclick="remove()">删除</a>
                                            <a class="mini-button" iconCls="icon-search" onclick="except()">导出全部订单到Excel</a>
                                        </td>
                                        <td style="white-space:nowrap;">
                                            <input id="rankType" class="mini-combobox" style="width:100px;" textField="typeValue" valueField="typeId"
                                                   value="typeId" showNullItem="false" allowInput="false"  valueFromSelect=“true”/>
                                            <input id="key" class="mini-textbox" emptyText="请输入查询内容" style="width:150px;" onenter="onKeyEnter"/>
                                            <a class="mini-button" onclick="search()">查询</a>
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </div>
                        <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="用户交易订单">
                            <div id="datagrid1" class="mini-datagrid" style="height:320px;" multiSelect="false"
                                 url="${path}/Goodscheck/findOrdersByPage?op=1"  idField="id" allowResize="true" >
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


<div id="editWindow" class="mini-window" title="用户订单信息编辑操作" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">您正在对用户订单信息进行操作。。。</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">操作的订单编号：</td>
                <td style="width:150px;"><input class="mini-textbox" id="gid" readonly="readonly" disabled="disabled"></td>
            </tr>

            <tr>
                <td style="width:120px;">操作的订单商品名称：</td>
                <td style="width:150px;"><input class="mini-textbox" id="name" readonly="readonly" disabled="disabled"></td>
            </tr>

            <tr>
                <td style="width:120px;">操作类型：</td>
                <td style="width:150px;"><input id="rankType1" class="mini-combobox" style="width:120px;" textField="typeValue" valueField="typeId"
                                                value="typeId" showNullItem="false" allowInput="false"  valueFromSelect="true" required="true" onvaluechanged="showqt"/></td>
            </tr>
            <tr>
                <td style="width:120px;display:none;" id="qttt">消息内容：</td>
                <td style="width:150px; display: none" id="qtt"><input class="mini-textarea" id="content" style="width: 100%;height: 100px" required="required"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:addSysn()">确定</a>
                    <a class="Cancel_Button" href="javascript:cancel()">取消</a>
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
    $(function(){
        var jsonData = [{'typeId':'1','typeValue':'订单状态'},{'typeId':'3','typeValue':'订单编号'},{'typeId':'2','typeValue':'订单商品名称'}];
        var jsonDatas = [{'typeId':'1','typeValue':'提醒发货'},{'typeId':'2','typeValue':'提醒收货'},{'typeId':'4','typeValue':'发送订单消息'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');
        mini.get('rankType1').setData(jsonDatas);
        mini.get('rankType1').setValue('1');
        var ms = '${admininfo.id}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
    });

    //购物车列表操作
    function onActionRenderer(e){
        var state = e.record.state;
        if (state == 4){
            return '<span class="f_b f_orange"><a href="javascript:showpj()" style="color: #0b93d9">&nbsp;&nbsp;查看&nbsp;&nbsp;</a></span>';
        }
        if(state != 1 && state !=4){
            return '<span class="f_b f_orange"><a href="javascript:edit()" style="color: orangered">&nbsp;&nbsp;编辑&nbsp;&nbsp;</a></span>';
        }

    }

    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
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

    function remove(){
        var row = mini.get("datagrid1").getSelected();
        var adminid = '${admininfo.uid}';
        if(row){
            var id = row.id;
            var state = row.state;
        }else{
            mini.alert("请选择要删除的订单！");
            return;
        }
        if(state != 4 ){
            mini.confirm("当前订单还未完成交易，您确认要删除吗？","提示",function(btn) {
                if (btn == "ok") {
                    $.ajax({
                        url:"${path}/Goodscheck/removeOrderByAd",
                        type:"post",
                        async:false,
                        data:{"id":id,"adminid":adminid},
                        success:function(text){
                            if(text=="ok"){
                                mini.alert("删除成功！");
                                location.reload();
                            }
                        }
                    });
                }
            });
        }else{
            mini.confirm("您确认要删除当前订单吗？","提示",function(btn) {
                if (btn == "ok") {
                    $.ajax({
                        url:"${path}/Goodscheck/removeOrderByAd",
                        type:"post",
                        async:false,
                        data:{"id":id,"adminid":adminid},
                        success:function(text){
                            if(text=="ok"){
                                mini.alert("删除成功！");
                                location.reload();
                            }
                        }
                    });
                }
            });
        }


    }

    function edit(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要编辑的用户！");
            return;
        }
        newRow();
        mini.get('name').setValue(row.goodstitle);
        mini.get('gid').setValue(row.id);
    }

    function newRow() {
        var editWindow = mini.get("editWindow");
        editWindow.show();
    }

    function cancel(){
        var editWindow = mini.get("editWindow");
        editWindow.hide();
        mini.get('yy').setValue("");
        mini.get('rankType1').setValue("");
    }


    function showpj(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单信息！");
            return;
        }
        $.ajax({
            url:"${path}/Noticecheck/getGoodsidByOrder",
            type:"post",
            async:false,
            data:{"id":id},
            success:function(text){
                if (text !=null){
                    location.href="${path}/Goodscheck/toshowgoods?id="+text;
                }
            }
        });
    }

    /**
     * 导出功能
     */
    function except(){

        location.href="${path}/Goodscheck/getEXCCC";
    }


    function addSysn() {
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要操作的订单！");
            return;
        }
        var adminid = '${admininfo.uid}';
        var rankType = mini.get("rankType1").getValue();
        var content = mini.get("content").getValue();
        if(rankType == 4){
            if (content == null || content ==""){
                mini.alert("消息内容不能为空！");
            }
        }
        $.ajax({
            url:"${path}/SysnoticeCheck/saveSysnotice",
            data:{"orderid":id,"adminid":adminid,"rankType":rankType,"content":content},
            type:"post",
            scriptCharset: 'utf-8',
            success:function (text) {
                if (text=="ok"){
                    mini.alert("操作成功！");
                    cancel();
                }
            }
        });
    }

    function showqt (){
        var kd =  mini.get('rankType1').getValue();
        if(kd==4){
            $("#qtt").show();
            $("#qttt").show();
        }else{
            $("#qtt").hide();
            $("#qttt").hide();
        }
    }

    //获取农历信息
    var nowDateInfo = getNowDate();
    $("#nowDateInfo").html(nowDateInfo);
</script>

