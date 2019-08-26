<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
    <script type="text/javascript" src="../js/util.js" ></script>
    <title>文档管理</title>
</head>
<style>
    table, th, td {
        border: solid 1px #efefef;
    }
    table {
        width: 100%;
        margin: auto;
        border-collapse: collapse;
        text-align: center;
        border-radius: 6px;
    }
    td,th{
        padding: 10px;
    }
    a {
        text-decoration-line: none;
        color: green;
    }
    a:hover {
        color: brown;
        text-decoration-line: underline;
    }
    tr:first-child {
        background-color: #efefef;
        border-radius: 4px 4px 0 0;
        border-bottom: solid 1px #ddd;
    }
    table caption {
        font-size: 1.5rem;
        font-weight: bolder;
        margin-bottom: 20px;
    }
    p {
        text-align: center;
    }
    /*首页样式*/
    p a:first-child {
        width: 56px;
    }
    p a:last-child {
        width: 56px;
    }
    p a {
        display: inline-block;
        width: 28px;
        height: 24px;
        border: 1px solid green;
        margin-left:2px;
        line-height: 24px;
    }
    .mingzi{
        overflow: hidden;
        text-overflow: ellipsis;
        display: -webkit-box;
        -webkit-line-clamp: 1;
        -webkit-box-orient: vertical;

        margin-top: 0px;
        width: 300px;


    }
    #mydiv1{
        position:absolute;
        z-index:9999;
        font-size: 20px;
        display:none;
        border:1px solid #fdff21;
        background:#ffdc18 ;
    }
    /*当前页样式*/
    .active {
        background-color: green;
        color: white;
    }
    .more {
        border: none;
    }
</style>
<body>
<h3>当前位置：商品删除</h3>

<div id="mydiv1"></div>
<div id="addshanchu">

<%--<table class="table table-hover text-center">--%>
    <%--<tbody><tr>--%>
        <%--<th width="5%">ID</th>--%>
        <%--<th width="15%">图片</th>--%>
        <%--<th width="35%">名称</th>--%>
        <%--<th width="10%">单价</th>--%>
        <%--<th width="15%">库存</th>--%>
        <%--<th width="20%">操作</th>--%>
    <%--</tr>--%>


        <%--<tr>--%>
            <%--<td>1</td>--%>
            <%--<td width="10%"><img src="../tupian/1.jpg" alt="" width="70" height="70"></td>--%>
            <%--<td>马达加斯加1</td>--%>
            <%--<td>￥：10</td>--%>
            <%--<td>20</td>--%>
            <%--<td><div> <a class="shanchu"  onclick="shanchu()"> 删除</a> </div></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>2</td>--%>
            <%--<td width="10%"><img src="../tupian/1.jpg" alt="" width="70" height="70"></td>--%>
            <%--<td>马达加斯加2</td>--%>
            <%--<td>￥：20</td>--%>
            <%--<td>30</td>--%>
            <%--<td><div> <a class="shanchu"  onclick="shanchu()"> 删除</a> </div></td>--%>
        <%--</tr>--%>
        <%--<tr>--%>
            <%--<td>3</td>--%>
            <%--<td width="10%"><img src="../tupian/1.jpg" alt="" width="70" height="70"></td>--%>
            <%--<td>--%>
                <%--<div class="mingzi">--%>
                    <%--马达加斯加3--%>
                <%--</div></td>--%>
            <%--<td>￥：43</td>--%>
            <%--<td>8</td>--%>
            <%--<td><div> <a class="shanchu"  onclick="shanchu()"> 删除</a></div></td>--%>
        <%--</tr>--%>


    <%--</tbody>--%>
<%--</table>--%>

</div>
<!--分页-->
<script>
    $(function () {
        showshangpin();
    })
    function showshangpin(){
        $.ajax({
            type: "GET",//方法类型
            dataType: "json",//预期服务器返回的数据类型
            url: "/admin/queryGoods",//url
            data: $('#add').serialize(),
            success: function (result) {
                var ch = "";
                if (result.result) {
                    var json=result.data;
                    ch=ch+"<table class=\"table table-hover text-center\">\n" +
                        "    <tbody><tr>\n" +
                        "        <th width=\"5%\">ID</th>\n" +
                        "        <th width=\"15%\">图片</th>\n" +
                        "        <th width=\"35%\">名称</th>\n" +
                        "        <th width=\"10%\">单价</th>\n" +
                        "        <th width=\"15%\">库存</th>\n" +
                        "        <th width=\"20%\">操作</th>\n" +
                        "    </tr>\n"
                    $.each(json, function (index, n) {
                        ch = ch + "<tr>\n" +
                            "            <td>" +
                            json[index].goods_id +
                            "</td>\n" +
                            "            <td width=\"10%\"><img src=\"" +
                            json[index].goods_img +
                            "\" alt=\"\" width=\"70\" height=\"70\"></td>\n" +
                            "            <td> <div class=\"mingzi\">\n" +
                            json[index].goods_name +
                            "                </div></td>\n" +
                            "            <td>" +
                            json[index].goods_price +
                            "</td>\n" +
                            "            <td>100</td>\n" +
                            "            <td><div> <a class=\"shanchu\"  onclick=\"shanchu()\"> 删除</a> </div></td>\n" +
                            "        </tr>\n";
                    });
                    ch=ch+"</tbody>\n" +
                        "</table>"
                    add("addshanchu",ch);
                }else {
                    alert(result.msg)
                }
            },
            error : function() {
                alert("网络连接异常！");
            }
        });
    }
</script>

<script>
    $(document).ready(function() {
        getId();
        shanchu();
    })

    function shanchu() {
        $("#addshanchu > table > tbody > tr > td:nth-child(3)").mouseover(function () {
            $("#mydiv1").css("left", event.clientX);
            $("#mydiv1").css("top", event.clientY + 10);
            $("#mydiv1").show();
        })
        $("#addshanchu > table > tbody > tr > td:nth-child(3)").mouseout(function () {
            $("#mydiv1").hide();
        })

        $("#addshanchu > table > tbody > tr > td:nth-child(3)").hover(function () {
            $("#mydiv1").text($("#addshanchu > table > tbody > tr > td:nth-child(3)").find(".mingzi").text());

        },function() {

        })
    }
    function getId() {
        $(document).on("click", ".shanchu", function () {
            n = $(this)
            var mingcheng = $(this).parents("tr").find("td").eq(2).text(); //得到用户名
            var danjia = $(this).parents("tr").find("td").eq(3).text();//得到姓名
            var kucun = $(this).parents("tr").find("td").eq(4).text();
            var id = $(this).parents("tr").find("td").eq(0).text();
        })
    }
    function shanchu() {
        $(document).on("click", ".shanchu", function () {
            n = $(this)
            var id = $(this).parents("tr").find("td").eq(0).text();
            $.ajax({
                type: "GET",//方法类型
                dataType: "json",//预期服务器返回的数据类型
                url: "/admin/deleteGoods?str_id="+id ,//url
                data: $('#add').serialize(),
                success: function (result) {
                    alert(result.msg);
                    showshangpin();
                },
                error : function() {
                    alert("网络连接异常！");
                }
            });
        })
    }
</script>

</body>
</html>