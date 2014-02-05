(function() {
	var fncSyntax = function() {
		dp.SyntaxHighlighter.ClipboardSwf = '..external/SyntaxHighlighter/Scripts/clipboard.swf';
		dp.SyntaxHighlighter.HighlightAll('code');
	}

	if (window.addEventListener) { 
		window.addEventListener("load", fncSyntax, false); 
	} else if (window.attachEvent) { 
		window.attachEvent("onload", fncSyntax); 
	}
})();