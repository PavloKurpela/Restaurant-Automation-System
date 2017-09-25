<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Tables - Restaurant Automation System</title>
    <script
            src="https://code.jquery.com/jquery-2.1.3.js"
            integrity="sha256-goy7ystDD5xbXSf+kwL4eV6zOPJCEBD1FBiCElIm+U8="
            crossorigin="anonymous"></script>

    <%--<script--%>
            <%--src="https://code.jquery.com/jquery-3.2.1.js"--%>
            <%--integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="--%>
            <%--crossorigin="anonymous"></script>--%>

    <%@ include file="header.jsp" %>

</head>
<body>
<%@ include file="navbar.jsp"%>

<div class="wrapper">

    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-lg-push-3">

                <h1 class="page-header">Бронювання столиків</h1>

                <div class="container">
                    <img id="table-image" src="image/Zabava.jpg" class="img-responsive" alt="Responsive image">
                </div>

                <div class="container-fluid">
                        <table class="table table-hover" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>Номер столика</th>
                                <th>Максимальна кількість осіб</th>
                                <th></th>
                            </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${table}" var="table">
                                    <tr>
                                        <th>${table.numberTable}</th>
                                        <th>${table.maxCountPerson}</th>
                                        <th>
                                            <button type="button" id="${table.id}" value="${table.id}" class="btn btn-success btn-table">Забронювати</button>
                                        </th>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                </div>

            </div>
            <div class="col-lg-3 col-lg-pull-9">

                <div class="panel panel-info">

                    <div class="panel-heading">
                        <div class="sidebar-header">
                            <a href="/">Головна</a>
                        </div>
                        <div class="sidebar-header">
                            <a href="/menu">Меню</a>
                        </div>
                        <div class="sidebar-header">
                            <a href="/tables">Бронювання столиків</a>
                        </div>
                        <div class="sidebar-header">
                            <a href="/orders">Мої замовлення</a>
                        </div>
                        <div class="sidebar-header">
                            <a href="#">Контакти</a>
                        </div>
                        <div class="sidebar-header">
                            <a href="/admin/dish">Адміністрування</a>
                        </div>
                    </div>

                </div>

                <div class="panel panel-info hidden-xs">
                    <div class="panel-heading"> <div class="sidebar-header">Пошук</div> </div>
                    <div class="panel-body">
                        <form role="search">
                            <div class="form-group">
                                <div class="input-group">
                                    <span class="input-group-addon">@</span>
                                    <input type="search" class="form-control input-lg" placeholder="ваш запит">

                                    <div class="input-group-btn">
                                        <button class="btn btn-default btn-lg" type="submit"><i class="glyphicon glyphicon-search"></i></button>

                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div class="panel panel-info">
                    <div class="panel-heading"> <div class="sidebar-header">Вхід</div> </div>
                    <div class="panel-body">

                        <form role="form">
                            <div class="form-group">
                                <input type="text" class="form-control input-lg" placeholder="Логін">
                            </div>
                            <div class="form-group">
                                <input type="password" class="form-control input-lg" placeholder="Пароль">
                            </div>

                            <button type="submit" class="btn btn-warning pull-right">Вхід</button>

                        </form>

                    </div>
                </div>

            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>


<script>

    $('.btn-table').click(function () {
        $.ajax({
            type: "POST",
            cache: false,
            url: 'tables/add-table',
            data: {
                'tableId': $(this).val()
            },
            success: function () {
                alert("Столик заброньовано!");
            }
        });
    });

</script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
