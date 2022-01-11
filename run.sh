#!/bin/bash

docker run -it --rm -p 5760:5760 --env-file sitl.env khedar/ardu-sitl-headless
