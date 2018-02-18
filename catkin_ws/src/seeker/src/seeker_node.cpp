/*
 * Author: Sam Paxton
 * 2/18/2018
 *
 * Directs a turtlebot to seek and drive into a ball in simulation.
 */

#include <ros/ros.h>
#include <sensor_msgs/LaserScan.h>
#include <geometry_msgs/Vector3.h>
#include <geometry_msgs/Twist.h>
#include "seeker/enable.h"

class RobotDriver {
private:
  ros::NodeHandle seeker_node_handle;
  ros::Publisher displacement_pub;
  ros::Publisher velocity_pub;
  bool go, found;
  
public:
  
  RobotDriver(ros::NodeHandle &nh) {
    seeker_node_handle = nh;
    displacement_pub = seeker_node_handle.advertise<geometry_msgs::Vector3>("displacement", 100);
    velocity_pub = seeker_node_handle.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/teleop", 100);
    go = false;
    found = false;
  }
  
  bool processEnableCall(seeker::enable::Request &req, seeker::enable::Response &res) {
    if (req.data) {
      go = true;
      res.message = "Enabling seeking.";
    }
    else {
      go = false;
      res.message = "Disabling seeking.";
    }
    res.success = true;
  }
  
  //when enabled, the turtlebot spins until the ball is directly in front of it and then moves forward.
  void processLaserScan(const sensor_msgs::LaserScan::ConstPtr& scan) {
    if (go) {
      geometry_msgs::Twist base_cmd;
      geometry_msgs::Vector3 displacement;

      const float center_entry = scan->ranges[scan->ranges.size() / 2];
      
      //turn until object is directly in front of us, then move forward.
      if (found) {
        base_cmd.linear.x = .25;
      }
      else if (center_entry > 0) {
        found = true;
      }
      else {
        base_cmd.angular.z = .25;
      }

      //the center entry of ranges[] is directly along the x axis, so the displacement along x is 
      displacement.x = center_entry;
      displacement_pub.publish(displacement);
      velocity_pub.publish(base_cmd);
    }
  }
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "seeker_node");
  ros::NodeHandle seeker_node_handle;
  
  RobotDriver driver(seeker_node_handle);
  
  ros::Subscriber scan_sub = seeker_node_handle.subscribe<sensor_msgs::LaserScan>("/scan", 100, &RobotDriver::processLaserScan, &driver);
  ros::ServiceServer enable_server = seeker_node_handle.advertiseService("enable", &RobotDriver::processEnableCall, &driver);
 
  ros::spin();
}
