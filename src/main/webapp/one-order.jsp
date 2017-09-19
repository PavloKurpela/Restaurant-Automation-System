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
                    <button type="button" class="btn btn-success btn-delete-order">Відмінити замовлення</button>
                    <button type="button" class="btn btn-success btn-back-to-order">Назад</button>

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

    <div class="clear"></div>

<!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<!-- Include all compiled plugins (below), or include individual files as needed -->
<script src="js/orders-js.js"></script>
<script src="js/one-order-js.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/bootstrap-select.min.js"></script>
</body>
</html>
