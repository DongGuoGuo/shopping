<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>搜索</title>
    <link rel="stylesheet" href="../css/search.css">
    <script language="javascript" src="../js/jquery-3.3.1.js"></script>
    <meta http-equiv="description" content="ajax方式">
    <script type="text/javascript">
        function sousuo() {
            var key = $("#key").val();
            // key   =   key.replace(/^\s+|\s+$/g,"");
            if(key==""){
                alert("key值为空")
            }else {
                $.ajax({
                    //几个参数需要注意一下
                    type: "GET",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/goodsController/sousuo?key=" + key,//url
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
                                            "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a  onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1')\"href=\"" +
                                            "#" +       //消息链接
                                            "\" >" +
                                            chargeRuleLogs[index].goods_name +  //标题
                                            "</a></div><div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +  //价格
                                            "</div></div></div></li>";
                                        break;
                                    case 1:
                                        ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \"href=\"" +
                                            "#" +
                                            "\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a></div><div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div></div></div></li>";
                                        break;
                                    case 2:
                                        ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \"href=\"" +
                                            "#" +
                                            "\" >" +
                                            chargeRuleLogs[index].goods_name +
                                            "</a></div><div class=\"price\">￥：" +
                                            chargeRuleLogs[index].goods_price +
                                            "</div></div></div></li>";
                                        break;
                                    case 3:
                                        ch = ch + "\n<li class=\"lie\"><div class=\"element\"><div class=\"tupian\"><img class=\"tu\" src=\"" +
                                            chargeRuleLogs[index].goods_img +
                                            "\"></img></div><div class=\"wenzi\"><div class=\"mingzi\" ><a onMouseOver=\"javascript:show(this,'mydiv1'); \"onMouseOut=\"hide(this,'mydiv1') \"href=\"" +
                                            "#" +
                                            "\" >" +
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
                            //将信息追加
                            $(".table_node").append(rowTr)
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
        <div class="top-nav">
            <ul class="top-nav-1">
                <li class="top-nav-menu china">
                    <span class="c-span">中国大陆</span>
                    <span class="bg-pic xsj-pic"></span>
                </li>
                <li class="top-nav-menu login-sign">
                    <a href="#" class="login">亲，请登录</a>
                    <a href="#" class="sign">免费注册</a>
                </li>
            </ul>
            <ul class="top-nav-r">
                <li class="top-nav-menu my-taobao">
                    <a href="#">我的商城</a>
                    <span class="bg-pic xsj-pic"></span>
                </li>
                <li class="top-nav-menu shop-car">
                    <a href="#">
                        <span class="bg-pic shopCar-pic"></span>
                        <span>购物车</span>
                    </a>
                    <span class="bg-pic xsj-pic"></span>
                </li>
                <li class="top-nav-menu like">
                    <a href="#">
                        <span class="bg-pic like-pic"></span>
                        <span>收藏夹</span>
                    </a>
                    <span class="bg-pic xsj-pic"></span>
                </li>

                <li class="top-nav-menu cutsomer">
                    <a href="#">
                        <span class="c-span">联系客服</span>
                        <span class="bg-pic xsj-pic"></span>
                    </a>
                </li>

            </ul>
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




                        <a href="#" class="camera"></a>
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
                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a  onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1')"href="#" >马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') "href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a   onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') " href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') "href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>
            <%--</ul>--%>
        <%--</li>--%>


        <%--<li class="a">--%>
            <%--<ul  class="hang">--%>
                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') "href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') " href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') " href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

                <%--<li class="lie"><div class="element"><div class="tupian"><img class="tu" src="../tupian/1.jpg"></img></div><div class="wenzi"><div class="mingzi" ><a onMouseOver="javascript:show(this,'mydiv1'); "onMouseOut="hide(this,'mydiv1') " href="#" >马达加斯加1</a></div><div class="price">￥：马达加斯加2</div></div></div></li>--%>

            <%--</ul>--%>
        <%--</li>--%>

    </ul>
</div>

</body>

</html>