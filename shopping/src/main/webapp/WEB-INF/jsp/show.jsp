<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>详情页面</title>
    <link href="../css/show.css" rel="stylesheet" type="text/css">
    <link href="../css/size.css" rel="stylesheet" type="text/css"/>
    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/jquery.cookie.js"></script>
    <script src="../js/common.js"></script>
    <script src="../js/util.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            fadajing();
        });
        function fadajing() {
            var showproduct = {
                "boxid": "showbox",
                "sumid": "showsum",
                "boxw": 400,
                "boxh": 550,
                "sumw": 60,//列表每个宽度,该版本中请把宽高填写成一样
                "sumh": 60,//列表每个高度,该版本中请把宽高填写成一样
                "sumi": 7,//列表间隔
                "sums": 5,//列表显示个数
                "sumsel": "sel",
                "sumborder": 1,//列表边框，没有边框填写0，边框在css中修改
                "lastid": "showlast",
                "nextid": "shownext"
            };//参数定义
            $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行
            $(function () {
                $('.tabs a').click(function () {
                    var $this = $(this);
                    $('.panel').hide();
                    $('.tabs a.active').removeClass('active');
                    $this.addClass('active').blur();
                    var panel = $this.attr("href");
                    $(panel).show();
                    return fasle;  //告诉浏览器  不要纸箱这个链接
                })//end click
                $(".tabs li:first a").click()   //web 浏览器，单击第一个标签吧
            })//end ready
            $(".centerbox li").click(function () {
                $("li").removeClass("now");
                $(this).addClass("now")
            });
        }

    </script>
    <script>
        $(function (){
            var id = $.cookie('id');
            // alert("开始详细查询" + id)
            xiangxi(id);
        });

        function onclick1() {
            $.cookie('key', $("#key").val());
            window.location.href = "/transpond/search";
        }

        function xiangxi(id) {
            // alert("正在初始化详细内容" + id);
            $.ajax({
                //几个参数需要注意一下
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/goodsController/xiangxi?id=" + id,//url
                success: function (result) {
                    if (result.result) {
                        var json=result.data;
                        var ch = "";
                        ch = ch + "<img src=\"" +
                            json.goods_img +
                            "\" width=\"400\" height=\"550\"/>";
                        add("showbox",ch);

                        ch="";
                        ch=ch+"               <div> <p class=\"imgname\">" +
                            json.goods_name +
                            "</p></div><br>\n" +
                            "               <div> <p class=\"Aprice\">价格：<samp>￥" +
                            json.goods_price +
                            "</samp></p></div><br>\n" +
                            "                <div><p class=\"kefu\">客服电话：" +
                            "" +
                            "</p></div><br>";
                        add("info",ch);
                        fadajing();
                    }
                },
                error: function () {
                    alert("网络连接异常！");
                }
            });
        }

        /**
         * 在某个节点后添加代码
         * @param elementld
         * @param child
         */

        function buy() {
            $.ajax({
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/goodsController/isLogin",//url
                success: function (result) {
                   if(result.result){
                       var id = $.cookie("id");
                       var size = getRadio("size");
                       var goodnum = document.getElementById("goodnum").value
                       window.location.href = "/ShoppingcartController/saveShoppingCart?id="+id+"&size="+size+"&goodnum="+goodnum;
                   }else {
                       alert("请先登录后再尝试");
                   }
                },
                error: function () {
                    alert("网络连接异常！");
                }
            });






        }

        function shopping() {
            $.ajax({
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/goodsController/isLogin",//url
                success: function (result) {
                    if(result.result){
                        var id = $.cookie("id");
                        var size = getRadio("size");
                        var goodnum = document.getElementById("goodnum").value;
                        var  path="/ShoppingcartController/saveShoppingCart1?id="+id+"&size="+size+"&goodnum="+goodnum;
                        $.ajax({
                            type: "GET",//方法类型
                            dataType: "json",//预期服务器返回的数据类型
                            url: path,//url
                            success: function (result1) {
                                if (result1.result) {
                                    alert(result1.msg)
                                }
                            },
                            error: function () {
                                alert("网络连接异常！");
                            }
                        });
                    }else {
                        alert("请先登录后再尝试");
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

                    </div>
                </div>
            </div>
        </div>
    </div>
    <!--导航条-->
    <!-----商品详情部分------->
    <div class="shopdetails">
        <!-------放大镜-------->
        <div id="leftbox">
            <div id="showbox" class="showbox">
                <%--<img src="//img11.360buyimg.com/n8/jfs/t1/32065/22/9121/239601/5ca389ddEfe66c60b/0d658bd74ca7f532.jpg"--%>
                     <%--width="400" height="550"/>--%>
                <%--<img src="//img11.360buyimg.com/n8/jfs/t1/32065/22/9121/239601/5ca389ddEfe66c60b/0d658bd74ca7f532.jpg" width="400" height="550"/>--%>

            </div><!--展示图片盒子-->
            <%--<div id="showsum"></div><!--展示图片里边-->--%>
            <%--<p class="showpage">--%>
                <%--<a href="javascript:void(0);" id="showlast"> < </a>--%>
                <%--<a href="javascript:void(0);" id="shownext"> > </a>--%>
            <%--</p>--%>

        </div>
        <!----中间----->

        <div class="centerbox">
            <ul id="info" class="info">
                <div>
                    <p class="imgname">衣服</p>
                </div>
                <%--<div>--%>
                    <%--<p class="Aprice">价格：<samp>￥89.00</samp></p>--%>
                <%--</div>--%>
                <%--<div>--%>
                    <%--<p class="kefu">客服电话：</p>--%>
                <%--</div>--%>
            </ul>
            <div class="choose" id="dress-size">
                <form action="detail" method="POST">
                    <br>数量:
                    <input id="min" name="" type="button" value="-"  style="width:30px;height: 30px"/>
                    <input id="goodnum" name="goodnum" type="text" value="1" style="width:100px;height: 30px" />
                    <input id="add" name="" type="button" value="+" style="width:30px;height: 30px"/></td>
                    <br>
                    <div class="choosetext">尺寸：<span>未选择</span></div>
                    <div class="choosebox">
                        <ul class="clearfix">
                            <li>
                                <input type="radio" name="size" value="S" id="s"/>
                                <a href="javascript:void(0);" class="size_radioToggle"><span class="value">S</span></a>
                            </li>
                            <li>
                                <input type="radio" name="size" value="M" id="m"/>
                                <a href="javascript:void(0);" class="size_radioToggle"><span class="value">M</span></a>
                            </li>
                            <li>
                                <input type="radio" name="size" value="L" id="l"/>
                                <a href="javascript:void(0);" class="size_radioToggle"><span class="value">L</span></a>
                            </li>
                            <li>
                                <input type="radio" name="size" value="XL" id="xl"/>
                                <a href="javascript:void(0);" class="size_radioToggle"><span class="value">XL</span></a>
                            </li>
                            <li>
                                <input type="radio" name="size" value="XXL" id="xxl"/>
                                <a href="javascript:void(0);" class="size_radioToggle"><span
                                        class="value">XXL</span></a>
                            </li>
                        </ul>
                    </div>
                    <div>
                        <p>
                            <button type="button" class="btn-img1" onclick="buy()"><span></span></button>

                            <button type="button" class="btn-img" onclick="shopping()"><span></span></button>
                        </p>

                    </div>
                </form>
            </div><!--choose end-->


            <div class="clear"></div>
            <p class="fuwu">服务承诺：</p>
            <p class="pay">支付方式：</p>

            <%--<p class="buy"><a href="#" id="firstbuy">立即购买</a><a href="#">加入购物车</a></p>--%>
            <!-----右边------->
        </div>
    </div>
</div>

<!-----商品详情评价部结束分------->

<script type="text/javascript">
    $(function () {
        $('.choosebox li a').click(function () {
            var thisToggle = $(this).is('.size_radioToggle') ? $(this) : $(this).prev();
            var checkBox = thisToggle.prev();
            checkBox.trigger('click');
            $('.size_radioToggle').removeClass('current');
            thisToggle.addClass('current');
            return false;
        });
    });

    $(".choosebox li a").click(function () {
        var text = $(this).html();
        $(".choosetext span").html(text);
        $("#result").html("" + getSelectedValue("dress-size"));
    });

    function getSelectedValue(id) {
        return
        $("#" + id).find(".choosetext span.value").html();
    }


</script>
<script type="text/javascript">
    $(function(){
        $("#add").click(function(){
            var total= getTotal();
            setTotal(total+1);
        })
        $("#min").click(function(){
            var total= getTotal();
            if(total-1==0){
                alert("购买数量必须大于等于1")
            }else {
                setTotal(total-1);
            }
        })
        function getTotal() {
            var t = $("#goodnum").val();
            t=t-0;
            return t;
        }


        function setTotal(total){
            $("#goodnum").val(total);
        }

    })
</script>
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

</body>
</html>
