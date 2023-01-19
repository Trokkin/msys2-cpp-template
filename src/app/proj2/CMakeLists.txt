project(proj2)

#
# This file configures a sample application
#

set(EXECUTABLE ${PROJECT_NAME}.cpp)

add_custom_target(run_${PROJECT_NAME}
    COMMAND ${PROJECT_NAME}
    WORKING_DIRECTORY ${CMAKE_RUNTIME_OUTPUT_DIRECTORY}
)

add_executable(${PROJECT_NAME} ${PROJECT_SOURCE_DIR}/${EXECUTABLE})

target_compile_options(${PROJECT_NAME} PUBLIC ${COMPILE_OPTS})
target_link_options(${PROJECT_NAME} PUBLIC ${LINK_OPTS})
target_link_libraries(${PROJECT_NAME} corelib)
# setup_warnings(${PROJECT_NAME})
