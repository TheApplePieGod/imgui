cmake_minimum_required(VERSION 3.14)

project(imgui)

file(GLOB_RECURSE SOURCES CONFIGURE_DEPENDS "*.cpp" "*.h")
add_library(imgui STATIC "${SOURCES}")