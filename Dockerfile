# FROM arm32v7/ros:kinetic-robot-xenial
FROM arm32v7/ros:kinetic-robot
COPY ./qemu/bin/ /usr/bin/
RUN chmod +x /usr/bin/cross-build-start
RUN chmod +x /usr/bin/cross-build-end
RUN chmod +x /usr/bin/qemu*
RUN chmod +x /usr/bin/sh*

RUN ls -la /usr/bin/cross*

# RUN [ "cross-build-start" ]
ENV INITSYSTEM off
ENV QEMU_EXECVE 1
ENV TERM "xterm"
ENV LANG C.UTF-8
ENV LL_ALL C.UTF-8
ENV ROS_DISTRO kinetic

RUN apt update &&  apt-get install ros-kinetic-rqt-tf-tree python-tf-conversions -y

RUN mkdir /home/edgecar_msgs
COPY . /home/edgecar_msgs
ENV ROS_LANG_DISABLE=gennodejs:geneus:genlisp

RUN /bin/bash -c "cd /home/edgecar_msgs/ && source /opt/ros/kinetic/setup.bash && catkin_make -j -C catkin_ws/"
# RUN echo "source /home/edgecar_msgs/docker_setup.sh" >> ~/.bashrc

# RUN bash -c "source /home/edgecar_msgs/docker_setup.sh"

RUN ls -la /usr/bin/

ENV ROS_MASTER_URI=http://master:11311


# RUN [ "cross-build-end" ]

WORKDIR /home/edgecar_msgs