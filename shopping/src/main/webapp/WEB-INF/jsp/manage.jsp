<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="../css/manage.css">
    <script type="text/javascript" src="../js/jquery-3.3.1.js" ></script>
    <script type="text/javascript" ></script>
    <title>网站后台模板</title>
</head>

<body>
<!--顶部信息区-->
<header role="header">
    <div>
        <h1>后台管理系统</h1>
        <nav role="user">
            <ul>
                <li>欢迎管理员:<strong>admin</strong></li>
            </ul>
        </nav>
    </div>
</header>
<!--圣杯二列布局-->
<main role="main">
    <!--主体内联框架区-->
    <article role="content">
        <iframe src="/transpond/goodstianjia" name="main"></iframe>

    </article>
    <!--左侧导航区-->
    <aside>
        <nav role="option">
            <ul>
                <li>导航列表</li>
                <li><a href="/transpond/goodstianjia" target="main" id="bctive1" class="active">商品添加</a></li>
                <li><a href="/transpond/goodsxiugai" target="main" id="bctive2" class="b">商品修改</a></li>
                <li><a href="/transpond/goodsshanchu" target="main" id="bctive3" class="b">商品删除</a></li>
            </ul>
        </nav>
    </aside>
</main>
</body>
</html>
<script >
    $(document).ready(function(){
        $("#bctive1").click(function () {
            $("#bctive2").attr("class","b")
            $("#bctive3").attr("class","b")
            $("#bctive1").attr("class","active")
        })


         $("#bctive2").click(function () {
            $("#bctive1").attr("class","b")
            $("#bctive3").attr("class","b")
            $("#bctive2").attr("class","active")
        })

        $("#bctive3").click(function () {
            $("#bctive2").attr("class","b")
            $("#bctive1").attr("class","b")
            $("#bctive3").attr("class","active")
        })

    })


    function logout() {
        if (window.confirm('是否退出?')) {
            window.location.href = 'login.html';
        } else {
            return false;
        }
    }
</script>