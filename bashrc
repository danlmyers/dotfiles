########################
# DotFiles (castle) ~/.bashrc
# Daniel Myers
########################

##### Interactive Mode #####
[[ $- != *i* ]] && return


##### Aliases #####
[[ -s "$HOME/.bash.d/aliases" ]] && source "$HOME/.bash.d/aliases"

##### Ruby Path #####
if hash ruby 2>/dev/null; then
    PATH="$(ruby -e 'print Gem.user_dir')/bin:$PATH"
fi


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

##### Python Virtualenvwrapper ######
[[ -s "/usr/local/share/python/virtualenvwrapper.sh" ]] && source "/usr/local/share/python/virtualenvwrapper.sh"
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"

##### Prompt ######
[[ -s "$HOME/.bash.d/ps1_functions" ]] && source "$HOME/.bash.d/ps1_functions"

ps1_set

