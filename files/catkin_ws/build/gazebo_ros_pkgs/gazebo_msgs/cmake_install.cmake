# Install script for directory: /root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/root/catkin_ws/install")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Release")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Install shared libraries without execute permission?
if(NOT DEFINED CMAKE_INSTALL_SO_NO_EXE)
  set(CMAKE_INSTALL_SO_NO_EXE "1")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs/msg" TYPE FILE FILES
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ContactsState.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ContactState.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/LinkState.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/LinkStates.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ModelState.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ModelStates.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ODEJointProperties.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/ODEPhysics.msg"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/msg/WorldState.msg"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs/srv" TYPE FILE FILES
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/ApplyBodyWrench.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/DeleteModel.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/DeleteLight.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetLinkState.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetPhysicsProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetJointProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetModelConfiguration.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SpawnModel.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/ApplyJointEffort.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetJointProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetModelProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetWorldProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetLinkProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetModelState.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/BodyRequest.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetLinkProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetModelState.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/JointRequest.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetLinkState.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetPhysicsProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetJointTrajectory.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/GetLightProperties.srv"
    "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/srv/SetLightProperties.srv"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs/cmake" TYPE FILE FILES "/root/catkin_ws/build/gazebo_ros_pkgs/gazebo_msgs/catkin_generated/installspace/gazebo_msgs-msg-paths.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/include" TYPE DIRECTORY FILES "/root/catkin_ws/devel/include/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/roseus/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/roseus/ros/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/common-lisp/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/common-lisp/ros/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gennodejs/ros" TYPE DIRECTORY FILES "/root/catkin_ws/devel/share/gennodejs/ros/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  execute_process(COMMAND "/usr/bin/python" -m compileall "/root/catkin_ws/devel/lib/python2.7/dist-packages/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/python2.7/dist-packages" TYPE DIRECTORY FILES "/root/catkin_ws/devel/lib/python2.7/dist-packages/gazebo_msgs")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/lib/pkgconfig" TYPE FILE FILES "/root/catkin_ws/build/gazebo_ros_pkgs/gazebo_msgs/catkin_generated/installspace/gazebo_msgs.pc")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs/cmake" TYPE FILE FILES "/root/catkin_ws/build/gazebo_ros_pkgs/gazebo_msgs/catkin_generated/installspace/gazebo_msgs-msg-extras.cmake")
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs/cmake" TYPE FILE FILES
    "/root/catkin_ws/build/gazebo_ros_pkgs/gazebo_msgs/catkin_generated/installspace/gazebo_msgsConfig.cmake"
    "/root/catkin_ws/build/gazebo_ros_pkgs/gazebo_msgs/catkin_generated/installspace/gazebo_msgsConfig-version.cmake"
    )
endif()

if(NOT CMAKE_INSTALL_COMPONENT OR "${CMAKE_INSTALL_COMPONENT}" STREQUAL "Unspecified")
  file(INSTALL DESTINATION "${CMAKE_INSTALL_PREFIX}/share/gazebo_msgs" TYPE FILE FILES "/root/catkin_ws/src/gazebo_ros_pkgs/gazebo_msgs/package.xml")
endif()

