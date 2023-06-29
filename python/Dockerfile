FROM python:3.10.4-slim-bullseye
WORKDIR /root
COPY requirements.txt /root
RUN apt-get update \
  && apt-get -y install libpq-dev gcc \
  && pip install psycopg2 \
  && pip install --upgrade pip \
  && pip install -r requirements.txt