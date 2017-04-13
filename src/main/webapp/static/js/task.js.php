var destoon_userid = 0;
var destoon_username = '';
var destoon_message = 0;
var destoon_chat = 0;
var destoon_cart = substr_count(get_cookie('cart'), ',');
var destoon_member = '';
destoon_member += '欢迎，<span class="f_red">客人</span> | <a href="http://www.zlf168.com/member/login.php">请登录</a> | <a href="http://www.zlf168.com/member/register.php">免费注册</a> | <a href="http://www.zlf168.com/member/send.php">忘记密码?</a>';
$('#destoon_member').html(destoon_member);
$('#destoon_city').html('全国');
