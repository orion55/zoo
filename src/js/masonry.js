$(document).ready(function () {
    $('.category').masonry({
        itemSelector: '.category__item',
        columnWidth: '.category__item',
        percentPosition: true
    });
});