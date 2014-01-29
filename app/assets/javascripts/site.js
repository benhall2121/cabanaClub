// Place your application-specific JavaScript functions and classes here
// This file is automatically included by javascript_include_tag :defaults


jQuery.ajaxSetup({ 
  'beforeSend': function(xhr) {xhr.setRequestHeader("Accept", "text/javascript")}
})


$(document).ready(function() {
  $('.not_created_yet').click(function(){
  	alert("This page has not yet been created.");
  });

  $("#accounts_search input").keyup(function() {
    $.get($("#accounts_search").attr("action"), $("#accounts_search").serialize(), null, "script");
    return false;
  });

  $(".register_for_class").click(function(){
  	thisId = $(this).attr("id").split(",");
  	
  	if($(this).is(':checked')){
  	  url = "/add_item_to_shopping_cart"
  	} else {
  	  url = "/remove_item_from_shopping_cart"
  	}


  	$.ajax({
      url: url,
      type: 'post',
      data: {
        model_id: thisId[0],
        model_name: thisId[1]
      },
      success: function(r) {
        console.log("Success");
      },
      error: function() {
        console.log("Failed to add Item to Cart");
      }
    });

  });
});














