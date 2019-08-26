<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="../css/gouwuche.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
    <script type="text/javascript" src="../js/util.js" ></script>
    <script>
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
                    "                <li class=\"top-nav-menu shop-car\">\n" +
                    "                    <a href=\"/transpond/allorder\">\n" +
                    "                        <span class=\"bg-pic shopCar-pic\"></span>\n" +
                    "                        <span>我的订单</span>\n" +
                    "                    </a>\n" +
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

        function pays() {
            var i = 0;
            var b = new Array();
            var c = new Array();

            $(".mingzi").each(function (i) {
                var n = $(".mingzi:eq(" + i + ")").index();
                b[i] = $(".mingzi:eq(" + i + ")").text();
            })
            i = 0;
            $(".shuliang").each(function (i) {
                var n = $(".shuliang:eq(" + i + ")").index();
                c[i] = $(".shuliang:eq(" + i + ")").text();
            })

            var b1 = b.toString();
            var c1 = c.toString();

            $.ajax({
                type: "POST",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/ShoppingcartController/pay",//url
                data: {"b": b1, "c": c1},
                success: function (result) {
                    if (result.result) {
                        alert(result.msg);
                        location.reload();
                        window.location.href = "/transpond/allorder";
                    }
                },
                error: function () {
                    alert("网络连接异常！");
                }
            });
        }

    </script>
</head>
<body>
<div class="wrapper">
    <!--导航条+ad-->
    <div class="top-nav-wrap">
        <div class="top-nav" id="top-nav">


        </div>
        <div class="ad-wrap">
            <div class="ad">
                <img src="../images/top.jpg" alt="">
            </div>
        </div>
    </div>
    <!--搜索区域-->

    <!--导航条-->
</div>
<!--购物车-->
<div class="addGoods">
    <div class="goods_list">
        <ul id="goodslistul">
           <%--动态添加购物车--%>

        </ul>
        <div class="pay" id="pay">
            <%--共计<span class="totalNum">0</span>件--%>
            <%--<p>总价¥<span class="totalPrice">0</span></p><button type="submit">去付款</button>--%>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        click();
    });
    function click() {
        //点击增加按钮触发事件
        $(".plus").click(function(){
            var num = $(this).parent().children("span");
            //单品数量增加
            num.text(parseInt(num.text())+1);
            //商品总数增加
            var totalNum = parseInt($(".totalNum").text());
            totalNum++
            $(".totalNum").text(totalNum);
            //计算总价
            var goods_price = parseInt($(this).parent().parent().children(".goods_price").text());
            $(".totalPrice").text(parseInt($(".totalPrice").text())+goods_price);
        });

        //点击减少按钮触发事件
        $(".minus").click(function(){
            var num = $(this).parent().children("span");
            if(parseInt(num.text())>1){
                num.text(parseInt(num.text())-1);
                var totalNum = parseInt($(".totalNum").text());
                totalNum--
                $(".totalNum").text(totalNum);
                var goods_price = parseInt($(this).parent().parent().children(".goods_price").text());
                $(".totalPrice").text(parseInt($(".totalPrice").text())-goods_price);
            } else{
                num.text("1");
            }
        });
    }
</script>

<script type="text/javascript">
    $(function () {
        query("1");
    });
    function query(name) {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/ShoppingcartController/findAll1?user_name="+name,//url
            success: function (result) {
                if(result.result){
                    var ch="";
                    var shuliang=0;
                    var zongjia=0;
                    var data = result.data;
                    $.each(data, function (index, n) {
                        ch=ch+" <li><img class=\"goods_img\" src=\"" +
                            data[index].goods_img +
                            "\"><p class=\"mingzi\">" +
                            data[index].goods_name +
                            "</p>\n" +
                            "                <div class=\"goods_bottom\">¥<span class=\"goods_price\">" +
                            data[index].goods_price +
                            "</span><div class=\"num\"><img class=\"minus\" src=\"../images/jianhao.jpg\" /><span  class=\"shuliang\">" +
                            data[index].goods_amount +
                            "</span><img class=\"plus\" src=\"../images/jiahao.jpg\"></div></div></li>";

                        shuliang=parseFloat(shuliang)+ parseFloat(data[index].goods_amount);
                        zongjia=parseFloat(zongjia)+(parseFloat(data[index].goods_amount))*parseFloat(data[index].goods_price);
                        // alert("shuliang"+shuliang)
                        // alert("zongjia"+zongjia)
                    });

                    add("goodslistul",ch);

                    ch="";
                    ch=ch+" 共计<span class=\"totalNum\">" +
                        shuliang +
                        "</span>件\n" +
                        "            <p>总价¥<span class=\"totalPrice\">" +
                        zongjia +
                        "</span></p><button  type=\"button\" onclick=\"pays()\">去付款</button>";
                    add("pay",ch);
                    click();
                    // pays();
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