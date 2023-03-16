# Configure the home directory to Node Version Manager (nvm)
export NVM_DIR="$HOME/.nvm"

# Bootstrap Node Version Manager (nvm)
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Set up Node Version Manager bash completion
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
