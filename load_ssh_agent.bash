# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions

. "$HOME/start_ssh_agent.sh"
[deploy@mage3po ~]$ cat start_ssh_agent.sh
#!/bin/bash

SSH_ENV="$HOME/.ssh/environment"
SSH_ENV_SOCK="$HOME/.ssh/agent_sock"

function start_agent {
#    echo "Initialising new SSH agent..."
    rm -f $SSH_ENV_SOCK;
    /usr/bin/ssh-agent -a "$SSH_ENV_SOCK" | sed 's/^echo/#echo/' > "${SSH_ENV}"
#    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add > /dev/null;
    #/usr/bin/ssh-add "$HOME/.ssh/id_rsa";
}

function reconnect_agent {
#    echo "reconnecting agent";
    . "${SSH_ENV}" > /dev/null;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
    . "${SSH_ENV}" > /dev/null
    #ps ${SSH_AGENT_PID} doesn't work under cywgin

    PROCESS_STRING="/usr/bin/ssh-agent";

    PROCESS=$(ps -ef | grep ${SSH_AGENT_PID} | grep ${PROCESS_STRING});

    if [ -n "$PROCESS" ]; then
        reconnect_agent;
    else
        start_agent;
    fi

else
    start_agent;
fi
