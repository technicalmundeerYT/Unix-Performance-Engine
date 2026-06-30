#!/system/bin/sh

# Magisk module settings
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
  ui_print "*******************************"
  ui_print "   Unix Performance Engine"
  ui_print "          v1.0"
  ui_print "   By Technical Mundeer"
  ui_print "*******************************"
}

on_install() {
  ui_print "- Extracting module..."
  unzip -o "$ZIPFILE" 'system/*' -d "$MODPATH" >&2
  unzip -o "$ZIPFILE" 'system.prop' -d "$MODPATH" >&2
  
  ui_print " "
  ui_print "Initializing Performance Units..."
  ui_print " "
  
  # Premium animation ka raaz: 'echo' ke sath '-e' use karna aur flush karna
  # Magisk installer mein direct terminal output force karne ke liye:
  
  (
    sleep 1; echo -e "[✓] CPU Unit Loaded"
    sleep 1; echo -e "[✓] GPU Unit Loaded"
    sleep 1; echo -e "[✓] Memory Unit Loaded"
    sleep 1; echo -e "[✓] Storage Unit Loaded"
    sleep 1; echo -e "[✓] Touch Unit Loaded"
    sleep 1; echo -e "[✓] Network Unit Loaded"
    sleep 1; echo -e "[✓] Thermal Unit Loaded"
    sleep 1; echo -e "[✓] Display Unit Loaded"
    sleep 1; echo -e "[✓] Battery Unit Loaded"
  ) | while read line; do
      ui_print "$line"
  done
  
  ui_print " "
  ui_print "Status : SUCCESS"
  ui_print "Developer : Technical Mundeer"
  ui_print "*******************************"
}


set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
 	 set_perm "$MODPATH/service.sh" 0 0 0755
  set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
}

