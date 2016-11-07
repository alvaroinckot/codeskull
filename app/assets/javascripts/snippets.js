$("textarea[data-lang]").each(function() {
	if($("#snippet").val() != null) {
		$(this).val($("#snippet").val());
	}
	var lang = $(this).attr('data-lang');
    var code = CodeMirror.fromTextArea($(this).get(0), {
      lineNumbers: true,
      mode: lang
    });
});

