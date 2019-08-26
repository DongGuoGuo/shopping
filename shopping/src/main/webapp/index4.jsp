<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <title>详情页面</title>
    <link href="../css/show.css" rel="stylesheet" type="text/css">

    <script src="../js/jquery-3.3.1.js"></script>
    <script src="../js/common.js"></script>
    <script type="text/javascript">
        $(document).ready(function(){
            var showproduct = {
                "boxid":"showbox",
                "sumid":"showsum",
                "boxw":400,
                "boxh":550,
                "sumw":60,//列表每个宽度,该版本中请把宽高填写成一样
                "sumh":60,//列表每个高度,该版本中请把宽高填写成一样
                "sumi":7,//列表间隔
                "sums":5,//列表显示个数
                "sumsel":"sel",
                "sumborder":1,//列表边框，没有边框填写0，边框在css中修改
                "lastid":"showlast",
                "nextid":"shownext"
            };//参数定义
            $.ljsGlasses.pcGlasses(showproduct);//方法调用，务必在加载完后执行

            $(function(){

                $('.tabs a').click(function(){

                    var $this=$(this);
                    $('.panel').hide();
                    $('.tabs a.active').removeClass('active');
                    $this.addClass('active').blur();
                    var panel=$this.attr("href");
                    $(panel).show();
                    return fasle;  //告诉浏览器  不要纸箱这个链接
                })//end click


                $(".tabs li:first a").click()   //web 浏览器，单击第一个标签吧



            })//end ready

            $(".centerbox li").click(function(){
                $("li").removeClass("now");
                $(this).addClass("now")

            });


        });




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
                        <form action="">
                            <div class="btn">
                                <button class="submit">搜索</button>
                            </div>
                            <div class="search-inp-box">
                                <div class="search-inp">
                                    <input type="text" placeholder="荣耀10降价">
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
<!-----商品详情部分------->
<div class="shopdetails">
    <!-------放大镜-------->
    <div id="leftbox">
        <div id="showbox">
            <img src="../tupian/1.jpg" width="400" height="550" />
            <img src="../tupian/2.jpg" width="400" height="550" />
            <img src="../tupian/3.jpg" width="400" height="550" />
            <img src="../tupian/4.jpg" width="400" height="550" />
            <img src="../tupian/1.jpg" width="400" height="400" />
            <img src="../tupian/4.jpg" width="400" height="400" />

        </div><!--展示图片盒子-->
        <div id="showsum"></div><!--展示图片里边-->
        <p class="showpage">
            <a href="javascript:void(0);" id="showlast"> < </a>
            <a href="javascript:void(0);" id="shownext"> > </a>
        </p>

    </div>
    <!----中间----->

    <div class="centerbox">
        <p class="imgname">衣服</p>
        <p class="Aprice">价格：<samp>￥89.00</samp></p>
        <p class="kefu">客服：</p>
        <ul>
            <li class="kuanshi">款式：</li>
            <li class="now shopimg"><a href="#" title="熊猫套装"><img src="../tupian/1.jpg" width="45"></a></li>
            <li class="shopimg"><a href="#" title="铁塔套装"><img src="../tupian/1.jpg" width="45"></a></li>
            <li class="shopimg"><a href="#" title="创意胡子"><img src="../tupian/1.jpg" width="45"></a></li>
            <li class="shopimg"><a href="#" title="四色小猫"><img src="../tupian/1.jpg" width="45"></a></li>
        </ul>
        <div class="clear"></div>
        <p class="chima">尺码：</p>
        <p class="buy"><a href="#" id="firstbuy">立即购买</a><a href="#">加入购物车</a></p>
        <div class="clear"></div>
        <p class="fuwu">服务承诺：</p>
        <p class="pay">支付方式：</p>
    </div>

    <!-----右边------->


</div>
<!-----商品详情部分结束------->
<!-----商品详情评价部分------->
<div class="evaluate">




    <div class="tabbedPanels">
        <ul class="tabs">
            <li><a href="#panel01">商品详情</a></li>
            <li><a href="#panel02" class="active">累计评价</a></li>
        </ul>

        <div class="panelContainer">
            <div class="panel" id="panel01">
                <p class="sell">商品描述</p>
                <p>创意造型 浓浓文艺气息 闲暇时光 与好友分享</p>
                <p></p>
                <p class="sell">整体款式</p>
                <img src="../tupian/1.jpg">
                <img src="../tupian/1.jpg">
                <img src="../tupian/1.jpg">
                <img src="../tupian/1.jpg">
                <img src="../tupian/1.jpg">
                <img src="../tupian/1.jpg">
                <div class="clear"></div>
            </div>

            <div class="panel" id="panel02">
                <p class="sell">买家评价</p>
                <p class="judge">全部评价(20)<span>晒图(13)</span></p>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">落***1</p>
                        <p>杯子很可爱！就是有两三个杯子后面的小图案有一丢丢斜下来，不过没多大关系，其他的还好。有一点真的特别特别好的就是😂包裹的非常非常非常严实，简直就是里三层外三层！杯子完好无损，赠送的刷子也包装的很好😂让我第一眼以为那是一个棉花糖hhh</p>
                        <p class="which">颜色:创意胡子</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">

                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">席***2</p>
                        <p>质量很好，快递也很快，拆包裹很艰难～～～包得太好了，没有碎。厚度也可以。值得购买！</p>
                        <p class="which">颜色:熊猫套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">怒***4</p>
                        <p>特别好，必须赞👍，质量好，很漂亮，快递也好快的。还挺优惠。看图吧。</p>
                        <p class="which">颜色:熊猫套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">毛***字</p>
                        <p>很精致，用起来很满意，做工也非常的细致，用着很满意哦，非常值得购买</p>
                        <p class="which">颜色:创意胡子</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">轻***4</p>
                        <p>店家服务太贴心了，没有破碎，包装非常严实</p>
                        <p class="which">颜色:铁塔套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">里***2</p>
                        <p>不错，很可爱包装很好，赶快下手吧</p>
                        <p class="which">颜色:四色小猫</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">啥***2</p>
                        <p>一直想要咖啡杯，这次总算拿到手了。很不错的陶瓷杯。图案也很可爱。实物与图一样。</p>
                        <p class="which">颜色:熊猫套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>



                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">胡***2</p>
                        <p>宝贝很实惠 拆包装的时候很惊讶 竟然包了四层！完好无损</p>
                        <p class="which">颜色:四色小猫</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">落***1</p>
                        <p>杯子很可爱！就是有两三个杯子后面的小图案有一丢丢斜下来，不过没多大关系，其他的还好。有一点真的特别特别好的就是😂包裹的非常非常非常严实，简直就是里三层外三层！杯子完好无损，赠送的刷子也包装的很好😂让我第一眼以为那是一个棉花糖hhh</p>
                        <p class="which">颜色:创意胡子</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">

                    </div>
                </div>
                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">轻***4</p>
                        <p>店家服务太贴心了，没有破碎，包装非常严实</p>
                        <p class="which">颜色:铁塔套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">里***2</p>
                        <p>不错，很可爱包装很好，赶快下手吧</p>
                        <p class="which">颜色:四色小猫</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>
                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">怒***4</p>
                        <p>特别好，必须赞👍，质量好，很漂亮，快递也好快的。还挺优惠。看图吧。</p>
                        <p class="which">颜色:熊猫套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>
                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">里***2</p>
                        <p>不错，很可爱包装很好，赶快下手吧</p>
                        <p class="which">颜色:四色小猫</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">啥***2</p>
                        <p>一直想要咖啡杯，这次总算拿到手了。很不错的陶瓷杯。图案也很可爱。实物与图一样。</p>
                        <p class="which">颜色:熊猫套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>
                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">毛***字</p>
                        <p>很精致，用起来很满意，做工也非常的细致，用着很满意哦，非常值得购买</p>
                        <p class="which">颜色:创意胡子</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="judge01">
                    <div class="idimg"><img src="images/shopdetail/detail102.png"></div>
                    <div class="write">
                        <p class="idname">轻***4</p>
                        <p>店家服务太贴心了，没有破碎，包装非常严实</p>
                        <p class="which">颜色:铁塔套装</p>
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                        <img src="../tupian/1.jpg" width="40px" height="40px">
                    </div>
                </div>

                <div class="clear"></div>
            </div>




        </div>

    </div>

</div>

<!-----商品详情评价部结束分------->



</body>
</html>
