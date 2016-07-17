$(document).ready(function(){

	// search on load dashboard
	$("#autosearch").ready(function(){
		$.ajax({
		  url: "/tracks?q=*:*",
		  context: document.body
		}).done(function(response) {
			$("#stage").html(response)
		});
	});

});