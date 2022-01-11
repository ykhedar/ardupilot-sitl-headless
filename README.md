docker run -it --rm -p 5760:5760 --env-file sitl.env khedar/ardu-sitl-headless

mavproxy.py --master=tcp:localhost:5760 --out=udp:127.0.0.1:14550

python3 vehicle.py --connect 127.0.0.1:14550