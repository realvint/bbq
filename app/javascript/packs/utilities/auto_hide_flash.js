document.addEventListener('turbolinks:load', function() {
  // Timeout hide flash
  let alert = document.getElementById('alert');
  if (alert) fadeOut(alert, 5000)

  // Timeout hide error
  let errs = document.getElementById('errors');
  if (errs) fadeOut(errs, 7000)

  // Timeout hide Devise error
  let deviseErrorExplanation = document.getElementById('error_explanation');
  if (deviseErrorExplanation) fadeOut(deviseErrorExplanation, 7000)

  function fadeOut(object, time) {
    window.setTimeout(function () {
      object.remove()
    }, time);
  }
});
