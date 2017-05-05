# four-c-trial
Set-up of 4 C's toolchain, trialing with VTK library

## pull in dependencies

on terminal:

$ cd ./build
$ conan install --build missing

## on CLion

#### Using the CMakeLists.txt in this repository leads to the error.

Generic Warning: In /Users/liamadams/.conan/data/VTK/7.0.0/bilke/stable/build/7586e5a72612387c5beb630c8ff07f1a397d08b6/VTK-7.0.0/Rendering/Core/vtkPolyDataMapper.cxx, line 28
Error: no override found for 'vtkPolyDataMapper'.

Process finished with exit code 11

#### Using and CMakeLists.txt of the form below, gives warnings about overrides during the build, but the executable runs fine. Also when using this it was building from VTK that I had pulled in via Homebrew.

cmake_minimum_required(VERSION 3.7)
project(four-c-trial)

set(CMAKE_CXX_STANDARD 11)

find_package(VTK REQUIRED)
include(${VTK_USE_FILE})

add_executable(four-c-trial main.cpp)
target_link_libraries(four-c-trial ${VTK_LIBRARIES})

