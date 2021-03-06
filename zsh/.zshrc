# Setup ZSH
# ======================
  # a If you come from bash you might have to change your $PATH.
  export PATH=$PATH:$HOME/.local/bin:/usr/local/bin

  # Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh
  export ZSH_CUSTOM=$ZSH/custom
  if [ ! -e $ZSH ]; then
    git clone https://github.com/robbyrussell/oh-my-zsh.git $ZSH
  fi

  # Compilation flags
  export ARCHFLAGS="-arch x86_64"

  # ssh
  export SSH_KEY_PATH="~/.ssh/rsa_id"

  # Themes
  ZSH_THEME="spaceship-prompt"
  # cloud
  # af-magic
  # robbyrussell
  # robbyrussell
  # flazz
  # agnoster

  # Uncomment the following line to change how often to auto-update (in days).
  export UPDATE_ZSH_DAYS=3

  # Uncomment the following line to enable command auto-correction.
  ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"

  # The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
  HIST_STAMPS="%d.%m.%y %T"
  # Plugins
    ZSH_PLUGINS_HOME=$ZSH/custom/plugins

    # download autosuggestions
    ZSH_AUTOSUGGESTIONS=$ZSH_PLUGINS_HOME/zsh-autosuggestions
    if [ ! -e $ZSH_AUTOSUGGESTIONS ]; then
      git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_AUTOSUGGESTIONS
    fi

    # download wakatime
    WAKATIME_PLUGINS=$ZSH_PLUGINS_HOME/zsh-wakatime
    if [ ! -e $WAKATIME_PLUGINS ]; then
      git clone https://github.com/wbingli/zsh-wakatime.git $WAKATIME_PLUGINS
    fi

    # download spaceship-prompt theme
    OMZ_THEME=$ZSH_CUSTOM/themes/spaceship-prompt
    dest="$ZSH/themes/spaceship-prompt.zsh-theme"
    if [ ! -e $dest ]; then
      git clone https://github.com/denysdovhan/spaceship-prompt.git $OMZ_THEME
      ln -s "$OMZ_THEME/spaceship.zsh-theme" $dest

      # Install Powerline fonts
      git clone https://github.com/powerline/fonts.git --depth=1
      cd fonts
      ./install.sh
      cd ..
      rm -rf fonts
    fi

    # select plugins
    plugins=(
      git
      npm
      rust
      docker
      ansible
      kubectl
      golang
      python
      zsh-autosuggestions
    )


# Load files
# =================
  file_paths=(
    # zsh
    $ZSH/oh-my-zsh.sh
    # aliases
    $HOME/.aliases
    # scripts
    $HOME/.local/bin/ws
  )
  for file_path in ${file_paths[@]}; do
    [ -f $file_path ] && source $file_path
  done
