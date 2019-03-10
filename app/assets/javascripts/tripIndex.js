// reload JS on page loads
document.addEventListener("turbolinks:load", function() {
  // Trip tool tips
  $(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });

  // date picker
  $(document).ready(function() {
    $("#index-date-picker")
      .datepicker({ autoclose: true })
      .on("changeDate", function(data) {
        console.log(data);
        $.post("/trips/", { _method: "get", date: data.date });
      });
  });
});
