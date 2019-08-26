<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物商城</title>
    <link rel="stylesheet" href="../css/index.css">
    <script src="../js/index.js" type="text/javascript"></script>
    <script src="../js/jquery-3.3.1.js" type="text/javascript"></script>
    <script src="../js/jquery.cookie.js" type="text/javascript"></script>
    <script src="../js/util.js" type="text/javascript"></script>
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
                                    <button class="submit" onclick="onclick1()" type="button">搜索</button>
                                </div>
                                <div class="search-inp-box">
                                    <div class="search-inp">
                                        <input type="text" name="key" id="key">
                                    </div>
                                </div>
                            </form>








                            <a href="#" class="camera"></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--导航条-->
        <div class="screen-nav">
            <div class="daohangtiao">
                <ul>
                    <li class="daohang" id="yfdh">衣服</li>
                    <li class="daohang" id="jddh">家电</li>
                    <li class="daohang" id="tsdh">图书</li>
                    <li class="daohang" id="dndh">电脑</li>
                    <li class="daohang" id="spdh">手机</li>
                    <li class="daohang" id="sjdh">食品</li>
                    <!--<li>技术</li>-->
                </ul>
            </div>
        </div>
        <div id="mydiv1"> aaaa</div>
        <!--图片主体展示部分-->
        <div class="screen-box">
            <div class="main">
                <div class="main-inner">
                    <div class="inner-content">
                        <div class="body" id="yifu">
                            <ul class='uu'>
                                <div id="uuyifu">
                                </div>
                            </ul>
                        </div>
                        <div class="body" id="jiadian">
                            <ul class="uu">
                                <div id="uujiadian">
                                </div>
                            </ul>
                        </div>
                        <div class="body" id="tushu">
                            <ul class="uu">
                                <div id="uutushu">
                                </div>
                            </ul>
                        </div>
                        <div class="body" id="diannao">
                            <ul class="uu">
                                <div id="uudiannao">
                                </div>
                            </ul>
                        </div>
                        <div class="body" id="shouji">
                            <ul class="uu">
                                <div id="uushouji">
                                </div>
                            </ul>
                        </div>
                        <div class="body" id="shiping">
                            <ul class="uu">
                                <div id="uushiping">
                                </div>
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
                <div class="message">
                    <a href="#">
                        实时新闻
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
                                <li>国外</li>
                                <!--<li>技术</li>-->
                            </ul>
                        </div>
                        <!--主要内容-->
                        <div id="tab-content">


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
    $(document).ready(function(){
        $(function show(obj,id) {
            var objDiv = $("#"+id+"");
            $(objDiv).css("display","block");
            $(objDiv).css("left", event.clientX);
            $(objDiv).css("top", event.clientY + 10);
        })
      $(function hide(obj,id) {
            var objDiv = $("#"+id+"");
            $(objDiv).css("display", "none");

        })
        $(function () {
            $("#uu > li:nth-child(1) > ul > li").hover(function () {
                $("#mydiv1").text($(this).find("a").text());
            },function() {

            })
        })
        $("#sjdh").click(function () {
            $("#yifu").hide();
            $("#diannao").hide();
            $("#tushu").hide();
            $("#shiping").hide();
            $("#jiadian").hide();
            $("#shouji").show();
        })
        $("#yfdh").click(function () {
            $("#diannao").hide();
            $("#tushu").hide();
            $("#shiping").hide();
            $("#jiadian").hide();
            $("#shouji").hide();
            $("#yifu").show();
        })
        $("#dndh").click(function () {
            $("#tushu").hide();
            $("#shiping").hide();
            $("#jiadian").hide();
            $("#shouji").hide();
            $("#yifu").hide();
            $("#diannao").show();
        })

        $("#tsdh").click(function () {
            $("#shiping").hide();
            $("#jiadian").hide();
            $("#shouji").hide();
            $("#yifu").hide();
            $("#diannao").hide();
            $("#tushu").show();
        })

        $("#spdh").click(function () {
            $("#jiadian").hide();
            $("#shouji").hide();
            $("#yifu").hide();
            $("#diannao").hide();
            $("#tushu").hide();
            $("#shiping").show();
        })

        $("#jddh").click(function () {
            $("#shouji").hide();
            $("#yifu").hide();
            $("#diannao").hide();
            $("#tushu").hide();
            $("#shiping").hide();
            $("#jiadian").show();
        })

    })
</script>

<script>
    $(function(){
        resuo();
        allnew();
        aaa();
    });



    function showxiangxi(id){
        $.cookie('id',id);
        window.location.href="/transpond/show";
    }

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
    function resuo() {
        $.ajax({
            //几个参数需要注意一下
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/goodsController/resou",//url
            success: function (result) {
                var i = 0;
                if (result.result) {
                    var chargeRuleLogs = result.data
                    var ch = "";
                    $.each(chargeRuleLogs, function (index, n) {
                        var json1=chargeRuleLogs[index];
                        ch="";
                        $.each(json1,function (index1, n1) {
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
                                        json1[index1].goods_img +
                                        "\"></img>\n" +
                                        "                        </div>\n" +
                                        "                        <div class=\"wenzi\">\n" +
                                        "                            <div class=\"mingzi\" >\n" +
                                        "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                        json1[index1].goods_id +
                                        ")\" >" +
                                        json1[index1].goods_name +
                                        "</a>\n" +
                                        "                            </div>\n" +
                                        "                            <div class=\"price\">￥：" +
                                        json1[index1].goods_price +
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
                                        json1[index1].goods_img +
                                        "\"></img>\n" +
                                        "                        </div>\n" +
                                        "                        <div class=\"wenzi\">\n" +
                                        "                            <div class=\"mingzi\" >\n" +
                                        "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                        json1[index1].goods_id +
                                        ")\" >" +
                                        json1[index1].goods_name +
                                        "</a>\n" +
                                        "                            </div>\n" +
                                        "                            <div class=\"price\">￥：" +
                                        json1[index1].goods_price +
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
                                        json1[index1].goods_img +
                                        "\"></img>\n" +
                                        "                        </div>\n" +
                                        "                        <div class=\"wenzi\">\n" +
                                        "                            <div class=\"mingzi\" >\n" +
                                        "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                        json1[index1].goods_id +
                                        ")\" >" +
                                        json1[index1].goods_name +
                                        "</a>\n" +
                                        "                            </div>\n" +
                                        "                            <div class=\"price\">￥：" +
                                        json1[index1].goods_price +
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
                                        json1[index1].goods_img +
                                        "\"></img>\n" +
                                        "                        </div>\n" +
                                        "                        <div class=\"wenzi\">\n" +
                                        "                            <div class=\"mingzi\" >\n" +
                                        "                                <a href=\"#\" onclick=\"showxiangxi(" +
                                        json1[index1].goods_id +
                                        ")\" >" +
                                        json1[index1].goods_name +
                                        "</a>\n" +
                                        "                            </div>\n" +
                                        "                            <div class=\"price\">￥：" +
                                        json1[index1].goods_price +
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
                        switch (index) {
                            case 0:
                                add("uuyifu",ch);
                                break;
                            case 1:
                                add("uujiadian",ch);
                                break;
                            case 2:
                                add("uutushu",ch);
                                break;
                            case 3:
                                add("uudiannao",ch);
                                break;
                            case 4:
                                add("uushiping",ch);
                                break;
                            case 5:
                                add("uushouji",ch);
                                break;
                        }
                        showshow();
                    });
                } else {
                    alert(chargeRuleLogs.msg);
                }
            },
            error: function () {
                alert("网络连接异常！");
            }
        });

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

                        if(index==0){
                            child=child+"\n<div class=\"dom\" " +
                                "style=\"display: block;\"" +
                                ">\n" +
                                "                            <ul class='news'>";
                        }else {
                            child=child+"\n<div class=\"dom\" " +
                                ">\n" +
                                "                            <ul class='news'>";
                        }


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

    function showxiangxi1(id){
        $.cookie('id',id);
        window.location.href="/transpond/show";
    }

    function onclick1() {
        $.cookie('key', $("#key").val());
        window.location.href = "/transpond/search";
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

                $("#uutushu > li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
                $("#uujiadian > li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
                $("#uudiannao > li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
                $("#uushouji> li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
                $("#uushiping > li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
                $("#uuyifu > li:nth-child(1) > ul > li").hover(function () {
                    $("#mydiv1").text($(this).find("a").text());

                },function() {

                })
            })

        }
    </script>
</body>
</html>