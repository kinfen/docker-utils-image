#!/bin/bash

### BEGIN INIT INFO
# Provides:             convoy
### END INIT INFO

set -e

DAEMON="/usr/local/bin/convoy"
NAME="convoy"
PATH="/usr/local/bin"
LOGFILE="/var/log/convoy.log"
CHROOT="/var/run/convoy"
VFS_PATH="~/volumes"

test -x "${DAEMON}" || exit 0

. /lib/lsb/init-functions

if [ ! -e "${LOGFILE}" ]; then
        touch "${LOGFILE}"
        chmod 640 "${LOGFILE}"
        chown root:adm "${LOGFILE}"
fi

if [ ! -d "${CHROOT}" ]; then
        mkdir -p "${CHROOT}"
fi

case "${1}" in
        start)
                log_daemon_msg "Starting ${NAME} server"
                start-stop-daemon --start --background -m --oknodo --pidfile /var/run/convoy/convoy.pid --exec ${DAEMON} daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH
                
                # n=0
                # while [ ${n} -le 5 ]
                # do 
                #         _PID="$(if [ -e /var/run/convoy/convoy.pid ]; then cat /var/run/convoy/convoy.pid; fi)"
                #         if ! ps -C convoy | grep -qs "${_PID}"
                #         then
                #                 break
                #         fi
                #         sleep 1
                #         n=$(( $n + 1 ))
                # done

                # if ! ps -C vsftpd | grep -qs "${_PID}"
                # then
                #         log_warning_msg "vsftpd failed - probably invalid config."
                #         exit 1
                # fi

                log_end_msg 0
                ;;

        stop)
                log_daemon_msg "Stopping ${NAME} server"

                start-stop-daemon --stop --pidfile /var/run/convoy/convoy.pid --oknodo --exec ${DAEMON} daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH
                rm -f /var/run/vsftpd/vsftpd.pid

                log_end_msg 0
                ;;
        restart)
                ${0} stop
                ${0} start
                ;;

        reload|force-reload)
                log_daemon_msg "Reloading FTP server configuration"

                start-stop-daemon --stop --pidfile /var/run/convoy/convoy.pid --signal 1 --exec $DAEMON daemon --drivers vfs --driver-opts vfs.path=$VFS_PATH

                log_end_msg "${?}"
                ;;

        status)
                status_of_proc "${DAEMON}" " server"
                ;;

        *)
                echo "Usage: ${0} {start|stop|restart|reload|status}"
                exit 1
                ;;
esac

exit 0

