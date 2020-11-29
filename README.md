# dev-container-javascript

Personal container environment for javascript/typescript development.

Stop bloating your machine with packages and dependencies, code inside the Docker container! Everything is isolated, controlled, 100% customizable and it's reusable or disposable (if you want).

**This is not a Docker image for production/release!**

During the build, all the files inside the **/config** folder is copied to the **/root** folder inside the container. You can customize my configurations or you can use it as a start point and
make yourself home with your own configurations.

**Read the Dockerfile!** There's useful comments there. (actually you should always read any scripts you download from the internet :P)

Of course, some of the packages installed is completely personal preferences (for example, I like to use ZSH as my shell and Micro as my text editor), but the image can also be edited to your taste. Have fun!

# How to use it

- **Docker**
  Make sure you have docker installed and running in your machine.
  Some great resources:
  - [Docker Official Documentation](https://docs.docker.com/get-started/)
  - [How To Install and Use Docker on Ubuntu 20.04 by Brian Hogan](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)
  - [Docker Wiki Page from Alpine Wiki](https://wiki.alpinelinux.org/wiki/Docker)
  - [Get started using Visual Studio Code with Windows Subsystem for Linux by Microsoft Docs](https://docs.microsoft.com/pt-br/windows/wsl/tutorials/wsl-vscode)
  - [Get started with Docker remote containers on WSL 2 by Microsoft](https://docs.microsoft.com/pt-br/windows/wsl/tutorials/wsl-containers)

* **Manual**
  Clone the repository, make your changes to the Dockerfile, build, run and attach your shell and/or VSCode (using [Remote - Container Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)) to the container

  ```
  git clone https://github.com/1mamute/dev-container-javascript.git
  cd dev-container-javascript
  docker build --tag dev-container-javascript:latest .
  docker run -it dev-container-javascript:latest /bin/zsh
  ```

- **Docker Hub**
  Pull the image from DockerHub, run and attach your shell and/or VSCode (using [Remote - Container Extension](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers)) to the container
  ```
  docker pull 1mamute/dev-container-javascript:latest
  docker run -it 1mamute/dev-container-javascript:latest /bin/zsh
  ```

# TODO:

- Mount a volume to persist the storage from the container
- Support multiple versions of Node with nvm
- Setup a user inside the container so we won't always be using the root user
- Move the base docker image with the "system configuration" to its own registry/repository and make the language specifics images based on it
