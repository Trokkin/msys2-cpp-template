cmake_minimum_required(VERSION 3.13)

#
# This file configures a core application library project
#

project(corelib)

file(GLOB SOURCE_LIB ${PROJECT_SOURCE_DIR}/*.cpp)

add_library(${PROJECT_NAME} SHARED ${SOURCE_LIB})

find_package(Filesystem REQUIRED)
find_package(Threads REQUIRED)
find_package(OpenGL REQUIRED)
# find_package(GLEW REQUIRED)
# find_package(GLUT REQUIRED)
find_package(X11 REQUIRED)
find_package(PNG REQUIRED)

target_compile_options(${PROJECT_NAME} PUBLIC ${COMPILE_OPTS})
target_link_options(${PROJECT_NAME} PUBLIC ${LINK_OPTS})
target_link_libraries(${PROJECT_NAME}
    stdc++fs
    Threads::Threads
    ${OPENGL_LIBRARIES}
    ${X11_LIBRARIES}
    ${PNG_LIBRARIES}
    ${LUA_LIBRARIES}
    shlwapi
    gdiplus
    dwmapi
    # ${CMAKE_THREAD_LIBS_INIT}
)
