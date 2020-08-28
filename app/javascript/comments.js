$(function(){
  function buildHTML(comment){
    let html = `<p>${comment.nickname}
                    ${comment.craeted_at}</p>
                <p>${comment.text}</p>`
    return html;
  }
  $('#new_comment').on('submit', function(e){
    e.preventDefault();

    let formData = new FormData(this);
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: "POST",
      data: formData,
      dataType: 'json',
      processData: false,
      contentType: false
    })
    .done(function(data){
      console.log("ok");
      let html = buildHTML(data);
      $('.card-body').prepend(html);
      $('.form-control').val('');
      $('.btn-primary CommentSubmitBtn').prop('disabled', false);
    })
    .fail(function(){
      alert('error');
    })
  })

});