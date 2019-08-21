document.addEventListener('turbolinks:load', function () {
  var ticks_timer = document.querySelector('.timer_clock');

  if (ticks_timer) {
    var time = ticks_timer.dataset.timeleft;
    setInterval(function () {
      if (time > 0) {
        time -= 1;
      } else if (time == 0) {
        $('#next_question').click();
      }
      display_result = parseInt(time / 60) + ':' + time % 60;
      ticks_timer.innerHTML = display_result;
    }, 1000)

  };
});
