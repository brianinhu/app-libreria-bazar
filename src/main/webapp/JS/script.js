$(document).ready(function () {
    $('.slide-inner').slick({
        slidesToShow: 5,
        slidesToScroll: 1,
        infinite: true,
        prevArrow: $('.prev-button'),
        nextArrow: $('.next-button')
    });
});