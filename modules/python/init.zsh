#
# Enables local Python package installation.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#   Sebastian Wiesner <lunaryorn@googlemail.com>
#   Patrick Bos <egpbos@gmail.com>
#

# Load manually installed pyenv into the shell session.
if [[ -s "$HOME/.pyenv/bin/pyenv" ]]; then
  path=("$HOME/.pyenv/bin" $path)
  eval "$(pyenv init -)"

# Load package manager installed pyenv into the shell session.
elif (( $+commands[pyenv] )); then
  eval "$(pyenv init -)"

# Prepend PEP 370 per user site packages directory, which defaults to
# ~/Library/Python on Mac OS X and ~/.local elsewhere, to PATH. The
# path can be overridden using PYTHONUSERBASE.
else
  if [[ -n "$PYTHONUSERBASE" ]]; then
    path=($PYTHONUSERBASE/bin $path)
  elif [[ "$OSTYPE" == darwin* ]]; then
    path=($HOME/Library/Python/*/bin(N) $path)
  else
    # This is subject to change.
    path=($HOME/.local/bin $path)
  fi
fi

# Return if requirements are not found.
if (( ! $+commands[python] && ! $+commands[pyenv] )); then
  return 1
fi

# Load virtualenvwrapper into the shell session.
# ...only if not using conda, since the two are expected to clash
if (( ! $+commands[conda] )); then
  if (( $+commands[virtualenvwrapper.sh] )); then
    # Set the directory where virtual environments are stored.
    export WORKON_HOME="$HOME/.virtualenvs"

    # Disable the virtualenv prompt.
    VIRTUAL_ENV_DISABLE_PROMPT=1

    source "$commands[virtualenvwrapper.sh]"
  fi
else
  if (( $(conda ..changeps1) )); then
    echo "To make sure Conda doesn't change your prompt (should do that in the prompt module) run:\n  conda config --set changeps1 false"
    # TODO:
    # We could just run this ourselves. In an exit hook
    # (add zsh-hook zshexit [(anonymous) function]) we could then set it back
    # to the way it was before we changed it. However, I'm not sure if this is
    # exception safe, so left it like this for now.
  fi
fi

#
# Aliases
#

alias py='python'
