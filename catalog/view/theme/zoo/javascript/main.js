"use strict";

$(document).ready(function () {
    if ($(window).width() < 767) {
        var $menu = $("#my-menu").mmenu({
            // extensions: ["fullscreen", "theme-dark"]
            "extensions": ["fx-menu-zoom", "fx-panels-zoom", "pagedim-black", "theme-dark"]
        });
        var $icon = $("#mmenu-icon");
        var API = $menu.data("mmenu");
        // var logo = $('.logo');
        // var phone = $('.phone');
        var title = $('a.mm-navbar__title');

        title.text('Меню');

        $icon.on("click", function () {
            API.open();
        });

        $("a.nav__link").click(function () {
            API.close();
        });

        API.bind("open:finish", function () {
            setTimeout(function () {
                $icon.addClass("is-active");
            }, 100);

            $icon.on("click", function () {
                API.close();
            });
        });

        API.bind("close:finish", function () {
            setTimeout(function () {
                $icon.removeClass("is-active");
            }, 100);

            $icon.on("click", function () {
                API.open();
            });
        });
    }
});