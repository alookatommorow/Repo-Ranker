$(document).ready(function() {

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
