$(document).ready(function() {
  $('#delete').on("click", function(e) {
    e.preventDefault();
    console.log($('#delete'))
    $.ajax({
      url: $(this).attr('href'),
      type: "DELETE"
    }).done(function() {
      window.location.href = '/'
    });
  });
});
