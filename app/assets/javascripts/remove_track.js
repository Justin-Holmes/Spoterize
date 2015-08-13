$(document).ready(function(){
  $('td.like-track').append($("<span class='btn delete-song pull-right'><i class='fa fa-times fa-lg'></i></span>"));

  $('.delete-song').click(function(){
    var $like = $(this).closest('.like')
    var likeParams = {
      like: {
        like_index: $(this).closest('.like').data('index')
      }
    };

    $.ajax({
      type: 'DELETE',
      url: '/api/v1/remove_like',
      data: likeParams,
      success: function() {
        $like.remove();
      },
      error: function(){
        $like.remove();
      }
    });
  });
});

