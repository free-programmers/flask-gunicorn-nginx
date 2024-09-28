FROM alpine:3.20.3

LABEL authors="alisharify"
LABEL description="flask gunicorn nginx proxy docker base file"
LABEL version="1.0.0"

# COPY sources.list /etc/apt/sources.list

RUN apk update && apk add nginx python3 py3-pip
RUN mkdir /usr/src/app/ -p
RUN touch /usr/src/app/requirements.txt

RUN pip3 config set global.break-system-packages true
RUN python3 -m pip install --upgrade pip
RUN pip3 install -r /usr/src/app/requirements.txt
RUN pip3 install gunicorn

ENV PYTHONUNBUFFERED=1

COPY nginx.conf /etc/nginx/nginx.conf
COPY custom.conf /etc/nginx/conf.d/custom.conf

RUN touch /usr/src/app/pre_build.sh
RUN touch /usr/src/app/after_build.sh
COPY start.sh /usr/src/app/start.sh

RUN chmod +x /usr/src/app/pre_build.sh
RUN chmod +x /usr/src/app/after_build.sh


EXPOSE 80
RUN chmod 777 /usr/src/app/start.sh

CMD ["/usr/src/app/start.sh"]
