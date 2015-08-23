# Author:   Nishikata Hijiri

eval $(ssh-agent)

function cleanup {
   echo "Killing SSH-Agent"
   kill -9 $SSH_AGENT_PID
}

trap cleanup EXIT

# Save login history
#set +m && $(last -30 > ~/.log/.system_log &) && set -m
