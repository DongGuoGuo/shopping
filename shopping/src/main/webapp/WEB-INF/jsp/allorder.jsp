<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" type="text/css" href="../css/allorder.css" charset="utf-8"/>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/util.js"></script>
    <title>我的订单</title>    <script>
    $(function(){
        idLogin();
    });


    function logout() {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/UserController/logout" ,//url
            success: function (result) {
                if(result.result){
                    alert(result.msg);
                    window.location.href="/transpond/index";
                }else {
                    alert("用户登出失败");
                }
            },
            error : function() {
                alert("网络连接异常！");
            }
        });
    }

    function idLogin() {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/goodsController/isLogin",//url
            success: function (result) {
                x(result.result,result.data);
            },
            error: function () {
                alert("网络连接异常！");
            }
        });
    }

    function x(flag,username) {
        var ch="";
        if(flag){
            ch=ch+"\n" +
                "            <ul class=\"top-nav-1\">\n" +
                "                <li class=\"top-nav-menu china\">\n" +
                "                    <span class=\"bg-pic xsj-pic\"></span>\n" +
                "                </li>\n" +
                "                <li class=\"top-nav-menu login-sign\">\n" +
                "                    <a href=\"/transpond/xiugai\" class=\"login\"> 欢迎 " +
                username +
                "</a>\n" +

                "                </li>\n" +
                "            </ul>\n";

            ch=ch+"   <ul class=\"top-nav-r\">\n" +
                "                <li class=\"top-nav-menu shop-car\">\n"+
                "                    <a href=\"#\"  onclick=\"logout()\">\n" +
                "                        <span class=\"bg-pic shopCar-pic\"></span>\n" +
                "                        <span>退出登录</span>\n" +
                "                    </a>\n" +
                "                </li>\n" +
                "            </ul>"
        }else {
            ch=ch+"\n" +
                "            <ul class=\"top-nav-1\">\n" +
                "                <li class=\"top-nav-menu china\">\n" +
                "                    <span class=\"bg-pic xsj-pic\"></span>\n" +
                "                </li>\n" +
                "                <li class=\"top-nav-menu login-sign\">\n" +
                "                    <a href=\"/transpond/login\" class=\"login\">亲，请登录</a>\n" +
                "                    <a href=\"/transpond/register\" class=\"sign\">免费注册</a>\n" +
                "                </li>\n" +
                "            </ul>\n";


            ch=ch+"   <ul class=\"top-nav-r\">\n" +
                "                <li class=\"top-nav-menu shop-car\">\n" +
                "                    <a href=\"/transpond/gouwuche\">\n" +
                "                        <span class=\"bg-pic shopCar-pic\"></span>\n" +
                "                        <span>购物车</span>\n" +
                "                    <a href=\"/transpond/allorder\">\n" +
                "                        <span class=\"bg-pic shopCar-pic\"></span>\n" +
                "                        <span>我的订单</span>\n" +
                "                    </a>\n" +
                "                    </a>\n" +
                "                </li>\n" +
                "            </ul>"
        }

        add("top-nav",ch);
    }
</script>
</head>
<body>
<div class="wrapper">
    <!--导航条+ad-->
    <div class="top-nav-wrap">
        <div class="top-nav" id="top-nav">
            <%--添加导航条--%>



        </div>
        <div class="ad-wrap">
            <div class="ad">
                <img src="../images/top.jpg" alt="">
            </div>
        </div>
    </div>
</div>
<div class="order-container">
    <ul class="order" id="order">



    </ul>

</div>

<script>
    $(function () {
        all()
    });

    function all() {
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/ShoppingcartController/findAll" ,//url
            success: function (result) {
                if(result.result){
                    var ch="";
                    var data = result.data;
                    $.each(data, function (index, n) {
                        if(data[index].cart_is=="Y"){
                            ch=ch+"<li>\n" +
                                "            <div class=\"order-div\">\n" +
                                "                <p class=\"order-top\">订单号：" +
                                data[index].cart_id +
                                "</p>\n" +
                                "                <div>\n" +
                                "                    <img class=\"goods_img\" src=\"" +
                                data[index].goods_img +
                                "\"><p class=\"mingzi\">" +
                                data[index].goods_name +
                                "</p><p class=\"number\">数量：" +
                                data[index].goods_amount +
                                "</p><p class=\"price\">￥：<span class=\"span-price\">" +
                                data[index].goods_price +
                                "</span></p><p class=\"status\">状态：已完成</p>\n" +
                                "                </div>\n" +
                                "            </div>\n" +
                                "        </li>\n" +
                                "        ";

                        }else {
                            ch=ch+"<li>\n" +
                                "            <div class=\"order-div\">\n" +
                                "                <p class=\"order-top\">订单号：" +
                                data[index].cart_id +
                                "</p>\n" +
                                "                <div>\n" +
                                "                    <img class=\"goods_img\" src=\"" +
                                data[index].goods_img +
                                "\"><p class=\"mingzi\">" +
                                data[index].goods_name +
                                "</p><p class=\"number\">数量：" +
                                data[index].goods_amount +
                                "</p><p class=\"price\">￥：<span class=\"span-price\">" +
                                data[index].goods_price +
                                "</span></p><p class=\"status\">状态：未完成</p>\n" +
                                "                </div>\n" +
                                "            </div>\n" +
                                "        </li>\n" +
                                "        ";
                        }
                    });
                    // alert(ch)
                    add("order",ch);
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

</body>
</html>