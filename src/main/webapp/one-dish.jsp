<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>

    <%--<title>Menu - Restaurant Automation System</title>--%>
    <%--<script--%>
            <%--src="https://code.jquery.com/jquery-2.1.3.js"--%>
            <%--integrity="sha256-goy7ystDD5xbXSf+kwL4eV6zOPJCEBD1FBiCElIm+U8="--%>
            <%--crossorigin="anonymous"></script>--%>
    <%--&lt;%&ndash;<script&ndash;%&gt;--%>
            <%--&lt;%&ndash;src="https://code.jquery.com/jquery-3.2.1.js"&ndash;%&gt;--%>
            <%--&lt;%&ndash;integrity="sha256-DZAnKJ/6XZ9si04Hgrsxu/8s717jcIzLy3oi35EouyE="&ndash;%&gt;--%>
            <%--&lt;%&ndash;crossorigin="anonymous"></script>&ndash;%&gt;--%>

    <%--<%@ include file="header.jsp" %>--%>
    <%--<link href="css/bootstrap.min.css" rel="stylesheet">--%>
    <%--<link href="css/style.css" rel="stylesheet">--%>
    <%--<link href="css/bootstrap-select.css" rel="stylesheet">--%>

<%--</head>--%>
<%--<body>--%>
<%--<%@ include file="navbar.jsp"%>--%>

<%--<div class="wrapper">--%>

    <%--<div class="container">--%>
        <%--<div class="row">--%>
            <%--<div class="col-lg-9 col-lg-push-3">--%>

                <h1>${dish.name}</h1>

                <form:form method="POST" action="changeDish" modelAttribute="dish">
                    <div class="modal-body">

                        <table class="table table-hover" cellspacing="0" width="100%">
                            <tbody>

                            <tr style="display: none">
                                <th><h3><form:label path="id">ID</form:label></h3></th>
                                <th><h3><form:input cssStyle="width: 200px" path="id"/></h3></th>
                            </tr>
                            <tr style="display: none">
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

                        <a href="/admin-dish"><button type="button" class="btn btn-default">Назад</button></a>
                        <button id="change-dish" type="submit" class="btn btn-primary">Зберегти</button>

                    </div>
                </form:form>

            <%--</div>--%>
            <%--<div class="col-lg-3 col-lg-pull-9">--%>

                <%--<div class="panel panel-info">--%>

                    <%--<div class="panel-heading">--%>
                        <%--<div class="sidebar-header">--%>
                            <%--<a href="/">Головна</a>--%>
                        <%--</div>--%>
                        <%--<div class="sidebar-header">--%>
                            <%--<a href="/menu">Меню</a>--%>
                        <%--</div>--%>
                        <%--<div class="sidebar-header">--%>
                            <%--<a id="table-br" href="/tables">Бронювання столиків</a>--%>
                        <%--</div>--%>
                            <%--<div class="sidebar-header">--%>
                                <%--<a href="/orders">Мої замовлення</a>--%>
                            <%--</div>--%>
                        <%--<div class="sidebar-header">--%>
                            <%--<a href="#">Контакти</a>--%>
                        <%--</div>--%>
                    <%--</div>--%>

                <%--</div>--%>

                <%--<div class="panel panel-info hidden-xs">--%>
                    <%--<div class="panel-heading"> <div class="sidebar-header">Пошук</div> </div>--%>
                    <%--<div class="panel-body">--%>
                        <%--<form role="search">--%>
                            <%--<div class="form-group">--%>
                                <%--<div class="input-group">--%>
                                    <%--<span class="input-group-addon">@</span>--%>
                                    <%--<input type="search" class="form-control input-lg" placeholder="ваш запит">--%>

                                    <%--<div class="input-group-btn">--%>
                                        <%--<button class="btn btn-default btn-lg" type="submit"><i class="glyphicon glyphicon-search"></i></button>--%>

                                    <%--</div>--%>
                                <%--</div>--%>
                            <%--</div>--%>
                        <%--</form>--%>
                    <%--</div>--%>
                <%--</div>--%>


                <%--<div class="panel panel-info">--%>
                    <%--<div class="panel-heading"> <div class="sidebar-header">Вхід</div> </div>--%>
                    <%--<div class="panel-body">--%>

                        <%--<form role="form">--%>
                            <%--<div class="form-group">--%>
                                <%--<input type="text" class="form-control input-lg" placeholder="Логін">--%>
                            <%--</div>--%>
                            <%--<div class="form-group">--%>
                                <%--<input type="password" class="form-control input-lg" placeholder="Пароль">--%>
                            <%--</div>--%>

                            <%--<button type="submit" class="btn btn-warning pull-right">Вхід</button>--%>

                        <%--</form>--%>

                    <%--</div>--%>
                <%--</div>--%>

            <%--</div>--%>
        <%--</div>--%>
    <%--</div>--%>
    <%--<div class="clear"></div>--%>
<%--</div>--%>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<%--</body>--%>
<%--</html>--%>
