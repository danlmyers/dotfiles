set fish_function_path $fish_function_path "/usr/lib/python3.8/site-packages/powerline/bindings/fish"
eval (python -m virtualfish)
powerline-setup

if test -d ~/.local/bin
    set PATH ~/.local/bin $PATH
end
if test -d ~/.bin
    set PATH ~/.bin $PATH
end
if test -d ~/.pbin
    set PATH ~/.pbin $PATH
end