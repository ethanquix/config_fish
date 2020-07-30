set -l g_commands install download set run which remove prune list list-all self-upgrade help
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a install -d ' Download and set go <version> use latest for the latest version('
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a download -d 'Download go <version>'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a set -d 'Switch to go <version>'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a run -d 'Run a given version of go'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a which -d 'Output bin path for <version>'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a remove -d 'Remove the given version(s)'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a prune -d 'Remove all versions except the current version'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a list -d 'Output downloaded go versions'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a list-all -d 'Output all available, remote go versions'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a self-upgrade -d 'Upgrades g to the latest version'
complete -f -c g -n "not __fish_seen_subcommand_from $g_commands" -a help -d 'Display help information'