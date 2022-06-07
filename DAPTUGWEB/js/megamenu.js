$.fn.megamenu = function (e) { function r() { $(".megamenu").find("li, a").unbind(); if (window.innerWidth <= 768) { o(); s(); if (n == 0) { $(".megamenu > li:not(.showhide)").hide(0) } } else { u(); i() } } function i() { $(".megamenu li").bind("mouseover", function () { $(this).children(".dropdown, .megapanel").stop().fadeIn(t.interval) }).bind("mouseleave", function () { $(this).children(".dropdown, .megapanel").stop().fadeOut(t.interval) }) } function s() { $(".megamenu > li > a").bind("click", function (e) { if ($(this).siblings(".dropdown, .megapanel").css("display") == "none") { $(this).siblings(".dropdown, .megapanel").slideDown(t.interval); $(this).siblings(".dropdown").find("ul").slideDown(t.interval); n = 1 } else { $(this).siblings(".dropdown, .megapanel").slideUp(t.interval) } }) } function o() { $(".megamenu > li.showhide").show(0); $(".megamenu > li.showhide").bind("click", function () { if ($(".megamenu > li").is(":hidden")) { $(".megamenu > li").slideDown(300) } else { $(".megamenu > li:not(.showhide)").slideUp(300); $(".megamenu > li.showhide").show(0) } }) } function u() { $(".megamenu > li").show(0); $(".megamenu > li.showhide").hide(0) } var t = { interval: 250 }; var n = 0; $(".megamenu").prepend("<li class='showhide'><span class='title'>MENU</span><span class='icon1'></span><span class='icon2'></span></li>"); r(); $(window).resize(function () { r() }) }

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