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
public:
  
  RobotDriver(ros::NodeHandle &nh) : 
    m_turn_speed(.25), 
    m_move_speed(.25), 
    m_should_seek(false), 
    m_found(false),
    m_seeker_node_handle(nh),
    m_displacement_pub(m_seeker_node_handle.advertise<geometry_msgs::Vector3>("displacement", 100)),
    m_velocity_pub(m_seeker_node_handle.advertise<geometry_msgs::Twist>("/cmd_vel_mux/input/teleop", 100)) {
  
  }
  
  bool processEnableCall(seeker::enable::Request &req, seeker::enable::Response &res) {
    if (req.data) {
      m_should_seek = true;
      res.message = "Enabling seeking.";
    }
    else {
      m_should_seek = false;
      m_found = false; //in case ball is moved while disabled, make the turtlebot re-find the ball.
      res.message = "Disabling seeking.";
    }
    res.success = true;
  }
  
  //when enabled, the turtlebot spins until the ball is directly in front of it and then moves forward.
  void processLaserScan(const sensor_msgs::LaserScan::ConstPtr& scan) {
    if (m_should_seek) {
      geometry_msgs::Twist base_cmd;
      geometry_msgs::Vector3 displacement;

      //the middle entry corresponds to what is directly in front of the turtlebot.
      const float center_entry = scan->ranges[scan->ranges.size() / 2];
      
      //turn until object is directly in front of us, then move forward.
      if (m_found) {
        base_cmd.linear.x = m_move_speed;
      }
      else if (center_entry > 0) {
        m_found = true;
      }
      else {
        base_cmd.angular.z = m_turn_speed;
      }

      //the center entry of ranges[] is directly along the x axis, i.e. it is the displacement along x  
      displacement.x = center_entry;
      
      m_displacement_pub.publish(displacement);
      m_velocity_pub.publish(base_cmd);
    }
  }
  
private:
  ros::NodeHandle m_seeker_node_handle;
  ros::Publisher m_displacement_pub, m_velocity_pub;
  bool m_should_seek, m_found;
  const float m_turn_speed, m_move_speed;
  
};

int main(int argc, char **argv) {
  ros::init(argc, argv, "seeker_node");
  ros::NodeHandle seeker_node_handle;
  
  RobotDriver driver(seeker_node_handle);
  
  ros::Subscriber scan_sub = seeker_node_handle.subscribe<sensor_msgs::LaserScan>("/scan", 100, &RobotDriver::processLaserScan, &driver);
  ros::ServiceServer enable_server = seeker_node_handle.advertiseService("enable", &RobotDriver::processEnableCall, &driver);
 
  ros::spin();
}
