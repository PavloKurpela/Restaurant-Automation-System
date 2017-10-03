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
            <div class="col-lg-9 col-lg-push-3">

                <ul class="nav nav-tabs nav-justified">
                    <li role="presentation"><a href="/admin/dish">Страви</a></li>
                    <li role="presentation" class="active"><a href="/admin/waiter">Офіціанти</a></li>
                    <li role="presentation"><a href="/admin/order">Замовлення</a></li>
                </ul>

                <div class="container-fluid">
                    <div class="row">
                        <form role="form" enctype="multipart/form-data" method="post">
                            <table id="myTable" class="table table-hover" cellspacing="0" width="100%">
                                <thead>
                                <tr>
                                    <th>Імя</th>
                                    <th>Прізвище</th>
                                    <th>Логін</th>
                                    <th>Статус</th>
                                    <th>Кількість активних замовлень</th>
                                    <th></th>
                                </tr>
                                </thead>

                                <tbody id="table_waiter">

                                </tbody>
                            </table>
                        </form>

                        <button type="button" class="btn btn-success" data-toggle="modal" data-target=".modal-add-waiter">Новий офіціант</button>

                        <%--Модальне вікно для вибору часу замовлення--%>

                        <div class="modal fade modal-add-waiter" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                            <div class="modal-dialog modal-lg" role="document">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                        <h4 class="modal-title">Новий офіціант</h4>
                                    </div>
                                    <form:form method="POST" action="addWaiter" modelAttribute="waiter">
                                        <div class="modal-body">

                                            <table class="table table-hover" cellspacing="0" width="100%">
                                                <tbody>
                                                <tr>
                                                    <th><h3><form:label path="firstName">Імя</form:label></h3></th>
                                                    <th><h3><form:input cssStyle="width: 200px" path="firstName"/></h3></th>
                                                </tr>
                                                <tr>
                                                    <th><h3><form:label path="lastName">Прізвище</form:label></h3></th>
                                                    <th><h3><form:input cssStyle="width: 200px" path="lastName"/></h3></th>
                                                </tr>
                                                <tr>
                                                    <th><h3><form:label path="loginName">Логін</form:label></h3></th>
                                                    <th><h3><form:input cssStyle="width: 200px" path="loginName"/></h3></th>
                                                    </th>
                                                </tr>
                                                <tr>
                                                    <th><h3><form:label path="password">Пароль</form:label></h3></th>
                                                    <th><h3><form:input cssStyle="width: 200px" path="password"/></h3></th>
                                                </tr>
                                                </tbody>

                                            </table>

                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-default" data-dismiss="modal">Відмінити</button>
                                            <button id="save-waiter" type="submit" class="btn btn-primary">Зберегти</button>
                                        </div>
                                    </form:form>
                                </div>
                            </div>
                        </div>
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

    $(window).load(function () {

        $.ajax({
            type: "GET",
            cache: false,
            url: '/admin/all_waiter',
            data: "",
            success: function (response) {
                var html = '';
                //html = response.result;
                $.each(response.data, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data[i].firstName + "</th>";
                    html = html + "<th>" + response.data[i].lastName + "</th>";
                    html = html + "<th>" + response.data[i].loginName + "</th>";
                    if (response.data[i].active == true) {
                        html = html + "<th>Працює</th>";
                    } else {
                        html = html + "<th>Не працює</th>";
                    }
                    html = html + "<th>" + response.data[i].countActiveOrders + "</th>";
//                    html = html + "<th><button type=\"button\" id=\"changeDish\" name=\"changeDish\" value='" + response.data[i].id + "'class=\"btn btn-success btn-change-dish\">Редагувати</button></th>";
                    html = html + "<th><button type=\"button\" id=\"deleteWaiter\" name=\"deleteWaiter\" value='" + response.data[i].id + "'class=\"btn btn-success btn-delete-waiter\">Видалити</button></th>";
                    html =  html + "</tr>";
                });
                $('#table_waiter').html(html);

                $('.btn-delete-waiter').click(function () {

                    var url = '/admin/one-waiter/' + $(this).val();

                    $.ajax({
                        type: "DELETE",
                        cache: false,
                        url: url,
                        data: '',
                        success: function () {
                            alert("Офіціанта видаленно!");
                            document.location.replace("/admin/waiter");
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
</body>
</html>
