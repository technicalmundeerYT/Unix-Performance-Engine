#!/system/bin/sh
# Post-fs-data Gaming + Fast Charging Optimization Script
# By Technical Mundeer

# Ensure the script runs with necessary permissions
if [ "$(id -u)" -ne 0 ]; then
    echo "Root privileges required. Exiting."
    exit 1
fi

echo "========================================"
echo "   Extreme Gaming and Performance Boost "
echo "   Optimizations Applied Successfully   "
echo "========================================"

# === Advanced CPU Performance Tweaks ===
echo "Applying CPU performance tweaks..."
echo "1" > /proc/sys/kernel/sched_interactive                        # Prioritize responsiveness
echo "300000" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_min_freq  # Increase min CPU frequency
echo "300000" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_min_freq  # Apply to big cores
echo "performance" > /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
echo "performance" > /sys/devices/system/cpu/cpu4/cpufreq/scaling_governor
echo "0" > /sys/module/msm_thermal/core_control/enabled               # Disable thermal throttling

# === GPU Tweaks ===
echo "Optimizing GPU for smooth gameplay..."
setprop debug.sf.latch_unsignaled true                                # Optimize frame rendering
echo "1" > /sys/devices/platform/kgsl-3d0/kgsl/kgsl_pwrctrl/touchboost
echo "performance" > /sys/class/kgsl/kgsl-3d0/devfreq/governor
echo "15" > /sys/class/kgsl/kgsl-3d0/idle_timer                       # Reduce idle timer for better GPU utilization

# === Kernel-level Gaming Mode ===
echo "Enabling kernel-level gaming optimizations..."
echo "1" > /sys/module/cpu_boost/parameters/input_boost_enabled
echo "1" > /sys/module/cpu_boost/parameters/sync_threshold
echo "0" > /proc/sys/kernel/sched_autogroup_enabled                  # Disable autogrouping for better task scheduling

# === Audio Optimization for Gaming ===
echo "Improving audio sync for gaming..."
setprop persist.audio.low_latency true
setprop persist.audio.uhqa.enable true

# === Battery Performance Management ===
echo "Enhancing battery performance during gaming..."
echo "0" > /sys/module/lpm_levels/parameters/sleep_disabled           # Keep cores active
echo "1" > /sys/module/lpm_levels/parameters/touch_boost
echo "1" > /sys/module/cpu_boost/parameters/input_boost_freq

# === Fast Charging Optimizations ===
echo "Boosting fast charging capabilities..."
if [ -f /sys/class/power_supply/battery/fastcharge ]; then
    echo "1" > /sys/class/power_supply/battery/fastcharge
    echo "3000" > /sys/class/power_supply/battery/current_max          # Set max charging current to 3A
    echo "1" > /sys/class/power_supply/battery/constant_charge_enable
    echo "0" > /sys/class/power_supply/battery/temp_limit              # Disable temperature limits
fi

# === Memory Allocation for Gaming ===
echo "Prioritizing memory for gaming tasks..."
echo "1" > /sys/block/zram0/mem_used_max
echo "524288" > /proc/sys/vm/extra_free_kbytes                        # Reserve additional memory
echo "10" > /proc/sys/vm/swappiness                                   # Reduce swapping for gaming stability

# === Miscellaneous Tweaks ===
echo "Applying miscellaneous performance enhancements..."
setprop persist.sys.scrollingcache enable                             # Smooth scrolling
setprop persist.sys.cached_apps_freezer disabled                      # Prevent aggressive app freezing
setprop persist.sys.gaming_performance true
setprop debug.sf.hw 1                                                 # Force hardware acceleration
setprop debug.hwui.renderer skia                                      # Use Skia for better rendering

echo "========================================"
echo " Gaming Optimizations Applied Successfully "
echo "========================================"

exit 0
