#!/bin/sh
cd /etc/IPReflector
sudo gunicorn --workers 3 -b 0.0.0.0:80 flaskapp:app &