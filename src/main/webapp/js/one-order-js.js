

$('.btn-back-to-order').click(function () {
    document.location.replace("/orders");
});

$('.btn-delete-order').click(function () {


    var url = '/orders/' + $('#title-order-number').html();

    $.ajax({
        type: "DELETE",
        cache: false,
        url: url,
        data: '',
        success: function () {
            alert("Ваше замовлення відміненно!");
            document.location.replace("/orders");
        }
    });
});