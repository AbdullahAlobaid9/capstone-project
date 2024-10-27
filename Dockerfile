FROM python:3.9-slim

WORKDIR /app

RUN apt-get update

COPY requirements.txt ./app

RUN pip install --no-cache-dir -r requirements.txt

COPY . /app

EXPOSE 5000

ENV FLASK_APP=app.py


# Since the flask app is not running the init_db because of db taking a long time to initialize, we call this function to make the user table :D 
CMD ["/bin/sh", "-c", "python -c 'from app import init_db; init_db()' && flask run --host=0.0.0.0"]