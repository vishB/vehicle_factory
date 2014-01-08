$(window).load(function(){

  // Hiding and showing attributes for vehicles
  $("#vehicle_vehicle_type").val() =='Satellite'
  $("#payload_weight").show();
  $("#occupants").hide();

  $( "#vehicle_vehicle_type" ).change(function() {
    if ($("#vehicle_vehicle_type").val() == 'Shuttle'){
      $("#payload_weight").hide();
      $("#occupants").show();
    }
    else if ($("#vehicle_vehicle_type").val() == 'Satellite'){
      
      $("#payload_weight").show();
      $("#occupants").hide();
    }
  });

  //AJAX call for getting engine power and payload on page load.
   $.ajax({
        type: "GET",
        url: "engine_data",
        context: document.body,
        data: {engine_model : $("#vehicle_engine_id").val()}, 
        success: function(){}
      });

  // AJAX call for getting engine power and payload.
  $("#vehicle_engine_id").change(function() {
  $.ajax({ url: "engine_data", context: document.body,data: {engine_model : $(this).val()}, success: function(){
  }});
});

});

$(document).ready(function() {

  $.validator.addMethod("endate_greater_startdate", function(value, element) {
    return $('#start_date').val() > $('#delivery_date').val()
  }, "* Delivery date should be greater than Start date");

  $("#new_vehicle").validate({
      onsubmit: true,
      errorClass: 'got_error',
      rules: {
        "vehicle[v_identifier]":{
          required: true,
          number: true,
          minlength: 4
        },
        "start_date":{
          required:true
        },
        "delivery_date":{
          required:true,
          endate_greater_startdate:true
        }
      },
      messages: {
        "vehicle[v_identifier]":{
          required: "Required",
          number: "Identifier must be a number"
        },
        "delivery_date":{
          required: "Required",
          endate_greater_startdate: "Delivery date cannot be in past."
        }
      }
  });

  $(function() {
    $( "#start_date" ).datepicker({ minDate: 0, maxDate: "+1M +10D" });
    $( "#delivery_date" ).datepicker({ minDate: 0, maxDate: "+1M +10D" });
  });
});
