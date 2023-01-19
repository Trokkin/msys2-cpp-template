cmake_minimum_required(VERSION 3.13)

#
# This file configures tests for the core library
#

project(tests)

enable_testing()

file(GLOB SOURCE_LIB ${PROJECT_SOURCE_DIR}/*.cpp)


foreach(file ${SOURCE_LIB})
    string(REGEX REPLACE "(.*/)([a-zA-Z0-9_ ]+)(\.cpp)" "\\2" test_name ${file}) 
    add_executable(${test_name} ${file})
    find_package(GTest REQUIRED)
    
    target_link_libraries(${test_name}
        corelib
        ${GTEST_LIBRARIES}
        # # GTest::GTest
        # # GTest::Main
        # GTest::gmock
        # GTest::gmock_main
    )
    target_link_options(${PROJECT_NAME} PUBLIC ${LINK_OPTS})
    target_compile_options(${PROJECT_NAME} PUBLIC ${COMPILE_OPTS})
    add_test(NAME Test_${test_name} COMMAND ${test_name})
endforeach()
