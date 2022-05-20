<h1>Performed Tasks.</h1>
<hr>
1. Forked the repo<br/>
2. Created a 'Dockerfile' right here on GitHub with the following layers.<br/> 

>set the base image. Since we're running a Python application a Python base image is used<br/>
FROM python:3.8<br/>
set a key-value label for the Docker image<br/>
LABEL maintainer="Moyosore Baiye"<br/>
copy files from the host to the container filesystem. <br/>
For example, all the files in the current directory to the  `/app` directory in the container<br/>
COPY . /app<br/>
defines the working directory within the container<br/>
WORKDIR /app<br/>
EXPOSE 3111<br/>
run commands within the container. <br/>
For example, invoke a pip command to install dependencies defined in the requirements.txt file. <br/>
RUN pip install -r requirements.txt<br/>
RUN python init_db.py<br/>
provide a command to run on container start. <br/>
For example, start the `app.py` application.<br/>
>CMD [ "python", "app.py" ]<br/>
<hr/>
3. I chose to use GitHub Actions for its simplicity and ease of integration with GitHub.<br/>
4. Created a '.github' folder in the root folder and inside it a 'workflows' folder that holds a 'docker-build-push.yaml' configuration file with code below. <br/>

'''
*This is a basic workflow to help you get started with Actions*<br/>

name: Docker Build and Push<br/>

*Controls when the action will run. Triggers the workflow on push or pull request events but only for the main branch*<br/>
on:<br/>
  push:<br/>
    branches: [ main ]<br/>
  pull_request:<br/>
    branches: [ main ]<br/>

*A workflow run is made up of one or more jobs that can run sequentially or in parallel*<br/>
jobs:<br/>
  *This workflow contains a single job called "build"*<br/>
  build:<br/>
    *The type of runner that the job will run on*<br/>
    runs-on: ubuntu-latest<br/>

    *Steps represent a sequence of tasks that will be executed as part of the job*<br/>
    steps:<br/>
      -<br/>
        name: Checkout<br/>
        uses: actions/checkout@v2<br/>
      -<br/>
        name: Set up QEMU<br/>
        uses: docker/setup-qemu-action@v1<br/>
      -<br/>
        name: Set up Docker Buildx<br/>
        uses: docker/setup-buildx-action@v1<br/>
      -<br/>
        name: Login to DockerHub<br/>
        uses: docker/login-action@v1 <br/>
        with:<br/>
          username: ${{ secrets.DOCKERHUB_USERNAME }}<br/>
          password: ${{ secrets.DOCKERHUB_TOKEN }}<br/>
      -<br/>
        name: Build and push<br/>
        uses: docker/build-push-action@v2<br/>
        with:<br/>
          context: .<br/>
          file: ./Dockerfile<br/>
          platforms: linux/amd64<br/>
          push: true<br/>
          tags: mbaiye/devops:techpet<br/>'''
