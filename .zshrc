function colorized_prompt {
    if [[ $? ]]; then
        printf "\e[32m$\e[m"
    else
        printf "\e[31m$\e[m"
    fi
}
export PROMPT='%{%F{blue}%}%n%{%f%}@%{%F{green}%}%m %{%F{red}%}%~ ∫ % %{%f%}'
export CLICOLOR=1
#export PATH="/Users/mac/desktop/glm-3/glm:/usr/local/cellar/qt@5/5.15.2/bin:$PATH"
export LSCOLORS=GxFxCxDxBxegedabagaced
export CLASSPATH=".:/usr/local/lib/antlr-4.9.2-complete.jar:$CLASSPATH"
export CLASSPATH=".:/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH"
alias grun='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.gui.TestRig'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.9-complete.jar:$CLASSPATH" org.antlr.v4.Tool'

export LD_LIBRARY_PATH="${LD_LIBRARY_PATH}:-L/usr/opt/local/"

##  antigen bundle zsh-users/zsh-autosuggestions
alias julia="exec '/Applications/Julia-1.7.app/Contents/Resources/julia/bin/julia'"

alias aip="echo $(ifconfig | grep broadcast | awk '{print $2}')"

PATH="/usr/local/cellar/qt@5/5.15.6/bin:$PATH"
export PATH="-L/opt/local/bin:/opt/local/sbin:/usr/local/cellar/qt@5/5.15.6/bin:$PATH"

#export PATH="/usr/local/anaconda3/bin:$PATH"  # commented out by conda initialize

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
#__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
#if [ $? -eq 0 ]; then
#    eval "$__conda_setup"
#else
#    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
#        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
#    else
#        export PATH="/usr/local/anaconda3/bin:$PATH"
#    fi
#fi
#unset __conda_setup
