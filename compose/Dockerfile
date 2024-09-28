FROM python:3.13.0rc2-slim-bookworm

RUN mkdir /usr/src/app -p

COPY ./ /usr/src/app

WORKDIR /usr/src/app
RUN pip3 config set global.trusted-host 188.121.98.210
RUN pip3 config set global.extra-index-url http://188.121.98.210:9999/
RUN pip3 install gunicorn
RUN pip3 install -r requirements.txt

CMD ["gunicorn", "-b", "0.0.0.0:8000" ,"app:app"]