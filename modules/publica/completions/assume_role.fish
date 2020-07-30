set -l assume_role_commands ctv_engineer stream_engineer stream_admin

complete -f -c assume_role -n "not __fish_seen_subcommand_from $assume_role_commands" -a ctv_engineer -d 'CTV Engineer'
complete -f -c assume_role -n "not __fish_seen_subcommand_from $assume_role_commands" -a stream_engineer -d 'Stream Engineer'
complete -f -c assume_role -n "not __fish_seen_subcommand_from $assume_role_commands" -a stream_admin -d 'Stream Admin'