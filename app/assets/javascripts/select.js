// In your Javascript (external .js resource or <script> tag)
document.addEventListener("turbolinks:load", function() { //don't know why, but this is some turbolinks issues
    $('.js-select').select2({
        theme: "bootstrap",
        allowClear: true
    });
});