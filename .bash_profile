# .bash_profile -*- mode: sh -*-

# Load login settings and environment variables
if [[ -f ~/.profile ]]; then
  source ~/.profile
fi

# Load interactive settings
if [[ -f ~/.bashrc ]]; then
  source ~/.bashrc
fi

# Load Oh-My-Bash settings
if [[ -f ~/.bashrc_omb ]]; then
  source ~/.bashrc_omb
fi

