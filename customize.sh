#!/system/bin/sh

# Check device compatibility
PRJNAME=$(getprop ro.boot.prjname)

if [ "$PRJNAME" != "24926" ] && [ "$PRJNAME" != "24976" ]; then
  ui_print "! This module is for OnePlus Pad 2 Pro only."
  ui_print "! Detected prjname: $PRJNAME"
  abort "> Aborting..."
fi

# Define source and destination paths
SRC="/odm/firmware/wireless_pen/24976/cps8601_firmware.bin"
DST="$MODPATH/odm/firmware/wireless_pen/24926/cps8601_firmware.bin"

# Copy firmware into the module's overlay path
if [ -f "$SRC" ]; then
  cp -af "$SRC" "$DST"
  ui_print "- Firmware copied to module path successfully."
else
  ui_print "! WARNING: Source firmware not found at $SRC"
  ui_print "! The module may not work correctly."
fi

set_perm_recursive "$MODPATH"/odm/firmware 0 0 0755 0644 u:object_r:vendor_configs_file:s0
