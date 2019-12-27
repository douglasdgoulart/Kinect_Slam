FROM osrf/ros:kinetic-desktop-full-xenial

# install ros packages
RUN apt-get update && apt-get install -y

#Create Catkin Workspace directory
RUN mkdir -p ~/catkin_ws/src && cd ~/catkin_ws/

#Run catkin_make
RUN /bin/bash -c ". /opt/ros/kinetic/setup.bash; cd ~/catkin_ws/; catkin_make" 

#LIBFREENECT2 TUTORIAL
#Clone the Libfreenect2 repository
RUN git clone https://github.com/OpenKinect/libfreenect2.git

#Install build tools
RUN apt-get install -y build-essential cmake pkg-config

#Install libusb
RUN apt-get install -y libusb-1.0-0-dev

#Install TuboJPEG
RUN apt-get install libturbojpeg libjpeg-turbo8-dev -y

#Install OpenGL
RUN apt-get install -y libglfw3-dev

#Build
RUN cd libfreenect2 && \
mkdir build && cd build && \
cmake .. -DCMAKE_INSTALL_PREFIX=$HOME/freenect2 && \
make && \
make install

#IAI_KINECT2
#Clone and build the package
RUN cd ~/catkin_ws/src/ && \
git clone https://github.com/code-iai/iai_kinect2.git && \
cd iai_kinect2 && \
rosdep install -r -y --from-paths . && \
/bin/bash -c ". /opt/ros/kinetic/setup.bash; cd ~/catkin_ws/; catkin_make -DCMAKE_BUILD_TYPE=\"Release\""

#Sources the catkins packages
RUN /bin/bash -c "source ~/catkin_ws/devel/setup.bash"

#GAZEBO INSTALL
#Install Pre-Built Debian
RUN apt-get install -y ros-kinetic-gazebo-ros-pkgs ros-kinetic-gazebo-ros-control

#Sources the packages
RUN echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

#Kinetic is using the gazebo 7.x series, start by installing it
RUN apt-get install -y libgazebo7-dev

#Download the source code from the gazebo_ros_pkgs github repository
RUN cd ~/catkin_ws/src && \
git clone https://github.com/ros-simulation/gazebo_ros_pkgs.git -b kinetic-devel

#Automatically install the missing dependencies using rosdep via debian install
RUN cd ~/catkin_ws/src && \
    apt-get update && \
    rm /etc/ros/rosdep/sources.list.d/20-default.list && \
    rosdep init && \
    rosdep update --include-eol-distros && \
    rosdep install --from-paths . --ignore-src --rosdistro kinetic -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

#Build the gazebo_ros_pkgs
RUN cd ~/catkin_ws/ && \
/bin/bash -c ". /opt/ros/kinetic/setup.bash; cd ~/catkin_ws/; catkin_make"

RUN /bin/bash -c "source /opt/ros/kinetic/setup.bash" && \
    echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc

#Vim install
RUN apt-get update -y && \
    apt-get install apt-file -y && \
    apt-file update -y && \
    apt-get install vim -y

#Install some packages
RUN apt-get update -y && \
    apt-get install ros-kinetic-openni-launch -y && \
    apt-get install ros-kinetic-teleop-twist-keyboard -y && \
    apt-get install ros-kinetic-pointcloud-to-laserscan -y && \
    apt-get install ros-kinetic-slam-gmapping -y

#Get local catkin packages
COPY files/ /root/
    
