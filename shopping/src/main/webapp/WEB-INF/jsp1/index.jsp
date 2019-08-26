<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物商城</title>
    <link rel="stylesheet" href="../css/index.css">
    <meta http-equiv="description" content="ajax方式">
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/util.js"></script>

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

    </script>


</head>
<body>
<div class="wrapper">
    <!--导航条+ad-->
    <div class="top-nav-wrap">
        <div class="top-nav" id="top-nav">

            <%--<ul class="top-nav-1">--%>
                <%--<li class="top-nav-menu china" >--%>
                    <%--<span class="c-span">中国大陆</span>--%>
                    <%--<span class="bg-pic xsj-pic"></span>--%>
                <%--</li>--%>
                <%--<li class="top-nav-menu login-sign">--%>
                    <%--<a href="/transpond/login" class="login">亲，请登录</a>--%>
                    <%--<a href="/transpond/register" class="sign">免费注册</a>--%>
                <%--</li>--%>
            <%--</ul>--%>

            <%--<ul class="top-nav-r">--%>
                <%--<li class="top-nav-menu shop-car">--%>
                    <%--<a href="/transpond/gouwuche">--%>
                        <%--<span class="bg-pic shopCar-pic"></span>--%>
                        <%--<span>购物车</span>--%>
                    <%--</a>--%>
                    <%--<a href="/transpond/gouwuche">--%>
                        <%--<span class="bg-pic shopCar-pic"></span>--%>
                        <%--<span>退出登录</span>--%>
                    <%--</a>--%>
                <%--</li>--%>
            <%--</ul>--%>
        </div>
        <div class="ad-wrap">
            <div class="ad">
                <img src="https://gw.alicdn.com/tfs/TB1Wht3NW6qK1RjSZFmXXX0PFXa-1190-460.jpg" alt="">
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

                        <form name="form" id="form" onsubmit="return false" action="##">
                            <div class="btn">
                                <button class="submit" onclick="onclick1()" type="button">搜索</button>
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
    <!--导航条-->
    <div class="screen-nav">
        <div class="screen-nav-con">
            <h2>热卖商品</h2>

        </div>
    </div>
    <!--图片主体展示部分-->
    <div class="screen-box">
        <div class="main">
            <div class="main-inner">
                <div class="inner-content">
                    <!--    list-->
                    <div id="body">
                        <ul id='uu' class="uu">

                            <%--<li class="a">--%>
                                <%--<ul class="hang">--%>
                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/2.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/3.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/2.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>
                                <%--</ul>--%>
                            <%--</li>--%>


                            <%--<li class="a">--%>
                                <%--<ul class="hang">--%>
                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/4.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/3.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/2.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                    <%--<li class="lie">--%>
                                        <%--<div class="element">--%>
                                            <%--<div class="tupian"><img class="tu" src="../tupian/2.jpg"></img></div>--%>
                                            <%--<div class="wenzi">马达加斯加1</div>--%>
                                        <%--</div>--%>
                                    <%--</li>--%>

                                <%--</ul>--%>
                            <%--</li>--%>

                        </ul>
                    </div>
                </div>
                <div class="inner-right">
                    <a href="#">
                        <img src="淘宝/qiu.jpg" alt="">
                    </a>

                </div>
            </div>
        </div>
        <div class="col-right">
            <div class="member">
                <div class="member-head">
                    <div class="header">
                        <a href="#"></a>
                    </div>
                    <span class="info">hi 你好</span>
                    <%--<p>--%>
                    <%--<a href="#" class="icon">--%>
                        <%--<span></span>--%>
                        <%--领淘金币抵钱--%>
                    <%--</a>--%>
                    <%--<a href="#" class="club">--%>
                        <%--<span></span>--%>
                        <%--会员俱乐部--%>
                    <%--</a>--%>
                <%--</p>--%>
                </div>
                <%--<div class="member-foot">--%>
                    <%--<a href="/transpond/login" class="login">登录</a>--%>
                    <%--<a href="/transpond/register">注册</a>--%>
                    <%--<a href="#">开店</a>--%>
                <%--</div>--%>
            </div>
            <div class="message">
                <a href="#">
                    网上有害信息举报
                    <span></span>
                </a>
            </div>

            <div class="notice">
                <!--选项卡-->
                <div id="tab">
                    <!--选项的头部-->
                    <div id="tab-header">
                        <ul>
                            <li class="selected">企业</li>
                            <li>社会</li>
                            <li>国内</li>
                            <li>国际</li>
                            <!--<li>技术</li>-->
                        </ul>
                    </div>
                    <!--主要内容-->
                    <div id="tab-content" class="tab-content">

                        <div class="dom" style="display: block;">
                            <ul>
                            </ul>
                        </div>
                        <div class="dom">
                            <ul>
                            </ul>
                        </div>
                        <div class="dom">
                            <ul>
                            </ul>
                        </div>
                        <div class="dom">
                            <ul>
                            </ul>
                        </div>

                    </div>
                </div>


            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        aaa();
    });
    function aaa() {
// 拿到所有的标题(li标签) 和 标题对应的内容(div)
        var titles = $('tab-header').getElementsByTagName('li');
        var divs = $('tab-content').getElementsByClassName('dom');
        // 判断
        if (titles.length != divs.length) return;
        // 遍历
        for (var i = 0; i < titles.length; i++) {
            // 取出li标签
            var li = titles[i];
            li.id = i;
            //        console.log(li);
            // 监听鼠标的移动
            li.onmousemove = function () {
                for (var j = 0; j < titles.length; j++) {
                    titles[j].className = '';
                    divs[j].style.display = 'none';
                }
                this.className = 'selected';
                divs[this.id].style.display = 'block';
            }
        }
        function $(id) {
            return typeof id === 'string' ? document.getElementById(id) : id;
        }
    }
</script>
<script type="text/javascript">

    $(function(){
        resuo();
        allnew();
        aaa();
    });

    function onclick1() {
        $.cookie('key', $("#key").val());
        window.location.href = "/transpond/search";
    }

    function resuo() {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/goodsController/resou",//url
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
                                ch = ch + "<li class=\"a\">\n" +
                                    "            <ul  class =\"hang\">\n" +
                                    "                <li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                    chargeRuleLogs[index].goods_img +   //图片
                                    "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onclick=\"showxiangxi1(" +
                                    chargeRuleLogs[index].goods_id +
                                    ")\" onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1')\" href=\"#\" >" +
                                    chargeRuleLogs[index].goods_name +  //标题
                                    "</a></div><div class=\"price\">￥：" +
                                    chargeRuleLogs[index].goods_price +  //价格
                                    "</div></div></div></li>";
                                break;
                            case 1:
                                ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                    chargeRuleLogs[index].goods_img +
                                    "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onclick='showxiangxi1(" +
                                    chargeRuleLogs[index].goods_id +
                                    ")' onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \" href=\"#\" >" +
                                    chargeRuleLogs[index].goods_name +
                                    "</a></div><div class=\"price\">￥：" +
                                    chargeRuleLogs[index].goods_price +
                                    "</div></div></div></li>\n"
                                break;

                            case 2:
                                ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                    chargeRuleLogs[index].goods_img +
                                    "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onclick='showxiangxi1(" +
                                    chargeRuleLogs[index].goods_id +
                                    ")' onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \" href=\"#\" >" +
                                    chargeRuleLogs[index].goods_name +
                                    "</a></div><div class=\"price\">￥：" +
                                    chargeRuleLogs[index].goods_price +
                                    "</div></div></div></li>\n"

                                break;
                            case 3:
                                ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                    chargeRuleLogs[index].goods_img +
                                    "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onclick='showxiangxi1(" +
                                    chargeRuleLogs[index].goods_id +
                                    ")' onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \" href=\"#\" >" +
                                    chargeRuleLogs[index].goods_name +
                                    "</a></div><div class=\"price\">￥：" +
                                    chargeRuleLogs[index].goods_price +
                                    "</div></div></div></li>\n" +
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
                } else {
                    alert(chargeRuleLogs.msg);
                }
            },
            error: function () {
                alert("网络连接异常！");
            }
        });

    }
    function showxiangxi1(id){
        $.cookie('id',id);
        window.location.href="/transpond/show";
    }




    function allnew() {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/goodsController/news",//url
            success: function (result) {
                if(result.result){
                    //取出后端传过来的list值
                    var chargeRuleLogs = result.data


                    //对list值进行便利
                    var child="";
                    $.each(chargeRuleLogs, function (index, n) {
                        var josn = chargeRuleLogs[index];
                        // alert(chargeRuleLogs[index].news_title)

                        child=child+"\n<div class=\"dom\" style=\"display: block;\">\n" +
                            "                            <ul>";
                        $.each(josn, function (index1, n1) {
                            // alert(josn[index1].news_title)
                            child=child+"<li><a href=\"" +
                                josn[index1].news_uil +
                                "\">" +
                                josn[index1].news_title +
                                "</a></li>";
                        });
                        child=child+"</ul>\n" +
                            "                        </div>";
                    });

                    // alert(child)
                    add("tab-content",child);
                }else {
                    alert(result.msg);
                }

            },
            error: function () {
                alert("网络连接异常！");
            }
        });
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
</body>
</html>