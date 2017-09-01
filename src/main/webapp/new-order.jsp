<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="no-new-order">
    <h1>Ваше поточне замовлення</h1>
    <h3>Зараз у вас не має нового замовлення, натисніть кнопу "Створити", для того щоб створити
        нове замовлення</h3>
    <button type="button" class="btn btn-primary add-new-order">Створити</button>
</div>
<div id="is-new-order">

    <h1>Замовлення є</h1>

</div>

<script>

    $('.add-new-order').click(function () {

        $.ajax({
            type: "POST",
            cache: false,
            url: '/api/add-new-order',
            data: '',
            success: function () {
                alert("Нове замовлення створенно!");
                document.location.replace("/orders");
            }
        });

    });
</script>