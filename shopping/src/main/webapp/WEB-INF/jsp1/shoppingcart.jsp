<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>购物车</title>
    <link rel="stylesheet" href="../css/gouwuche.css">
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

    <!--导航条-->
</div>
<!--表格-->
<div id="table-container">

        <button id="deleteAll" ng-click="deleteall()">清空购物车</button>
        <table id="dataTable" ng-show="istableShow" border="1px" cellpadding="0" cellspacing="0" align="center"  >
            <thead>
            <tr>
                <td id="td1"></td>
                <td id="td2">名称</td>
                <td id="td3">图片</td>
                <td id="td5">单价</td>
                <td id="td6">数量</td>
                <td id="td7">小计</td>
                <td id="td8">操作</td>
            </tr>
            </thead>
            <tbody ng-repeat="x in datas">
            <tr>
                <td class="td1"><input type="checkbox"/></td>
                <td class="td2"><div class="name-div">马达加斯加</div></td>
                <td class="td3"><div class="tu-div"><img class="tu" src="../tupian/4.jpg"></img></div></td>
                <td class="td5">1</td>
                <td class="td6"><div class="num-div"><button class="reduce" ng-click="reduce(x.id)">-</button><input  class="num" type="text" value="{{x.gnumber}}"/><button class="increase" ng-click="increase(x.id)">+</button></div></td>
                <td class="td7">{{x.totalprice=x.price*x.gnumber}}</td>
                <td class="td8"><button ng-click="deleteone(x.id)" class="deleteOne">删除</button></td>
            </tr>
            <tr>
                <td class="td1"><input type="checkbox"/></td>
                <td class="td2"><div class="name-div">马达加斯加</div></td>
                <td class="td3"><div class="tu-div"><img class="tu" src="../tupian/4.jpg"></img></div></td>
                <td class="td5">1</td>
                <td class="td6"><div class="num-div"><button class="reduce" ng-click="reduce(x.id)">-</button><input class="num" type="text" value="{{x.gnumber}}"/><button class="increase" ng-click="increase(x.id)">+</button></div></td>
                <td class="td8">{{x.totalprice=x.price*x.gnumber}}</td>
                <td class="td1"><button ng-click="deleteone(x.id)" class="deleteOne">删除</button></td>
            </tr>
            </tbody>
        </table>
        <span id="countPrice">总价为: ¥ {{count()}}</span>

</div>
</body>
</html>