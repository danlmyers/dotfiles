#Makes sure .bashrc is read if it is there
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

