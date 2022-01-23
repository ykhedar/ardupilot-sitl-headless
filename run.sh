#!/bin/bash

docker run -it --rm -p 5760:5760 -p 14540:14540/udp --env-file sitl.env khedar/ardupilot-sitl-headless
