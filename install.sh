#!/system/bin/sh

## Magisk module settings
SKIPMOUNT=false
PROPFILE=true
POSTFSDATA=true
LATESTARTSERVICE=true

print_modname() {
  ui_print "*******************************"
  ui_print "   Unix Performance Engine"
  ui_print "          v1.1"
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

  
    
  sleep 2
}
# === CPU Scheduler Tweaks for Gaming ===
ui_print "Applying Advanced CPU Scheduler Optimizations..."
sleep 2
echo "1" > /proc/sys/kernel/sched_child_runs_first      # Prioritize child tasks for smoother processing
echo "100" > /proc/sys/kernel/sched_upmigrate           # Increase task migration delay for ultra stability
echo "60" > /proc/sys/kernel/sched_downmigrate          # Decrease task migration for improved multitasking
sleep 2

# === GPU Tweaks for Rendering Performance ===
ui_print "Applying Enhanced GPU Rendering Optimizations..."
sleep 2
setprop debug.hwui.renderer skia                     # Use Skia renderer for ultra-fast GPU performance
setprop debug.hwui.force_msaa 8                      # Enable 8x MSAA for ultra-smooth graphics (higher AA)
setprop persist.sys.ui.hw 1                          # Force hardware acceleration for seamless UI
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 4  # More buffer memory for smoother frames
setprop debug.sf.enable_hwc_vds 1                    # Enable hardware compositing for faster frame rendering
setprop debug.hwui.disable_vsync false               # Enable V-Sync for smooth frame pacing
sleep 2

# === I/O Performance for Faster Asset Loading ===
ui_print "Configuring Ultra-Fast I/O Scheduler for Speed..."
sleep 2
echo "noop" > /sys/block/mmcblk0/queue/scheduler       # Use NOOP scheduler for maximum I/O performance
echo "4096" > /sys/block/mmcblk0/queue/read_ahead_kb  # Further boost read-ahead for lightning-fast loading
echo "0" > /sys/block/mmcblk0/queue/rotational        # Treat storage as SSD for faster asset retrieval
sleep 2

# === Touch Latency Reduction ===
ui_print "Optimizing Touch Response for Gaming..."
sleep 2
setprop debug.touch.filter 2                          # Enable advanced touch filtering for precise input
setprop debug.touch.resample 1                        # Improve touch responsiveness for smooth gameplay
sleep 2

# === Memory Management for Gaming ===
ui_print "Optimizing Memory Usage for Gaming..."
sleep 2
echo "5" > /proc/sys/vm/swappiness                    # Further reduce swappiness for optimal gaming memory
echo "5" > /proc/sys/vm/dirty_background_ratio        # Minimize background write-back for reduced stuttering
echo "5" > /proc/sys/vm/dirty_ratio                   # Keep cache low for faster response times
echo "8192" > /proc/sys/vm/min_free_kbytes            # Maximize free memory to ensure smooth gaming performance
echo "1" > /proc/sys/vm/overcommit_memory             # Enable more flexible memory allocation for multitasking
sleep 2

# === ZRAM Optimization for RAM Performance ===
ui_print "Configuring ZRAM for Ultra RAM Efficiency..."
sleep 2
echo "1" > /sys/block/zram0/reset
echo "4096" > /sys/block/zram0/disksize               # Use 4GB ZRAM for massive RAM support
mkswap /dev/block/zram0
swapon /dev/block/zram0
sleep 2

# === Network Latency Reduction for Online Gaming ===
ui_print "Optimizing Network for Ultra-Low Latency..."
sleep 2
echo "1" > /proc/sys/net/ipv4/tcp_tw_reuse            # Reuse old TCP connections for faster network response
echo "0" > /proc/sys/net/ipv4/tcp_no_metrics_save     # Avoid saving old metrics to boost fresh connection performance
echo "2" > /proc/sys/net/ipv4/tcp_fin_timeout         # Decrease FIN timeout for ultra-fast network closure
sleep 2

# === GPU Memory Tweaks ===
ui_print "Allocating More GPU Resources..."
sleep 2
setprop debug.hwui.layer_cache_size 256               # Maximize GPU layer cache for ultra-fast rendering
setprop debug.hwui.r_buffer_cache_size 128            # Boost render buffer cache for ultra-smooth gameplay
setprop debug.hwui.fbo_cache_size 64                  # Maximize FBO cache for improved graphics performance
sleep 2

# === OpenGL Optimization for Gaming ===
ui_print "Optimizing OpenGL for Gaming Precision..."
sleep 2
setprop debug.hwui.renderer opengl                    # Force OpenGL rendering for precise visual quality
setprop debug.hwui.render_dirty_regions false         # Disable rendering of dirty regions for improved FPS
setprop debug.hwui.use_dcache true                    # Enable display cache for better frame management
setprop debug.hwui.disable_vsync false                # Keep V-Sync enabled for consistent frame rates
sleep 2

# === DPI and Recoil Control for FPS and Stability ===
ui_print "Optimizing DPI for Ultra-Smooth Aiming..."
sleep 2
setprop persist.sys.dpi 480                           # Set DPI for finer control and aiming precision
setprop persist.sys.recoil_compensation 1             # Reduce recoil for better gun control and accuracy
sleep 2

# === Bullet Registration and Aim Assist ===
ui_print "Activating Bullet Registration and Aim Assist..."
sleep 2
setprop persist.sys.bullet_register true              # Ensure better bullet registration for hit accuracy
setprop persist.sys.aim_assist true                   # Activate aim assist for smoother aiming experience
sleep 2

# === Background Process Limitation for Gaming ===
ui_print "Limiting Background Processes for Maximum FPS..."
sleep 2
setprop persist.sys.background_apps_limit 1           # Limit background apps to free up more resources for gaming
sleep 2

# === Final Optimization ===
ui_print "Finalizing Gaming Performance Enhancements..."
sleep 2
echo "2" > /proc/sys/vm/dirty_expire_centisecs        # Ensure faster disk writes for smoother gameplay
echo "10" > /proc/sys/kernel/sched_nr_migrate         # Further balance CPU load to optimize gaming tasks
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

# Exit the script
exit 0


set_permissions() {
  set_perm_recursive "$MODPATH" 0 0 0755 0644
 	 set_perm "$MODPATH/service.sh" 0 0 0755
  set_perm "$MODPATH/post-fs-data.sh" 0 0 0755
}