# erase greeting
set --erase fish_greeting

# direnv
eval (direnv hook fish)

# starship
starship init fish | source

# fnm
fnm env --multi | source
