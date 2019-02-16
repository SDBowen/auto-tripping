// reload JS on page loads
document.addEventListener("turbolinks:load", function() {
  // Trip tool tips
  $(function() {
    $('[data-toggle="tooltip"]').tooltip();
  });

  // Load datatable
  $(document).ready(function() {
    $("#dttb").dataTable({
      order: [6, "asc"],
      pageLength: 100,
      searching: false,
      paging: false,
      info: false
    });
  });

  // date picker
  $(document).ready(function() {
    $("#index-date-picker")
      .datepicker({ autoclose: true })
      .on("changeDate", function(e) {
        console.log(e);
      });
  });
});
