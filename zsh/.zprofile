# set environment vars
# ======================
  export BROWSER="/usr/bin/brave"
  export SHELL="/usr/bin/zsh"
  export EDITOR="/usr/bin/vim"
  export WORKSPACE=$HOME/dev # user Workspace


# Setup user profile
# ======================
  # a If you come from bash you might have to change your $PATH.
  export PATH=$PATH:$HOME/.local/bin:/usr/local/bin
  export ARCHFLAGS="-arch x86_64"
  export SSH_KEY_PATH="~/.ssh/rsa_id"


# System Setup
# ===================
  ## Settup env language: https://wiki.archlinux.org/index.php/Locale
  export LANG=pt_BR.UTF-8
  export LC_ALL=pt_BR.UTF-8


# Go Setup
# ===============
  export GOPATH=$WORKSPACE/go
  export GO_GLOBAL=/usr/local/opt/go/libexec/bin
  export PATH=$PATH:$GOPATH/bin:$GO_GLOBAL
  if [ ! -x "$(command -v go)" ]; then
    wget -c https://golang.org/dl/go1.17.linux-amd64.tar.gz -O - | sudo tar -xz -C /usr/local
  fi
  [ ! -e $GOPATH ] && mkdir -p $GOPATH


# Rust Setup
# =================
  export RUST_HOME="$HOME/.cargo"
  export PATH=$PATH:$RUST_HOME/bin
  [ ! -e $RUST_HOME ] && mkdir -p $RUST_HOME
  if [ ! -x "$(command -v cargo)" ] || [ ! -x "$(command -v rustc)" ]; then
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  source "$RUST_HOME/env"


# Deno Setup
# =================
  export DENO_HOME="$HOME/.deno"
  export PATH=$PATH:$DENO_HOME/bin
  [ ! -e $DENO_HOME ] && mkdir -p $DENO_HOME
  [ ! -x "$(command -v deno)" ] && cargo install deno


# Node Setup
# =================
  ## NPM
  export NPM_HOME=$HOME/.npm-global
  export PATH=$PATH:$NPM_HOME/bin
  npm config set prefix $NPM_HOME
  [ ! -e $NPM_HOME ] && mkdir -p $NPM_HOME

  ## Yarn
  export YARN_HOME=$HOME/.config/yarn
  export PATH=$PATH:$YARN_HOME/global/node_modules/.bin
  if [ ! -e $YARN_HOME ]; then
    npm i -g yarn
    mkdir -p $YARN_HOME
  fi


# Python Setup
# ===================
  if [ -x "$(command -v pyenv)" ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init --path)"

    # pyenv virtualenv
    [ -x "$(command -v pyenv)" ] && eval "$(pyenv virtualenv-init -)"
  else;
    echo "Please install pyenv"
  fi


# Emacs Doom Setup
# =================
  export EMACS_HOME="$HOME/.emacs.d/"
  export PATH=$PATH:$EMACS_HOME/bin


# Fig Setup
# ===================
  [ -s ~/.fig/fig.sh ] && source ~/.fig/fig.sh


# Ruby Setup
# ===================
  # Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
  export PATH="$PATH:$HOME/.rvm/bin"
  [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
