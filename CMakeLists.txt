cmake_minimum_required(VERSION 3.18)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(
    Dummy
    VERSION 1.0
    DESCRIPTION " Dummy - A Dummy lib"
    LANGUAGES C
)

set_property(
    TARGET ${PROJECT}
    PROPERTY C_STANDARD 11
)

add_library(
    ${PROJECT_NAME}
    src/dummy.c
)

target_include_directories(
    ${PROJECT_NAME}
    PUBLIC
    include
)

add_executable(main main.c)
target_link_libraries(main PRIVATE ${PROJECT_NAME})
