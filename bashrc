########################
# DotFiles (castle) ~/.bashrc
# Daniel Myers
########################

##### Interactive Mode #####
[[ $- != *i* ]] && return


##### Aliases #####
[[ -s "$HOME/.bash.d/aliases" ]] && source "$HOME/.bash.d/aliases"

##### PATHs #####
function conditionally_prefix_path {
    local dir=$1
    if [ -d $dir ]; then
	PATH="$dir:${PATH}"
    fi
}

conditionally_prefix_path ~/.bin
conditionally_prefix_path ~/.pbin


##### Shell Settings #####
export EDITOR="vim"

##### Private Bashrc ######
[[ -s "$HOME/.pbashrc" ]] && source "$HOME/.pbashrc"

##### RVM Settings #####
#[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

##### Python Virtualenvwrapper (this is homebrew specific location) ######
[[ -s "/usr/local/share/python/virtualenvwrapper.sh" ]] && source "/usr/local/share/python/virtualenvwrapper.sh"

##### SSH Agent #####
eval $(ssh-agent)

##### Prompt ######
[[ -s "$HOME/.bash.d/ps1_functions" ]] && source "$HOME/.bash.d/ps1_functions"

ps1_set --notime

