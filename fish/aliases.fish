# Navigation
function ..   ; cd .. ; end
function ...  ; cd ../.. ; end
function .... ; cd ../../.. ; end

function ls ; command ls -al ; end

# Shortcuts
function g ; git $argv ; end

# Completion
function make_completion --arguments-name alias command
  echo "
    function __alias_completion_$alias
      set -l cmd (commandline -o)
      set -e cmd[1]
      complete -C\"$command \$cmd\"
    end
  " | .
  complete -c $alias -a "(__alias_completion_$alias)"
end

make_completion g "git"
