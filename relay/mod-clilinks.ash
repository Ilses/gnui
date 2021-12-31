// Modified version of CLI Links to also scrape the output.

// Original CLI Links by Zarqon
string cmd = form_fields()["cli"];
// TODO: This is for debugging if a command is typo'd.
//print("JavaScript command: "+cmd);
switch (cmd) {
   case "": write("Nothing successfully accomplished!"); exit;
   // Kind of a hack, clean this up.
   default: write(cli_execute_output("ashq write("+cmd+")"));
}
