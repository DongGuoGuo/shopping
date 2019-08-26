<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<%--<%!JSON json;%>--%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>搜索</title>
    <link rel="stylesheet" href="../css/search.css">
    <script language="javascript" src="../js/jquery-3.3.1.js"></script>
    <script language="javascript" src="../js/jquery.cookie.js"></script>
    <script language="javascript" src="../js/util.js"></script>
    <meta http-equiv="description" content="ajax方式">

    <script>
        $(function(){
            idLogin();
        });
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
                    "                    <a href=\"/transpond/gouwuche\">\n" +
                    "                        <span class=\"bg-pic shopCar-pic\"></span>\n" +
                    "                        <span>购物车</span>\n" +
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
                    "                    </a>\n" +
                    "                </li>\n" +
                    "            </ul>"
            }

            add("top-nav",ch);
        }


        function logout() {
            $.ajax({
                //几个参数需要注意一下
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/UserController/logout" ,//url
                success: function (result) {
                    if(result.result){
                        alert(result.msg);
                        idLogin();
                    }else {
                        alert("用户登出失败");
                    }
                },
                error : function() {
                    alert("网络连接异常！");
                }
            });
        }
    </script>

    <script type="text/javascript">
        $(function(){
            $("#key").val($.cookie('key'));
            sousuo();
            // $.removeCookie('key');
        });

        function showxiangxi(id){
            $.cookie('id',id);
            window.location.href="/transpond/show";
        }


        function sousuo() {
            var key = $("#key").val();
            if(key==""){

            }else {
                $.ajax({
                    //几个参数需要注意一下
                    type: "GET",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/goodsController/sousuo?key=" + $("#key").val(),//url
                    success: function (result) {

                        //取出后端传过来的list值
                        var chargeRuleLogs = result.data
                        //对list值进行便利
                        if (!chargeRuleLogs.result) {
                             var rowTr = document.getElementById("uu");
                            //找到html的tr节点
                            rowTr.className = "uu";

                            var ch = "";
                            var i = 0;
                            $.each(chargeRuleLogs, function (index, n) {
                                if (i == 4) {
                                    i = 0;
                                }
                                switch (i) {
                                    case 0:
                                        ch=ch+" <li class=\"a\">\n" +
                                            "            <ul  class =\"hang\">\n";
                                        ch = ch + "<li class=\"lie\">\n" +
                                            "                    <div class=\"element\">\n" +
                                            "                        <div class=\"tupian\">\n" +
                                            "                            <img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"wenzi\">\n" +
                                            "                            <div class=\"mingzi\" >\n" +
                                            "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                            chargeRuleLogs[index].goods_id +
                                            ")\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a>\n" +
                                            "                            </div>\n" +
                                            "                            <div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div>\n" +
                                            "                        </div>\n" +
                                            "                    </div>\n" +
                                            "                </li>\n"
                                        break;
                                    case 1:
                                        ch = ch + "<li class=\"lie\">\n" +
                                            "                    <div class=\"element\">\n" +
                                            "                        <div class=\"tupian\">\n" +
                                            "                            <img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"wenzi\">\n" +
                                            "                            <div class=\"mingzi\" >\n" +
                                            "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                            chargeRuleLogs[index].goods_id +
                                            ")\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a>\n" +
                                            "                            </div>\n" +
                                            "                            <div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div>\n" +
                                            "                        </div>\n" +
                                            "                    </div>\n" +
                                            "                </li>\n"
                                        break;

                                    case 2:
                                        ch = ch + "<li class=\"lie\">\n" +
                                            "                    <div class=\"element\">\n" +
                                            "                        <div class=\"tupian\">\n" +
                                            "                            <img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"wenzi\">\n" +
                                            "                            <div class=\"mingzi\" >\n" +
                                            "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                            chargeRuleLogs[index].goods_id +
                                            ")\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a>\n" +
                                            "                            </div>\n" +
                                            "                            <div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div>\n" +
                                            "                        </div>\n" +
                                            "                    </div>\n" +
                                            "                </li>\n"
                                        break;
                                    case 3:
                                        ch = ch + " <li class=\"lie\">\n" +
                                            "                    <div class=\"element\">\n" +
                                            "                        <div class=\"tupian\">\n" +
                                            "                            <img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img>\n" +
                                            "                        </div>\n" +
                                            "                        <div class=\"wenzi\">\n" +
                                            "                            <div class=\"mingzi\" >\n" +
                                            "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                            chargeRuleLogs[index].goods_id +
                                            ")\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a>\n" +
                                            "                            </div>\n" +
                                            "                            <div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div>\n" +
                                            "                        </div>\n" +
                                            "                    </div>\n" +
                                            "                </li>\n" +
                                            "\n" +
                                            "            </ul>\n" +
                                            "        </li>";
                                        break;



                                    default:
                                        break;
                                }
                                i++;
                            });
                            if (i == 4) {
                                ch = ch + "\n</ul>\n" +
                                    "        </li>";
                            }
                            //将要展示的信息写入页面
                            rowTr.innerHTML = ch
                            showshow();
                            //将信息追加
                            // $(".table_node").append(rowTr)
                        } else {
                            alert(chargeRuleLogs.msg);
                        }
                    },
                    error: function () {
                        alert("网络连接异常！");
                    }
                });
            }
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
    <div class="search-wrap">
        <div class="search-con">
            <div class="logo-box">
                <div class="logo1"></div>
                <div class="logo2"></div>
            </div>
            <div class="search-box">
                <div class="search-t">
                    <div class="search-panel">
                        <a href="#" class="sousuo"></a>


                        <form name="form" id="form" onsubmit="return false" action="##">
                            <div class="btn">
                                <button class="submit" onclick="sousuo()" type="button">搜索</button>
                            </div>
                            <div class="search-inp-box">
                                <div class="search-inp">
                                    <input type="text" name="key" id="key">
                                </div>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--导航条-->
</div>
<div id="body">
    <div id="mydiv1"></div>
    <ul id='uu'>




        <%--<li class="a">--%>
            <%--<ul  class ="hang">--%>

                <%--<li class="lie">--%>
                    <%--<div class="element">--%>
                        <%--<div class="tupian">--%>
                            <%--<img class="tu" src="../tupian/1.jpg"></img>--%>
                        <%--</div>--%>
                        <%--<div class="wenzi">--%>
                            <%--<div class="mingzi" >--%>
                                <%--<a href="#" onclick="showxiangxi(1)" >马达加斯加1马达加斯加1马达加斯加1马</a>--%>
                            <%--</div>--%>
                            <%--<div class="price">￥：马达加斯加2</div>--%>
                        <%--</div>--%>
                    <%--</div>--%>
                <%--</li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a--%>

                        <%--href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a--%>

                        <%--href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a--%>

                        <%--href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>
            <%--</ul>--%>
        <%--</li>--%>


    </ul>
</div>
<script>
    $(function () {
        showshow();
    })
    function showshow() {
        $(function () {
            $(".mingzi").mouseover(function () {
                $("#mydiv1").css("left", event.clientX);
                $("#mydiv1").css("top", event.clientY + 10);
                $("#mydiv1").show();
            })
            $(".mingzi").mouseout(function () {
                $("#mydiv1").hide();
            })
            $("#uu > li:nth-child(1) > ul > li").hover(function () {
                $("#mydiv1").text($(this).find("a").text());

            },function() {

            })
        })
    }
</script>
</body>

</html>