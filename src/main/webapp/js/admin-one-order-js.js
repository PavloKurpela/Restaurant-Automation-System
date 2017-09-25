

$('.btn-back-to-order').click(function () {
    document.location.replace("/admin/order");
});

$('.btn-start-service').click(function () {


    var url = '/admin/start-service/' + $('#title-order-number').html();

    $.ajax({
        type: "POST",
        cache: false,
        url: url,
        data: '',
        success: function () {
            alert("Обслуговування розпочато");
            document.location.replace("/admin/order");
        }
    });
});
