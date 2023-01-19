cmake_minimum_required(VERSION 3.13)

#
# This file configures build targets -- headers, libraries and executables
#

project(source)

# Headers inlcude directories
set(COMMON_INCLUDES ${PROJECT_SOURCE_DIR}/include)
include_directories(${COMMON_INCLUDES})

# Core application library
add_subdirectory(lib)

# Core testing library
add_subdirectory(tests)

# Executables
add_subdirectory(app/testProj)
add_subdirectory(app/proj2)
# add_subdirectory(app/myP2PServer)
# add_subdirectory(app/myP2PClient)
