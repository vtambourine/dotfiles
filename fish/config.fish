set -g fish_greeting ""

set -x EDITOR "vim"
set -x LC_ALL "ru_RU.UTF-8"
set -x LANG "ru_RU.UTF-8"

set PATH "/usr/local/share/npm/bin" $PATH # npm
set PATH "./node_modules/.bin"      $PATH # local npm
set PATH "/usr/local/heroku/bin"    $PATH # Heroku Toolbelt
set PATH "./bin"                    $PATH # Project-specific binstubs

set NODE_PATH "/usr/local/lib/node_modules" $NODE_PATH
set NODE_PATH "$HOME/node_modules/.bin"     $NODE_PATH

ulimit -n 8192
command ulimit -n 8192

source ~/.config/fish/aliases.fish
