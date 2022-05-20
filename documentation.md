<h1>Performed Tasks.</h1>
<hr>
1. Forked the repo<br/>
2. Created a Dockerfile right here on GitHub with the following layers.<br/> 

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
3. I chose to use GitHub Actions for its simplicity and ease of integration with GitHub
