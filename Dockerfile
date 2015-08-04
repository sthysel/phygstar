FROM python:3.4
MAINTAINER sthysel <sthysel@gmail.com>

ENV REFRESHED_AT 2015-05-27
ENV PYTHONUNBUFFERED 1

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y --no-install-recommends \
  wget
  && apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN env --unset=DEBIAN_FRONTEND

RUN mkdir /src/
WORKDIR /src/
ADD requirements.txt /src/
RUN pip install -r requirements.txt
ADD . /src/

RUN mkdir /data/
RUN wget https://github.com/astronexus/HYG-Database/blob/master/hygdata_v3.csv -O /data/hygdata.csv
RUN wget https://github.com/astronexus/HYG-Database/blob/master/dso.csv -O /data/dso.csv

