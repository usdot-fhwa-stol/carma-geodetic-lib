cmake_minimum_required(VERSION 3.10.2)

# where to find our CMake modules
set(CMAKE_MODULE_PATH "$ENV{CARMA_OPT_DIR}/cmake")
# Required for std::lock and syntax
set(CMAKE_CXX_STANDARD 17)

# Needed so CMake can find the vendored PROJ4 module file. Th FindPROJ4.cmake
# module file can be removed if we upgrade to a more recent PROJ version. See
# https://github.com/usdot-fhwa-stol/carma-platform/issues/2139 for updates.
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

project(carma-geodetic
    DESCRIPTION "CARMA geodetic library"
    HOMEPAGE_URL https://github.com/usdot-fhwa-stol/carma-geodetic-lib
	VERSION 0.0.1
    LANGUAGES CXX
)

find_package(Threads)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -pthread")

include(cmake/dependencies.cmake)

add_library(${PROJECT_NAME} SHARED)
target_link_libraries( ${PROJECT_NAME}
 ${PROJ4_LIBRARIES}  # Note: Newer versions of PROJ use PROJ::proj
  GSL  # Note: Newer versions of GSL use Microsoft.GSL::GSL
  units::units
)
target_include_directories(${PROJECT_NAME} 
    PUBLIC
        $<INSTALL_INTERFACE:include>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>
    PRIVATE
        ${CMAKE_CURRENT_SOURCE_DIR}/src
)
target_link_libraries( ${PROJECT_NAME}
 ${PROJ4_LIBRARIES}  # Note: Newer versions of PROJ use PROJ::proj
  GSL  # Note: Newer versions of GSL use Microsoft.GSL::GSL
  units::units
)
set_target_properties(${PROJECT_NAME} PROPERTIES
    SOVERSION 1
)


include(CommonSource)
include(Testing)
include(CodeCoverage)
include(InstallingGeneral)
include(InstallingConfigs)
set(CPACK_DEBIAN_PACKAGE_DEPENDS "libproj-dev (>= 6.3.1-1)")
include(Packing)
