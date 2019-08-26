<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Title</title>
    <style>
        .box{
            width: 100%;
        }
        .box1{
            width: 100%;
            height: 50px;
            background: lavender;
        }
        .clear:after{
            content: "\200B";
            display: block;
            clear: both;
        }
        .btn{
            background: orange;
            color: white;
            border: 0;
            width: 80px;
            height: 30px;
            border-radius: 5px;
        }
        .liang{
            background: crimson;
            color: white;
            border: 0;
            width: 100px;
            height: 30px;
            line-height: 30px;
            border-radius: 5px;
            float: right;
            margin: 10px;
        }
        #sou{
            width: 200px;
            height: 30px;
            border-radius: 3px;
            margin: 10px;
        }
        table{
            margin-top: 15px;
            width: 100%;
            border-collapse: collapse;
            text-align: center;
        }
        th{
            border: 1px solid silver;
        }
        /*点击列表头信息，如：”商品名称”时该头信息名称变红色*/
        th:active{color: red}
        th:hover{color: red}
        td{
            border: 1px solid silver;
        }
    </style>
    <script>
        var myapp=angular.module("myapp",[]);
        myapp.controller("myCtrl",function ($scope) {
            /*声明数据对象，初始化商品信息，数据自拟且不低于四条*/
            $scope.goods=[{
                gname:"ipad",
                num:"10",
                price:"3400",
                id:2,
                state:false
            },{
                gname: "aphone",
                num: "100",
                price: "6400",
                id:4,
                state:false
            },{
                gname: "mypad",
                num: "20",
                price: "4400",
                id:3,
                state:false
            },{
                gname: "zpad",
                num: "130",
                price: "8400",
                id:5,
                state:false
            },{
                gname: "iphone X",
                num: "199",
                price: "1500",
                id:1,
                state:false
            }
            ];
            /*点击删除按钮时弹出提示框询问用户确定删除，用户点击确定删除后该条数据在页面被删除。*/
            $scope.remove=function (index) {
                if(confirm('确定移除此项嘛？')){
                    $scope.goods.splice(index,1);
                }
            };
            /*用户没有选中任意复选框时点击批量删除按钮提示用户先进行选中要删除的商品信息*/
            $scope.pi=function () {
                for(var i=0;i<$scope.goods.length;i++){
                    if($scope.goods[i].state==true){
                        $scope.goods.splice(i,1);
                        i--;
                    }
                }
            }
            /*且该列数据进行正（倒）序排列，再单击序号则该列信息数据进行倒（正）序排列。*/
            $scope.toggleSort = function(){
                $scope.sortIsAsc = !$scope.sortIsAsc;
                $scope.goods.sort(function(a, b){
                    if($scope.sortIsAsc){
                        if (a.id < b.id) {
                            return -1;
                        }
                        if (a.id === b.id) {
                            return 0;
                        }
                        return 1;
                    }
                    if (a.id > b.id) {
                        return -1;
                    }
                    if (a.id === b.id) {
                        return 0;
                    }
                    return 1;
                });
            };
            /*点击第一个checkbox,所有的复选框被选中*/
            $scope.allCheck=false;
            $scope.all= function () {
                for(var i=0;i<$scope.goods.length;i++){
                    if($scope.allCheck===true){
                        $scope.goods[i].state=true;
                    }else {
                        $scope.goods[i].state=false;
                    }
                }
            };
            //每个复选框
            $scope.itemCheck = function () {
                var flag = 0;
                for(var i = 0; i<$scope.goods.length; i++){
                    if($scope.goods[i].state == true){
                        flag ++;
                    }
                }
                if(flag == $scope.goods.length){
                    $scope.allCheck = true;
                }else{
                    $scope.allCheck = false;
                }
            };
        })
    </script>
</head>
<body ng-app="myapp" ng-controller="myCtrl">
<div class="box">
    <h1>商品库存信息管理</h1>
    <hr>
</div>
<div class="box1">
    <input type="text" placeholder="输入关键字..." id="sou" ng-model="query"/><button ng-click="pi()" class="liang">批量删除</button>
</div>
<table>
    <tr>
        <th><input type="checkbox" ng-model="allCheck" ng-click="all()"/></th>
        <th>商品编号</th>
        <th>商品名称</th>
        <th>商品价格</th>
        <th>商品库存</th>
        <th ng-click="toggleSort()">序号</th>
        <th>数据操作</th>
    </tr>
    <!--用ng-repaet指令将对象遍历并渲染到页面中-->
    <!--Filter实现模糊查询的功能。用户在输入框中键入信息的时候商品列表会动态显示符合要求的查询信息-->
    <tr ng-repeat="arr in goods | filter:query">
        <td><input type="checkbox" ng-model="arr.state" ng-click="itemCheck()"/></td>
        <td>{{$index+1}}</td>
        <td>{{arr.gname}}</td>
        <!--商品价格这一列需要在价格前面加上”￥：”。-->
        <td>{{arr.price|currency:"￥："}}</td>
        <td>{{arr.num}}</td>
        <td>{{arr.id}}</td>
        <td><button ng-click="remove($index)" class="btn">删除</button></td>
    </tr>
</table>

</body>
</html>
