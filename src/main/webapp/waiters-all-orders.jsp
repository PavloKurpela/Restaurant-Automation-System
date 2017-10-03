<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Waiter Room - Restaurant Automation System</title>
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
            <div id="main-content" class="col-lg-9 col-lg-push-3">

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation" id="active-orders"><a href="/waiter">Активні замовлення</a></li>
                    <li role="presentation" id="all-orders"  class="active"><a href="/waiter/orders">Усі замовлення</a></li>
                </ul>
                <div id="mycontext">

                    <h1 id="page-title">Усі ваші замовлення за сьогодні</h1>

                    <input type="date" style="width: 70%; display: inline" class="form-control" id="date-for-orders" name="date-start" placeholder="Дата" required>
                    <button type="button" id="select-orders" class="btn btn-success btn-select-orders">Вибрати</button>
                    <div class="container-fluid">
                        <div class="row">
                            <form role="form" enctype="multipart/form-data" method="post">
                                <table id="myTable" class="table table-hover" cellspacing="0" width="100%">
                                    <thead>
                                    <tr>
                                        <th>Номер</th>
                                        <th>Час здійснення</th>
                                        <th>Загальна сума</th>
                                        <th>Статус оплати</th>
                                    </tr>
                                    </thead>

                                    <tbody id="table-active-orders">

                                    </tbody>
                                </table>
                            </form>

                        </div>
                </div>


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
                            <a id="table-br" href="/tables">Бронювання столиків</a>
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
                        <div class="sidebar-header">
                            <a href="/waiter">Кабінет офіціанта</a>
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

$(window).load(function () {
    $('#select-orders').click();
});


$('#select-orders').click(function () {

    var date = $('#date-for-orders').val();

    if (date != '') {
        $('#page-title').html("Усі ваші замовлення за " + date);
    }
    $.ajax({
        type: "GET",
        cache: false,
        url: '/waiter/all-dish-for-date',
        data: {
            'date': date,
        },
        success: function (response) {
            var html = '';
            //html = response.result;
            $.each(response.data, function (i) {
                html =  html + "<tr>";
                html = html + "<th id='id-ord'>" + response.data[i].id + "</th>";
                html = html + "<th>" + response.data[i].dateTimeFrom + "</th>";
                html = html + "<th>" + response.data[i].orderSum + "</th>";
                if(response.data[i].paymentStatus == false) {
                    html = html + "<th>Неоплаченно</th>";
                } else {
                    html = html + "<th>Оплаченно</th>";
                }
                html = html + "<th></th>";
//                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
//                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                html =  html + "</tr>";
            });
            $('#table-active-orders').html(html);

            $(document).on('click', '#table-active-orders tr', function () {

                var x = $(this).find('th#id-ord').text();

                url = "/orders/" + x;

                $('#main-content').load("waiter-one-order.jsp");

                $.ajax({
                    type: "GET",
                    cache: false,
                    url: url,
                    data: "",
                    success: function (response) {

                        $('#title-order-number').html(response.data.id);
                        //$('#start-date-order').html('' + response.data.dateTimeFrom);
                        $('#start-date-order').html(response.data.dateTimeFrom);
                        $('#end-date-order').html(response.data.dateTimeBefore);
                        if (response.data.tableOrdered != null) {
                            $('#ordered-table').html("Столик №" + response.data.tableOrdered.numberTable);
                        } else {
                            $('#ordered-table').html("Не обрано");
                        }
                        if (response.data.countPerson == 0) {
                            $('#cout-person').html('не вказано');
                        } else {
                            $('#cout-person').html(response.data.countPerson);
                        }
                        $('#sum-order').html(response.data.orderSum)
                        if (response.data.status == 'завершено') {
                            $('#complete-order').hide();
                        }
                        if (response.data.paymentStatus == true) {
                            $('#pay-order').hide();
                        }
                        var html = '';
                        //html = response.result;
                        $.each(response.data.orderedDishes, function (i) {
                            html = html + "<tr>";
                            html = html + "<th>" + response.data.orderedDishes[i].dish.name + "</th>";
                            html = html + "<th>" + response.data.orderedDishes[i].dish.price + "</th>";
                            html = html + "<th>" + response.data.orderedDishes[i].count + "</th>";
                            var sum = response.data.orderedDishes[i].dish.price * response.data.orderedDishes[i].count;
                            html = html + "<th>" + sum + "</th>";
//                            html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                            html = html + "</tr>";
                        });
                        if (html == '') {
                            $('#selected-dish').html("Ви ще не обрали жодної позиції...");
                        } else {
                            $('#selected-dish').html(html);
                        }

                    }

                });


            });
        }
    });
});



    </script>


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
<%--<script src="js/one-order-js.js"></script>--%>
<%--<script src="js/waiters-js.js"></script>--%>
</body>
</html>
