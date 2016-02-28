# Author:   Nishikata Hijiri

###
#   ssh config
###
eval $(ssh-agent)

function cleanup {
   echo "Killing SSH-Agent"
   kill -9 $SSH_AGENT_PID
}

trap cleanup EXIT


# Save login history
#set +m && $(last -30 > ~/.log/.system_log &) && set -m

###
#   Perl Env.
###
if which plenv > /dev/null; then eval "$(plenv init -)"; fi
