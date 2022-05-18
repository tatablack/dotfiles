# Aliases
function cat
  bat $argv
end

alias top="btm --config ~/.config/bottom/bottom.toml"
alias gitroot="cd (git rev-parse --show-toplevel)"

function ssh -d "Concatenates ssh configuration files into one, updates its permissions, and executes ssh"
  cat ~/.ssh/config.d/* > ~/.ssh/config
  chmod 600 ~/.ssh/config
  command ssh $argv
end

function e -d "Set defaults for exa invocations"
  command exa --header --group --group-directories-first --all --long --classify --modified --created $argv
end

# Skip updating brew every time it's invoked
set -x HOMEBREW_NO_AUTO_UPDATE 1

# Initialise the prompt configuration
starship init fish | source

# Initialise prompt history
atuin init fish | source

# Initialise zoxide
zoxide init fish | source

# Set the default editor
set -gx EDITOR micro
set -gx VISUAL micro