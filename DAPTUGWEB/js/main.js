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

/*Toast menu*/
function toast({ title = "", message = "", type = "info", duration = 3000 }) {
    const main = document.getElementById("toast");
    if (main) {
        const toast = document.createElement("div");

        // Auto remove toast
        const autoRemoveId = setTimeout(function () {
            main.removeChild(toast);
        }, duration + 1000);

        // Remove toast when clicked
        toast.onclick = function (e) {
            if (e.target.closest(".toast__close")) {
                main.removeChild(toast);
                clearTimeout(autoRemoveId);
            }
        };

        const icons = {
            success: "fas fa-check-circle",
            info: "fas fa-info-circle",
            warning: "fas fa-edit",
            error: "fas fa-exclamation-circle"
        };
        const icon = icons[type];
        const delay = (duration / 1000).toFixed(2);

        toast.classList.add("toast", `toast--${type}`);
        toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;

        toast.innerHTML = `
                      <div class="toast__icon">
                          <i class="${icon}"></i>
                      </div>
                      <div class="toast__body">
                          <h3 class="toast__title">${title}</h3>
                          <p class="toast__msg">${message}</p>
                      </div>
                      <div class="toast__close">
                          <i class="fas fa-times"></i>
                      </div>
                  `;
        main.appendChild(toast);
    }
}

function showSuccessToast() {
    toast({
        title: "Product management",
        message: "Successful add",
        type: "success",
        duration: 3000
    });
}

function showErrorToast() {
    toast({
        title: "Product management",
        message: "Successful updates",
        type: "warning",
        duration: 3000
    });
}

function showRemoveToast() {
    toast({
        title: "Product management",
        message: "Successful remove",
        type: "error",
        duration: 3000
    });
}
function showLoginToast() {
    toast({
        title: "LOGIN",
        message: "Successful Login ",
        type: "success",
        duration: 3000
    });
}