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
      pageLength: 50
    });
  });
});
