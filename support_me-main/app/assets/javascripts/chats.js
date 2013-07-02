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

Scroller = function() {
  var documentHeight = $(document).height();
  $(".admin_chat_content").scrollTop(documentHeight);
}