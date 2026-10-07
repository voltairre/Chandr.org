cmake_minimum_required(VERSION 3.31.6)

project(website VERSION 1.0 LANGUAGES CXX)

find_package(Qt6 REQUIRED COMPONENTS Quick)

qt_standard_project_setup(REQUIRES 6.11.2)

qt_add_executable(app
    main.cpp
)

qt_add_qml_module(app
    URI website
    QML_FILES
    Main.qml
    Zonai.qml

    RESOURCES
    assets/blur_full_green_energy.jpg
)

target_link_libraries(app PRIVATE
    Qt6::Quick
)

target_compile_options(app PRIVATE
    "$<$<CONFIG:Release>:-Os>"
    "$<$<CONFIG:Release>:-flto>"
)

target_link_options(app PRIVATE
    "$<$<CONFIG:Release>:-flto>"
    "$<$<CONFIG:Release>:-O0>"
    "$<$<CONFIG:Release>:-sWASM_BIGINT>"
    "$<$<CONFIG:Release>:-sMAX_WEBGL_VERSION=2>"
    "$<$<CONFIG:Release>:-sWEBGL2_BACKWARDS_COMPATIBILITY_EMULATION>"
)
