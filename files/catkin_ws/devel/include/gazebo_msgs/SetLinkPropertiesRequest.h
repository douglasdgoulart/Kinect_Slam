// Generated by gencpp from file gazebo_msgs/SetLinkPropertiesRequest.msg
// DO NOT EDIT!


#ifndef GAZEBO_MSGS_MESSAGE_SETLINKPROPERTIESREQUEST_H
#define GAZEBO_MSGS_MESSAGE_SETLINKPROPERTIESREQUEST_H


#include <string>
#include <vector>
#include <map>

#include <ros/types.h>
#include <ros/serialization.h>
#include <ros/builtin_message_traits.h>
#include <ros/message_operations.h>

#include <geometry_msgs/Pose.h>

namespace gazebo_msgs
{
template <class ContainerAllocator>
struct SetLinkPropertiesRequest_
{
  typedef SetLinkPropertiesRequest_<ContainerAllocator> Type;

  SetLinkPropertiesRequest_()
    : link_name()
    , com()
    , gravity_mode(false)
    , mass(0.0)
    , ixx(0.0)
    , ixy(0.0)
    , ixz(0.0)
    , iyy(0.0)
    , iyz(0.0)
    , izz(0.0)  {
    }
  SetLinkPropertiesRequest_(const ContainerAllocator& _alloc)
    : link_name(_alloc)
    , com(_alloc)
    , gravity_mode(false)
    , mass(0.0)
    , ixx(0.0)
    , ixy(0.0)
    , ixz(0.0)
    , iyy(0.0)
    , iyz(0.0)
    , izz(0.0)  {
  (void)_alloc;
    }



   typedef std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other >  _link_name_type;
  _link_name_type link_name;

   typedef  ::geometry_msgs::Pose_<ContainerAllocator>  _com_type;
  _com_type com;

   typedef uint8_t _gravity_mode_type;
  _gravity_mode_type gravity_mode;

   typedef double _mass_type;
  _mass_type mass;

   typedef double _ixx_type;
  _ixx_type ixx;

   typedef double _ixy_type;
  _ixy_type ixy;

   typedef double _ixz_type;
  _ixz_type ixz;

   typedef double _iyy_type;
  _iyy_type iyy;

   typedef double _iyz_type;
  _iyz_type iyz;

   typedef double _izz_type;
  _izz_type izz;





  typedef boost::shared_ptr< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> > Ptr;
  typedef boost::shared_ptr< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> const> ConstPtr;

}; // struct SetLinkPropertiesRequest_

typedef ::gazebo_msgs::SetLinkPropertiesRequest_<std::allocator<void> > SetLinkPropertiesRequest;

typedef boost::shared_ptr< ::gazebo_msgs::SetLinkPropertiesRequest > SetLinkPropertiesRequestPtr;
typedef boost::shared_ptr< ::gazebo_msgs::SetLinkPropertiesRequest const> SetLinkPropertiesRequestConstPtr;

// constants requiring out of line definition



template<typename ContainerAllocator>
std::ostream& operator<<(std::ostream& s, const ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> & v)
{
ros::message_operations::Printer< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >::stream(s, "", v);
return s;
}

} // namespace gazebo_msgs

namespace ros
{
namespace message_traits
{



// BOOLTRAITS {'IsFixedSize': False, 'IsMessage': True, 'HasHeader': False}
// {'sensor_msgs': ['/opt/ros/kinetic/share/sensor_msgs/cmake/../msg'], 'std_msgs': ['/opt/ros/kinetic/share/std_msgs/cmake/../msg'], 'trajectory_msgs': ['/opt/ros/kinetic/share/trajectory_msgs/cmake/../msg'], 'gazebo_msgs': ['/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg'], 'geometry_msgs': ['/opt/ros/kinetic/share/geometry_msgs/cmake/../msg']}

// !!!!!!!!!!! ['__class__', '__delattr__', '__dict__', '__doc__', '__eq__', '__format__', '__getattribute__', '__hash__', '__init__', '__module__', '__ne__', '__new__', '__reduce__', '__reduce_ex__', '__repr__', '__setattr__', '__sizeof__', '__str__', '__subclasshook__', '__weakref__', '_parsed_fields', 'constants', 'fields', 'full_name', 'has_header', 'header_present', 'names', 'package', 'parsed_fields', 'short_name', 'text', 'types']




template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct IsFixedSize< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> const>
  : FalseType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
  : TrueType
  { };

template <class ContainerAllocator>
struct IsMessage< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> const>
  : TrueType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
  : FalseType
  { };

template <class ContainerAllocator>
struct HasHeader< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> const>
  : FalseType
  { };


template<class ContainerAllocator>
struct MD5Sum< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "68ac74a4be01b165bc305b5ccdc45e91";
  }

  static const char* value(const ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator>&) { return value(); }
  static const uint64_t static_value1 = 0x68ac74a4be01b165ULL;
  static const uint64_t static_value2 = 0xbc305b5ccdc45e91ULL;
};

template<class ContainerAllocator>
struct DataType< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "gazebo_msgs/SetLinkPropertiesRequest";
  }

  static const char* value(const ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator>&) { return value(); }
};

template<class ContainerAllocator>
struct Definition< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
{
  static const char* value()
  {
    return "string link_name\n\
\n\
geometry_msgs/Pose com\n\
\n\
\n\
bool gravity_mode\n\
float64 mass\n\
float64 ixx\n\
float64 ixy\n\
float64 ixz\n\
float64 iyy\n\
float64 iyz\n\
float64 izz\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Pose\n\
# A representation of pose in free space, composed of position and orientation. \n\
Point position\n\
Quaternion orientation\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Point\n\
# This contains the position of a point in free space\n\
float64 x\n\
float64 y\n\
float64 z\n\
\n\
================================================================================\n\
MSG: geometry_msgs/Quaternion\n\
# This represents an orientation in free space in quaternion form.\n\
\n\
float64 x\n\
float64 y\n\
float64 z\n\
float64 w\n\
";
  }

  static const char* value(const ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator>&) { return value(); }
};

} // namespace message_traits
} // namespace ros

namespace ros
{
namespace serialization
{

  template<class ContainerAllocator> struct Serializer< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
  {
    template<typename Stream, typename T> inline static void allInOne(Stream& stream, T m)
    {
      stream.next(m.link_name);
      stream.next(m.com);
      stream.next(m.gravity_mode);
      stream.next(m.mass);
      stream.next(m.ixx);
      stream.next(m.ixy);
      stream.next(m.ixz);
      stream.next(m.iyy);
      stream.next(m.iyz);
      stream.next(m.izz);
    }

    ROS_DECLARE_ALLINONE_SERIALIZER
  }; // struct SetLinkPropertiesRequest_

} // namespace serialization
} // namespace ros

namespace ros
{
namespace message_operations
{

template<class ContainerAllocator>
struct Printer< ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator> >
{
  template<typename Stream> static void stream(Stream& s, const std::string& indent, const ::gazebo_msgs::SetLinkPropertiesRequest_<ContainerAllocator>& v)
  {
    s << indent << "link_name: ";
    Printer<std::basic_string<char, std::char_traits<char>, typename ContainerAllocator::template rebind<char>::other > >::stream(s, indent + "  ", v.link_name);
    s << indent << "com: ";
    s << std::endl;
    Printer< ::geometry_msgs::Pose_<ContainerAllocator> >::stream(s, indent + "  ", v.com);
    s << indent << "gravity_mode: ";
    Printer<uint8_t>::stream(s, indent + "  ", v.gravity_mode);
    s << indent << "mass: ";
    Printer<double>::stream(s, indent + "  ", v.mass);
    s << indent << "ixx: ";
    Printer<double>::stream(s, indent + "  ", v.ixx);
    s << indent << "ixy: ";
    Printer<double>::stream(s, indent + "  ", v.ixy);
    s << indent << "ixz: ";
    Printer<double>::stream(s, indent + "  ", v.ixz);
    s << indent << "iyy: ";
    Printer<double>::stream(s, indent + "  ", v.iyy);
    s << indent << "iyz: ";
    Printer<double>::stream(s, indent + "  ", v.iyz);
    s << indent << "izz: ";
    Printer<double>::stream(s, indent + "  ", v.izz);
  }
};

} // namespace message_operations
} // namespace ros

#endif // GAZEBO_MSGS_MESSAGE_SETLINKPROPERTIESREQUEST_H
