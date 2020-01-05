import rospy
from sensor_msgs.msg import LaserScan
from geometry_msgs.msg import Twist
from nav_msgs.msg import Odometry
from tf import transformations

import math

class Robot_regions:
    def __init__(self,max_distance_value = 10):
        self.scan_regions_min_distance = {'right': 10,'front': 10,'left': 10}
        self.all_distances = []
        self.distances_initial_index = {'right': 0,'front': 0,'left': 0}
        self.distances_final_index = {'right': 0, 'front': 0, 'left': 0}
        self.max_distance_value = 10

    def check_last_distance(self,new,old):
        if new == 10:
            return old
        return new

    def get_minimum_distance(self,distances,last_distance):
        minimum_distance = min(min(distances),self.max_distance_value)
        return self.check_last_distance(minimum_distance,last_distance)

    def get_msg_parameters(self,msg):
        self.all_distances = msg.ranges
        distance_scan_size  = len(self.all_distances)
        self.distances_initial_index = {
            'right': 0,
            'front': int(distance_scan_size/3+1),
            'left':  int(2*distance_scan_size/3+1)}
        self.distances_final_index = {
            'right': int(distance_scan_size/3),
            'front': int(2*distance_scan_size/3),
            'left':  int(3*distance_scan_size/3)}

    def update_regions(self):
        for region in self.scan_regions_min_distance:
            initial_region_index = int(self.distances_initial_index[region])
            final_region_index = int(self.distances_final_index[region])

            region_distances = self.all_distances[initial_region_index:final_region_index]
            self.scan_regions_min_distance[region] = self.get_minimum_distance(region_distances, self.scan_regions_min_distance[region])