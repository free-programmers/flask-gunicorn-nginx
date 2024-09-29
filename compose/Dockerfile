FROM python:3.13.0rc2-slim-bookworm

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN mkdir -p /usr/src/app

WORKDIR /usr/src/app

COPY requirements.txt ./

RUN pip3 config set global.trusted-host 188.121.98.210 && \
    pip3 config set global.extra-index-url http://188.121.98.210:9999/ && \
    pip3 install --no-cache-dir -r requirements.txt

RUN pip3 install --no-cache-dir gunicorn

COPY ./ ./

EXPOSE 8000

CMD ["gunicorn", "-b", "0.0.0.0:8000", "app:app"]