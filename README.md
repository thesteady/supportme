#SupportMe!

Your one stop spot for customer service. This project allows website owners to add our chat widget to their site. Customers can then chat with support without leaving the home page! On the support side, we allow the user to chat with up to six customers at a time.

A gSchool project by goats. :goat:

goats = [Laura Steadman, Jorge Tellez, John Maddux]

---

###How It Works

This project is an exercise in Service Oriented Architecture. We have two applications:
1. The Main application -- handles Customer/User creation and login and all front-end display work. Part of this application uses Private Pub (Faye) to allow instantaneous messaging between the two people chatting.

2. The Chat Service application -- handles Chats and Messages.

Here's a diagram of how a message is sent and received in SupportMe:

![Send a Message](/support_me-main/app/assets/images/send_a_message.jpg "Diagram of Message Sending")

---

###Installation

* Clone the repo
* Start Rails /
--- In chat_service: rails s
--- In support_me-main: rails s -p 3001
* Start Private Pub / rackup private_pub.ru -s thin -E production

---

###Window Widget

Copy and paste this code into your site to make it work:

```
  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

  <script>
    var inIframe = false;

    var iframeClicker = function(){
      $('iframe[src^="http://localhost:3000"]')
        .bind('mouseover', function(){
          console.log('entered iframe');
          inIframe = true;
          if ( inIframe ) { $('#supportMe').css({height: "260"}); }
        })
        .bind('mouseout', function(){
          console.log('left iframe');
          inIframe = false;
          if ( inIframe == false ) { $('#supportMe').css({height: "40"}); }
        });
      };
    ;

    $(document).ready(function(){
      iframeClicker()
    })
  </script>

  <iframe id="supportMe" src="http://localhost:3000/customers/new" frameborder="0" overflow-x="hidden"; overflow-y= "scroll" style="position:fixed; left:70%; bottom:0px; z-index:1000; height:40px; width:260px; border:1px solid gray;"></iframe>
```

---

###Tests

To run the tests run the following commands in your terminal.

rake db:test:prepare

be rspec
