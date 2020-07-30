set FILEPATH (dirname (status -f))

set GOPATH $HOME/code

# With G, to change go version, just use `g`

# With fnm to change node version just use `fnm`

# functions path
__utils_fish_add_to_functions_path "$FILEPATH/functions"

# completions path
__utils_fish_add_to_completions_path "$FILEPATH/completions"