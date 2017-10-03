<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
                <div class="container-fluid">
                    <h1 id="title-order">Замовлення №<span id="title-order-number"></span> </h1>
                    <table class="table table-hover" cellspacing="0" width="100%">
                        <tbody>
                        <tr>
                            <th><h3>Початок замовлення</h3></th>
                            <th><h3 id="start-date-order"></h3></th>
                        </tr>
                        <tr>
                            <th><h3>Закінчення замовлення</h3></th>
                            <th><h3 id="end-date-order"></h3></th>
                        </tr>
                        <tr>
                            <th><h3>Cтолик</h3></th>
                            <th><h3 id="ordered-table"></h3></th>
                        </tr>
                        <tr>
                            <th><h3>Кількість осіб</h3></th>
                            <th><h3 id="cout-person"></h3></th>
                        </tr>
                        <tr>
                            <th><h3>Загальна сума</h3></th>
                            <th><h3 id="sum-order"></h3></th>
                        </tr>
                        </tbody>
                    </table>
                    <h1>Cтрави</h1>
                    <table  class="table table-hover" cellspacing="0" width="100%">
                        <thead>
                        <tr>
                            <th>Назва</th>
                            <th>Ціна</th>
                            <th>Кількість</th>
                            <th>Вартість</th>
                        </tr>
                        </thead>

                        <tbody id="selected-dish">


                        </tbody>
                    </table>
                    <button type="button" id="complete-order" class="btn btn-success btn-complete-order">Завершити обслуговування</button>
                    <button type="button" id="pay-order" class="btn btn-success btn-pay-order">Оплаченно</button>
                    <button type="button" class="btn btn-success btn-back-to-order">Назад</button>

                </div>

    <div class="clear"></div>


<script>
    $('.btn-back-to-order').click(function () {
        document.location.replace("/waiter/orders");
    });


    $('.btn-complete-order').click(function () {


        var url = '/waiter/order/' + $('#title-order-number').html();

        $.ajax({
            type: "PUT",
            cache: false,
            url: url,
            data: '',
            success: function () {
                alert("Замовлення завершено");
            }
        });
    });

    $('.btn-pay-order').click(function () {


        var url = '/waiter/pay-order/' + $('#title-order-number').html();

        $.ajax({
            type: "PUT",
            cache: false,
            url: url,
            data: '',
            success: function () {
                alert("Оплата здійснена!!!");
            }
        });
    });
</script>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<%--<script src="js/orders-js.js"></script>--%>
<%--<script src="js/one-order-js.js"></script>--%>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
</body>
</html>
