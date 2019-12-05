<?php /*a:1:{s:71:"/home/wwwroot/lunwen.wit100.net/application/admin/view/login/index.html";i:1567238397;}*/ ?>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>登录页</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<link rel="shortcut icon" href="../favicon.ico" />
<link rel="icon" href="../animated_favicon.gif" type="image/gif" />
<link rel="stylesheet" type="text/css" href="/static/admin/css/purebox.css" />
<link rel="stylesheet" type="text/css" href="/static/admin/css/login.css" />
<script type="text/javascript" src="/static/admin/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="/static/admin/js/jquery.cookie.js"></script>
<script type="text/javascript" src="/static/admin/js/jquery.superslide.2.1.1.js"></script>
<script type="text/javascript" src="/static/admin/js/jquery.validation.min.js"></script>
<script type="text/javascript" src="/static/admin/js/lib_ecmobanfunc.js"></script>
<script type="text/javascript">


var process_request = "<i class='icon-spinner icon-spin'></i>";
var todolist_caption = "记事本";
var todolist_autosave = "自动保存";
var todolist_save = "保存";
var todolist_clear = "清除";
var js_select = "选择";
var js_selected = "已选择";
var todolist_confirm_save = "是否将更改保存到记事本？";
var todolist_confirm_clear = "是否清空内容？";
var start_data_notnull = "开始日期不能为空";
var end_data_notnull = "结束日期不能为空";
var data_invalid_gt = "输入的结束时间应大于起始日期";
var file_not_null = "上传文件不能为空";
var confirm_delete = "确定删除吗?";
var confirm_delete_fail = "删除失败";
var file_null = "请选择上传文件";
var title_name_one = "已完成更新，请关闭该窗口！";
var title_name_two = "正在更新数据中，请勿关闭该窗口！";
var user_name_empty = "管理员用户名不能为空!";
var password_empty = "密码不能为空!";
var password_invaild = "密码必须同时包含字母及数字且长度不能小于6!";
var email_empty = "Email地址不能为空!";
var email_error = "Email地址格式不正确!";
var pwd_confirm_empty = "确认密码不能为空";
var old_password_empty = "旧密码不能为空";
var old_password_error = "旧密码不正确";
var new_password_empty = "新密码不能为空";
var new_password_error = "密码长度不能小于六位";
var password_error = "两次输入的密码不一致!";
var captcha_empty = "您没有输入验证码!";
var username_password_error = "用户名或密码错误!";
</script>
<style>
.formText .captcha { position: absolute;right: 10px;top: 6px; border-left: 1px solid #e6e6e6;}
.formText .captcha img {height: 30px;cursor: pointer;}
.yzm{border-radius: 50px; overflow:hidden;}
</style>
</head>

<body>
	<div class="login-layout">
    	<div class="logo">
                	<img src="/static/admin/images/loginimg.png">
                </div>
        <form name='theForm' id="theForm" method="post" class="layui-form layui-form-pane">
            <div class="login-form" style="position: relative">
                <div class="formContent">
                	<div class="title">管理登录</div>
                    <div class="formInfo">
                    	<div class="formText">
                        	<i class="icon icon-user"></i>
                            <input type="text" name="username"  autocomplete="off" class="input-text layui-input" value="" placeholder="用户名" />
                        </div>
                        <div class="formText">
                        	<i class="icon icon-pwd"></i>
                                <input type="password" style="display:none"/> 
                            <input type="password" name="password" autocomplete="off" class="input-text layui-input" value="" placeholder="密  码" />
                        </div>
                        
                       
                           <div class="formText yzm">
                        	<i class="icon icon-pwd"></i>
                                <input type="text" name="vercode" id="captcha" lay-verify="required" placeholder="验证码" autocomplete="off" class="input-text layui-input">
                                <div class="captcha">
                                    <img src="<?php echo url('verify'); ?>" alt="captcha" onclick="this.src='<?php echo url("verify"); ?>?'+'id='+Math.random()"/>
                                </div>
                            </div>
                        
                        
                        <div class="formText submitDiv">
                                                        <span class="submit_span">
                            	<input style="border-radius: 50px;margin:0 auto;display: block;" type="submit"  name="submit" class="sub" value="登录" lay-submit lay-filter="login"/>
                            </span>
                                                        <input type="hidden" name="dsc_token" value="6ccc77694d90b55d7b075321afe29b7b" autocomplete="off" />
                        </div>
                    </div>
                </div>
                <div id="error" style="position: absolute;left:0px;bottom: 30px;text-align: center;width:395px;">

                </div>
            </div>
        </form>
    </div>
    <div id="bannerBox">
        <ul id="slideBanner" class="slideBanner">
            <li><img src="/static/admin/images/banner_1.jpg"></li>
            <li><img src="/static/admin/images/banner_2.jpg"></li>
            <li><img src="/static/admin/images/banner_3.jpg"></li>
            <li><img src="/static/admin/images/banner_4.jpg"></li>
            <li><img src="/static/admin/images/banner_5.jpg"></li>
        </ul>
    </div>
    <script type="text/javascript" src="/static/admin/js/jquery.purebox.js"></script>    <script type="text/javascript">
    	$("#bannerBox").slide({mainCell:".slideBanner",effect:"fold",interTime:3500,delayTime:500,autoPlay:true,autoPage:true,endFun:function(i,c,s){
			$(window).resize(function(){
				var width = $(window).width();
				var height = $(window).height();
				s.find(".slideBanner,.slideBanner li").css({"width":width,"height":height});
			});
		}});

        $(function(){
			$(".formText .input-text").focus(function(){
				$(this).parent().addClass("focus");
			});
			
			$(".formText .input-text").blur(function(){
				$(this).parent().removeClass("focus");
			});
			
			$(".checkbox").click(function(){
				if($(this).hasClass("checked")){
					$(this).removeClass("checked");
                    $('input[name=remember]').val(0);
				}else{
					$(this).addClass("checked");
                    $('input[name=remember]').val(1);
				}
			});
			
			$(".formText .input-yzm").focus(function(){
				$(this).prev().show();
			});
			
			$(".formText").blur(function(){
				$(this).prev().hide();
			});
			
            $('.submit_span .sub').on('click',function(){
                $('.code').show();
            });
           
			
			/* 判断浏览器是ie6 - ie8 后台不可以进入*/
			if(!$.support.leadingWhitespace){
				notIe();
			}
        });	
		
		
    </script>
    <script type="text/javascript" src="/static/plugins/layui/layui.js"></script>
<script>
    layui.use('form',function(){
        var form = layui.form,$ = layui.jquery;
        //监听提交
        form.on('submit(login)', function(data){
            loading =layer.load(1, {shade: [0.1,'#fff'] });//0.1透明度的白色背景
            $.post('<?php echo url("login/index"); ?>',data.field,function(res){
				console.log(res);
                layer.close(loading);
                if(res.status == 1){
                    layer.msg(res.msg, {icon: 1, time: 1000}, function(){
                        location.href = "<?php echo url('index/index'); ?>";
						console.log(res.url);
                    });
                }else{
                    $('#captcha').val('');
                    layer.msg(res.msg, {icon: 2, anim: 6, time: 1000});
                    $('.captcha img').attr('src','<?php echo url("verify"); ?>?id='+Math.random());
                }
            });
            return false;
        });
    });
</script>

</body>
</html>

