#!/system/bin/sh

# Wait for system to finish booting
until [ $(getprop sys.boot_completed) -eq 1 ]; do sleep 5; done

# --- Processor Detection ---
SOC=$(getprop ro.board.platform)
VENDOR=$(getprop ro.hardware)

# --- Common Tweaks (Sabhi ke liye) ---
# I/O Read Ahead (Faster Game Loading)
for i in /sys/block/mmcblk*/queue/read_ahead_kb; do echo "2048" > $i; done

# --- Processor Specific Tweaks ---

case "$SOC" in
    # 1. Snapdragon (Qualcomm) - Adreno GPU optimized
    msm*|sdm*|sm*)
        # Enable Adreno Boost
        [ -d /sys/class/kgsl/kgsl-3d0/devfreq ] && echo "1" > /sys/class/kgsl/kgsl-3d0/adrenoboost
        # GPU Max Clock
        echo "performance" > /sys/class/kgsl/kgsl-3d0/governor
        ;;

    # 2. Exynos (Samsung) - Mali GPU optimized
    exynos*)
        # Exynos thermal control tweaks
        echo "1" > /sys/module/exynos_thermal/parameters/enabled
        # Mali GPU performance
        echo "1" > /sys/devices/platform/11800000.mali/power_policy
        ;;

    # 3. MediaTek (Dimensity/Helio) - PowerVR/Mali optimized
    mt*|mediatek*)
        # MediaTek touch boost
        echo "1" > /sys/power/touch_boost
        # Scheduler tweaking for MTK
        echo "0" > /proc/sys/kernel/sched_migration_cost_ns
        ;;
esac

# --- Thermal Management (Optional) ---
# High performance ke liye thermal limit ko thoda loose karna
if [ -d /sys/class/thermal/thermal_zone0 ]; then
    echo "0" > /sys/class/thermal/thermal_zone0/mode
fi
