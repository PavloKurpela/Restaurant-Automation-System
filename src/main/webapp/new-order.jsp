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
                    <th rowspan="2"><button type="button" class="btn btn-success btn-date" style="width: 120px" data-toggle="modal" data-target=".modal-select-date">Обрати</button>
                </tr>
                <tr>
                    <th><h3>Закінчення замовлення(орієнтовно)</h3></th>
                    <th><h3 id="end-date-order"></h3></th>
                    <%--<th rowspan="2"><button type="button" class="btn btn-success" style="width: 120px" data-toggle="modal" data-target=".modal-select-end-date">Обрати</button>--%>
                    </th>
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


        <%--Модальне вікно для вибору часу замовлення--%>

        <div class="modal fade modal-select-date" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
            <div class="modal-dialog modal-sm" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">Вибір дати</h4>
                    </div>
                    <div class="modal-body">
                        <h3>Початок замовлення</h3>
                        <input type="date" class="form-control" id="date-start" name="date-start" placeholder="Дата" required>
                        <p><select id="hour-start" class="selectpicker">
                            <option>00</option>
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                        </select>
                        :
                        <select id="min-start" class="selectpicker">
                            <option>00</option>
                            <option>05</option>
                            <option>10</option>
                            <option>15</option>
                            <option>20</option>
                            <option>25</option>
                            <option>30</option>
                            <option>35</option>
                            <option>40</option>
                            <option>45</option>
                            <option>50</option>
                            <option>55</option>
                        </select></p>
                    <%--<p>One fine body&hellip;</p>--%>
                    </div>
                    <div class="modal-body">
                        <h3>Кінець замовлення</h3>
                        <input type="date" class="form-control" id="date-end" name="date-end" placeholder="Дата" required>
                        <p><select id="hour-end" class="selectpicker">
                            <option>00</option>
                            <option>01</option>
                            <option>02</option>
                            <option>03</option>
                            <option>04</option>
                            <option>05</option>
                            <option>06</option>
                            <option>07</option>
                            <option>08</option>
                            <option>09</option>
                            <option>10</option>
                            <option>11</option>
                            <option>12</option>
                            <option>13</option>
                            <option>14</option>
                            <option>15</option>
                            <option>16</option>
                            <option>17</option>
                            <option>18</option>
                            <option>19</option>
                            <option>20</option>
                            <option>21</option>
                            <option>22</option>
                            <option>23</option>
                        </select>
                            :
                            <select id="min-end" class="selectpicker">
                                <option>00</option>
                                <option>05</option>
                                <option>10</option>
                                <option>15</option>
                                <option>20</option>
                                <option>25</option>
                                <option>30</option>
                                <option>35</option>
                                <option>40</option>
                                <option>45</option>
                                <option>50</option>
                                <option>55</option>
                            </select></p>
                        <%--<p>One fine body&hellip;</p>--%>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Відмінити</button>
                        <button id="save-date" type="button" class="btn btn-primary">Зберегти</button>
                    </div>
                </div>
            </div>
        </div>

    </div>

</div>

<script>

    $('.selectpicker').selectpicker({
//        style: 'btn-info',
        size: 4,
    });

    $('.button-start').click(function () {
        alert('' + $('#date-start').val());
    });



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

    $('#save-date').click(function () {

        if($('#date-start').val() == "") {
            alert("Виберіть будь-ласка дату початку!");
        } else if($('#date-end').val() == "") {
            alert("Виберіть будь-ласка дату закінчення!");
        } else {
            var dateStart = $('#date-start').val() + " " + $('#hour-start').val() + ":" + $('#min-start').val();
            var dateEnd =  $('#date-end').val() + " " + $('#hour-end').val() + ":" + $('#min-end').val();

            $.ajax({
            type: "POST",
            cache: false,
            url: '/api/set-order-date',
            data: {
                'startDate': dateStart,
                'endDate': dateEnd
            },
            success: function () {
                document.location.replace("/orders");
            }
            });
        }
    });
</script>