FROM python:3.4
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-05-27
ENV PYTHONUNBUFFERED 1

RUN mkdir /src/
WORKDIR /src/
ADD requirements.txt /src/
RUN pip install -r requirements.txt
ADD . /src/
