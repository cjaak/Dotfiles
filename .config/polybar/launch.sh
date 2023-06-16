# #!/usr/bin/env sh

# # Terminate already running bar instances
# killall -q polybar

# # Wait until the processes have been shut down
# while pgrep -x polybar >/dev/null; do sleep 1; done

# screens=$(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f6)

# if [[ $(xrandr --listactivemonitors | grep -v "Monitors" | cut -d" " -f4 | cut -d"+" -f2- | uniq | wc -l) == 1 ]]; then
#   MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar top &; 
#   MONITOR=$(polybar --list-monitors | cut -d":" -f1) TRAY_POS=right polybar bottom &;
# else
#   primary=$(xrandr --query | grep primary | cut -d" " -f1)

#   for m in $screens; do
#     if [[ $primary == $m ]]; then
#         MONITOR=$m  polybar top &
#         MONITOR=$m  polybar bottom &
#     else
#         MONITOR=$m TRAY_POS=none polybar secondary &
#     fi
#   done
# fi



#!/usr/bin/env sh
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

# Create env variable for polybar CPU temp.
# for i in /sys/class/hwmon/hwmon*/temp*_input; do 
#     if [ "$(<$(dirname $i)/name): $(cat ${i%_*}_label 2>/dev/null || echo $(basename ${i%_*}))" = "coretemp: temp1_input" ]; then
#         export HWMON_PATH="$i"
#     fi
# done

polybar --reload --quiet top -c ~/.config/polybar/config.ini &
polybar --reload --quiet bottom -c ~/.config/polybar/config.ini &
polybar --reload --quiet secondary -c ~/.config/polybar/config.ini &
