cmake_minimum_required(VERSION 3.10.2)

# Append CMake Module path where carma libraries and carma-build cmake files are installed
if(DEFINED ENV{CARMA_OPT_DIR})
  list(APPEND CMAKE_MODULE_PATH $ENV{CARMA_OPT_DIR}/cmake)
endif()


set(CMAKE_CXX_STANDARD 17)

project(carma-geodetic
  DESCRIPTION "CARMA geodetic library"
  HOMEPAGE_URL https://github.com/usdot-fhwa-stol/carma-geodetic-lib
  VERSION 0.0.1
  LANGUAGES CXX
)

include(cmake/dependencies.cmake)

add_library(${PROJECT_NAME} SHARED)
target_include_directories(${PROJECT_NAME} 
  PUBLIC
    $<BUILD_INTERFACE:${PROJECT_SOURCE_DIR}/include>
)
target_link_libraries( ${PROJECT_NAME}
 ${PROJ4_LIBRARIES}  # Note: Newer versions of PROJ use PROJ::proj
  Microsoft.GSL::GSL
  units::units
)
set_target_properties(${PROJECT_NAME} PROPERTIES
  SOVERSION 1
)
# Required for gtest for test executable. TODO: Maybe this needs to be addresseding Testing.cmake in carma-builds
find_package(Threads)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")

include(CommonSource)
include(Testing)
include(CodeCoverage)
include(InstallingGeneral)
include(InstallingConfigs)
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libproj-dev (>= 6.3.1-1)")
include(Packing)

