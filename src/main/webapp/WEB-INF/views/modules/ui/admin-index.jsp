<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/27
  Time: 14:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8"%>
<%@ include file="/WEB-INF/views/include/taglib.jsp"%>
<html class="no-js fixed-layout">
<head>
    <script src="${ctxStatic}/scripts/jquery-1.6.2.min.js" type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/miniui/miniui.js"type="text/javascript"></script>
    <script src="${ctxStatic}/scripts/boot.js"type="text/javascript"></script>

    <link rel="stylesheet" href="${ctxStatic}/scripts/miniui/themes/bootstrap/skin.css" />
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>管理员后台</title>
    <meta name="keywords" content="index">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="renderer" content="webkit">
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <link rel="icon" type="image/png" href="${ctxStatic}/assets/i/favicon.png">
    <link rel="apple-touch-icon-precomposed" href="${ctxStatic}/assets/i/app-icon72x72@2x.png">
    <meta name="apple-mobile-web-app-title" content="Amaze UI" />
    <link rel="stylesheet" href="${ctxStatic}/assets/css/amazeui.min.css"/>
    <link rel="stylesheet" href="${ctxStatic}/assets/css/admin.css">

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/themes/default/default.css" />

    <link rel="stylesheet" href="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.css" />

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/kindeditor.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/lang/zh_CN.js"></script>

    <script charset="utf-8" src="${ctxStatic}/kindeditor-4.1.7/plugins/code/prettify.js"></script>

</head>
<style type="text/css">

    .admin-task-bd:hover img{
        -webkit-transform:scale(3,3);
        -moz-transform:scale(3,3);
        -transform:scale(3,3);
    }

</style>

<body>

<header class="am-topbar am-topbar-inverse admin-header">
    <div class="am-topbar-brand">
        <strong>农林交流网</strong> <small>后台管理(完整版)</small>
    </div>

    <button class="am-topbar-btn am-topbar-toggle am-btn am-btn-sm am-btn-success am-show-sm-only" data-am-collapse="{target: '#topbar-collapse'}"><span class="am-sr-only">导航切换</span> <span class="am-icon-bars"></span></button>

    <div class="am-collapse am-topbar-collapse" id="topbar-collapse">

        <ul class="am-nav am-nav-pills am-topbar-nav am-topbar-right admin-header-list">

            <li class="am-dropdown" data-am-dropdown>
                <a class="am-dropdown-toggle" data-am-dropdown-toggle href="${path}/logincheck/toupdateAdmin">
                    ${img}&nbsp;&nbsp;${admininfo.name}
                </a>
            </li>
        </ul>
    </div>
</header>

<div class="am-cf admin-main">
    <!-- sidebar start -->
    <div class="admin-sidebar am-offcanvas" id="admin-offcanvas">
        <div class="am-offcanvas-bar admin-offcanvas-bar">
            <ul class="am-list admin-sidebar-list">
                <li><a href="${path}/logincheck/index"><span class="am-icon-home"></span> 首页</a></li>
                <li><a href="${path}/logincheck/toadminUserIndex"><span class="am-icon-table"></span> 用户信息管理模块</a></li>
                <li><a href="${path}/Tiezicheck/toTieziIndex?op=1"><span class="am-icon-table"></span> 帖子信息管理模块</a></li>
                <li><a href="${path}/Goodscheck/toadminOrderIndex"><span class="am-icon-table"></span> 交易信息管理模块</a></li>
                <li><a href="${path}/Goodscheck/toadmingoods"><span class="am-icon-table"></span> 商品信息管理模块</a></li>
                <li><a href="${path}/Goodscheck/toRecovery"><span class="am-icon-table"></span> 回收站模块</a></li>
                <li><a href="${path}/logincheck/toupdateAdmin"><span class="am-icon-pencil-square-o"></span> 管理员信息模块</a></li>
                <li><a onclick="logout()" href="#"><span class="am-icon-sign-out"></span> 注销</a></li>

            </ul>

            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-bookmark"></span> ${gonggao.title}</p>
                    <p>${gonggao.content}</p>
                </div>
            </div>

            <div class="am-panel am-panel-default admin-sidebar-panel">
                <div class="am-panel-bd">
                    <p><span class="am-icon-tag"></span> wiki</p>
                    <p>Welcome to the Admin wiki!</p>
                </div>
            </div>
        </div>
    </div>
    <!-- sidebar end -->

    <!-- content start -->
    <div class="admin-content">
        <div class="admin-content-body">
            <div class="am-cf am-padding">
                <div class="am-fl am-cf"><strong class="am-text-primary am-text-lg">首页</strong> / <small>一些常用模块</small></div>
            </div>

            <ul class="am-avg-sm-1 am-avg-md-4 am-margin am-padding am-text-center admin-content-list ">
                <li><a href="#" class="am-text-success"><span class="am-icon-btn am-icon-file-text"></span><br/>新增帖子<br/>${notenum}</a></li>
                <li><a href="#" class="am-text-warning"><span class="am-icon-btn am-icon-briefcase"></span><br/>成交订单<br/>${ordernum}</a></li>
                <li><a href="#" class="am-text-danger"><span class="am-icon-btn am-icon-recycle"></span><br/>总访问量<br/>${viewnum}</a></li>
                <li><a href="#" class="am-text-secondary"><span class="am-icon-btn am-icon-user-md"></span><br/>在线用户<br/>${usernum}</a></li>
            </ul>

            <div class="am-g" style="margin-bottom: 20px">
                <div class="am-u-sm-12">
                    <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                         showCollapseButton="true"  collapseOnTitleClick="true" title="订单信息管理"  >
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
                                        <a class="mini-button" onclick="search1()">查询</a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
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
            </div>

            <div class="am-g">
                <div class="am-u-md-6">
                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-1'}">专家课堂上传视频<span class="am-icon-upload"></span></div>
                        <div class="am-panel-bd am-collapse am-in" id="collapse-panel-1">
                            专家课堂标题：<input id="title" type="text" class="mini-textbox" required="required"><br>
                            <p><input type="button" id="vidb1" value="选择视频"></p>
                            专家课堂内容：<a style="font-size: 10px;color: orangered">[注：为了更好上传视频内容，请在课堂内容内勿做换行操作]</a>
                                <textarea name="article.content2" cols="100" rows="8" style="width:100%;height:200px;visibility:hidden;"></textarea>
                            <div style="margin-top: 10px"><td colspan="2" ><button style="margin-left: 40%;margin-bottom: 10px;"  onclick="uploads()">推送</button>
                                <button style="margin-left: 30px;margin-bottom: 10px;"  onclick="cancelUp()">取消</button></td></div>

                        </div>
                    </div>
                    <div class="am-panel am-panel-default">
                        <div style="margin-top: 25px;border: 1px solid slategrey;padding: 10px;font-size: 15px;width: 100%" class="mini-panel"
                             showCollapseButton="true"  collapseOnTitleClick="true" title="撰写公告" >
                            <textarea  name="article.content1" class="kindeditor" tools="basic" style="width:100%;height: 200px"></textarea>
                            <div style="margin-top: 10px"><td colspan="2" ><button style="margin-left: 40%;margin-bottom: 10px;"  onclick="addN()">发布</button>
                            <button style="margin-left: 30px;margin-bottom: 10px;"  onclick="cancelN()">取消</button></td></div>
                        </div>
                    </div>
                </div>

                <div class="am-u-md-6">
                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-4'}">最新留言显示<span class="am-icon-comment-o" ></span></div>
                        <div id="collapse-panel-4" class="am-panel-bd am-collapse am-in">
                        <c:forEach items="${msg}" var="msg" varStatus="status">
                            <ul class="am-list admin-content-task">
                                <li>
                                    <div class="admin-task-meta"> 留言与&nbsp;&nbsp; ${msg.createDateStr}  &nbsp;&nbsp;by &nbsp;${msg.uname} @ ${msg.noteName}</div>
                                    <div class="admin-task-bd">
                                        ${msg.msg}
                                    </div>
                                    <div class="am-cf">
                                        <div class="am-btn-toolbar am-fl">
                                            <div class="am-btn-group am-btn-group-xs">
                                            </div>
                                        </div>
                                        <div class="am-fr">
                                            <button type="button" class="am-btn am-btn-danger am-btn-xs" id="${msg.id}" onclick="removeMsg(this)">删除</button>
                                            <button type="button" class="am-btn am-btn-primary am-btn-xs" id="${msg.id}" onclick="showMsg(this)">查看</button>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </c:forEach>
                        </div>
                    </div>

                    <div class="am-panel am-panel-default">
                        <div class="am-panel-hd am-cf" data-am-collapse="{target: '#collapse-panel-3'}">最近公告显示<span class="am-icon-paper-plane-o" ></span></div>
                        <div class="am-panel-bd am-collapse am-in am-cf" id="collapse-panel-3">
                            <c:forEach items="${gonggaos}" var="gg" varStatus="status">
                            <ul class="am-comments-list admin-content-comment">
                                <li class="am-comment">
                                    <a href="#">${img1px}</a>
                                    <div class="am-comment-main">
                                        <header class="am-comment-hd">
                                            <div class="am-comment-meta"><a href="#" class="am-comment-author">${gg.fromuid}</a> 发布于 <time>${gg.postdateStr}</time></div>
                                        </header>
                                        <div class="am-comment-bd"><p>${gg.content}</p>
                                            <div class="am-fr">
                                                <button type="button" class="am-btn am-btn-danger am-btn-xs" id="${gg.id}" onclick="removeGG(this)">删除</button>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                            </ul>
                            </c:forEach>
                        </div>
                    </div>
                </div>
            </div>
        </div>



        <footer class="admin-content-footer">
            <hr>
            <p class="am-padding-left">© 2017 AgricultureWeb, Inc. BY Zhangsnke .</p>
        </footer>
    </div>
    <!-- content end -->

</div>

<a href="#" class="am-icon-btn am-icon-th-list am-show-sm-only admin-menu" data-am-offcanvas="{target: '#admin-offcanvas'}"></a>


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

<div class="cont" id="cont" runat="server" style="display: none"></div>




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

    //公告
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

    //上传文件
    var editor2 = null;
    KindEditor.ready(function(K) {
        editor2 = K.create('textarea[name="article.content2"]', {
            resizeType : 1,//只支持纵向拉伸
            uploadJson : '${ctxStatic}/kindeditor-4.1.7/jsp/upload_json.jsp',
            fileManagerJson : '${ctxStatic}/kindeditor-4.1.7/jsp/file_manager_json.jsp',
            allowFileManager : true, //允许管理上传文件
            allowImageUpload: true,//允许图片上传
            afterUpload:function(){this.sync();},//图片上传后，内容同步到textarea
            afterBlur:function(){this.sync();}, // 失去焦点后，将上传的图片同步到textarea
            items: [
                'fontname', 'fontsize', '|', 'forecolor', 'hilitecolor', 'bold', 'italic', 'underline',
                'removeformat', '|', 'justifyleft', 'justifycenter', 'justifyright', 'insertorderedlist',
                'insertunorderedlist', '|', 'emoticons']

        });
        K('#vidb1').click(function () {
            editor2.loadPlugin('media', function () {
                editor2.plugin.media.edit({
                    showRemote: false,
                    keUrl: K('#keUrl').val(),
                    clickFn: function (url, message, error) {
                        alert("上传成功!");
                        K("#imgbox").attr("src", url);
                        K("#imgbox").show();
                        editor2.hideDialog();
                    }
                });
            });
        });
        prettyPrint();
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

    function search1() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
    }


    function logout(){
        var data = '${admininfo.uid}';
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
        mini.get('content').setValue("");
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
                }else if(text!=null && text !=""){
                    mini.alert(text);
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

    //发布公告
    function addN(){
        var text = editor.html();
        var adminid = '${admininfo.uid}';
        $.ajax({
            url:"${path}/SysnoticeCheck/addSysN",
            data:{"content":text,"adminid":adminid},
            type:"post",
            scriptCharset: 'utf-8',
            async:false,
            success: function (text) {
                if(text=="ok"){
                    mini.alert("公告发布成功！");
                    location.reload();
                }
            }

        });
    }

    //取消公告
    function cancelN(){
        editor.html("");
    }

    //删除公告
    function removeGG(e) {
        $.ajax({
            url:"${path}/SysnoticeCheck/removeSysn",
            type:"post",
            data:{"id":e.id},
            async:false,
            success:function (text) {
                if (text == "ok"){
                    mini.alert("删除成功！");
                    location.reload();
                }
            }
        });
    }

    //删除最新评论
    function removeMsg(e) {
        $.ajax({
            url:"${path}/Tiezicheck/removeMsg",
            type:"post",
            data:{"id":e.id},
            async:false,
            success:function (text) {
                if (text == "ok"){
                    mini.alert("删除成功！");
                    location.reload();
                }
            }
        });
    }

    //查看最新评论的帖子
    function showMsg(e) {
        $.ajax({
            url:"${path}/Tiezicheck/toShowMsg",
            type:"post",
            data:{"id":e.id},
            async:false,
            success:function (text) {
                if(text!=null){
                    location.href="${path}/Tiezicheck/gettiezi?id="+text+"&op=1&pageIndex=0&pageSize=20";
                }else{
                    mini.alert("叮咚，出现错误了！");
                }
            }
        });
    }

    function uploads(){
        var text = editor2.html();
        var adminid = '${admininfo.uid}';
        var title = mini.get('title').getValue();
        if(title == "" || title == null){
            mini.alert("请填写标题！");
            return;
        }
        $.ajax({
            url:"${path}/classescheck/getUpload",
            type:"post",
            data:{"text":text,"adminid":adminid,"title":title},
            async:false,
            scriptCharset: 'utf-8',
            success:function (text) {
                if (text=="ok"){
                    mini.alert("上传成功！");
                    location.reload();
                }
            }
        });
    }

    function cancelUp(){
        editor2.html("");
        mini.get('title').setValue("");
    }

</script>

</body>
</html>

