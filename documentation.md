<h1>Performed Tasks.</h1>
<hr>
1. Forked the repo<br/>
2. Created a 'Dockerfile' right here on GitHub with the following layers.<br/> 

```
#set the base image. Since we're running a Python application a Python base image is used
FROM python:3.8
# set a key-value label for the Docker image
LABEL maintainer="Moyosore Baiye"
# copy files from the host to the container filesystem. 
# For example, all the files in the current directory to the  `/app` directory in the container
COPY . /app
# defines the working directory within the container
WORKDIR /app
# exposes port 3111 inside the container
EXPOSE 3111
# run commands within the container. 
# For example, invoke a pip command to install dependencies defined in the requirements.txt file. 
RUN pip install -r requirements.txt
RUN python init_db.py
# provide a command to run on container start. 
# For example, start the `app.py` application.
CMD [ "python", "app.py" ]
```
<hr/>
3. I chose to use GitHub Actions for its simplicity and ease of integration with GitHub.<br/>
4. Created a '.github' folder in the root folder and inside it a 'workflows' folder that holds a 'docker-build-push.yaml' configuration file with code below. <br/>

```
# This is a basic workflow to help you get started with Actions
 
name: Docker Build and Push
 
# Controls when the action will run. Triggers the workflow on push or pull request events but only for the main branch
on:
  push:
    branches: [ main ]
  pull_request:
    branches: [ main ]
 
# A workflow run is made up of one or more jobs that can run sequentially or in parallel
jobs:
  # This workflow contains a single job called "build"
  build:
    # The type of runner that the job will run on
    runs-on: ubuntu-latest
 
    # Steps represent a sequence of tasks that will be executed as part of the job
    steps:
      -
        name: Checkout
        uses: actions/checkout@v2
      -
        name: Set up QEMU
        uses: docker/setup-qemu-action@v1
      -
        name: Set up Docker Buildx
        uses: docker/setup-buildx-action@v1
      -
        name: Login to DockerHub
        uses: docker/login-action@v1 
        with:
          username: ${{ secrets.DOCKERHUB_USERNAME }}
          password: ${{ secrets.DOCKERHUB_TOKEN }}
      -
        name: Build and push
        uses: docker/build-push-action@v2
        with:
          context: .
          file: ./Dockerfile
          platforms: linux/amd64
          push: true
          tags: mbaiye/devops:techpet

```
After you commit the change, the workflow should be triggered automatically i.e build and push to dockerhub. Below is the screenshot of the built images on dockerhub.<br/>
Below are a few screenshots. Proper documentation would be done on them also.<br/>
<hr/>
- Built and pushed image in dockerhub<br/>


![GitHub Dark](/assets/images/dockerhub.png)

<hr/>
<h2>Building and running the application locally.</h2><br/>
5. The repo was cloned to my local machine afterwards so as to build and run the application.<br/>
Build the image with.<br/>

```
docker build -t techpet:blog . 
```
Run the built imagine with.<br/>

```
docker run -p 3111:3111 -d --rm --name techpetblog techpet:blog 
```
This threw an error and the screenshot below shows the error.<br/>


![GitHub Dark](/assets/images/error.png)

So i discovered that this error can be fixed by updating the versions of dependencies used in the requirements.txt file to Flask==2.1.0 and Werkzeug==2.0.0. Did that and rebuilt and re-ran the container and viola. <br/>
Screenshot below shows the running container<br/>

![GitHub Dark](/assets/images/finalrun.png)
