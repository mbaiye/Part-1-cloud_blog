<h1>Performed Tasks.</h1>
<hr>
1. Forked the repo</br>
2. Created a Dockerfile right here on GitHub with the following layers.</br> 
'''# set the base image. Since we're running 
# a Python application a Python base image is used
FROM python:3.8
# set a key-value label for the Docker image
LABEL maintainer="Moyosore Baiye"
# copy files from the host to the container filesystem. 
# For example, all the files in the current directory
# to the  `/app` directory in the container
COPY . /app
#  defines the working directory within the container
WORKDIR /app
EXPOSE 3111
# run commands within the container. 
# For example, invoke a pip command 
# to install dependencies defined in the requirements.txt file. 
RUN pip install -r requirements.txt
RUN python init_db.py
# provide a command to run on container start. 
# For example, start the `app.py` application.
'''
CMD [ "python", "app.py" ] </br>
3. I chose to use GitHub Actions for its simplicity and ease of integration with GitHub
