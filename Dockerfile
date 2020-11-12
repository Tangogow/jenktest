FROM python:alpine

LABEL maintainer="Alexis PLENEY <alexis.pleney@airbus.com>"

WORKDIR /app
EXPOSE 5000

ENV FLASK_APP=flasr.py
ENV FLASK_ENV=development

COPY . /app

RUN pip3 install flask pytest coverage wheel waitress virtualenv && \
    pip3 install -e /app

ENTRYPOINT ["flask", "run", "-h", "0.0.0.0"]