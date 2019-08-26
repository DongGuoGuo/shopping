<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin登录账户</title>
    <link rel="stylesheet" type="text/css" href="../css/login.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/base.css" charset="utf-8"/>
    <meta http-equiv="description" content="ajax方式">
    <script src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        function login() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/admin/adminlogin" ,//url
                data: $('#form').serialize(),
                success: function (result) {
                    if(result.result){
                        window.location.href="/admin/manage";
                    }else {
                        alert(result.msg);
                    }
                },
                error : function() {
                    alert("网络连接异常！");
                }
            });
        }
    </script>

</head>
<body>

<div id="login-container" class="w">
    <!--登录注册部分开始-->
    <div class="login">
        <p class="pass-from-logo">管理员登录</p>
        <form name="form" id="form" onsubmit="return false" action="##" 保存用户>
            <input type="text" name="username" placeholder=" 用户名/邮箱" id="username">
            <input type="text" name="password" placeholder=" 登录密码" id="userpw">
            <div class="btn-div">
                <input onclick="login()" class="btn-login fl" type="button" value="登  录">
                <input class="btn-reset fr" type="reset" value="重  置">
            </div>
        </form>
        <p class="tishi">我没有帐号，<a href="/transpond/register" class="zhuce">请点击这里注册</a></p>
    </div>
    <!--登录注册部分结束-->
</div>
</body>
</html>
