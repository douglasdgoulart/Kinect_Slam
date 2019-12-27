# Slam Lidar Kinect

This project were develep to implement the mapping and navigation algorith SLAM into an generic robot.

To help run dependencies and packages a docker has been created.

This project were develop to run into Ubunto OS.

## Docker
### Install
To install the docker into your machine follow this [link](https://runnable.com/docker/install-docker-on-linux).

PS: Don't forget to run Docker Intall tutorial "The Docker Group" section.

### Build
To build the docker run:

```
make docker-build
```

## Ros Docker Run

### Roscore
To run a roscore terminal run:
```
make docker-roscore-run
```

### RViz
To run a RViz terminal run:
```
make docker-rviz-run
```

### Gazebo
To run a Gazebo terminal run:
```
make docker-gazebo-run
```

### Keaboard Diferential Robot Controll
To run a Keaboard Diferential Robot Controll terminal run:
```
make docker-keyboard-run
```


### Ros Environment
The environment is destined to run anything at the ros docker enviroment.

To run a environment terminal run:
```
make docker-ros-env
```



