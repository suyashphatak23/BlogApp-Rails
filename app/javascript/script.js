
// Navigation
document.addEventListener("DOMContentLoaded", function(){
    window.addEventListener('scroll', function() {

        if (window.scrollY > 200) {
            document.getElementById('navbar_top').classList.add("sticky-top");
            document.getElementById('navbar_top').classList.add("shadow");
        }

        else {
            document.getElementById('navbar_top').classList.remove('sticky-top');
            document.getElementById('navbar_top').classList.remove('shadow');
        }
    });
});

// Slider
(function($) {

    const fullHeight = function () {

        $('.js-fullheight').css('height', $(window).height());
        $(window).resize(function () {
            $('.js-fullheight').css('height', $(window).height());
        });

    };
    fullHeight();

    const carousel = function () {
        $('.featured-carousel').owlCarousel({
            loop: true,
            autoplay: true,
            margin: 30,
            animateOut: 'fadeOut',
            animateIn: 'fadeIn',
            nav: true,
            dots: true,
            autoplayHoverPause: false,
            items: 1,
            navText: ["<span class='ion-ios-arrow-back'></span>", "<span class='ion-ios-arrow-forward'></span>"],
            responsive: {
                0: {
                    items: 1
                },
                600: {
                    items: 2
                },
                1000: {
                    items: 3
                }
            }
        });

    };
    carousel();

})(jQuery);