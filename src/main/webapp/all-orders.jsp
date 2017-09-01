<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div class="container-fluid">
    <div class="row">
        <form role="form" enctype="multipart/form-data" method="post">
            <table id="myTable" class="table table-hover" cellspacing="0" width="100%">
                <thead>
                <tr>
                    <th>Номер</th>
                    <th>Дата</th>
                    <th>Статус</th>
                    <th>Загальна сума</th>
                    <th>Статус оплати</th>
                </tr>
                </thead>

                <tbody id="table-my-orders">

                <%--<c:forEach items="${orders}" var="orders">--%>
                <%--<tr>--%>
                <%--<th>${orders.id}</th>--%>
                <%--<th></th>--%>
                <%--<th>${orders.status}</th>--%>
                <%--<th>${orders.orderSum}</th>--%>
                <%--<th></th>--%>
                <%--</tr>--%>
                <%--</c:forEach>--%>

                </tbody>
            </table>
        </form>

    </div>
</div>
