document.addEventListener('turbolinks:load', function () {
  var progressBar = document.querySelector('.progress-bar');

  if (progressBar) {
    var questionNumber = progressBar.dataset.questionNumber;
    var questionsCount = progressBar.dataset.questionsCount;

    var progressPercent = ((100 * questionNumber) / questionsCount) + '%';
    progressBar.style.width = progressPercent;
  }
});
