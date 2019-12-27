docker kill $(docker ps -q)

xterm -title "Roscore" -e "make docker-roscore-run" &
xterm -title "Gazebo" -e "make docker-gazebo-run > gazebo.out" &
sleep 1

while [ "$(grep 'Physics dynamic reconfigure ready.' gazebo.out)" = "" ];
do
    sleep 1
done

rm gazebo.out
xterm -title "Spawn Robot" -e "make docker-spawn-one-kinect" &
xterm -title "Point Cloud to Laser" -e "make docker-ros-env DOCKER_COMMAND:=\"roslaunch --wait one_kinect_robot pc2laser.launch\""&
xterm -title "Gmmaping" -e "make docker-ros-env DOCKER_COMMAND:=\"roslaunch --wait one_kinect_robot gmmaping.launch\""&
xterm -title "Keyboard Controller" -e "make docker-keyboard-run"&