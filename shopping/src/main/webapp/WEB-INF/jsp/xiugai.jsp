<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>information alter</title>
    <link rel="stylesheet" type="text/css" href="../css/xiugai.css" charset="utf-8"/>
    <link rel="stylesheet" type="text/css" href="../css/base.css" charset="utf-8"/>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/util.js"></script>

</head>
<body id="body">
<div class="alter-container" style="margin-top: 85px">
        <label id="biaoti">
            您的基础信息
        </label>

    <div id="adddiv">
        <%--<div class="input_div">--%>
            <%--<label class="key">&emsp;会员名:</label>--%>
            <%--<label class="value"> 1233</label>--%>
            <%--<a  id="gaimima" class="url" href="#">修改密码</a>--%>
        <%--</div>--%>
        <%--<div class="input_div">--%>
            <%--<label class="key">登录邮箱:</label>--%>
            <%--<label class="value"> @qq.com</label>--%>
            <%--<a id="gaiyouxiang" class="url" href="#">修改邮箱</a>--%>
        <%--</div>--%>
    </div>

        <div class="mimaxiugai">
            <form name="mima" id="mima">
                <p class="duan">  <input  class="wenbenkuang" id="jiu" name="jiu" type="text" placeholder=" 旧密码"></p>
                <p class="duan" > <input class="wenbenkuang" id="xin" name="xin"  type="text" placeholder=" 新密码"></p>
            </form>
            <div class="buttondiv">
                    <input  id="button1" onclick="tijiaomima()" type="button" value="提  交">
                    <input  id="button2" type="reset" value="重  置">
            </div>
        </div>
    <div class="youxiangxiugai">
        <form id="xiugaiemail">
            <p class="duan">  <input  class="wenbenkuang" id="newemail" name="newemail" type="text" placeholder=" 新邮箱"></p>
            <p class="duan" > <input class="wenbenkuang"  id="code" name="code" type="text" placeholder=" 原邮箱验证码"></p>
        </form>
        <div class="buttondiv">
            <input  id="button3" onclick="tijiao()" type="button"  value="提  交">
            <input  id="button5" onclick="getcode()"  type="button" value="获取验证码">
            <input  id="button4" type="reset" value="重  置">
        </div>
    </div>
    <script>
        function tijiao() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/UserController/gerenEmail" ,//url
                data: $('#xiugaiemail').serialize(),
                // data: {"username":username,"password":password,"id":"123456789"},
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
                    }else {
                        alert(result.msg);
                    }
                },
                error : function() {
                    alert("网络连接异常！");
                }
            });
        }
        function tijiaomima() {
            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/UserController/xiugaimima" ,//url
                data: $('#mima').serialize(),
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
                    }else {
                        alert(result.msg);
                    }
                },
                error : function() {
                    alert("网络连接异常！");
                }
            });
        }
        function getcode() {
            $.ajax({
                //几个参数需要注意一下
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/UserController/getEmailCode" ,//url
                data: $('#form').serialize(),
                // data: {"username":username,"password":password,"id":"123456789"},
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
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
    <script>
        $(document).ready(function() {
            $("#gaimima").click(function () {
                $(".mimaxiugai").show(500);
            })
            $("#button1").mouseover(function () {
                $("#button1").attr(
                    "style", "box-shadow:5px 5px 10px rgba(0,0,0,0.5);"
                )
            })
            $("#button1").mouseout(function () {
                $("#button1").attr(
                    "style", "box-shadow:0px 0px 0px rgba(0,0,0,0.5);"
                )
            })
            $("#button2").mouseover(function () {
                $("#button2").attr(
                    "style", "box-shadow:5px 5px 10px rgba(0,0,0,0.5);"
                )
            })
            $("#button2").mouseout(function () {
                $("#button2").attr(
                    "style", "box-shadow:0px 0px 0px rgba(0,0,0,0.5);"
                )
            })
            $("#button1").click(function () {
                $(".mimaxiugai").hide(500);
            })
            $("#gaiyouxiang").click(function () {
                $(".youxiangxiugai").show(500);
            })
            $("#button3").click(function () {
                $(".youxiangxiugai").hide(500);
            })

        })
        function x() {
            $("#gaimima").click(function () {
                $(".mimaxiugai").show(500);
            })
            $("#button1").mouseover(function () {
                $("#button1").attr(
                    "style", "box-shadow:5px 5px 10px rgba(0,0,0,0.5);"
                )
            })
            $("#button1").mouseout(function () {
                $("#button1").attr(
                    "style", "box-shadow:0px 0px 0px rgba(0,0,0,0.5);"
                )
            })
            $("#button2").mouseover(function () {
                $("#button2").attr(
                    "style", "box-shadow:5px 5px 10px rgba(0,0,0,0.5);"
                )
            })
            $("#button2").mouseout(function () {
                $("#button2").attr(
                    "style", "box-shadow:0px 0px 0px rgba(0,0,0,0.5);"
                )
            })
            $("#button1").click(function () {
                $(".mimaxiugai").hide(500);
            })
            $("#gaiyouxiang").click(function () {
                $(".youxiangxiugai").show(500);
            })
            $("#button3").click(function () {
                $(".youxiangxiugai").hide(500);
            })
        }
    </script>

</div>
<script>
    $(function () {
        var ch="";
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/UserController/getxinxi" ,//url
            success: function (result) {
                if(result.result){
                    alert(result.data.username)
                    ch=ch+"<div class=\"input_div\">\n" +
                        "            <label class=\"key\">&emsp;会员名:</label>\n" +
                        "            <label class=\"value\">" +
                        result.data.username +
                        "</label>\n" +
                        "            <a  id=\"gaimima\" class=\"url\" href=\"#\">修改密码</a>\n" +
                        "        </div>\n" +
                        "        <div class=\"input_div\">\n" +
                        "            <label class=\"key\">登录邮箱:</label>\n" +
                        "            <label class=\"value\"> " +
                        result.data.email +
                        "</label>\n" +
                        "            <a id=\"gaiyouxiang\" class=\"url\" href=\"#\">修改邮箱</a>\n" +
                        "        </div>";

                    add("adddiv",ch)
                    x();
                }else {
                    alert(result.msg);
                }
            },
            error : function() {
                alert("网络连接异常！");
            }
        });

    })
</script>
</body>
</html>