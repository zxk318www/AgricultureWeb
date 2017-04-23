<%--
  Created by IntelliJ IDEA.
  User: Zhangsnke
  Date: 2017/3/1
  Time: 13:36
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
        <div class="sz_fr" id="destoon_member" style="font-size: 15px">欢迎，<c:if test="${userinfo != null}"><c:if test="${userinfo.level eq 5 }"><a style="color: #7f2a0c;font-style: italic">尊贵的会员用户：</a></c:if>${img} ${userinfo.name}</c:if>
            <c:if test="${admininfo!=null}">${img} ${admininfo.name}</c:if>
            <a>->个人中心</a>|<a onclick="logout()" href="#">退出登录</a></div>
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
                <c:if test="${admininfo eq null && userinfo.id ne '11111'}"><a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toUserIndex">返回个人中心</a></c:if>
                <c:if test="${admininfo ne null }"><a style="float: right;margin-right: 72px;margin-top: 15px" href="${path}/logincheck/toAdminIndex">返回个人中心</a></c:if>
                <h2 style="color: #0B61A4;margin-left: 45%;margin-top: 50px">帖子中心</h2>
                <div style="padding:20px 50px 20px 50px;">
                    <div style="background:#FAFAFA;padding:10px 20px 10px 20px;line-height:24px;">
                        <div >
                            <div class="mini-toolbar" style="border-bottom:0;padding:0px;">
                                <table style="width:100%;">
                                    <tr>
                                        <td style="width:100%;">
                                            <a class="mini-button" iconCls="icon-add" onclick="show()">查看</a>
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
                        </div>
                        <div id="datagrid1" class="mini-datagrid" style="height:400px;"
                            <c:if test="${admininfo ne null}">url="${path}/Tiezicheck/findTieZi?op=1"</c:if>
                             <c:if test="${admininfo eq null}">url="${path}/Tiezicheck/findTieZi?op=2"</c:if>   idField="id" allowResize="true"
                            >
                            <div property="columns">
                                <div type="indexcolumn" ></div>
                                <div name="action" width="90px;" headerAlign="center" align="center" renderer="onActionRenderers" cellStyle="padding:0;" >操作</div>
                                <div field="type" width="120"  headerAlign="center" align="center" >帖子类型</div>
                                <div field="title" width="120" headerAlign="center"  showCellTip="false" align="center">标题</div>
                                <div field="stateStr" width="120" headerAlign="center"  showCellTip="false" align="center">状态</div>
                                <div field="content" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">大致内容</div>
                                <div field="uid" width="100" renderer="onGenderRenderer" align="center" headerAlign="center">发帖人</div>
                                <div field="num" width="100" renderer="onGenderRenderer" align="center"  allowSort="true" headerAlign="center">浏览数</div>
                                <div field="postdate" width="100" headerAlign="center" dateFormat="yyyy-MM-dd HH:mm" allowSort="true" align="center">发帖日期</div>
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


<div id="editWindow" class="mini-window" title="帖子编辑操作" style="width:500px;"
     showModal="true" allowResize="true" allowDrag="true">
    <div id="editform" class="form" >
        <input class="mini-hidden" name="id"/>
        <table style="width:100%;">
            <tr>
                <span style="color: #0B61A4;">您正在对帖子进行操作。。。</span>
            </tr>

            <tr>
                <hr style=" height:2px;border:none;border-top:2px dotted #185598;" />
                <hr style="height:10px;border:none;border-top:3px groove skyblue;" />
            </tr>

            <tr>
                <td style="width:120px;">操作的帖子编号：</td>
                <td style="width:150px;"><input class="mini-textbox" id="tid" readonly="readonly" disabled="disabled"></td>
            </tr>
            <tr>
                <td style="width:120px;">操作的帖子类型：</td>
                <td style="width:150px;"><input class="mini-textbox" id="type" readonly="readonly" disabled="disabled"></td>
            </tr>
            <tr>
                <td style="width:120px;">操作的帖子标题：</td>
                <td style="width:150px;"><input class="mini-textbox" id="name" readonly="readonly" disabled="disabled"></td>
            </tr>

            <tr>
                <td style="width:120px;">操作类型：</td>
                <td style="width:150px;"><input id="rankType1" class="mini-combobox" style="width:80px;" textField="typeValue" valueField="typeId"
                                                value="typeId" showNullItem="false" allowInput="false"  valueFromSelect="true" required="true"/></td>
            </tr>
            <tr>
                <td style="width:120px;">操作原因：</td>
                <td style="width:150px;"><input class="mini-textarea" id="yy" style="width: 100%;height: 100px" required="required"></td>
            </tr>
            <tr>
                <td style="text-align:right;padding-top:5px;padding-right:20px;" colspan="6">
                    <a class="Update_Button" href="javascript:updateTizi()">确定</a>
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
        var jsonData = [{'typeId':'1','typeValue':'帖子类型'},{'typeId':'2','typeValue':'帖子标题'},{'typeId':'3','typeValue':'帖子内容'},
            {'typeId':'4','typeValue':'发帖人'}];
        var jsonDatas = [{'typeId':'1','typeValue':'展示'},{'typeId':'2','typeValue':'驳回'},{'typeId':'3','typeValue':'整改'},{'typeId':'4','typeValue':'删除'}];
        mini.get('rankType').setData(jsonData);
        mini.get('rankType1').setData(jsonDatas);
        mini.get('rankType').setValue('1');

        <c:if test="${admininfo eq null}">
        var ms = '${userinfo.level}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
        </c:if>
        <c:if test="${admininfo ne null}">
        var ms = '${admininfo.id}';
        if(ms==null || ms ==""){
            mini.confirm("您长时间未操作，请选择确定重新登录","超时提示",function(){
                location.href="${path}/logincheck/tologin";
            });
        }
        </c:if>
    });

    //购物车列表操作
    function onActionRenderers(e){
        return '<span class="f_b f_orange"><a href="javascript:show()" style="color: #0b93d9">查看&nbsp;&nbsp;</a></span>'
                <c:if test="${admininfo ne null }">+'<span class="f_b f_orange"><a href="javascript:edit()" style="color: orangered">编辑&nbsp;&nbsp;</a></span>'</c:if>;
    }

    function search() {
        var rankType = mini.get('rankType').getValue();
        var key = mini.get("key").getValue();
        grid.load({key: key,rankType:rankType});
    }

    function show(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的帖子！");
            return;
        }
        location.href="${path}/Tiezicheck/gettiezi?id="+id+"&op=1&pageIndex=0&pageSize=20";
    }

    function logout(){
        var data = '${userinfo.uid}';
        var datas = '${admininfo.uid}';
        if(data ==""||data ==null){
            data = datas;
        }
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

    function edit(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
            newRow();
            mini.get('name').setValue(row.title);
            mini.get('tid').setValue(id);
            mini.get('type').setValue(row.type);
        }else{
            mini.alert("请选择要查看的帖子！");
            return;
        }

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

    function updateTizi(){
        var row = mini.get("datagrid1").getSelected();
        if(row){
            var id = row.id;
        }else{
            mini.alert("请选择要查看的帖子！");
            return;
        }
        var adminid = '${admininfo.uid}';
        var rank = mini.get('rankType1').getValue();
        var operate = null;
        if(rank == "1"){
            operate = "展示";
        }else if(rank == "2"){
            operate = "驳回";
        }else if(rank == "3"){
            operate = "整改";
        }else if(rank == "4"){
            operate = "删除";
        }
        var yy = mini.get('yy').getValue();
        $.ajax({
            url:"${path}/Tiezicheck/updateNoteandSysn",
            type:"post",
            scriptCharset: 'utf-8',
            data:{"id":id,"adminid":adminid,"rank":rank,"operate":operate,"yy":yy},
            success:function(text){
                if(text=="ok"){
                    mini.alert("操作成功，已经通知发帖用户！");
                    location.reload();
                }
            }
        });

    }
</script>