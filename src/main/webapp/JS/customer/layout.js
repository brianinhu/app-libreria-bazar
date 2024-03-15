$(document).ready(function () {
    $('.slide-inner').slick({
        slidesToShow: 4,
        slidesToScroll: 1,
        infinite: true,
        prevArrow: $('.prev-button'),
        nextArrow: $('.next-button'),
        autoplay: true,
        autoplaySpeed: 4000
    });
});