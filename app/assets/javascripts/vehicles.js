$(window).load(function(){
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

  $(".edit_vehicle").validate({
      onsubmit: true,
      errorClass: 'got_error',
      rules: {
        "vehicle[occupants]":{
          required:true
        },
        "vehicle[construction_attributes][start_date]":{
          required:true
        },
        "vehicle[construction_attributes][delivery_date]":{
          required:true,
        }
      },
      messages: {
        "vehicle[occupants]":{
          required: "Occupants cannot be blank"
        },
        "vehicle[construction_attributes][start_date]":{
          required: "Start date is required",
        },
        "vehicle[construction_attributes][delivery_date]":{
          required: "End date is required",
          endate_greater_startdate: "Delivery date cannot be in past."
        }
      },  
  });

  $(".new_vehicle").validate({
      onsubmit: true,
      errorClass: 'got_error',
      rules: {
        "vehicle[occupants]":{
          required:true
        },
        "vehicle[construction_attributes][start_date]":{
          required:true
        },
        "vehicle[construction_attributes][delivery_date]":{
          required:true,
        }
      },
      messages: {
        "vehicle[occupants]":{
          required: "Occupants cannot be blank"
        },
        "vehicle[construction_attributes][start_date]":{
          required: "Start date is required",
        },
        "vehicle[construction_attributes][delivery_date]":{
          required: "End date is required",
          endate_greater_startdate: "Delivery date cannot be in past."
        }
      },  
  });

  $(function() {
    $( "#start_date" ).datepicker({ minDate: 0, maxDate: "+5Y +1M +10D",dateFormat: 'D, dd M yy' });
    $( "#delivery_date" ).datepicker({ minDate: 0, maxDate: "+5Y +1M +10D",dateFormat: 'D, dd M yy' });
  });

  
    // Hiding and showing attributes for vehicles
    if ($("#vehicle_vehicle_type").val() == 'Shuttle'){
      $("#payload_weight").hide();
      $("#occupants").show();
    }
    else if ($("#vehicle_vehicle_type").val() == 'Satellite'){ 
      $("#payload_weight").show();
      $("#occupants").hide();
    }

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
});


