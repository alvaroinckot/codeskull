var expectation = function(){

	$("#expectation-form").ready(function(){
		
		var task_id = $("#task_id").val() || 1;
		var track_id = $("#track_id").val() || 1;

		$.ajax({
		  url: "/tracks/" + track_id + "/tasks/" + task_id + "/expectations",
		  context: document.body
		}).done(function(response) {
			$("#expectation-form").html(response)
		});

	});


	$("#expectation-form-new").on("click", function(e){
		var task_id = $("#task_id").val() || 1;
		var track_id = $("#track_id").val() || 1;

		$.ajax({
		  url: "/tracks/" + track_id + "/tasks/" + task_id + "/expectations/new",
		  context: document.body
		}).done(function(response) {
			$("#expectation-form").append(response)
		});
	});



};

$(document).ready(expectation);
$(document).on('page:load', expectation)
