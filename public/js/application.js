$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
  $('.repo-form').on('submit', function(event) {
    event.preventDefault();
    var type = $(this).attr('method')
    var url = $(this).attr('action')
    var data = $(this).serialize();
    console.log("going");
    $.ajax({
      url: url,
      type: type,
      data: data,
      dataType: 'JSON'
    })
    .done(function(response) {

      console.log(response);
      $('.results-container').children().remove();
      $('.results-container').append(response);
    });
  });


});
