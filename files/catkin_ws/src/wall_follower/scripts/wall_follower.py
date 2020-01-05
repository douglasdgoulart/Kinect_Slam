#! /usr/bin/env python

# import ros stuff
import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf import transformations

import math

from robot_state_machine import Robot_state_machine    

def find_wall():
    msg = Twist()
    msg.linear.x = 0.2
    msg.angular.z = -0.3
    return msg

def turn_left():
    msg = Twist()
    msg.angular.z = 0.3
    return msg

def follow_the_wall():   
    msg = Twist()
    msg.linear.x = 0.5
    return msg

def odometryCb(msg):
    print(msg)

def main():
    max_distance = 10
    robot_state_machine = Robot_state_machine()

    rospy.init_node('wall_follower')
    robot_speed = rospy.Publisher('/cmd_vel', Twist, queue_size=1)
    laser_scan = rospy.Subscriber('/kinect2/scan', LaserScan, robot_state_machine.change_state)
    odometry = rospy.Subscriber('odom',Odometry,odometryCb)

    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        msg = Twist()
        states_actions = {0b000:find_wall(),
                          0b001:find_wall(),
                          0b010:turn_left(),
                          0b011:turn_left(),
                          0b100:follow_the_wall(),
                          0b101:find_wall(),
                          0b110:turn_left(),
                          0b111:turn_left()}

        msg = states_actions[robot_state_machine.current_state]
        robot_speed.publish(msg)
        rate.sleep()


if __name__ == '__main__':
    main()