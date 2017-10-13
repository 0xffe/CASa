#!/bin/sh
# /etc/init.d/mjpg_cam.sh
### BEGIN INIT INFO
# Provides:          mjpg_cam.sh
# Required-Start:    $network
# Required-Stop:     $network
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: mjpg_cam for webcam
# Description:       Streams /dev/video0 to http://IP/?action=stream
### END INIT INFO
f_message(){
        echo "[+] $1"
}

# Carry out specific functions when asked to by the system
case "$1" in
        start)
                f_message "Starting mjpg_cam ... "
/usr/local/bin/mjpg_cam -b -i "/usr/local/lib/input_uvc.so -d /dev/video0 -r 1280x720 -f 10" -o "/usr/local/lib/output_http.so -p 8080 -w /usr/local/www"
                sleep 2
                f_message "mjpg_cam started!"
                ;;
        stop)
                f_message "Stopping mjpg_cam ..."
                killall mjpg_cam
                f_message "mjpg_cam stopped!"
                ;;
        restart)
                f_message "Restarting daemon mjpg_cam ..."
                killall mjpg_cam
sleep 2
/usr/local/bin/mjpg_cam -b -i "/usr/local/lib/input_uvc.so -d /dev/video0 -r 1280x720 -f 10" -o "/usr/local/lib/output_http.so -p 8080 -w /usr/local/www"
                f_message "Restarted daemon mjpg_cam ..."
                ;;
        status)
                pid=`ps -A | grep mjpg_cam | grep -v "grep" | grep -v mjpg_cam. | awk ‘{print $1}’ | head -n 1`
                if [ -n "$pid" ];
                then
                        f_message "mjpg_cam is running with pid ${pid}"
                        f_message "mjpg_cam was started with the following command line"
                        cat /proc/${pid}/cmdline ; echo ""
                else
                        f_message "Could not find mjpg_cam running"
                fi
                ;;
        *)
                f_message "Usage: $0 {start|stop|status|restart}"
                exit 1
                ;;
esac
exit 0
