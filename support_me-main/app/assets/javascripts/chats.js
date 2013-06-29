var WaitingClickListener = function() {
  $('.waiting').on('click', function() {
    var linkBeingMoved = $(this);
    $("#active-chats-list").append(
      $('<li>').append(linkBeingMoved));
  });
};

$(function(){
  WaitingClickListener();
});


