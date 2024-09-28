#!/bin/bash

gunicorn -b 0.0.0.0:8000 app:/usr/src/app/app &
nginx -g daemon off