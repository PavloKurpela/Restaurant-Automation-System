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
                    <li role="presentation" class="active"><a href="#">Страви</a></li>
                    <li role="presentation"><a href="#">Напої</a></li>
                </ul>
                <ul class="nav nav-pills nav-justified nav-mymeny">
                    <li id="first_dish" role="presentation"><a  href="#">Перше</a></li>
                    <li id="second_dish" role="presentation"><a href="#">Друге</a></li>
                    <li id="hot_snack"role="presentation"><a href="#">Гарячі закуски</a></li>
                    <li id="colt_snack" role="presentation"><a href="#">Холодні закуски</a></li>
                    <li id="garnish"role="presentation"><a href="#">Гарніри</a></li>
                    <li id="dessert" role="presentation"><a href="#">Десерти</a></li>
                </ul>

                <div class="container-fluid">
                    <div class="row">
                        <form role="form" enctype="multipart/form-data" method="post">
                        <table id="myTable" class="table table-hover" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>Назва</th>
                                <th>Розмір порції</th>
                                <th>Час готування</th>
                                <th>Ціна</th>
                                <th>Кількість порцій</th>
                                <th></th>
                            </tr>
                            </thead>

                            <tbody id="table_dish">

                            </tbody>
                        </table>
                        </form>

                        <a href="/orders"><button type="button" class="btn btn-success">Перейти до замовлення</button></a>
                    </div>
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

    $( window ).load(function() {
        $('#first_dish').click();
    });


$('#first_dish').click(function () {
    $('#first_dish').attr('class', 'active');
    $('#second_dish').attr('class', '');
    $('#hot_snack').attr('class', '');
    $('#colt_snack').attr('class', '');
    $('#garnish').attr('class', '');
    $('#dessert').attr('class', '');

    $.ajax({
        type: "GET",
        cache: false,
        url: '/menu/first_dish',
        data: "",
        success: function (response) {
            var html = '';
            //html = response.result;
            $.each(response.data, function (i) {
                html =  html + "<tr>";
                html = html + "<th>" + response.data[i].name + "</th>";
                html = html + "<th>" + response.data[i].weigth + "</th>";
                html = html + "<th>" + response.data[i].cookingTime + "</th>";
                html = html + "<th>" + response.data[i].price + "</th>";
                html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                html =  html + "</tr>";
            });
            $('#table_dish').html(html);

            $('.btn-dish').click(function () {
                var str = $(this).val();
                if (!$("#" + str).val()) {
                    alert("Введіть кількість порцій");
                } else {
//                    alert($("#" + str).val());
                    $.ajax({
                        type: "POST",
                        cache: false,
                        url: '/menu/add-dish-to-order',
                        data: {
                            'dishId': $(this).val(),
                            'countDish': $("#" + str).val()
                        },
                        success: function () {
                           alert("Вашу дію успішно виконано!!!")
                        }
                    });
                }
            });
        }
    });
});

    $('#second_dish').click(function () {
        $('#first_dish').attr('class', '');
        $('#second_dish').attr('class', 'active');
        $('#hot_snack').attr('class', '');
        $('#colt_snack').attr('class', '');
        $('#garnish').attr('class', '');
        $('#dessert').attr('class', '');

        $.ajax({
            type: "GET",
            cache: false,
            url: '/menu/second_dish',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].name + "</th>";
                    html = html + "<th>" + response.data[i].weigth + "</th>";
                    html = html + "<th>" + response.data[i].cookingTime + "</th>";
                    html = html + "<th>" + response.data[i].price + "</th>";
                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);


                $('.btn-dish').click(function () {
                    var str = $(this).val();
                    if (!$("#" + str).val()) {
                        alert("Введіть кількість порцій");
                    } else {
//                    alert($("#" + str).val());
                        $.ajax({
                            type: "POST",
                            cache: false,
                            url: '/menu/add-dish-to-order',
                            data: {
                                'dishId': $(this).val(),
                                'countDish': $("#" + str).val()
                            },
                            success: function () {
                                alert("Вашу дію успішно виконано!!!")
                            }
                        });
                    }
                });

            }
        });
    });

    $('#hot_snack').click(function () {
        $('#first_dish').attr('class', '');
        $('#second_dish').attr('class', '');
        $('#hot_snack').attr('class', 'active');
        $('#colt_snack').attr('class', '');
        $('#garnish').attr('class', '');
        $('#dessert').attr('class', '');

        $.ajax({
            type: "GET",
            cache: false,
            url: '/menu/hot_snack',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                //alert(myheader);
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].name + "</th>";
                    html = html + "<th>" + response.data[i].weigth + "</th>";
                    html = html + "<th>" + response.data[i].cookingTime + "</th>";
                    html = html + "<th>" + response.data[i].price + "</th>";
                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);


                $('.btn-dish').click(function () {
                    var str = $(this).val();
                    if (!$("#" + str).val()) {
                        alert("Введіть кількість порцій");
                    } else {
//                    alert($("#" + str).val());
                        $.ajax({
                            type: "POST",
                            cache: false,
                            url: '/menu/add-dish-to-order',
                            data: {
                                'dishId': $(this).val(),
                                'countDish': $("#" + str).val()
                            },
                            success: function () {
                                alert("Вашу дію успішно виконано!!!")
                            }
                        });
                    }
                });

            }
        });
    });

    $('#colt_snack').click(function () {
        $('#first_dish').attr('class', '');
        $('#second_dish').attr('class', '');
        $('#hot_snack').attr('class', '');
        $('#colt_snack').attr('class', 'active');
        $('#garnish').attr('class', '');
        $('#dessert').attr('class', '');

        $.ajax({
            type: "GET",
            cache: false,
            url: '/menu/cold_snack',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].name + "</th>";
                    html = html + "<th>" + response.data[i].weigth + "</th>";
                    html = html + "<th>" + response.data[i].cookingTime + "</th>";
                    html = html + "<th>" + response.data[i].price + "</th>";
                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);


                $('.btn-dish').click(function () {
                    var str = $(this).val();
                    if (!$("#" + str).val()) {
                        alert("Введіть кількість порцій");
                    } else {
//                    alert($("#" + str).val());
                        $.ajax({
                            type: "POST",
                            cache: false,
                            url: '/menu/add-dish-to-order',
                            data: {
                                'dishId': $(this).val(),
                                'countDish': $("#" + str).val()
                            },
                            success: function () {
                                alert("Вашу дію успішно виконано!!!")
                            }
                        });
                    }
                });

            }
        });
    });

    $('#garnish').click(function () {
        $('#first_dish').attr('class', '');
        $('#second_dish').attr('class', '');
        $('#hot_snack').attr('class', '');
        $('#colt_snack').attr('class', '');
        $('#garnish').attr('class', 'active');
        $('#dessert').attr('class', '');

        $.ajax({
            type: "GET",
            cache: false,
            url: '/menu/garnish',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].name + "</th>";
                    html = html + "<th>" + response.data[i].weigth + "</th>";
                    html = html + "<th>" + response.data[i].cookingTime + "</th>";
                    html = html + "<th>" + response.data[i].price + "</th>";
                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);


                $('.btn-dish').click(function () {
                    var str = $(this).val();
                    if (!$("#" + str).val()) {
                        alert("Введіть кількість порцій");
                    } else {
//                    alert($("#" + str).val());
                        $.ajax({
                            type: "POST",
                            cache: false,
                            url: '/menu/add-dish-to-order',
                            data: {
                                'dishId': $(this).val(),
                                'countDish': $("#" + str).val()
                            },
                            success: function () {
                                alert("Вашу дію успішно виконано!!!")
                            }
                        });
                    }
                });

            }
        });
    });

    $('#dessert').click(function () {
        $('#first_dish').attr('class', '');
        $('#second_dish').attr('class', '');
        $('#hot_snack').attr('class', '');
        $('#colt_snack').attr('class', '');
        $('#garnish').attr('class', '');
        $('#dessert').attr('class', 'active');

        $.ajax({
            type: "GET",
            cache: false,
            url: '/menu/dessert',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].name + "</th>";
                    html = html + "<th>" + response.data[i].weigth + "</th>";
                    html = html + "<th>" + response.data[i].cookingTime + "</th>";
                    html = html + "<th>" + response.data[i].price + "</th>";
                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);


                $('.btn-dish').click(function () {
                    var str = $(this).val();
                    if (!$("#" + str).val()) {
                        alert("Введіть кількість порцій");
                    } else {
//                    alert($("#" + str).val());
                        $.ajax({
                            type: "POST",
                            cache: false,
                            url: '/menu/add-dish-to-order',
                            data: {
                                'dishId': $(this).val(),
                                'countDish': $("#" + str).val()
                            },
                            success: function () {
                                alert("Вашу дію успішно виконано!!!")
                            }
                        });
                    }
                });

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
