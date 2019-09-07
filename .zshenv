#
# ~/.bash_profile
#
PATH="$PATH:/home/linuxbrew/.linuxbrew/bin"
PATH="$PATH:/usr/local/bin"
PATH="$PATH:/snap/bin"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes Postman install dir if it exists
# This is shitty but I am lazy
if [ -d "$HOME/bin/Postman" ] ; then
    PATH="$HOME/bin/Postman:$PATH"
fi


# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi
eval "$(rbenv init -)"
ORACLE_HOME="/usr/lib/oracle/12.2/client64"
PATH="$PATH:$ORACLE_HOME/bin"
# this should be dynamic to use proper nvm version
PATH="$PATH:/home/juraj/.nvm/versions/node/v8.4.0"
PATH="$PATH:/home/juraj/bin/DataGrip-2019.1.3/bin"

