<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>商品管理</title>
    <script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
    <link rel="stylesheet" href="../css/tianjia.css">
    <script>
        $(document).ready(function() {
            $("#button1").click(function () {
                $.ajax({
                    type: "POST",//方法类型
                    dataType: "json",//预期服务器返回的数据类型
                    url: "/admin/addGoods" ,//url
                    data: $('#add').serialize(),
                    success: function (result) {
                        alert(result.msg);
                    },
                    error : function() {
                        alert("网络连接异常！");
                    }
                });
            })
        })

        // function add() {
        //
        // }
    </script>
</head>
<body>
<h3>当前位置：商品添加</h3>
<div class="tian-container">
    <form id="add" name="add">
        <p class="duan"> <input name="goods_name"  class="wenbenkuang" type="text" placeholder="商品名称"></p>
        <p class="duan"><input name="goods_price" class="wenbenkuang" type="text" placeholder="商品单价"></p>
        <%--<p class="duan"><input name="" class="wenbenkuang" type="text" placeholder="商品库存"></p>--%>
        <p class="duan"><input name="goods_type" class="wenbenkuang" type="text" placeholder="商品类别"></p>
        <p class="duan"><input name="goods_img" class="wenbenkuang" type="text" placeholder="商品图片链接"></p>
        <%--<p class="duan">上传商品图片： <input type="file" id="file" class="filepath" onchange="changepic(this)" accept="image/jpg,image/jpeg,image/png,image/PNG" /> <img src="#" id="img3" /></p>--%>
        <p class="duan">
        <div class="buttondiv">
            <input  id="button1" type="button"  value="提  交"/>
            <input  id="button2" type="reset" value="重  置"/>
        </div>
        </p>
    </form>
</div>

<script type="text/javascript">
    function changepic() {
        $("#prompt3").css("display", "none");
        var reads = new FileReader();
        f = document.getElementById('file').files[0];
        reads.readAsDataURL(f);
        reads.onload = function(e) {
            document.getElementById('img3').src = this.result;
            $("#img3").css("display", "block");
        };
    }
</script>
</body>
</html>