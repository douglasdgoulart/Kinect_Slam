DOCKER-PARAMS := -e "DISPLAY=unix:0.0" -v="/tmp/.X11-unix:/tmp/.X11-unix:rw" --privileged \
               -e QT_X11_NO_MITSHM=1 \
               -e SVGA_VGPU10=0 \
               --net foo

ROS_MATER_HTTP := --env ROS_MASTER_URI=http://master:11311/

DOCKER_TAG := ros:kinect

DOCKER_NAME = "default"

RANDOM := $(shell bash -c 'echo $$RANDOM')

DOCKER_COMMAND:= ""

ALL_DOCKERS := $(shell bash -c 'echo $$(docker ps -q)')

docker-build:
	docker network create foo || echo "Network already exists"
	docker build --file Dockerfile --tag $(DOCKER_TAG) .

docker-roscore-run:
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name master \
               --env ROST_NAME=master \
               $(DOCKER_TAG) \
               roscore

docker-rviz-run:
	xhost +local:docker
	docker run --rm \
               $(DOCKER-PARAMS) \
               --name rviz \
               --env ROS_HOSTNAME=rviz \
               $(ROS_MATER_HTTP)\
               $(DOCKER_TAG) \
               rosrun rviz rviz

docker-spawn-one-kinect:
	xhost +local:docker
	docker run --rm \
               $(DOCKER-PARAMS) \
               --name spawn \
               --env ROS_HOSTNAME=spawn \
               $(ROS_MATER_HTTP)\
               $(DOCKER_TAG) \
               xterm -e "source /root/catkin_ws/devel/setup.bash && roslaunch one_kinect_robot spawn.launch"

docker-ros-env-comm:
	xhost +local:docker
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name env_$(RANDOM) \
               --env ROS_HOSTNAME=env_$(RANDOM) \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG) \
               xterm -e "source /root/catkin_ws/devel/setup.bash && $(DOCKER_COMMAND)"

docker-ros-env:
	xhost +local:docker
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name env_$(RANDOM) \
               --env ROS_HOSTNAME=env_$(RANDOM) \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG)

docker-gazebo-run:
	xhost +local:docker & \
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name gazebo_dock \
               --env ROS_HOSTNAME=gazebo_dock \
               --cpus=0.5 \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG) \
               roslaunch --wait gazebo_ros willowgarage_world.launch pause:=false

docker-keyboard-run:
	xhost +local:docker & \
	docker run -it --rm \
               $(DOCKER-PARAMS) \
               --name keyboard \
               --env ROS_HOSTNAME=keyboard \
               $(ROS_MATER_HTTP) \
               $(DOCKER_TAG) \
               rosrun teleop_twist_keyboard teleop_twist_keyboard.py

docker-kill-all:
	docker kill $(ALL_DOCKERS)
 