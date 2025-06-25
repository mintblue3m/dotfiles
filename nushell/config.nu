# config.nu
#
# Installed by:
# version = "0.104.1"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# This file is loaded after env.nu and before login.nu
#
# You can open this file in your default editor using:
# config nu
#
# See `help config nu` for more options
#
# You can remove these comments if you want or leave
# them for future reference.
$env.config.show_banner = false
$env.config.edit_mode = "vi"
$env.config.table.header_on_separator = true

## GCC ##
$env.CC = "/usr/local/bin/gcc"
## RUST ##
$env.RUSTC = "/usr/local/bin/rustc"
$env.RUSTDOC = "/usr/local/bin/rustdoc"
$env.RUSTFMT = "/usr/local/bin/rustfmt"
$env.CARGO = "/usr/local/bin/cargo"

def cheatsh [cmd] {
    curl $"cheat.sh/($cmd)"
}
source ~/.zoxide.nu

alias cd = __zoxide_z
alias cdi = __zoxide_zi

job spawn { pipewire }
job spawn { pipewire-pulse }

mkdir ($nu.data-dir | path join "vendor/autoload")
starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
source ~/.cache/carapace/init.nu

plugin add ~/git/nu_plugin_regex/target/release/nu_plugin_regex
