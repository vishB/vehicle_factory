// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require jquery.ui.all
//= require twitter/bootstrap
//= require jquery.validate
//= require jquery.validate.additional-methods
//= require_tree .


$(document).ready(function() {
	setTimeout(function() {
	    $('#test').fadeOut('slow');
	}, 3000);

    $('.delete_post').bind('ajax:success', function() {  
        $(this).closest('tr').fadeOut();  
    }); 

    $("#new_user").validate({
    	  onsubmit: true,
    	  errorClass: 'got_error',
        rules: {
            "user[email]":{
                required: true,
                email: true
            },
            "user[password]":{
                required: true,
                minlength: 7
            },
            "user[password_confirmation]":{
                equalTo: "#user_password"
            },
            "user[user_detail_attributes][first_name]":{
            	required: true,
            	minlength: 2
            },
            "user[user_detail_attributes][last_name]":{
            	required: true,
            	minlength: 2
            },
            "user[user_detail_attributes][age]":{
            	number: true
            },
            "user[user_detail_attributes][phone]":{
            	number: true,
            	minlength:10,
            	maxlength: 11
            }
        },
        messages: {
           
            "user[email]":{
                required: "Required",
                email: "A valid email address is required"
            },
            "user[password]":{
                required: "Required",
                minlength: "Min Length is 8 characters"
            },
            "user[password_confirmation]":{
                equalTo: "New Password Doesn't Match"
            },
            "user[user_detail_attributes][first_name]":{
            	required: "First name is required"
            },
            "user[user_detail_attributes][last_name]":{
            	required: "Last name is required"
            },
            "user[user_detail_attributes][phone]":{
            	required: "Phone number must be decimal value"
            }
        }
    });
     
  $(".numeric_only").keydown(function(event) {
        // Allow: backspace, delete, tab, escape, enter and .
        if ( $.inArray(event.keyCode,[46,8,9,27,13,190]) !== -1 ||
             // Allow: Ctrl+A
            (event.keyCode == 65 && event.ctrlKey === true) || 
             // Allow: home, end, left, right
            (event.keyCode >= 35 && event.keyCode <= 39)) {
                 // let it happen, don't do anything
                 return;
        }
        else {
            // Ensure that it is a number and stop the keypress
            if (event.shiftKey || (event.keyCode < 48 || event.keyCode > 57) && (event.keyCode < 96 || event.keyCode > 105 )) {
                event.preventDefault(); 
            }   
        }
    });

  $('.alphaonly').bind('keyup blur',function(){ 
    $(this).val( $(this).val().replace(/[^a-zA-Z]/g,'') ); }
  );
});


$(document).ready(function() {
  return $(".edit_user_detail").validate({
    onsubmit: true,
    errorClass: "got_error",
    rules: {
      "user_detail[first_name]": {
        required: true,
        minlength: 2
      },
      "user_detail[last_name]": {
        required: true,
        minlength: 2
      },
      "user_detail[age]": {
        number: true
      },
      "user_detail[phone]": {
        number: true,
        minlength: 10,
        maxlength: 11
      }
    },
    messages: {
      "user_detail[first_name]": {
        required: "First name is required"
      },
      "user_detail[last_name]": {
        required: "Last name is required"
      },
      "user_detail[phone]": {
        required: "Phone number must be decimal value"
      }
    }
  });

  $('.alphanumeric').keypress(function (e) {
    var regex = new RegExp("^[a-zA-Z]+$");
    var str = String.fromCharCode(!e.charCode ? e.which : e.charCode);
    if (regex.test(str)) {
        return true;
    }

    e.preventDefault();
    return false;
    });
});

