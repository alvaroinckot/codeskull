var ready = function(){

	$("#autosearch").ready(function(){
		$.ajax({
		  url: "/tracks?q=*:*",
		  context: document.body
		}).done(function(response) {
			$("#stage").html(response)
		});
	});

};

$(document).ready(ready);
$(document).on('page:load', ready)

