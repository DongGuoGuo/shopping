<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>文档管理</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
    <script type="text/javascript" src="../js/util.js" ></script>
    <link rel="stylesheet" href="../css/goodsxiugai.css">

    <script>
        $(document).ready(function() {
            $("#button1").click(function () {
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/admin/updataGoods" ,//url
                    data: $('#xiugai').serialize(),
                    success: function (result) {
                        alert(result.msg);
                        showshangpin();
                    },
                    error : function() {
                        alert("网络连接异常！");
                    }
                });
            })
        })
    </script>
</head>

<body>
<h3>当前位置：商品修改</h3>
<div id="addxiugai">

</div>
<!--分页-->
<div class="xianxi" >
    <label class="biaoti">
        商品的基础信息
    </label>
        <form name="xiugai" id="xiugai">
            <p hidden="hidden" class="duan">  <input id="id"  name="id" class="wenbenkuang" type="text"></p>
            <p class="duan">  <input id="mingcheng" name="mingcheng" class="wenbenkuang" type="text" placeholder=" 名称"></p>
            <p class="duan" > <input  id="danjia"  name="danjia" class="wenbenkuang"  type="text" placeholder=" 单价"></p>
            <%--<p class="duan" > <input  id="kucun" class="wenbenkuang"  type="text" placeholder=" 库存"></p>--%>
            <input  id="button1" onclick="xiugai()" type="button" value="提  交"/>
            <input  id="button2" type="reset" value="重  置"/>
        </form>


</div>
<div id="mydiv1"></div>
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
                        "    \n" +
                        "    <tbody><tr>\n" +
                        "        <th width=\"5%\">ID</th>\n" +
                        "        <th width=\"15%\">图片</th>\n" +
                        "        <th width=\"35%\">名称</th>\n" +
                        "        <th width=\"10%\">单价</th>\n" +
                        "        <th width=\"15%\">库存</th>\n" +
                        "        <th width=\"20%\">操作</th>\n" +
                        "    </tr>\n";
                    $.each(json, function (index, n) {
                        ch = ch + "<tr>\n" +
                            "            <td class=\"id\">" +
                            json[index].goods_id +
                            "</td>\n" +
                            "            <td width=\"10%\"><img src=\"" +
                            json[index].goods_img +
                            "\" alt=\"\" width=\"70\" height=\"70\"></td>\n" +
                            "            <td class=\"mingcheng\">" +
                            json[index].goods_name +
                            "</td>\n" +
                            "            <td class=\"danjia\">" +
                            json[index].goods_price +
                            "</td>\n" +
                            "            <td class=\"kucun\">100</td>\n" +
                            "            <td><div> <span style=\"cursor:pointer\" class=\"span1\">修改</span> </div></td>\n" +
                            "        </tr>";
                    });
                    ch=ch+"\n" +
                        "    </tbody>\n" +
                        "</table>";
                    add("addxiugai",ch);
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
    $(document).ready(function(){
        var n=0;
        var id;
        $(".mingzi").mouseover(function () {
            $("#mydiv1").css("left", event.clientX);
            $("#mydiv1").css("top", event.clientY + 10);
            $("#mydiv1").show();
        })
        $(".mingzi").mouseout(function () {
            $("#mydiv1").hide();
        })

        $("#addshanchu > table > tbody > tr > td:nth-child(3)").hover(function () {
            $("#mydiv1").text($(this).find(".mingzi").text());

        },function() {

        })
        $(document).on("click", "#button1", function () {

            var x=$("#danjia").val();
            var y=$("#mingcheng").val();
            var z=$("#kucun").val();
            n.parents("tr").find("td").eq(2).text(y);
            n.parents("tr").find("td").eq(3).text(x);
            n.parents("tr").find("td").eq(4).text(z);
                $(".xianxi").fadeOut("slow");
                $("xinxixiugai").fadeOut("slow");
                $("button-div").fadeOut("slow");
        })
        $(document).on("click", ".span1", function () {
            n=$(this)
            var mingcheng=$(this).parents("tr").find("td").eq(2).text(); //得到用户名
            var danjia=$(this).parents("tr").find("td").eq(3).text();//得到姓名
            var kucun=$(this).parents("tr").find("td").eq(4).text();
            var id=$(this).parents("tr").find("td").eq(0).text();
            $("#mingcheng").val(mingcheng)
            $("#danjia").val(danjia)
            $("#kucun").val(kucun)
            $("#id").val(id)
            $(".xianxi").fadeIn("slow");
            $("xinxixiugai").fadeIn("slow");
            $("button-div").fadeIn("slow");
        })

    })
</script>
</body>
</html>