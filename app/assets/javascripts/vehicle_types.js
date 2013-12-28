$(document).ready(function() {
  $("#new_vehicle_type").validate({
  	  onsubmit: true,
  	  errorClass: 'got_error',
      rules: {
        "vehicle_type[kind]":{
            required: true
        },
      },
      messages: {
         
        "vehicle_type[kind]":{
          required: "Vehicle kind must be specified",
        }
      }
  });
});
