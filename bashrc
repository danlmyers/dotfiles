########################
# DotFiles (castle) ~/.bashrc
# Daniel Myers
########################

##### Interactive Mode #####
[[ $- != *i* ]] && return


##### Aliases #####
[[ -s "$HOME/.bash.d/aliases" ]] && source "$HOME/.bash.d/aliases"

##### Functions #####
[[ -s "$HOME/.bash.d/functions" ]] && source "$HOME/.bash.d/functions"

##### Git Tab Completion #####
[[ -s "$HOME/.bash.d/git-completion.bash" ]] && source "$HOME/.bash.d/git-completion.bash"

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

function conditionally_append_path {
   local dir=$1
   if [ -d $dir ]; then
      PATH="${PATH}:$dir"
   fi
}

conditionally_prefix_path ~/.rbenv/bin
conditionally_prefix_path ~/.bin
conditionally_prefix_path ~/.pbin

##### GO #####
[[ -s "$HOME/.go" ]] && export GOPATH="$HOME/.go"
conditionally_append_path ~/.go/bin

##### Shell Settings #####
export EDITOR="vim"

##### Private Bashrc ######
[[ -s "$HOME/.pbashrc" ]] && source "$HOME/.pbashrc"

##### Python Virtualenvwrapper ######
[[ -s "/usr/local/share/python/virtualenvwrapper.sh" ]] && source "/usr/local/share/python/virtualenvwrapper.sh"
[[ -s "/usr/local/bin/virtualenvwrapper.sh" ]] && source "/usr/local/bin/virtualenvwrapper.sh"
[[ -s "/usr/bin/virtualenvwrapper.sh" ]] && source "/usr/bin/virtualenvwrapper.sh"

##### Prompt ######
#[[ -s "$HOME/.bash.d/ps1_functions" ]] && source "$HOME/.bash.d/ps1_functions"

#ps1_set
powerline-daemon -q
POWERLINE_BASH_CONTINUATION=1
POWERLINE_BASH_SELECT=1
#. /usr/lib/python3.5/site-packages/powerline/bindings/bash/powerline.sh
. /usr/local/lib/python2.7/site-packages/powerline/bindings/bash/powerline.sh
