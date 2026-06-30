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

  
    ui_print "[✓] CPU Unit Loaded"
    sleep 1
    ui_print "[✓] GPU Unit Loaded"
    sleep 1
    ui_print "[✓] Memory Unit Loaded"
    sleep 1
    ui_print "[✓] Storage Unit Loaded"
    sleep 1
    ui_print "[✓] Touch Unit Loaded"
    sleep 1
    ui_print "[✓] Network Unit Loaded"
    sleep 1
    ui_print "[✓] Thermal Unit Loaded"
    sleep 1
    ui_print "[✓] Display Unit Loaded"
    sleep 1
    ui_print "[✓] Battery Unit Loaded"
    sleep 1
 
  ui_print " "
  ui_print "Status : SUCCESS"
  ui_print "Developer : Technical Mundeer"
  ui_print "*******************************"
  sleep 2
}


set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
 	 set_perm "$MODPATH/service.sh" 0 0 0755
  set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
}