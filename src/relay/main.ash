buffer modifyPage(buffer source) {
  // Add a toggle for our interface to the world map page.
  source.replace_string('<body', '\
  <div id="gnui-text" style="display: block;"><center>\
    <table width="95%" cellspacing="0" cellpadding="0"><tbody> <tr>\
        <td style="padding: 5px; border: 1px solid white;"><center>\
          <table><tbody>\
            <tr>\
              <td>\
                <center>\
                  <a href="https://github.com/Ilses/gnui">gnui</a> \
                  <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.toggle_graph_display()">graph</a>\
                  <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.toggle_chat_display()">chat</a>\
                  <iframe id="gnui-chat", src="mchat.php", width="95%", height="40%"></iframe>\
                  <div id="gnui-helpers"></div>\
                  <!--<br>Crystal ball background demo: <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.set_demo_crystal_ball_pref()">Set orb preference</a> <b>or</b> <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.clear_crystal_ball_pref()">clear orb preference</a>!-->\
                </center>\
              </td>\
            </tr>\
          </tbody></table>\
        </center></td>\
      </tr>\
    </tbody>\
  </table>\
  </center></div>\
  \n<body');
  
  // Add the iframe with all the logic.
  source.replace_string('<body', '\n<center><iframe id="gnui", src="gnui.html", width="95%", height="80%" hidden=true></iframe></center>\n<body');

  return source;
}

void main() {
  if(!property_exists("gnui.enable")) {
    set_property("gnui.enable", true);
  }
  if(!property_exists("gnui.auto_delete_non_root")) {
    set_property("gnui.auto_delete_non_root", false);
  }
  // TODO: Consider tying to Mafia's is_dark_mode instead of a separate pref?
  if(!property_exists("gnui.dark")) {
    set_property("gnui.dark", false);
  }
  visit_url().modifyPage().write();
}
