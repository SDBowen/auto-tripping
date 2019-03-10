// reload JS on page loads
document.addEventListener("turbolinks:load", function() {
  // Trip tool tips
  $(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });
});
