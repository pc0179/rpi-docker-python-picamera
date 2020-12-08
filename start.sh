#!/bin/bash
python demo.py &
cd /data
#python -m SimpleHTTPServer 8081
python -m http.server 8081
