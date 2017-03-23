$(document).ready(function() {

  $("#datepicker").datepicker({dateFormat: "yy/mm/dd", 
  onSelect: function() {
        var selectedDate = $(this).val();
        var filledData = {  url: "/show_readings", 
                                data: {
                                      
                                        observation_date: selectedDate
                                      
                                      },
                                      type: 'GET'
                            };
        ajaxCall(filledData);
    }
  });

  function ajaxCall(ajaxData) {
  
    $.ajax({
      type: ajaxData.type,
      url: ajaxData.url,
      data: ajaxData.data,
      async: false,
      dataType: 'script'
    });
  }
  
  $('#calendar-button').click(function() {
    $("#datepicker").focus();
  });
  
});
  