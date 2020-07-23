cmake_minimum_required(VERSION 2.8.3)
project(edgecar_msgs)


find_package(catkin REQUIRED
    rospy
    message_generation
    std_msgs
    geometry_msgs
    visualization_msgs
    sensor_msgs
#    tf_conversions
    tf)

add_message_files(
    FILES
    BoolStamped.msg
    WheelsCmdStamped.msg
    UpdateAi.msg
)

## Generate services in the 'srv' folder
# add_service_files(
#   FILES
#   Service1.srv
#   Service2.srv
# )

generate_messages(
  DEPENDENCIES
  std_msgs  # Or other packages containing msgs
  geometry_msgs
  sensor_msgs
)

catkin_package(
#  INCLUDE_DIRS include
#  LIBRARIES edgecar_msgs
#  CATKIN_DEPENDS other_catkin_pkg
#  DEPENDS system_lib
    CATKIN_DEPENDS
    geometry_msgs
    rospy
    sensor_msgs
    std_msgs
    message_runtime
    visualization_msgs
)

include_directories(
  ${catkin_INCLUDE_DIRS}
)
