$(document).ready(function() {

    $('#filters_form_id').validate({
        messages: {
            age: {
                pattern: "<div class=\"text-danger small\">Пожалуйста, проверьте, правильно ли указан возраст.</div>",
                min: "<div class=\"text-danger small\">Пожалуйста, проверьте, правильно ли указан возраст.</div>",
                max: "<div class=\"text-danger small\">Пожалуйста, проверьте, правильно ли указан возраст.</div>"
            }
        },
    });

    var $regionSelect = $('.js-region-select-multiple'); //making it JQuery object
    var $countrySelect = $('.js-country-select-multiple');
    var $categorySelect = $('.js-category-select-multiple');

    $countrySelect.select2({
        placeholder: "Выберите страны",
        allowClear: true,
        theme: "bootstrap",
        width: '100%',
        ajax: {
            url: '/api/v1/countries/select2',
            dataType: 'json'
        }
    });

    $countrySelect.on("change", function (e) {
        var countries = $countrySelect.val();
        if (countries.length > 0) {
            $regionSelect.attr('data-select2-countries', $countrySelect.serialize());
            $('.js-region-select-multiple-block').show();
            $regionSelect.trigger('change');
        } else {
            $('.js-region-select-multiple-block').hide();
            $regionSelect.val(null);
            $regionSelect.attr('data-select2-countries', "");
        }
    });

    var countriesList = getAllUrlParams()['countries[]'] || [];
    if (typeof countriesList === 'string') {
        countriesList = [countriesList];
    }

    for (var i = 0; i < countriesList.length; i++) {
        $.ajax({
            type: 'GET',
            url: '/api/v1/countries/select2',
            data: {
                id : countriesList[i]
            }
        }).then(function (data) {
            // create the option and append to Select2
            var option = new Option(data.name, data.id, true, true);
            $countrySelect.append(option).trigger('change');

            // manually trigger the `select2:select` event
            $countrySelect.trigger({
                type: 'select2:select',
                params: {
                    data: data
                }
            });
        });
    }

    var $regionSelect = $('.js-region-select-multiple').select2({
        placeholder: "Уточните города",
        allowClear: true,
        theme: "bootstrap",
        width: '100%',
        ajax: {
            url: function() {
                if ($regionSelect.attr('data-select2-countries')) {
                    return '/api/v1/regions/select2?' +  $regionSelect.attr('data-select2-countries');
                } else {
                    return '/api/v1/regions/select2';
                }
            },
            dataType: 'json',
        }
    });

    var regionsList = getAllUrlParams()['regions[]'] || [];
    if (typeof regionsList === 'string') {
        regionsList = [regionsList];
    }

    for (var i = 0; i < regionsList.length; i++) {
        $.ajax({
            type: 'GET',
            url: '/api/v1/regions/select2',
            data: {
                id : regionsList[i]
            }
        }).then(function (data) {
            // create the option and append to Select2
            var option = new Option(data.name, data.id, true, true);
            $regionSelect.append(option).trigger('change');

            // manually trigger the `select2:select` event
            $regionSelect.trigger({
                type: 'select2:select',
                params: {
                    data: data
                }
            });
        });
    }

    $categorySelect.select2({
        placeholder: "Уточните тип лагеря",
        allowClear: true,
        theme: "bootstrap",
        width: '100%',
        ajax: {
            url: '/api/v1/categories/select2',
            dataType: 'json'
        }
    });

    var categoriesList = getAllUrlParams()['categories[]'] || [];
    if (typeof categoriesList === 'string') {
        categoriesList = [categoriesList];
    }

    for (var i = 0; i < categoriesList.length; i++) {
        $.ajax({
            type: 'GET',
            url: '/api/v1/categories/select2',
            data: {
                id : categoriesList[i]
            }
        }).then(function (data) {
            // create the option and append to Select2
            var option = new Option(data.name, data.id, true, true);
            $categorySelect.append(option).trigger('change');

            // manually trigger the `select2:select` event
            $categorySelect.trigger({
                type: 'select2:select',
                params: {
                    data: data
                }
            });
        });
    }

    var age = getAllUrlParams().age
    if (typeof age === 'string') {
        $('#filters_age_input_id').val(age);
    }

});
