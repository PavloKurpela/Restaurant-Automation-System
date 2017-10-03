<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Menu - Restaurant Automation System</title>
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

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation"><a href="/admin/dish">Страви</a></li>
                    <li role="presentation"><a href="/admin/waiter">Офіціанти</a></li>
                    <li role="presentation" class="active"><a href="/admin/order">Замовлення</a></li>
                </ul>

                <div id="mycontext">

                </div>

            </div>
            <div class="col-lg-3 col-lg-pull-9">

                <%@ include file="navigation.jsp"%>

            </div>
        </div>
    </div>
    <div class="clear"></div>
</div>


<script>

    $(window).load(function () {

        $('#mycontext').load('all-orders.jsp');
        $.ajax({
            type: "GET",
            cache: false,
            url: '/admin/expected-orders',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th id='id-ord'>" + response.data[i].id + "</th>";
                    html = html + "<th>" + response.data[i].timeShipmentOrder + "</th>";
                    html = html + "<th>" + response.data[i].dateTimeFrom + "</th>";
                    html = html + "<th>" + response.data[i].status + "</th>";
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
                $('#table-my-orders').html(html);

            }

        });

        $(document).on('click', '#table-my-orders tr', function () {
            //var x = $(this).text(); // получаем значение со строки "td"
            var x = $(this).find('th#id-ord').text();

            url = "/orders/" + x;

            $('#mycontext').load("admin-one-order.jsp");

            $.ajax({
                type: "GET",
                cache: false,
                url: url,
                data: "",
                success: function (response) {


                    if (response.result == "success") {
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

                    } else {
                        $('#is-new-order').hide();
                    }

                }

            });


        });



    });

</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
