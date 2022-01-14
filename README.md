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



 
  

cd ArduPilot/
./Tools/autotest/sim_vehicle.py             --vehicle Rover             -I0             --custom-location=52.26666,10.516667,100,180             -w             --frame rover-skid             --no-rebuild             --no-mavproxy             --speedup 10 &
  
pip install mavproxy
  
APM_VERSION=Rover-4.1.2 tools/run-sitl-tests.sh /home/user/ArduPilot

tools/run-sitl-tests.sh
tools/start_px4_sitl.sh
tools/stop_px4_sitl.sh