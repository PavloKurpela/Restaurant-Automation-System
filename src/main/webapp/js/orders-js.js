$('.add-new-order').click(function () {

    $.ajax({
        type: "POST",
        cache: false,
        url: '/api/add-new-order',
        data: '',
        success: function () {
            alert("Вашу дію успішно виконано!!!");
            document.location.replace("/orders");
        }
    });

});

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
        url: '/api/new-order',
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

                var url = '/api/new-order/' + $(this).val();

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

//                    $('.btn-change').click(function(){
//                        alert($(this).val());
//
//                        var url = '/api/new-order/' + $(this).val();
//
//                        var count = 4;
//
//                        $.ajax({
//                            type: "PUT",
//                            cache: false,
//                            url: url,
//                            data: {'newCount' : count},
//                            success: function () {
//                                alert("Вашу дію успішно виконано!!!");
//                                document.location.replace("/orders");
//                            }
//                        });
//                    });

        }

    });


});




$('#all-orders').click(function () {
    $('#new-order').attr('class', '');
    $(this).attr('class', 'active');

    $('#mycontext').load('all-orders.jsp');
    $.ajax({
        type: "GET",
        cache: false,
        url: '/api/orders',
        data: "",
        success: function (response) {
            var html = '';
            //html = response.result;
            $.each(response.data, function (i) {
                html =  html + "<tr>";
                html = html + "<th id='id-ord'>" + response.data[i].id + "</th>";
                html = html + "<th></th>";
                html = html + "<th>" + response.data[i].status + "</th>";
                html = html + "<th>" + response.data[i].orderSum + "</th>";
                html = html + "<th></th>";
//                    html = html + "<th><input type=\"text\" id='" + response.data[i].id +  "'class=\"form-control\"></th>";
//                    html = html + "<th><button type=\"button\" id=\"dishAdd\" name=\"dishAdd\" value='" + response.data[i].id + "'class=\"btn btn-success btn-dish\">Додати</button></th>";
                html =  html + "</tr>";
            });
            $('#table-my-orders').html(html);

//                $('#table-my-orders tr').click(function () {
//                    alert("ddd");
//                });

                $(document).on('click', '#table-my-orders tr', function () {
                    //var x = $(this).text(); // получаем значение со строки "td"
                    var x = $(this).find('th#id-ord').text();

                    url = "/api/order/" + x;

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
//                  $('.btn-dish').click(function () {
//                    var str = $(this).val();
//                    if (!$("#" + str).val()) {
//                        alert("Введіть кількість порцій");
//                    } else {
////                    alert($("#" + str).val());
//                        $.ajax({
//                            type: "POST",
//                            cache: false,
//                            url: '/menu/add-dish-to-order',
//                            data: {
//                                'dishId': $(this).val(),
//                                'countDish': $("#" + str).val()
//                            },
//                            success: function () {
//                                alert("Вашу дію успішно виконано!!!")
//                            }
//                        });
//                    }
//                });
        }
    });
});
