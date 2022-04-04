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




    $('#tang').click(function () {
        UpQuantity();
    });

    function UpQuantity() {
        alert("gjhfgdsgfhdsf")
    }

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

$(window).on('scroll', function () {
    if ($(this).scrollTop() > 100) {
        $('.to-top').fadeIn(1000);
        $('.to-top').css('opacity', '1');
    } else {
        $('.to-top').fadeOut();
    }
});
$('.to-top').click(function () {
    $('html,body').animate({
        scrollTop: 0
    }, 1000)
});



    $(document).ready(function () {
                            
                            var defaults = {
        containerID: 'toTop', // fading element id
    containerHoverID: 'toTopHover', // fading element hover id
    scrollSpeed: 1200,
    easingType: 'linear'
                                };


    $().UItoTop({easingType: 'easeOutQuart' });

                        });



$('a[href*="#"]')
    // Remove links that don't actually link to anything
    .not('[href="#"]')
    .not('[href="#0"]')
    .on('click', function (event) {

        // Make sure this.hash has a value before overriding default behavior
        if (this.hash !== "") {

            // Store hash
            var hash = this.hash;

            // Using jQuery's animate() method to add smooth page scroll
            // The optional number (800) specifies the number of milliseconds it takes to scroll to the specified area
            // - 70 is the offset/top margin
            $('html, body').animate({
                scrollTop: $(hash).offset().top - 70
                // scrollTop: $(hash).offset().top - 3.875
            }, 800, function () {

                // Add hash (#) to URL when done scrolling (default click behavior), without jumping to hash
                if (history.pushState) {
                    history.pushState(null, null, hash);
                } else {
                    window.location.hash = hash;
                }
            });
            return false;
        } // End if
    });

});