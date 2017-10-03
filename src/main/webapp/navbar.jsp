<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="container-fluid">
    <div class="row">

        <nav role="navigation" class="navbar navbar-inverse">
            <div class="container">

                <div class="navbar-header header">

                    <div class="container">

                        <div class="row">

                            <div class="col-lg-12">
                                <h1><a href="#">Забава</a></h1>
                                <p>Тут вам завжди раді</p>
                            </div>

                        </div>

                    </div>

                    <button type="button" data-target="#navbarCollapse" data-toggle="collapse" class="navbar-toggle">

                        <span class="sr-only">Toggle navigation</span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>

                    </button>

                </div>

                <div id="navbarCollapse" class="collapse navbar-collapse navbar-right">

                    <ul class="nav nav-pills">
                        <ul class="nav navbar-nav navbar-right">
                            <sec:authorize access="isAuthenticated()">
                            <li><a><span class="glyphicon glyphicon-user"></span> <sec:authentication property="principal.username"/></a></li>
                            <li><a href="/logout"><span class="glyphicon glyphicon-log-out"></span> Вийти</a></li>
                            </sec:authorize>
                            <sec:authorize access="!isAuthenticated()">
                                <li><a href="/login"><span class="glyphicon glyphicon-log-in"></span> Увійти</a></li>
                            </sec:authorize>

                        </ul>
                    </ul>

                </div>

            </div>

            </nav>

    </div>
</div>