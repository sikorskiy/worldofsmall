$(document).ready(function(){
    $(".favourite-book-text").click(function () {
        if ($(this).html().localeCompare("Добавить в список желаний") == 0) {
            $(this).html("Удалить из списка желаний");
        }
        else {
            $(this).html("Удалить из списка желаний 2");
        }


    })


});