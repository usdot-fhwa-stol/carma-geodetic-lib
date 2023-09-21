# Copyright 2023 Leidos
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
include(cmake/get_cpm.cmake)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake)

include(cmake/FindPROJ4.cmake)
set(CPM_USE_LOCAL_PACKAGES ON)

# # lint_cmake: -readability/wonkycase
CPMFindPackage (NAME units
  GITHUB_REPOSITORY nholthaus/units
  GIT_TAG v2.3.3
  SYSTEM ON
  OPTIONS
    "BUILD_TESTS FALSE"
    "BUILD_DOCS FALSE"
)
export( TARGETS units NAMESPACE units:: FILE unitsConfig.cmake)
# lint_cmake: -readability/wonkycase
CPMFindPackage (NAME Microsoft.GSL
  GITHUB_REPOSITORY microsoft/GSL
  GIT_TAG v4.0.0  # This is the version shipped with Ubuntu 20.04; newer versions are available
  EXCLUDE_FROM_ALL ON
  SYSTEM ON
  OPTIONS
    "GSL_INSTALL TRUE"
    "GSL_TEST FALSE"
    "CMAKE_CXX_STANDARD 17"
)

# CARMA currently uses PROJ version 6.3.1, which is not designed to be incorporated
# as a subdirectory into larger projects. If CARMA upgrades to a newer version, we
# could use the CPMAddPackage(...) command to install PROJ as a source dependency
# if there is no version already locally available.
# See https://github.com/usdot-fhwa-stol/carma-platform/issues/2139 for the PROJ
# version upgrade plans.
find_package(PROJ4 REQUIRED MODULE)

