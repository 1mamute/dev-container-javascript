# dev-container-javascript

Personal container environment for javascript/typescript development.

- Ubuntu 20.04 base image
- Essentials packages
- Creates a user (jsdev as default) and add its to sudoers group 
- nvm for managing multiple node versions
- Installs latest nodejs and nodejs-lts (uses nodejs-lts as default)
- Essentials js/ts npm packages and yarn

Stop bloating your machine with packages and dependencies, code inside the Docker container! Everything is isolated, controlled, 100% customizable and it's reusable or disposable (if you want).

**Read the Dockerfile!** There's useful comments there. (actually you should always read any scripts you download from the internet :P)

**This is not a Docker image for production/release!**
# How to use it

- **Docker**:
  Make sure you have docker installed and running in your machine.
  Some great resources:

  - [Docker Official Documentation](https://docs.docker.com/get-started/)
  - [How To Install and Use Docker on Ubuntu 20.04 by Brian Hogan](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
  - [Docker Wiki Page from Alpine Wiki](https://wiki.alpinelinux.org/wiki/Docker)
  - [Get started using Visual Studio Code with Windows Subsystem for Linux by Microsoft Docs](https://docs.microsoft.com/pt-br/windows/wsl/tutorials/wsl-vscode)
  - [Get started with Docker remote containers on WSL 2 by Microsoft](https://docs.microsoft.com/pt-br/windows/wsl/tutorials/wsl-containers)

- **Manual**:
  Clone the repository, make your changes to the Dockerfile, build, run and attach your shell and/or VSCode (using [Remote - Container Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)) to the container

  The **--build-arg** determine the users configuration. If you don't pass any **--build-arg** it will use _jsdev_ as default user/pwd. You can also use your currently logged user if you pass **--build-arg USER=$USER** and **--build-arg PW=YOURPASSWORDHERE**
  ```
  git clone https://github.com/1mamute/dev-container-javascript.git
  cd dev-container-javascript
  docker build --build-arg USER=jsdev \
               --build-arg UID=1000 \
               --build-arg GID=1000 \
               --build-arg PW=jsdev \
               --tag dev-container-javascript:latest .
  docker run -it -u jsdev dev-container-javascript:latest /bin/bash
  ```

- **Docker Hub**:
  Pull the image from DockerHub, run and attach your shell and/or VSCode (using [Remote - Container Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)) to the container
  ```
  docker pull 1mamute/dev-container-javascript:latest
  docker run -it -u jsdev 1mamute/dev-container-javascript:latest /bin/bash
  ```

# TODO:

- Mount a volume to persist the storage from the container
- Create a devcontainer.json configuration
- Support multiple versions of Node with nvm (done)
- Setup a user inside the container so we won't always be using the root user (done)