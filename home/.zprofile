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


###
#   Perl Env.
###
if which plenv > /dev/null; then eval "$(plenv init -)"; fi

###
#   screen -*- virtual terminal manager -*-
###
screenlatest='screen-4.3.1'
${=screenlatest} -d -R -t work
