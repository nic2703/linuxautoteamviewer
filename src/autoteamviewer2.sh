#!/bin/bash

# User
user=$(whoami)

# Log File Location
logfile='TeamViewer15_Logfile.log'
logpath="/opt/teamviewer/logfiles/$user"

# Executables
tvpath='/opt/teamviewer/tv_bin'
tvdesktop='TeamViewer_Desktop'
tvclient='TeamViewer'

# Restart TeamViewer Function
restart_teamviewer() {
    echo "Restarting TeamViewer..."
    sleep 1
    nohup teamviewer >/dev/null 2>&1 &
}

# Main Loop
i=0
while [ "$i" -lt 1000000 ]
do
    i=$((i + 1))

    echo "This is the ${i}th session."
    echo "-------------------------------------------------------------------------------------------------------------------"
    ps aux | grep "teamviewer"
    echo "-------------------------------------------------------------------------------------------------------------------"
    echo ""

    logout=$(date -d"$(cat $logpath/$logfile | grep "SessionTerminate" | tail -n 1 | awk '{print $1,$2}')" +%s)
    echo "Previous Logout time is: $logout"
    echo ""

    logout_check=$logout
    while [ "$logout_check" = "$logout" ]
    do
        logout_check=$(date -d"$(cat $logpath/$logfile | grep "SessionTerminate" | tail -n 1 | awk '{print $1,$2}')" +%s)
        sleep 2
    done

    kill -9 $(ps aux | grep "$tvpath/$tvclient" | awk '{print $2}')

    # Restart TeamViewer after termination
    restart_teamviewer

done
