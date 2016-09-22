$("textarea[data-lang]").each(function() {
	$(this).val($("#snippet").val());
	var lang = $(this).attr('data-lang');
	console.log("text/x-" + lang);
    var code = CodeMirror.fromTextArea($(this).get(0), {
      lineNumbers: true,
      mode: "text/x-" + lang
    });
});

