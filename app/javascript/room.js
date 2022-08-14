/* Contains all the self written Javascript Related to Homepage and in Specific Rooms */
//= require jquery
//= require jquery2
//= require bootstrap

$(document).on('ready', function() {
    $('body').on('click', '#room-category-form-button', () => {
        $('#room-category-form').submit()
    });
})
