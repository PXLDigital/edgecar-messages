#!/bin/bash

set -e -x

source /home/aidrivingmodule/docker_setup.sh

source /home/aidrivingmodule/catkin_ws/devel/setup.bash

roslaunch driving_module driving_module.launch veh:=$VEHICLE_NAME