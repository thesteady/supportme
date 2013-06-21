var WaitingClickListener = function() {
    $('.waiting').on('click', function() {
      $('#active-chats ul').append(this).append('<br>');
    });
  };

  $(function(){
    WaitingClickListener();
  });
