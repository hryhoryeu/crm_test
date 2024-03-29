# pull official base image
FROM python:3.8.3-alpine
# set work directory
WORKDIR /crm_test/
# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
# install psycopg2 dependencies
RUN apk update \
    && apk add gcc musl-dev python3-dev libffi-dev openssl-dev cargo postgresql-dev
# install dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt
# copy entrypoint.sh
COPY ./entrypoint.sh .
# copy project
COPY . .