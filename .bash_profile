if [ -f "$HOME/.bashrc" ]; then
	. "$HOME/.bashrc"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi


alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
export
PATH="/usr/local/Cellar/qt@5/5.15.6/bin:$PATH"
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
alias g++="g++ -std=c++17 -O2 -Wextra -Werror -Wshadow"
##
# Your previous /Users/mac/.bash_profile file was backed up as /Users/mac/.bash_profile.macports-saved_2019-09-20_at_20:28:53
##

# MacPorts Installer addition on 2019-09-20_at_20:28:53: adding an appropriate PATH variable for use with MacPorts.
export PATH="/opt/local/bin:/opt/local/sbin:/usr/local/Cellar/qt@5/5.15.6/bin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/Users/mac/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/Users/mac/opt/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/Users/mac/opt/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/Users/mac/opt/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
# <<< conda initialize <<<
