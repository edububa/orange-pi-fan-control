#!/bin/bash

GPIO=13
START_TEMP=50
STOP_TEMP=40
INTERVAL=1

GPIO_VALUE=/sys/class/gpio/gpio${GPIO}/value
GPIO_DIRCN=/sys/class/gpio/gpio${GPIO}/direction

if [ ! -e $GPIO_VALUE ]; then
        echo $GPIO > /sys/class/gpio/export
fi

if [ $(cat $GPIO_DIRCN) != "out" ]; then
        echo out > $GPIO_DIRCN
fi

while true; do
        if [ $(cat /sys/class/thermal/thermal_zone0/temp) -gt $START_TEMP ]; then
                echo 1 > $GPIO_VALUE
        fi

        if [ $(cat /sys/class/thermal/thermal_zone0/temp) -lt $STOP_TEMP ]; then
                echo 0 > $GPIO_VALUE
        fi
        sleep $INTERVAL
done
