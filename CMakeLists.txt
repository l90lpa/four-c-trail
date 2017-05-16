cmake_minimum_required(VERSION 3.7)
project(four-c-trial)

# Copy conan.cmake file to build folder
# Could also Download Conan automatically (not working through CLion)
if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    FILE(COPY conan.cmake DESTINATION "${CMAKE_BINARY_DIR}")
    #message(STATUS "Downloading conan.cmake from https://github.com/memsharded/cmake-conan")
    #file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/master/conan.cmake"
    #              "${CMAKE_BINARY_DIR}/conan.cmake" SHOW_PROGRESS LOG DOWNLOAD_STATUS INACTIVITY_TIMEOUT 3 TIMEOUT 5)
    #message(STATUS "-- Download complete --")
    #message(STATUS ${DOWNLOAD_STATUS})
endif()

message(STATUS "Including conan.cmake")
include("${CMAKE_BINARY_DIR}/conan.cmake")

# Run Conan
conan_cmake_run(CONANFILE conanfile.txt
        BASIC_SETUP
        BUILD missing)

find_package(VTK REQUIRED)

set(SOURCE_FILES src/main.cpp)
add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} ${VTK_LIBRARIES} ${CONAN_LIBS})


set(CMAKE_CXX_STANDARD 11)
set_property(DIRECTORY PROPERTY VS_STARTUP_PROJECT ${PROJECT_NAME})
