FROM ubuntu:20.04
MAINTAINER shrikanaga5@gmail.com

RUN apt-get update -y
RUN apt-get install python3-pip -y
RUN apt-get install gunicorn3 -y

COPY requirements.txt requirements.txt
COPY flaskapp /opt/

RUN pip3 install -r requirement.txt
WORKDIR /opt/

EXPOSE 5000

CMD ["gunicorn3", "-b", "0.0,0.0:5000", "app:app", "--workers=5"]
