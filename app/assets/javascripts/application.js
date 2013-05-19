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
//= require jquery_nested_form
//= require jquery_ujs
//= require bootstrap
//= require bootstrap-timepicker
//= require_tree .


$(document).ready(function() {
	$('.timepicker').timepicker({
	     minuteStep: 15,
	     showInputs: false,
	     disableFocus: true
	 });

	// var date       = new Date();
	// var d          = date.getDate();
	// var m          = date.getMonth();
	// var y          = date.getFullYear();
	
	var calendar   = $('#calendar').fullCalendar({
		header: {
			left: 'prev,next today',
			center: 'title',
			right: 'month,agendaWeek,agendaDay'
		},
		editable: true,
		theme: true,
		allDaySlot: false,
		selectable: true,
		selectHelper: true,
		select: function(start, end, allDay) {
			$('#myModal').modal('show');
		    $('#myModal').on('shown', function() {
			var st = formatTime(start);
			var ft = formatTime(end);

		         $("#startTime").val(st);
		         $("#finishTime").val(ft);
		         $("#performedOn").val(start);
		        // 		
		    })
			  // var title = "brill"
			// prompt('Raify Title:');
			if (title) {
				calendar.fullCalendar('renderEvent',
					{
						title: title,
						start: start,
						end: end,
						allDay: allDay
					},
					true // make the event "stick"
				);
			}
			calendar.fullCalendar('unselect');
		},
				
		
	});


});

 	 function formatTime(givenTime) {
	    var hours   = givenTime.getHours();
	    var minutes = givenTime.getMinutes();
	    if (hours  > 12) {
			hours   = hours - 12;
		var ap = ' PM';	
			}
			else
			{
			var ap=' AM';	
			}
	
	    if (hours   === 0) {
		hours   = "12";
		ap=" AM";}
		if (hours   === 12) {
		ap=" PM";}
	    if (hours   < 10) {hours   = "0"+hours;}
	    if (minutes < 10) {minutes = "0"+minutes;}
	    var time    = hours+':'+minutes+ap;
	    return time;
	}
function updateEvent(the_event) {
    $.update(
      "/events/" + the_event.id,
      { event: { title: the_event.title,
                 starts_at: "" + the_event.start,
                 ends_at: "" + the_event.end,
                 description: the_event.description
               }
      },
      function (reponse) { alert('successfully updated task.'); }
    );


};





