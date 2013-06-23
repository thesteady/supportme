#SupportMe!
---

Your one stop spot for customer service.

A gSchool project by goats. :goat:

goats = [Laura Steadman, Jorge Tellez, John Maddux]

###Installation

* Clone the repo
* Start Rails / rails s
* Start Private Pub / rackup private_pub.ru -s thin -E production

###Window Widget

Copy and paste this code into your site to make it work.


  <script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.1/jquery.min.js"></script>

  <script>
    var inIframe = false;

    var iframeClicker = function(){
      $('iframe[src^="http://localhost:3000"]')
        .bind('mouseover', function(){
          console.log('entered iframe');
          inIframe = true;
          if ( inIframe ) { $('#supportMe').css({height: "200"}); }
        })
        .bind('mouseout', function(){
          console.log('left iframe');
          inIframe = false;
          if ( inIframe == false ) { $('#supportMe').css({height: "50"}); }
        });
      };
    ;

    $(document).ready(function(){
      iframeClicker()
    })
  </script>

  <iframe id="supportMe" src="http://localhost:3000/customers/new" frameborder="0" overflow-x="hidden"; overflow-y= "scroll" style="position:fixed; left:70%; bottom:0px; z-index:1000; height:50px; width:260px; border:1px solid gray;"></iframe>


###Tests

To run the tests run the following commands in your terminal.

rake db:test:prepare

be rspec