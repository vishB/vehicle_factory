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
  // AJAX call for getting engine power and payload on page load.
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
  $("#new_vehicle").validate({
      onsubmit: true,
      errorClass: 'got_error',
      rules: {
        "vehicle[v_identifier]":{
          required: true,
          number: true,
          minlength: 4
        },
      },
      messages: {
        "vehicle[v_identifier]":{
          required: "Required",
          number: "Identifier must be a number"
        },
      }
  });

  $('#datetimepicker1').datetimepicker({
    language: 'pt-BR'
  });

  $('#datetimepicker2').datetimepicker({
    language: 'pt-BR'
  });
});
