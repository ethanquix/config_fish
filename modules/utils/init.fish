set FILEPATH (dirname (status -f))

# We source utils functions

# to prevent multi add
# contains /tmp $PATH
# or set PATH /tmp $PATH

# Helper to add path to functions path (lazy-loading)
function __utils_fish_add_to_functions_path
    set -gx fish_function_path "$argv[1]" $fish_function_path
end

# Helper to add path to completions path (lazy-loading)
function __utils_fish_add_to_completions_path
    set -gx fish_complete_path "$argv[1]" $fish_complete_path
end

# functions path
set -gx fish_function_path "$FILEPATH/functions" $fish_function_path