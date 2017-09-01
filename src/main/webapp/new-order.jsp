<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

<div id="no-new-order">
    <h1>Ваше поточне замовлення</h1>
    <h3>Зараз у вас не має нового замовлення, натисніть кнопу "Створити", для того щоб створити
        нове замовлення</h3>
    <button type="button" class="btn btn-success add-new-order">Створити</button>
</div>
<div id="is-new-order">

    <div class="container-fluid">
        <h1>Інформація по замовленню</h1>
        <table class="table table-hover" cellspacing="0" width="100%">
            <tbody>
                <tr>
                    <th><h3>Початок замовлення(Дата та час)</h3></th>
                    <th><h3 id="start-date-order"></h3></th>
                    <th><p><button type="button" style="width: 120px" class="btn btn-success">Обрарти</button></p></th>
                </tr>
                <tr>
                    <th><h3>Закінчення замовлення(орієнтовно)</h3></th>
                    <th><h3 id="end-date-order"></h3></th>
                    <th><p><a href="#"><button type="button" style="width: 120px" class="btn btn-success">Обрати</button></a></p></th>
                </tr>
                <tr>
                    <th><h3>Обраний столик</h3></th>
                    <th><h3 id="ordered-table"></h3></th>
                    <th><a href="/tables"><button type="button" style="width: 120px" class="btn btn-success">Обрати столик</button></a></th>
                </tr>
                <tr>
                    <th><h3>Кількість осіб</h3></th>
                    <th><h3 id="cout-person"></h3></th>
                    <th><button type="button" style="width: 120px" class="btn btn-success add-count-person">Вказати</button></th>
                </tr>
                <tr>
                    <th><h3>Загальна сума</h3></th>
                    <th><h3 id="sum-order"></h3></th>
                </tr>
            </tbody>
        </table>
        <h1>Обрані страви</h1>
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
        <a href="/menu"><button type="button" class="btn btn-success">Перейти до вибору страв...</button></a>
        <button type="button" class="btn btn-success btn-order">Оформити замовлення</button>
        <%--<input type="date" class="form-control" id="date" name="date" placeholder="Дата" required>
            Поле для вибору дати--%>
    </div>

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

    $('.add-count-person').click(function () {

        var count = prompt("Введіть кількість осіб:");

        if (count != null) {

            $.ajax({
                type: "POST",
                cache: false,
                url: '/api/set-count-person',
                data: {
                    'countPerson': count
                },
                success: function () {
                    document.location.replace("/orders");
                }
            });
        }
    });

    $('.btn-order').click(function () {

        $.ajax({
            type: "POST",
            cache: false,
            url: '/menu/add-order',
            data: '',
            success: function (response) {

                if (response.result == "error") {

                    if(response.message == "tableNull") {
                        alert("Столик не вибранно, оберіть будь-ласка столик...");
                        //document.location.replace("/tables");
                    }
                    if (response.message == "dishNull") {
                        alert("Не вибрано жожної позиції...");
                    }
                } else {
                    alert("Замовлення оформленно!")
                }
            }
        });
    });
</script>