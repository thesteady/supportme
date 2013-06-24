var WaitingClickListener = function() {
    
    $('.waiting').on('click', function() {
      // create a new list item in the active tab
      // add the link (this) to the list item ive just created using inner html
      console.log(this);

      var linkBeingMoved = this;

      var newListItem = document.createElement('li');
      newListItem.setAttribute('id', 'testing')
      newListItem.innerHTML = linkBeingMoved;

      var listActive = document.getElementById('active-chats-list');
      var listWaiting = document.getElementById('waiting-chats-list');
      console.log(listActive);
      console.log(listWaiting);


      $("#active-chats-list").append(this).append("<br>");



     // $('#active-chats ul').append(this).append('<br>');
    });
  };

  $(function(){
    WaitingClickListener();
  });
