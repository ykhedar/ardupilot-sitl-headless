# Ardupilot SITL Headless 

Run the SITL using run.sh script

```bash
$ bash run.sh
```


Then run mavproxy to route packets to external ports
```bash
$ mavproxy.py --master=tcp:localhost:5760 --out=udp:127.0.0.1:14550
```

Now run the offboard script for ardupilot.

```bash
$ python3 vehicle.py --connect 127.0.0.1:14550
```
