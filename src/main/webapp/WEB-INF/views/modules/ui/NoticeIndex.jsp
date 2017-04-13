<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/17
  Time: 11:02
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
</style>


<div class="top">
    <div class="topbar">
        <div class="sz_fr" id="destoon_member">欢迎，<c:if test="${userinfo.level eq 5 }"><a style="color: #7f2a0c;font-style: italic">尊贵的会员用户：</a></c:if>${img} ${userinfo.name} <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
                <a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a>
                <h2 style="color: #0B61A4;margin-left: 45%;margin-top: 50px">我的通知中心</h2>
                <div style="padding:20px 50px 20px 50px;">

                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div >
                            <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
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

                                <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%;text-align: center" class="mini-panel"
                                     showCollapseButton="true"  collapseOnTitleClick="true" title="商品出售通知" >
                                    <div id="datagrid1" class="mini-datagrid" style="height:320px;" multiSelect="true"
                                         url="${path}/Noticecheck/findNoticePage"  idField="id" allowResize="true" >
                                        <div property="columns">
                                            <div type="indexcolumn" ></div>
                                            <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderers" cellStyle="padding:0;" >操作</div>
                                            <div field="orderid" width="120" headerAlign="center" align="center" >订单号</div>
                                            <div field="stateStr" width="120" headerAlign="center" align="center" >订单状态</div>
                                            <div field="goodstitle" width="120" headerAlign="center" align="center" >订单商品名称</div>
                                            <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">订单商品数量</div>
                                            <div field="buydate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">下单日期</div>
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
                                        <a class="mini-button" iconCls="icon-remove" onclick="removes()">删除</a>
                                    </td>

                                </tr>
                            </table>

                            <div style="margin-top: 5px;border: 1px solid slategrey;padding: 10px;font-size: 18px;width: 100%" class="mini-panel"
                                 showCollapseButton="true"  collapseOnTitleClick="true" title="系统服务通知">
                                <div id="datagrid" class="mini-datagrid" style="height:320px;" multiSelect="true"
                                     url="${path}/SysnoticeCheck/findSysnoticePage"  idField="id" allowResize="true" >
                                    <div property="columns">
                                        <div type="indexcolumn" ></div>
                                        <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderer" cellStyle="padding:0;" >操作</div>
                                        <div field="title" width="120" headerAlign="center" align="center" >通知消息标题</div>
                                        <div field="content" width="150" headerAlign="center" align="center" >通知消息主体内容</div>
                                        <div field="postdate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">消息发送日期</div>
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

<div id="editWindow" class="mini-window" title="填写发货信息" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: orangered;">网页自设定15分钟自动刷新页面，为防止您填写的内容被清空，填写的时候请注意时间！</span>
            </tr><br>
            <tr>
                <span style="color: #0B61A4;">请认真填写物流（快递）信息，您填写的信息关乎买家是否能正常收件，请再三确认！</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">物流（快递）名称：</td>
                <td style="width:150px;"><input id="rankType1" class="mini-combobox" style="width:120px;" textField="typeValue" valueField="typeId"
                        value="typeId" showNullItem="false" allowInput="false"  valueFromSelect="true" required="required" onvaluechanged="showqt"/></td>
            </tr>

                <tr>
                    <td style="width:120px;display: none" id="qtt">其他快递：</td>
                    <td style="width:150px;display:none;" id="qttt"><input class="mini-textbox" id="qt" required="required"></td>
                </tr>

            <tr>
                <td style="width:120px;">物流（快递）单号：</td>
                <td style="width:150px;"><input class="mini-textbox" id="kddh" required="required"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:addSysnotice()">确定</a>
                    <a class="Cancel_Button" href="javascript:cancel()">取消</a>
                </td>
            </tr>
        </table>
    </div>
</div>

<div id="editWindows" class="mini-window" title="查看消息" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editforms" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">网页自设定15分钟刷新一次，若长时间没有新的消息，请手动刷新页面</span>
            </tr>
            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">通知消息标题：</td>
                <td style="width:300px;"><input style="width: 100%" class="mini-textbox" id="title" name="title"  readonly="true" disabled="true"></td>
            </tr>

            <tr>
                <td style="width:120px;">通知消息内容：</td>
                <%--<td style="width:300px;"><input style="width: 100%;height: 100px" class="mini-textarea" id="content" name="content"  readonly="true" disabled="true"></td>--%>
                <td style="width:300px;"><div style="border:  1px solid silver;height: 150px;border-radius: 5px;" id="content" class="content"></div></td>
            </tr>
            <tr>
                <td style="width:120px;">消息发送时间：</td>
                <td style="width:300px;"><input style="width: 100%" class="mini-textbox" id="postdate" name="postdate"  readonly="true" disabled="true"></td>
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
        var jsonData = [{'typeId':'1','typeValue':'订单状态'},{'typeId':'2','typeValue':'订单号'},{'typeId':'3','typeValue':'订单商品名称'}];
        var jsonDatas = [{'typeId':'0','typeValue':'请选择快递品牌'},{'typeId':'1','typeValue':'申通快递'},{'typeId':'2','typeValue':'顺丰快递'},
            {'typeId':'3','typeValue':'圆通快递'},{'typeId':'4','typeValue':'中通快递'},{'typeId':'5','typeValue':'韵达快递'},{'typeId':'6','typeValue':'全峰快递'},
            {'typeId':'7','typeValue':'国通快递'},{'typeId':'8','typeValue':'EMS快递'},{'typeId':'9','typeValue':'DHL快递'}
            ,{'typeId':'10','typeValue':'其他快递'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType').setValue('1');
        mini.get('rankType1').setData(jsonDatas);
        mini.get('rankType1').setValue('0');

        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }

    });

    function showqt (){
       var kd =  mini.get('rankType1').getValue();
        if(kd == 10){
            $("#qtt").show();
            $("#qttt").show();
        }
    }

    function onActionRenderers(e){
        var state = e.record.state;
        if(state == 0){
            return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看&nbsp;&nbsp;</a>|'+'<a href="javascript:edit()" style="color: orangered">&nbsp;&nbsp;发货&nbsp;&nbsp;</a></span>';
        }
        if(state == 2){
            return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看&nbsp;&nbsp;</a>|'+'<a href="javascript:edit()" style="color: silver">&nbsp;&nbsp;已发货&nbsp;&nbsp;</a></span>';
        }
        if(state == 1){
            return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看</a></span>';
        }
        if(state == 4){
            return '<span class="f_b f_orange"><a href="javascript:showpj()" style="color: #0b93d9">查看评价</a></span>';
        }
        if(state == 3){
            return '<span class="f_b f_orange"><a href="javascript:" style="color: silver">等待买家评价</a></span>';
        }
    }

    //系统通知消息
    function onActionRenderer(e){
        return '<span class="f_b f_orange"><a href="javascript:shows()" style="color: #0b93d9">查看</a></span>';
    }


    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
    }



    //查看订单
    function show(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单信息！");
            return;
        }
        $.ajax({
            url:"${path}/Noticecheck/checkNotice",
            type:"get",
            async:false,
            data:{"noticeid":id},
            success:function(text){
                if(text != null && text != ""){
                    location.href="${path}/Noticecheck/toshowNotice?noticeid="+text;
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
            mini.alert("请选择要查看的订单信息！");
            return;
        }
        editWindow.show();
    }


    //取消显示
    function cancel(){
        var editWindow = mini.get("editWindow");
        editWindow.hide();
    }

    //编辑购物车
    function edit(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
            var name = row.goodstitle;
        }else{
            mini.alert("请选择要操作的订单通知！");
            return;
        }
        newRow();
    }


    //删除购物车
    function removes(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的系统通知！");
            return;
        }
        $.ajax({
            url:"${path}/SysnoticeCheck/removeSysnotice",
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

    function remove(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要删除的购物车！");
            return;
        }
        $.ajax({
            url:"${path}/Noticecheck/removeNotice",
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


    function addSysnotice(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的订单信息！");
            return;
        }
        var kdmc = null;
        var Type = mini.get("rankType1").getValue();
        var qt = mini.get("qt").getValue();
        var kddh = mini.get("kddh").getValue();
        if(Type == '1'){
            kdmc = '申通快递';
        }else if (Type =='2'){
            kdmc= '顺丰快递';
        }else if (Type =='3'){
            kdmc= '圆通快递';
        }else if (Type =='4'){
            kdmc= '中通快递';
        }else if (Type =='5'){
            kdmc= '韵达快递';
        }else if (Type =='6'){
            kdmc= '全峰快递';
        }else if (Type =='7'){
            kdmc= '国通快递';
        }else if (Type =='8'){
            kdmc= 'EMS快递';
        }else if (Type =='9'){
            kdmc= 'DHL快递';
        }else if (Type =='10'){
            kdmc= qt;
        }

//        mini.alert("kdmc:"+kdmc+";kddh:"+kddh);
        $.ajax({
            url:"${path}/Noticecheck/updateNotice",
            type:"post",
            async:false,
            data:{"kdmc":kdmc,"kddh":kddh,"id":id},
            success:function(text){
                if (text=="ok"){
                    mini.alert("发货信息保存成功！");
                    location.reload();
                }
            }
        });

    }

    function  shows(){
        var row = mini.get("datagrid").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的系统通知信息！");
            return;
        }
        var editWindow = mini.get("editWindows");
        editWindow.show();
        $.ajax({
            url:"${path}/SysnoticeCheck/getSysnotice",
            type:"post",
            async:false,
            data:{"id":id },
            success:function(data){
                if(data!=null){
                    mini.get('title').setValue(data.title);
//                    mini.get('content').setValue(data.content);
                    $("#content").html(data.content);
                    mini.get('postdate').setValue(data.postdate);
;                }
            }
        });
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
            url:"${path}/Noticecheck/getGoodsid",
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
</script>
