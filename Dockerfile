FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive

# The user creation process inside the dockerfile came from this article
# https://medium.com/faun/set-current-host-user-for-docker-container-4e521cef9ffc
ARG USER=jsdev
ARG PW=jsdev
ARG UID=1000
ARG GID=1000

# Set the SHELL to bash with pipefail option and
# interactive mode, docker doesn't like this and yell at you a bit
# but don't worry about it
SHELL ["/bin/bash", "-o", "pipefail", "-c", "-i"]

# Adding a new non-root user jsdev, use sudo if you need root privileges
# If you don't pass USER and PW arguments, the user you're currently logged in
# will be used
RUN useradd -m ${USER} -u ${UID} && echo "${USER}:${PW}" | chpasswd

# Update packages
RUN apt update && apt-get update && apt -y upgrade && apt-get -y upgrade

# Install essential packages
RUN apt install -y --no-install-recommends \
  apt-transport-https \
  bash-completion \
  ca-certificates \ 
  curl \
  dirmngr \
  git \
  gnupg \
  netbase \
  openssl \
  software-properties-common \
  sudo \
  wget \
  xz-utils \
  && apt-get install -y \
  build-essential \
  libatomic1 \
  libssl-dev 
  
# Clean up apt cache
RUN rm -rf /var/lib/apt/lists/*

# Add user to sudo group
RUN adduser ${USER} sudo

# Setup default user when entering docker container
USER ${UID}:${GID}
WORKDIR /home/${USER}

# nvm
RUN git clone https://github.com/nvm-sh/nvm.git && mv nvm .nvm

# Copied from nvm's original Dockerfile
RUN echo 'export NVM_DIR="$HOME/.nvm"'                                       >> "$HOME/.bashrc" && \
    echo '[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm' >> "$HOME/.bashrc" && \
    echo '[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion" # This loads nvm bash_completion' >> "$HOME/.bashrc"

# Install latest nodejs-lts (as default), latest nodejs and other packages
# Set to use latest nodejs-lts after installing everything
RUN source $HOME/.nvm/nvm.sh && \
    nvm install 'lts/*' --latest-npm && \
    npm install --prefix "$HOME/.nvm/" && \
    npm install -g ts-node typescript eslint @types/node @types/eslint yarn && \
    nvm install node --reinstall-packages-from=current && \
    nvm use --lts

CMD [ "/bin/bash" ]