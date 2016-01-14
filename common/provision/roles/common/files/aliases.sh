export LS_OPTIONS='--color=auto'
eval "`dircolors`"
alias ls='ls $LS_OPTIONS   # color
alias l='ls -F'            # classify
alias la='l -A'            # classify, hidden

alias ll='l -lh'  # human readable
alias lla='ll -A' # hidden

alias x='clear;'
alias xl='clear; l'
alias xla='clear; la'
