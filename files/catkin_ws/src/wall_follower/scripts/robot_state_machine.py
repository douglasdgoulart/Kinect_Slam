import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf import transformations

import math

from robot_regions import Robot_regions

class Robot_state_machine:

    def __init__(self):
        self.current_state = 0
        self.changing_distance = 1.5
        self.robot_regions = Robot_regions()
        self.is_region_close = {'right': False,'front': False,'left': False}

    def update_state(self,msg):
         self.robot_regions.get_msg_parameters(msg)
         self.robot_regions.update_regions()

    def update_region_close(self):
        self.is_region_close["right"] = True if self.robot_regions.scan_regions_min_distance['right'] < self.changing_distance else False
        self.is_region_close["front"] = True if self.robot_regions.scan_regions_min_distance['front'] < self.changing_distance else False
        self.is_region_close["left"] = True if self.robot_regions.scan_regions_min_distance['left'] < self.changing_distance else False

    def change_state(self,msg):
        self.update_state(msg)
        self.update_region_close()

        right_bit = 1 if self.is_region_close['right'] else 0
        front_bit = 1 if self.is_region_close['front'] else 0
        left_bit = 1 if self.is_region_close['left'] else 0
        
        self.current_state = 4*right_bit + 2*front_bit + left_bit
        print(self.robot_regions.scan_regions_min_distance)
        print("[{}] Current state: {}".format(rospy.get_rostime(),self.current_state))
