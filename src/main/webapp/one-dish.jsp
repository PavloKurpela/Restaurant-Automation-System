<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="en">
<head>

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

                        <a href="/admin/dish"><button type="button" class="btn btn-default">Назад</button></a>
                        <button id="change-dish" type="submit" class="btn btn-primary">Зберегти</button>

                    </div>
                </form:form>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/bootstrap.min.js"></script>
<%--</body>--%>
<%--</html>--%>
