buffer modifyPage(buffer source) {
  // Add a toggle for our interface to the world map page.
	source.replace_string('<body', '<b>Super pre-alpha version.</b> Ping <b>Ilses#9123</b> on the ASS discord or send a PR for any issues. <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.toggle_graph_display()">toggle graph</a>\n<body');
  
  // And the iframe with all the logic.
	source.replace_string('<body', '\n<iframe id="gnui", src="gnui.html", width="100%", height="90%"></iframe>\n<body');

  return source;
}

void main() {
	if(!property_exists("gnui.enable")) {
		set_property("gnui.enable", true);
	}
  visit_url().modifyPage().write();
}
