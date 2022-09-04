buffer modifyPage(buffer source) {
  // Add a toggle for our interface to the world map page.
  source.replace_string('<div id="awesome"', '\
  <br><br>\
  <div id="gnui-text" style="display: block;"><center>\
    <table width="100%" cellspacing="30" cellpadding="0"><tbody> <tr>\
        <td style="padding: 5px; border: 1px solid white;"><center>\
          <table><tbody>\
            <tr>\
              <td>\
                <center>\
                  <a href="https://github.com/Ilses/gnui">gnui</a> \
                  <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.toggle_graph_display()">graph</a>\
                  <a href=# onclick="window.document.getElementById(\'gnui\').contentWindow.toggle_chat_display()">chat</a>\
                  <iframe id="gnui-chat", src="mchat.php", width="100%", height="40%" hidden></iframe>\
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
  <!-- // Add the iframe with all the logic --!>\
  <center><iframe id="gnui", src="gnui.html", width="99%", height="800" hidden=true></iframe>\
  <div id="awesome"');

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
