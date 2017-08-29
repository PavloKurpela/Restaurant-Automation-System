<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<!DOCTYPE html>
<html>
<head>
    <title>Menu-Restaurant Automation System</title>
</head>
<body>
<ul>
<c:forEach items="${first_dishes}" var="first_dish">
      <li>${first_dish.name}</li>
</c:forEach>
</ul>
</body>
</html>
