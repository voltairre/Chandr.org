cmake_minimum_required(VERSION 3.31.6)

project(website VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Quick Network)

qt_standard_project_setup(REQUIRES 6.11.2)

qt_add_executable(main
    main.cpp
)

qt_add_qml_module(main
    URI Main

    QML_FILES
    Main.qml
    Zonai.qml

    RESOURCES
    assets/blur_full_green_energy.jpg
)

qt_add_qml_module(Music
    URI Music
    OUTPUT_DIRECTORY "${CMAKE_CURRENT_BINARY_DIR}/Music"

    SOURCES
    music.h
    music.cpp
)

target_link_libraries(main PRIVATE
    Qt6::Quick
    Qt6::Network
    Music
)

target_compile_options(main PRIVATE
    "$<$<CONFIG:Release>:-Os>"
    "$<$<CONFIG:Release>:-flto>"
)

target_link_options(main PRIVATE
    "$<$<CONFIG:Release>:-flto>"
    "$<$<CONFIG:Release>:-O0>"
    "$<$<CONFIG:Release>:-sWASM_BIGINT>"
    "$<$<CONFIG:Release>:-sMAX_WEBGL_VERSION=2>"
    "$<$<CONFIG:Release>:-sWEBGL2_BACKWARDS_COMPATIBILITY_EMULATION>"
)
