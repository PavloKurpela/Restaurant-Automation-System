<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<!DOCTYPE html>
<html lang="en">
<head>

    <title>Main - Restaurant Automation System</title>

    <%@ include file="header.jsp" %>

</head>
<body>
<%@ include file="navbar.jsp"%>

<div class="wrapper">

    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-lg-push-3">

                <form role="search"  class="visible-xs">
                    <div class="form-group">
                        <div class="input-group">
                            <input type="search" class="form-control input-lg" placeholder="ваш запит">

                            <div class="input-group-btn">
                                <button class="btn btn-default btn-lg" type="submit"><i class="glyphicon glyphicon-search"></i></button>

                            </div>
                        </div>
                    </div>
                </form>

                <h1>Події і новини</h1>
                <hr>

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

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
</body>
</html>
