/* Contains all the self written Javascript Related to Homepage and in Specific Rooms */
//= require jquery
//= require jquery2
//= require bootstrap

$(document).on('ready', function() {
    console.log("Javascripts Loaded")

    $('body').on('click', '#room-category-form-button', () => {
        console.log('clicked')
        $('#room-category-form').submit()
    });
})