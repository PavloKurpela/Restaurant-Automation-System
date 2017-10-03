<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
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
        <sec:authorize access="hasAuthority('USER')">
            <div class="sidebar-header">
                <a href="/orders">Мої замовлення</a>
            </div>
        </sec:authorize>
        <div class="sidebar-header">
            <a href="#">Контакти</a>
        </div>
        <sec:authorize access="hasRole('ADMIN')">
            <div class="sidebar-header">
                <a href="/admin/dish">Адміністрування</a>
            </div>
        </sec:authorize>
        <sec:authorize access="hasAuthority('WAITER')">
            <div class="sidebar-header">
                <a href="/waiter">Кабінет офіціанта</a>
            </div>
        </sec:authorize>
    </div>

</div>

<sec:authorize access="!isAuthenticated()">
<div class="panel panel-info">
    <div class="panel-heading"> <div class="sidebar-header">Вхід</div> </div>
    <div class="panel-body">

        <c:url value="/j_spring_security_check" var="loginUrl" />
        <form role="form" action="${loginUrl}" method="post">
            <div class="form-group">
                <input type="text" class="form-control input-lg" name="j_username" placeholder="Login" required>
            </div>
            <div class="form-group">
                <input type="password" class="form-control input-lg" name="j_password" placeholder="Password" required>
            </div>

            <button type="submit" class="btn btn-warning pull-right">Увійти</button>

        </form>

    </div>
</div>
</sec:authorize>