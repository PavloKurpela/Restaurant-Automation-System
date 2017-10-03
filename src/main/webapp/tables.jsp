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

                <sec:authorize access="!isAuthenticated()">
                    <h2 class="access-info">Для бронювання столика потрібно авторизуватись</h2>
                </sec:authorize>

                <div class="container-fluid">
                        <table class="table table-hover" cellspacing="0" width="100%">
                            <thead>
                            <tr>
                                <th>Номер столика</th>
                                <th>Максимальна кількість осіб</th>
                                <%--<th></th>--%>
                            </tr>
                            </thead>

                            <tbody>
                                <c:forEach items="${table}" var="table">
                                    <tr>
                                        <th>${table.numberTable}</th>
                                        <th>${table.maxCountPerson}</th>
                                        <sec:authorize access="isAuthenticated()">
                                            <th>
                                                <button type="button" id="${table.id}" value="${table.id}" class="btn btn-success btn-table">Забронювати</button>
                                            </th>
                                        </sec:authorize>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
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
