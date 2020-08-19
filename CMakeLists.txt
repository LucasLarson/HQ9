cmake_minimum_required(VERSION 3.14)
project(HQ9+)
set(CMAKE_CXX_STANDARD 20)
include_directories(.)
add_executable(
        ${PROJECT_NAME}
        main.cpp
	helloWorld.hpp
        helloWorld.cpp
        beer.hpp
        beer.cpp
)
