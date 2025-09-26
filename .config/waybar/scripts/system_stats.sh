#!/run/current-system/sw/bin/bash

get_cpu_usage() {
    cpu_usage=$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {printf "%.0f", usage}')
    echo "$cpu_usage"
}

get_memory_usage() {
    mem_usage=$(free | grep Mem | awk '{printf "%.0f", $3/$2 * 100.0}')
    echo "$mem_usage"
}

get_temperature() {
    if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        temp=$((temp / 1000))
        echo "$temp"
        if [ "$temp" -gt 90 ]; then
            notify-send "Temperature too high" --urgency critical --expire-time 3
            notify-send "Shut your bitchass PC off" --urgency critical --expire-time 3
        elif [ "$temp" -gt 60 ]; then
            notify-send "Temperature above 60" --urgency normal --expire-time 2
        fi
    else
        echo "0"
    fi
}

cpu=$(get_cpu_usage)
mem=$(get_memory_usage)
temp=$(get_temperature)

if [ $cpu -gt 90 ] || [ $mem -gt 90 ] || [ $temp -gt 95 ]; then
    class="critical"
elif [ $cpu -gt 50 ] || [ $mem -gt 60 ] || [ $temp -gt 60 ]; then
    class="warning"
else
    class="normal"
fi

echo "{\"text\":\"    ${cpu}%    ${mem}%    ${temp}°C\",\"tooltip\":\"CPU: ${cpu}%\\nRAM: ${mem}%\\nTemp: ${temp}°C\",\"class\":\"$class\"}"
