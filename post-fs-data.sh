#!/system/bin/sh
MODPATH=${0%/*}

# ZRAM Tweaks (Early initialization)
if [ -f /sys/block/zram0/disksize ]; then
  echo "2147483648" > /sys/block/zram0/disksize # 2GB ZRAM
  mkswap /dev/block/zram0
  swapon /dev/block/zram0
fi

# I/O Scheduler (Early setting)
for i in /sys/block/*/queue/scheduler; do
  echo "bfq" > $i
done
