## LOGIN WITH TTY ##
if (glob "/tmp/**" | grep $"/tmp/(id -u krabs)-runtime-dir" | is-empty) == true {
mkdir $"/tmp/(id -u krabs)-runtime-dir"
chmod 0700 $"/tmp/(id -u krabs)-runtime-dir"
}
$env.XDG_RUNTIME_DIR = $"/tmp/(id -u krabs)-runtime-dir"

# personal config
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
## DOTNET ##
$env.DOTNET_ROOT = '/home/krabs/.dotnet'

$env.PATH = ($env.PATH | append "/home/krabs/.local/bin")
$env.PATH = ($env.PATH | append "/home/krabs/.cargo/bin")
$env.PATH = ($env.PATH | append "/home/krabs/.dotnet")
$env.PATH = ($env.PATH | append "/home/krabs/.dotnet/tools")

$env.config.buffer_editor = "nvim"

$env.CARAPACE_BRIDGES = 'zsh' # optional
mkdir ~/.cache/carapace
carapace _carapace nushell | save --force ~/.cache/carapace/init.nu
zoxide init nushell --no-cmd | save -f ~/.zoxide.nu
