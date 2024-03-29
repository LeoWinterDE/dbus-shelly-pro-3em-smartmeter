#!/bin/bash
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}"  )" &> /dev/null && pwd  )
DAEMON_NAME=${SCRIPT_DIR##*/}
RC_FILE_PATH=/data/rc.local
STARTUP=$SCRIPT_DIR/install.sh

rm /service/$DAEMON_NAME
kill $(pgrep -f 'supervise $DAEMON_NAME')
chmod a-x $SCRIPT_DIR/service/run
$SCRIPT_DIR/restart.sh
sed -i "\~$STARTUP~d" $RC_FILE_PATH
