<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>注册的页面</title>
    <link rel="stylesheet" type="text/css" href="../css/register.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/base.css" charset="utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta http-equiv="description" content="ajax方式">
    <script src="../js/jquery-3.3.1.js"></script>
    <script type="text/javascript">
        //onblur失去焦点的值
        function checkIt(){
            //获取文本框的值
            var username=document.getElementById("username").value;
            $.ajax({
                //几个参数需要注意一下
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/checkUserisExist/checkUsername?username="+username,//url
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
                    }else {
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
        function checkIt2(){
            //获取文本框的值
            var email=document.getElementById("email").value;
            $.ajax({
                //几个参数需要注意一下
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/checkUserisExist/checkEmail?email="+email,//url
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
                    }else {
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }

        function register() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/disIntercept/register" ,//url
                data: $('#from_register').serialize(),
                success: function (result) {
                    if(result.result){
                        window.location.href="/disIntercept/toLogin";
                    }else {
                        alert(result.msg);
                    }
                },
                error : function() {
                    alert("异常！");
                }
            });
        }
    </script>
</head>

<body  id="register-container">
<div class ="register">
<div align="center">
    <label class="font">欢&emsp;迎&emsp;您&emsp;的&emsp;加&emsp;入</label>
</div>

<div align="center">
    <form id="from_register" action="" method="post">
        <div class="input_div">
            <label>&emsp;用户名:</label>
            <input type="text" class="input_text" name="username"  id="username" onblur="checkIt()"/>
        </div>
        <div class="input_div">
            <label>密&emsp;&emsp;码: </label>
            <input type="text" class="input_text" name="password"/>
        </div>
        <div class="input_div">
            <label>确认密码: </label>
            <input type="text" class="input_text" name="password1"/>
        </div>
        <div class="input_div">
            <label>昵&emsp;&emsp;称: </label>
            <input type="text" class="input_text" name="nickname"/>
        </div>
        <div class="input_div">
            <label>邮&emsp;&emsp;箱: </label>
            <input type="text" class="input_text" name="email"  id="email" onblur="checkIt2()"/>
        </div>

        <div class="btn-div">
            <input type="button" value="注册" class="btn-login fl" onclick="register()">&emsp;&emsp;
            <input type="reset" value="重置" class="btn-login fr">
        </div>
    </form>

</div>
</div>
</body>
</html>