<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
            <div id="dish-content" class="col-lg-9 col-lg-push-3">

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation" class="active"><a href="/admin/dish">Страви</a></li>
                    <li role="presentation"><a href="/admin/waiter">Офіціанти</a></li>
                    <li role="presentation"><a href="/admin/order">Замовлення</a></li>
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
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody id="table_dish">

                                </tbody>
                            </table>
                        </form>

                        <button type="button" class="btn btn-success" data-toggle="modal" data-target=".modal-add-dish">Додати страву</button>

                        <%--Модальне вікно для вибору часу замовлення--%>

                        <div class="modal fade modal-add-dish" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Нова страва</h4>
                                    </div>
                                    <form:form method="POST" action="addDish" modelAttribute="dish">
                                    <div class="modal-body">

                                        <table class="table table-hover" cellspacing="0" width="100%">
                                            <tbody>
                                            <tr>
                                                <th><h3><form:label path="name">Назва</form:label></h3></th>
                                                <th><h3><form:input cssStyle="width: 200px" path="name"/></h3></th>
                                            </tr>
                                            <tr>
                                                <th><h3><form:label path="price">Ціна(грн)</form:label></h3></th>
                                                <th><h3><form:input cssStyle="width: 200px" path="price"/></h3></th>
                                            </tr>
                                            <tr>
                                                <th><h3><form:label path="weigth">Вага(грам)</form:label></h3></th>
                                                <th><h3><form:input cssStyle="width: 200px" path="weigth"/></h3></th>
                                                </th>
                                            </tr>
                                            <tr>
                                                <th><h3><form:label path="cookingTime">Час готування(хв)</form:label></h3></th>
                                                <th><h3><form:input cssStyle="width: 200px" path="cookingTime"/></h3></th>
                                            </tr>
                                            <tr>
                                                <th><h4><form:label path="type">Тип</form:label></h4></th>
                                                <th><h4><form:radiobutton path="type" value="перше"/> перше <br>
                                                        <form:radiobutton path="type" value="друге"/> друге <br>
                                                        <form:radiobutton path="type" value="гаряча закуска"/> гаряча закуска <br>
                                                        <form:radiobutton path="type" value="холодна закуска"/> холодна закуска <br>
                                                        <form:radiobutton path="type" value="гарнір"/> гарнір <br>
                                                        <form:radiobutton path="type" value="десерт"/> десерт</h4></th> <br>
                                            </tr>
                                            </tbody>

                                        </table>

                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-default" data-dismiss="modal">Відмінити</button>
                                        <button id="save-dish" type="submit" class="btn btn-primary">Зберегти</button>
                                    </div>
                                    </form:form>
                                </div>
                            </div>
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

        $.ajax({
            type: "GET",
            cache: false,
            url: '/admin/all_dish',
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
                    html = html + "<th><button type=\"button\" id=\"changeDish\" name=\"changeDish\" value='" + response.data[i].id + "'class=\"btn btn-success btn-change-dish\">Редагувати</button></th>";
                    html = html + "<th><button type=\"button\" id=\"deleteDish\" name=\"deleteDish\" value='" + response.data[i].id + "'class=\"btn btn-success btn-delete-dish\">Видалити</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_dish').html(html);

                $('.btn-delete-dish').click(function () {

                    var url = '/admin/one-dish/' + $(this).val();

                    $.ajax({
                        type: "DELETE",
                        cache: false,
                        url: url,
                        data: '',
                        success: function () {
                            alert("Страву видаленно!");
                            document.location.replace("/admin/dish");
                        }
                    });
                });

                $('.btn-change-dish').click(function () {

                    $('#dish-content').load("/admin/one-dish/" + $(this).val());

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
