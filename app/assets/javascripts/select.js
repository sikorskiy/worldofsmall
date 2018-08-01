// In your Javascript (external .js resource or <script> tag)
document.addEventListener("turbolinks:load", function() { //don't know why, but this is some turbolinks issues
    $('.js-select-new').select2({
        theme: "bootstrap",
        tags: true,
        allowClear: true,
        width: "100%",

        createTag: function (params) {
            var term = $.trim(params.term);
            console.log(term);
            if (term === '') {
                return null;
            }

            return {
                id: term,
                text: "Новый: "+ term
            }
        }

    });

    $('.js-select').select2({
        theme: "bootstrap",
        allowClear: true,
        width: "100%"

    });

    $('#filter_form').validate({
        rules: {
          age: {
              min: 0,
              max: 20
          },
          rating: {
              range: [0, 5]
          }
        },
        messages: {
            age: "Некорректно указан возраст",
            rating: "Некорретно указан рейтинг"
        }
    })
});

