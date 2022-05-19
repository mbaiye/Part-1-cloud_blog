FROM python:3.8

LABEL maintainer="Moyosore Baiye"

WORKDIR /app

COPY . /app

EXPOSE 3111

RUN pip install -r requirements.txt

RUN python init_db.py

CMD [ "python", "app.py" ]
