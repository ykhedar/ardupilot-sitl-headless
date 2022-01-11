FROM ubuntu:20.04 AS builder

ENV DEBIAN_FRONTEND=noninteractive

ARG ROVER_VERSION=Rover-4.1.2

RUN apt-get update && apt-get install -y -q git lsb-release tzdata

RUN git clone https://github.com/ArduPilot/ardupilot.git ardupilot && \
    cd ardupilot && git checkout ${ROVER_VERSION} && git submodule update --init --recursive

RUN cd ardupilot && sed -i 's/sudo //' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i '6,9d' Tools/environment_install/install-prereqs-ubuntu.sh && \
    sed -i '/usermod -a -G dialout/d' Tools/environment_install/install-prereqs-ubuntu.sh && \
    bash Tools/environment_install/install-prereqs-ubuntu.sh -y

WORKDIR /ardupilot/

RUN ./waf distclean && ./waf configure --board sitl && ./waf rover 

FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y -q python-is-python3 libpython3-stdlib libxml2-dev libxslt-dev python3-pip

RUN python -m pip install --upgrade pymavlink

COPY --from=builder /ardupilot/Tools /ardupilot/Tools
COPY --from=builder /ardupilot/Rover /ardupilot/Rover
COPY --from=builder /ardupilot/build /ardupilot/build

EXPOSE 5760/tcp

WORKDIR /ardupilot/

ENTRYPOINT /ardupilot/Tools/autotest/sim_vehicle.py --vehicle ${VEHICLE} -I${INSTANCE} --custom-location=${LAT},${LON},${ALT},${DIR} -w --frame ${MODEL} --no-rebuild --no-mavproxy --speedup ${SPEEDUP}
