#! /usr/bin/env python

# import ros stuff
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

    def compare_values(self, old, new):
        if new == 10:
            return old
        return new

    def get_minimum_distance(self,distances):
        minimum_distance = min(min(distances),self.max_distance_value)
        return compare_values(minimum_distance)

    def get_msg_parameters(self,msg):
        self.all_distances = msg.ranges
        distance_scan_size  = len(all_distances)
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
            initial_region_index = distances_initial_index[region]
            final_region_index = distances_final_index[region]

            region_distances = self.scan_regions_min_distance[initial_region_index:final_region_index]
            self.scan_regions_min_distance[region] = get_minimum_distance(region_distances)


        scan_regions_min_distance_size = len(self.scan_regions_min_distance)


        regions_msg_step = int(all_distances_size / scan_regions_min_distance_size)

        self.scan_regions_min_distance["right"] = update_region(
            all_distances[0:regions_msg_step])
        self.scan_regions_min_distance["front"] = update_region(
            all_distances[regions_msg_step+1:2*regions_msg_step])
        self.scan_regions_min_distance["left"] = update_region(
            all_distances[regions_msg_step + 1:2 * regions_msg_step])

class Robot_state_machine:
    def __init__(self):
        self.current_state = 0

pub_ = None
state_ = 0
state_dict_ = {
    0: 'find the wall',
    1: 'turn left',
    2: 'follow the wall',
}

def clbk_laser(msg):
    global regions_
    msg_ranges_size = len(msg.ranges)
    regions_msg_step = int(msg_ranges_size/3)

    regions_ = {
        'fright': compare_values(regions_['fright'],min(min(msg.ranges[0:regions_msg_step]), 10)),
        'front':  compare_values(regions_['front'],min(min(msg.ranges[regions_msg_step+1:2*regions_msg_step]), 10)),
        'fleft':  compare_values(regions_['fleft'],min(min(msg.ranges[2*regions_msg_step+1:3*regions_msg_step]), 10)),
    }
    print("Regions: {}".format(regions_))
    take_action()


def change_state(state):
    global state_, state_dict_
    if state is not state_:
        print 'Wall follower - [%s] - %s' % (state, state_dict_[state])
        state_ = state


def take_action():
    global regions_
    regions = regions_
    msg = Twist()
    linear_x = 0
    angular_z = 0

    state_description = ''

    d = 1.5

    if regions['front'] > d and regions['fleft'] > d and regions['fright'] > d:
        state_description = 'case 1 - nothing'
        change_state(0)
    elif regions['front'] < d and regions['fleft'] > d and regions['fright'] > d:
        state_description = 'case 2 - front'
        change_state(1)
    elif regions['front'] > d and regions['fleft'] > d and regions['fright'] < d:
        state_description = 'case 3 - fright'
        change_state(2)
    elif regions['front'] > d and regions['fleft'] < d and regions['fright'] > d:
        state_description = 'case 4 - fleft'
        change_state(0)
    elif regions['front'] < d and regions['fleft'] > d and regions['fright'] < d:
        state_description = 'case 5 - front and fright'
        change_state(1)
    elif regions['front'] < d and regions['fleft'] < d and regions['fright'] > d:
        state_description = 'case 6 - front and fleft'
        change_state(1)
    elif regions['front'] < d and regions['fleft'] < d and regions['fright'] < d:
        state_description = 'case 7 - front and fleft and fright'
        change_state(1)
    elif regions['front'] > d and regions['fleft'] < d and regions['fright'] < d:
        state_description = 'case 8 - fleft and fright'
        change_state(0)
    else:
        state_description = 'unknown case'
        rospy.loginfo(regions)


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
    global regions_

    msg = Twist()
    msg.linear.x = 0.5
    return msg


def main():
    max_distance = 10
    robot_regions = Robot_regions(max_distance)
    global pub_

    rospy.init_node('reading_laser')

    pub_ = rospy.Publisher('/cmd_vel', Twist, queue_size=1)

    sub = rospy.Subscriber('/kinect2/scan', LaserScan, clbk_laser)

    rate = rospy.Rate(20)
    while not rospy.is_shutdown():
        msg = Twist()
        if state_ == 0:
            msg = find_wall()
        elif state_ == 1:
            msg = turn_left()
        elif state_ == 2:
            msg = follow_the_wall()
            pass
        else:
            rospy.logerr('Unknown state!')

        pub_.publish(msg)

        rate.sleep()


if __name__ == '__main__':
    main()