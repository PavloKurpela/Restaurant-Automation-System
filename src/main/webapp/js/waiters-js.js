
$( window ).load(function() {
    $('#new-order').click();
});

$('#new-order').click(function () {
    $('#all-orders').attr('class', '');
    $(this).attr('class', 'active');

//        document.location.replace("/orders");
    $('#mycontext').load("new-order.jsp");

    $.ajax({
        type: "GET",
        cache: false,
        url: '/orders/new-order',
        data: "",
        success: function (response) {


            if (response.result == "success") {
                $('#no-new-order').hide();
                //$('#start-date-order').html('' + response.data.dateTimeFrom);
                $('#start-date-order').html(response.data.dateTimeFrom);
                $('#end-date-order').html(response.data.dateTimeBefore);
                if (response.data.tableOrdered != null) {
                    $('#ordered-table').html("Столик №" + response.data.tableOrdered.numberTable);
                } else {
                    $('#ordered-table').html("Не обрано");
                }
                if(response.data.countPerson == 0) {
                    $('#cout-person').html('не вказано');
                } else {
                    $('#cout-person').html(response.data.countPerson);
                }
                $('#sum-order').html(response.data.orderSum)

                var html = '';
                //html = response.result;
                $.each(response.data.orderedDishes, function (i) {
                    html =  html + "<tr>";
                    html = html + "<th>" + response.data.orderedDishes[i].dish.name + "</th>";
                    html = html + "<th>" + response.data.orderedDishes[i].dish.price + "</th>";
                    html = html + "<th>" + response.data.orderedDishes[i].count + "</th>";
                    var sum = response.data.orderedDishes[i].dish.price * response.data.orderedDishes[i].count;
                    html = html + "<th>" + sum + "</th>";
//                            html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                    html = html + "<th><button type=\"button\" name=\"changeCount\" value='" + response.data.orderedDishes[i].dish.id + "'class=\"btn btn-success btn-change\">Змінити кількість</button></th>";
                    html = html + "<th><button type=\"button\" name=\"deleteDish\" value='" + response.data.orderedDishes[i].dish.id + "'class=\"btn btn-success btn-delete\">Видалити</button></th>";

                    html =  html + "</tr>";
                });
                if(html == '') {
                    $('#selected-dish').html("Ви ще не обрали жодної позиції...");
                } else {
                    $('#selected-dish').html(html);
                }

            } else {
                $('#is-new-order').hide();
            }

            $('.btn-delete').click(function(){
                //alert($(this).val());

                var url = '/orders/new-order/' + $(this).val();

                $.ajax({
                    type: "DELETE",
                    cache: false,
                    url: url,
                    data: '',
                    success: function () {
                        alert("Вашу дію успішно виконано!!!");
                        document.location.replace("/orders");
                    }
                });
            });

        }

    });


});




$('#all-orders').click(function () {
    $('#active-orders').attr('class', '');
    $(this).attr('class', 'active');

    $('#mycontext').load('all-orders.jsp');
    $.ajax({
        type: "GET",
        cache: false,
        url: '/orders/all',
        data: "",
        success: function (response) {
            var html = '';
            //html = response.result;
            $.each(response.data, function (i) {
                html =  html + "<tr>";
                html = html + "<th id='id-ord'>" + response.data[i].id + "</th>";
                html = html + "<th>" + response.data[i].timeShipmentOrder + "</th>";
                html = html + "<th>" + response.data[i].dateTimeFrom + "</th>";
                html = html + "<th>" + response.data[i].status + "</th>";
                html = html + "<th>" + response.data[i].orderSum + "</th>";
                if(response.data[i].paymentStatus == false) {
                    html = html + "<th>Неоплаченно</th>";
                } else {
                    html = html + "<th>Оплаченно</th>";
                }
                html = html + "<th></th>";
//                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
//                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                html =  html + "</tr>";
            });
            $('#table-my-orders').html(html);

                $(document).on('click', '#table-my-orders tr', function () {

                    var x = $(this).find('th#id-ord').text();

                    url = "/orders/" + x;

                    $('#main-content').load("one-order.jsp");

                    $.ajax({
                        type: "GET",
                        cache: false,
                        url: url,
                        data: "",
                        success: function (response) {


                            if (response.result == "success") {
                                $('#title-order-number').html(response.data.id);
                                //$('#start-date-order').html('' + response.data.dateTimeFrom);
                                $('#start-date-order').html(response.data.dateTimeFrom);
                                $('#end-date-order').html(response.data.dateTimeBefore);
                                if (response.data.tableOrdered != null) {
                                    $('#ordered-table').html("Столик №" + response.data.tableOrdered.numberTable);
                                } else {
                                    $('#ordered-table').html("Не обрано");
                                }
                                if (response.data.countPerson == 0) {
                                    $('#cout-person').html('не вказано');
                                } else {
                                    $('#cout-person').html(response.data.countPerson);
                                }
                                $('#sum-order').html(response.data.orderSum)
                                if (response.data.status != 'очікується') {
                                    $('.btn-delete-order').hide();
                                }
                                if (response.data.status == 'очікується') {
                                   $('#waiter').html("не призначено")
                                } else {
                                    $('#waiter').html(response.data.waiter.lastName + ' ' + response.data.waiter.firstName);
                                }
                                var html = '';
                                //html = response.result;
                                $.each(response.data.orderedDishes, function (i) {
                                    html = html + "<tr>";
                                    html = html + "<th>" + response.data.orderedDishes[i].dish.name + "</th>";
                                    html = html + "<th>" + response.data.orderedDishes[i].dish.price + "</th>";
                                    html = html + "<th>" + response.data.orderedDishes[i].count + "</th>";
                                    var sum = response.data.orderedDishes[i].dish.price * response.data.orderedDishes[i].count;
                                    html = html + "<th>" + sum + "</th>";
//                            html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
                                    html = html + "</tr>";
                                });
                                if (html == '') {
                                    $('#selected-dish').html("Ви ще не обрали жодної позиції...");
                                } else {
                                    $('#selected-dish').html(html);
                                }

                            } else {
                                $('#is-new-order').hide();
                            }

                        }

                    });


                });
        }
    });
});
