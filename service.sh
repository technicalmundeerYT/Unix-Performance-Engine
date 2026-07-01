if [ "$(id -u)" -ne 0 ]; then
    ui_print "Root privileges required. Exiting."
    exit 1
fi

# Inform the user about the tweak application
ui_print "========================================"
ui_print "      Extreme Gaming Performance         "
ui_print "      Optimizations for BGMI/PUBG        "
ui_print "========================================"

# Wait for the device to settle
sleep 1

# === 1. CPU Scheduler Tweaks ===
ui_print "Applying advanced CPU tweaks..."
[ -f /proc/sys/kernel/sched_child_runs_first ] && echo "1" > /proc/sys/kernel/sched_child_runs_first
[ -f /proc/sys/kernel/sched_upmigrate ] && echo "70" > /proc/sys/kernel/sched_upmigrate
[ -f /proc/sys/kernel/sched_downmigrate ] && echo "60" > /proc/sys/kernel/sched_downmigrate
[ -f /proc/sys/kernel/sched_autogroup_enabled ] && echo "0" > /proc/sys/kernel/sched_autogroup_enabled

# Boost CPU Performance (Disable thermal throttling)
ui_print "Disabling thermal throttling..."
if [ -f /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor ]; then
    echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
    echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
    echo 0 > /sys/module/msm_thermal/core_control/enabled
    echo 0 > /sys/devices/system/cpu/cpu*/online
fi

# === 2. GPU Rendering Tweaks ===
ui_print "Optimizing GPU for smooth gameplay..."
setprop debug.hwui.renderer skia
setprop debug.hwui.force_msaa 4
setprop debug.sf.hw 1
setprop persist.sys.ui.hw 1
setprop ro.surface_flinger.max_frame_buffer_acquired_buffers 5
setprop debug.sf.enable_hwc_vds 1
setprop debug.hwui.disable_vsync false
echo "performance" > /sys/class/kgsl/kgsl-3d0/devfreq/governor  # Force GPU performance mode

# === 3. Thermal Management ===
ui_print "Adjusting thermal settings..."
if [ -f /sys/class/thermal/thermal_message/switch_cpu_gpu ]; then
    echo 0 > /sys/class/thermal/thermal_message/switch_cpu_gpu
fi
echo -n 0 > /sys/module/msm_thermal/parameters/enabled  # Disable thermal throttling

# === 4. Gyroscope Calibration ===
ui_print "Improving gyroscope response..."
setprop persist.sensor.gyro_calibration 1
setprop persist.sys.gyro.delay 0
setprop persist.sys.gyro.optimization 1

# === 5. Touch Optimization ===
ui_print "Enhancing touch response..."
setprop debug.touch.filter 1
setprop debug.touch.resample 1
setprop persist.sys.input.boost 1
echo 1 > /sys/devices/virtual/input/input*/banned_keys  # Prevent touch lag issues

# === 6. ZRAM Optimization ===
ui_print "Configuring advanced ZRAM settings..."
if [ -e /sys/block/zram0/disksize ]; then
    echo 1 > /sys/block/zram0/reset
    echo 4294967296 > /sys/block/zram0/disksize  # Set 4GB ZRAM
    mkswap /dev/block/zram0
    swapon /dev/block/zram0
fi

# === 7. I/O Scheduler Tweaks ===
ui_print "Improving I/O performance..."
if [ -e /sys/block/mmcblk0/queue/scheduler ]; then
    echo "noop" > /sys/block/mmcblk0/queue/scheduler
fi
echo "8192" > /sys/block/mmcblk0/queue/read_ahead_kb

# === 8. Network Optimization ===
ui_print "Tuning network for ultra-low latency..."
echo 1 > /proc/sys/net/ipv4/tcp_tw_reuse
echo 1 > /proc/sys/net/ipv4/tcp_slow_start_after_idle
echo 0 > /proc/sys/net/ipv4/tcp_no_metrics_save
echo 3 > /proc/sys/net/ipv4/tcp_fin_timeout

# === 9. Memory Management ===
ui_print "Adjusting memory for gaming..."
echo 5 > /proc/sys/vm/swappiness
echo 3 > /proc/sys/vm/dirty_background_ratio
echo 3 > /proc/sys/vm/dirty_ratio
echo 1 > /proc/sys/vm/overcommit_memory
echo 32768 > /proc/sys/vm/min_free_kbytes

# === 10. OpenGL Tweaks ===
ui_print "Applying OpenGL optimizations..."
setprop debug.hwui.renderer opengl
setprop debug.hwui.fbo_cache_size 128
setprop debug.hwui.use_dcache true
setprop debug.hwui.disable_vsync false

# === 11. FPS Stability ===
ui_print "Improving FPS stability..."
setprop persist.sys.game.fps.stabilizer 1
echo 0 > /sys/devices/system/cpu/cpu*/cpufreq/thermal_throttle

# Completion Message
ui_print "========================================"
ui_print " Extreme Gaming Optimizations Applied!  "
ui_print "        Enjoy Lag-Free Gameplay         "
ui_print "========================================"

# Exit the script
exit 0


# === 9. Background Process Limits ===
ui_print "Limiting background processes..."
setprop persist.sys.background_apps_limit 2          # Free up maximum resources for gaming

# 
# Completion Message
ui_print "========================================"
ui_print "  Ultimate Performance Optimizations   "
ui_print "       Applied Successfully!           "
ui_print "========================================"

# Exit the script
exit 0
