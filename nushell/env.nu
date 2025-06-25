# env.nu
#
# Installed by:
# version = "0.104.1"
#
# Previously, environment variables were typically configured in `env.nu`.
# In general, most configuration can and should be performed in `config.nu`
# or one of the autoload directories.
#
# This file is generated for backwards compatibility for now.
# It is loaded before config.nu and login.nu
#
# See https://www.nushell.sh/book/configuration.html
#
# Also see `help config env` for more options.
#
# You can remove these comments if you want or leave
# them for future reference.
if (ls "/tmp/" | grep $"/tmp/(id -u krabs)-runtime-dir" | is-empty) == true {
mkdir $"/tmp/(id -u krabs)-runtime-dir"
chmod 0700 $"/tmp/(id -u krabs)-runtime-dir"
}
$env.XDG_RUNTIME_DIR = $"/tmp/(id -u krabs)-runtime-dir"

$env.PATH = ($env.PATH | append "/home/krabs/.local/bin")
$env.PATH = ($env.PATH | append "/home/krabs/.cargo/bin")

$env.config_buffer_editor = "nvim"

$env.CARAPACE_BRIDGES = 'zsh' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
zoxide init nushell --no-cmd | save -f ~/.zoxide.nu
