/* Contains all the self written Javascript Related to Homepage and in Specific Rooms */
//= require jquery
//= require jquery2
//= require bootstrap

$(document).on('ready', function() {
    $('body').on('click', '#room-category-form-button', () => {
        $('#room-category-form').submit()
    });

    startTimer(30); // hardcoded for now, look into making this value dynamic -> also hardcoded in html page on initial load
})

// controls the in game timer
function timerMechanism(duration, display) {
    var timer = duration, minutes, seconds;
    setInterval(function () {
        minutes = parseInt(timer / 60, 10);
        seconds = parseInt(timer % 60, 10);

        minutes = minutes < 10 ? "0" + minutes : minutes;
        seconds = seconds < 10 ? "0" + seconds : seconds;

        display.textContent = minutes + ":" + seconds;

        if (--timer < 0) {
            if (document.querySelector('#end-game-button') != null) {
                var end_game_button = document.querySelector('#end-game-button');
                end_game_button.click();
            };
        };
    }, 1000);
}

function startTimer(time) {
    if (document.querySelector('#time') != null) {
        var display = document.querySelector('#time');
        timerMechanism(time, display);
    };
}