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



 
  options: "--privileged"

cd ArduPilot/
./Tools/autotest/sim_vehicle.py             --vehicle Rover             -I0             --custom-location=52.26666,10.516667,100,180             -w             --frame rover-skid             --no-rebuild             --no-mavproxy             --speedup 10 &
  
pip install mavproxy
  
APM_VERSION=Rover-4.1.2 tools/run-sitl-tests.sh /home/user/ArduPilot

tools/run-sitl-tests.sh
tools/start_px4_sitl.sh
tools/stop_px4_sitl.sh




git clone https://github.com/ykhedar/MAVSDK.git .
git submodule update --init --recursive
APM_VERSION=copter-4.1.2 tools/run-sitl-tests.sh /home/user/ArduPilot


'', '/home/user/ArduPilot', '/root/.local/lib/python3.8/site-packages', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages'

['', '/__w/MAVSDK/MAVSDK', '/root/.local/lib/python3.8/site-packages', '/usr/lib/python38.zip', '/usr/lib/python3.8', '/usr/lib/python3.8/lib-dynload', '/usr/local/lib/python3.8/dist-packages', '/usr/lib/python3/dist-packages']




Usage: sim_vehicle.py

Options:
  -h, --help            show this help message and exit
  -v VEHICLE, --vehicle=VEHICLE
                        vehicle type (ArduCopter|Helicopter|Blimp|ArduPlane|Ro
                        ver|ArduSub|AntennaTracker)
  -f FRAME, --frame=FRAME
                        set vehicle frame type
                        ArduCopter: +|Callisto|IrisRos|X|airsim-
                            copter|bfx|calibration|coaxcopter|cwx|deca|deca-
                            cwx|djix|dodeca-hexa|gazebo-iris|heli|heli-
                            dual|hexa|hexa-cwx|hexa-dji|octa|octa-cwx|octa-
                            dji|octa-quad|octa-quad-cwx|quad|scrimmage-
                            copter|singlecopter|tri|y6
                        Helicopter: heli|heli-dual
                        Blimp: quad
                        ArduPlane: CRRCSim|calibration|firefly|gazebo-
                            zephyr|jsbsim|last_letter|plane|plane-
                            dspoilers|plane-elevon|plane-jet|plane-
                            soaring|plane-tailsitter|plane-
                            vtail|quadplane|quadplane-cl84|quadplane-
                            tilthvec|quadplane-tilttri|quadplane-
                            tilttrivec|quadplane-tri|scrimmage-plane
                        Rover: airsim-rover|balancebot|calibration|gazebo-
                            rover|rover|rover-skid|rover-
                            vectored|sailboat|sailboat-motor
                        ArduSub: gazebo-bluerov2|vectored|vectored_6dof
                        AntennaTracker: tracker
  --vehicle-binary=VEHICLE_BINARY
                        vehicle binary path
  -C, --sim_vehicle_sh_compatible
                        be compatible with the way sim_vehicle.sh works; make
                        this the first option

  Build options:
    -N, --no-rebuild    don't rebuild before starting ardupilot
    -D, --debug         build with debugging
    -c, --clean         do a make clean before building
    -j JOBS, --jobs=JOBS
                        number of processors to use during build (default for
                        waf : number of processor, for make : 1)
    -b BUILD_TARGET, --build-target=BUILD_TARGET
                        override SITL build target
    -s BUILD_SYSTEM, --build-system=BUILD_SYSTEM
                        build system to use
    --enable-math-check-indexes
                        enable checking of math indexes
    --rebuild-on-failure
                        if build fails, do not clean and rebuild
    --waf-configure-arg=WAF_CONFIGURE_ARGS
                        extra arguments to pass to waf in configure step
    --waf-build-arg=WAF_BUILD_ARGS
                        extra arguments to pass to waf in its build step

  Simulation options:
    -I INSTANCE, --instance=INSTANCE
                        instance of simulator
    -n COUNT, --count=COUNT
                        vehicle count; if this is specified, -I is used as a
                        base-value
    -i INSTANCES, --instances=INSTANCES
                        a space delimited list of instances to spawn; if
                        specified, overrides -I and -n.
    -V, --valgrind      enable valgrind for memory access checking (slow!)
    --callgrind         enable valgrind for performance analysis (slow!!)
    -T, --tracker       start an antenna tracker instance
    -A SITL_INSTANCE_ARGS, --sitl-instance-args=SITL_INSTANCE_ARGS
                        pass arguments to SITL instance
    -G, --gdb           use gdb for debugging ardupilot
    -g, --gdb-stopped   use gdb for debugging ardupilot (no auto-start)
    --lldb              use lldb for debugging ardupilot
    --lldb-stopped      use ldb for debugging ardupilot (no auto-start)
    -d DELAY_START, --delay-start=DELAY_START
                        delay start of mavproxy by this number of seconds
    -B BREAKPOINT, --breakpoint=BREAKPOINT
                        add a breakpoint at given location in debugger
    --disable-breakpoints
                        disable all breakpoints before starting
    -M, --mavlink-gimbal
                        enable MAVLink gimbal
    -L LOCATION, --location=LOCATION
                        use start location from Tools/autotest/locations.txt
    -l CUSTOM_LOCATION, --custom-location=CUSTOM_LOCATION
                        set custom start location (lat,lon,alt,heading)
    -S SPEEDUP, --speedup=SPEEDUP
                        set simulation speedup (1 for wall clock time)
    -t TRACKER_LOCATION, --tracker-location=TRACKER_LOCATION
                        set antenna tracker start location
    -w, --wipe-eeprom   wipe EEPROM and reload parameters
    -m MAVPROXY_ARGS, --mavproxy-args=MAVPROXY_ARGS
                        additional arguments to pass to mavproxy.py
    --scrimmage-args=SCRIMMAGE_ARGS
                        arguments used to populate SCRIMMAGE mission (comma-
                        separated). Currently visual_model, motion_model, and
                        terrain are supported. Usage:
                        [instance=]argument=value...
    --strace            strace the ArduPilot binary
    --model=MODEL       Override simulation model to use
    --use-dir=USE_DIR   Store SITL state and output in named directory
    --no-mavproxy       Don't launch MAVProxy
    --fresh-params      Generate and use local parameter help XML
    --mcast             Use multicasting at default 239.255.145.50:14550
    --osd               Enable SITL OSD
    --osdmsp            Enable SITL OSD using MSP
    --tonealarm         Enable SITL ToneAlarm
    --rgbled            Enable SITL RGBLed
    --add-param-file=ADD_PARAM_FILE
                        Add a parameters file to use
    --no-extra-ports    Disable setup of UDP 14550 and 14551 output
    -Z SWARM, --swarm=SWARM
                        Specify path of swarminit.txt for shifting spawn
                        location
    --flash-storage     enable use of flash storage emulation
    --disable-ekf2      disable EKF2 in build
    --disable-ekf3      disable EKF3 in build
    --start-time=START_TIME
                        specify simulation start time in format YYYY-MM-DD-
                        HH:MM in your local time zone
    --sysid=SYSID       Set SYSID_THISMAV
    --postype-single    force single precision postype_t
    --ekf-double        use double precision in EKF
    --ekf-single        use single precision in EKF

  Compatibility MAVProxy options (consider using --mavproxy-args instead):
    --out=OUT           create an additional mavlink output
    --map               load map module on startup
    --console           load console module on startup
    --aircraft=AIRCRAFT
                        store state and logs in named directory
    --moddebug=MODDEBUG
                        mavproxy module debug
    --no-rcin           disable mavproxy rcin

  Completion helpers:
    --list-vehicle      List the vehicles
    --list-frame=LIST_FRAME
                        List the vehicle frames



Usage: mavproxy.py [options]

Options:
  -h, --help            show this help message and exit
  --master=DEVICE[,BAUD]
                        MAVLink master port and optional baud rate
  --force-connected     Use master even if initial connection fails
  --out=DEVICE[,BAUD]   MAVLink output port and optional baud rate
  --baudrate=BAUDRATE   default serial baud rate
  --sitl=SITL           SITL output port
  --streamrate=STREAMRATE
                        MAVLink stream rate
  --source-system=SOURCE_SYSTEM
                        MAVLink source system for this GCS
  --source-component=SOURCE_COMPONENT
                        MAVLink source component for this GCS
  --target-system=TARGET_SYSTEM
                        MAVLink target master system
  --target-component=TARGET_COMPONENT
                        MAVLink target master component
  --logfile=LOGFILE     MAVLink master logfile
  -a, --append-log      Append to log files
  --quadcopter          use quadcopter controls
  --setup               start in setup mode
  --nodtr               disable DTR drop on close
  --show-errors         show MAVLink error packets
  --speech              use text to speech
  --aircraft=AIRCRAFT   aircraft name
  --cmd=CMD             initial commands
  --console             use GUI console
  --map                 load map module
  --load-module=LOAD_MODULE
                        Load the specified module. Can be used multiple times,
                        or with a comma separated list
  --mav10               Use MAVLink protocol 1.0
  --mav20               Use MAVLink protocol 2.0
  --auto-protocol       Auto detect MAVLink protocol version
  --mavversion=MAVVERSION
                        Force MAVLink Version (1.0, 2.0). Otherwise autodetect
                        version
  --nowait              don't wait for HEARTBEAT on startup
  -c, --continue        continue logs
  --dialect=DIALECT     MAVLink dialect
  --rtscts              enable hardware RTS/CTS flow control
  --moddebug=MODDEBUG   module debug level
  --mission=MISSION     mission name
  --daemon              run in daemon mode, do not start interactive shell
  --non-interactive     do not start interactive shell
  --profile             run the Yappi python profiler
  --state-basedir=STATE_BASEDIR
                        base directory for logs and aircraft directories
  --version             version information
  --default-modules=DEFAULT_MODULES
                        default module list



SitlTest.
  ActionHoverAsync
  ActionHoverSyncDefault
  ActionHoverSyncHigher
  ActionHoverSyncLower
  ActionTakeoffAndKill
  ActionTransitionSync_standard_vtol
  ActionGoto
  ActionHold
  FollowMeOneLocation
  FollowMeMultiLocationWithConfig
  GeofenceInclusion
  Info
  MissionUploadCancellation
  MissionDownloadCancellation
  MissionChangeSpeed
  MissionAddWaypointsAndFly
  MissionWithRTLHigh
  MissionWithRTLLow
  MissionWithRTLHigherAnyway
  MissionRawMissionChanged
  MissionRawImportAndFly
  MissionSetCurrent
  OffboardAccelerationNED
  OffboardVelocityNED
  OffboardVelocityBody
  OffboardPositionNED
  ParamSad
  ParamHappy
  SystemConnectionAsync
  TelemetryAsync
  TelemetryHealth
  TelemetrySync
  MavlinkPassthrough
  MissionTransferLossy
HardwareTest.
  CalibrationGyro
  CalibrationAccelerometer
  CalibrationMagnetometer
  CalibrationLevelHorizon
  CalibrationGimbalAccelerometer
  CalibrationGyroWithTelemetry
  CalibrationGyroCancelled
  LogFiles
  LogFilesDownloadFailsIfPathIsDirectory
  LogFilesDownloadFailsIfFileAlreadyExists
CameraTest.
  CaptureInfo
  SetModeSync
  SetModeAsync
  ShowSettingsAndOptions
  SetSettings
  SubscribeCurrentSettings
  SubscribePossibleSettings
  Status
  TakePhotoSingle
  TakePhotosMultiple
  TakePhotoInterval
  Format
ConnectionTest.
  UdpListenOnDefaultPath
  UdpListenOnExplicitPath
SitlTestGimbal.
  GimbalMove
  GimbalAngles
  GimbalTakeoffAndMove
  GimbalROIOffboard
SitlTestDisabled.
  OffboardAttitudeRate
  TelemetryGpsOrigin
  TelemetryFlightModes
FtpTest.
  ListDirectory
  DownloadFile
  UploadFiles
  TestServer
SitlTestMultiple.
  SystemMultipleComponents
StatusTextTest.
  TestServer



[  FAILED  ] SitlTest.ActionHoverAsync
[  FAILED  ] SitlTest.ActionHoverSyncDefault
[  FAILED  ] SitlTest.ActionHoverSyncHigher
[  FAILED  ] SitlTest.ActionHoverSyncLower
[  FAILED  ] SitlTest.ActionTakeoffAndKill
[  FAILED  ] SitlTest.ActionTransitionSync_standard_vtol
[  FAILED  ] SitlTest.ActionGoto
[  FAILED  ] SitlTest.ActionHold
[  FAILED  ] SitlTest.FollowMeOneLocation
[  FAILED  ] SitlTest.FollowMeMultiLocationWithConfig
[  FAILED  ] SitlTest.Info
[  FAILED  ] SitlTest.MissionUploadCancellation
[  FAILED  ] SitlTest.MissionDownloadCancellation
[  FAILED  ] SitlTest.MissionChangeSpeed
[  FAILED  ] SitlTest.MissionAddWaypointsAndFly
[  FAILED  ] SitlTest.MissionWithRTLHigh
[  FAILED  ] SitlTest.MissionWithRTLLow
[  FAILED  ] SitlTest.MissionWithRTLHigherAnyway
[  FAILED  ] SitlTest.MissionRawMissionChanged
[  FAILED  ] SitlTest.MissionRawImportAndFly
[  FAILED  ] SitlTest.MissionSetCurrent
[  FAILED  ] SitlTest.OffboardAccelerationNED
[  FAILED  ] SitlTest.OffboardVelocityNED
[  FAILED  ] SitlTest.OffboardVelocityBody
[  FAILED  ] SitlTest.OffboardPositionNED
[  FAILED  ] SitlTest.ParamSad
[  FAILED  ] SitlTest.ParamHappy
[  FAILED  ] SitlTest.TelemetryAsync
[  FAILED  ] SitlTest.TelemetrySync
[  FAILED  ] SitlTest.MavlinkPassthrough
[  FAILED  ] SitlTest.MissionTransferLossy




ActionHoverAsync
  ActionHoverSyncDefault
  ActionHoverSyncHigher
  ActionHoverSyncLower
  ActionTakeoffAndKill
  ActionTransitionSync_standard_vtol
  ActionGoto
  ActionHold
  FollowMeOneLocation
  FollowMeMultiLocationWithConfig
  GeofenceInclusion
  Info
  MissionUploadCancellation
  MissionDownloadCancellation
  MissionChangeSpeed
  MissionAddWaypointsAndFly
  MissionWithRTLHigh
  MissionWithRTLLow
  MissionWithRTLHigherAnyway
  MissionRawMissionChanged
  MissionRawImportAndFly
  MissionSetCurrent
  OffboardAccelerationNED
  OffboardVelocityNED
  OffboardVelocityBody
  OffboardPositionNED
  ParamSad
  ParamHappy
  SystemConnectionAsync
  TelemetryAsync
  TelemetryHealth
  TelemetrySync
  MavlinkPassthrough
  MissionTransferLossy