#!/bin/sh
rm ~/.paseo/paseo.pid
paseo daemon start --web-ui --listen 0.0.0.0:6767 --foreground
