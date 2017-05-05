cmake_minimum_required(VERSION 3.7)
project(four-c-trial)

set(CMAKE_CXX_STANDARD 11)

if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/conanbuildinfo.cmake)
    include(${CMAKE_CURRENT_SOURCE_DIR}/conanbuildinfo.cmake)
else()
    include(${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)
endif()
conan_basic_setup()

add_executable(four-c-trial main.cpp)
target_link_libraries(four-c-trial ${CONAN_LIBS})
