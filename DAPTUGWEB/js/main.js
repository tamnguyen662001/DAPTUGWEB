$(document).ready(function () {
    // $(window).on('scroll', function () {
    //     if ($(this).scrollTop() > 1335) {
    //         $('#x').addClass('fixed-top');
    //     } else {
    //         $('#x').removeClass('fixed-top');
    //     }
    // });
    pos = $('#x').position();
    $(window).on('scroll', function () {
        if ($(this).scrollTop() > parseInt(pos.top)) {
            $('#x').addClass('fixed-top');
            // $(".fixed-top").css(" transition" ,"all 0.3s ease-in-out");
        } else {
            $('#x').removeClass('fixed-top');
        }
    });




    $(function () {
        var $cart = $('#cart');
        $('#clickme').click(function (e) {
            e.stopPropagation();
            if ($cart.is(":hidden")) {
                $cart.slideDown("slow");
            } else {
                $cart.slideUp("slow");
            }
        });
        $(document.body).click(function () {
            if ($cart.not(":hidden")) {
                $cart.slideUp("slow");
            }
        });
    });
})
                      