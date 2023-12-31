# CARMA Geodetic Library
This CARMA Geodetic library is a focused library providing classes and utilities which enable a consuming project to make calls to translate between UTM coordinates and WSG84 coordinates.
# CI Status
[![Build Workflow](https://github.com/usdot-fhwa-stol/carma-geodetic-lib/actions/workflows/build.yml/badge.svg)](https://github.com/usdot-fhwa-stol/carma-geodetic-lib/actions/workflows/build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=usdot-fhwa-stol_carma-geodetic-lib&metric=alert_status)](https://sonarcloud.io/summary/new_code?id=usdot-fhwa-stol_carma-geodetic-lib)
[![Coverage](https://sonarcloud.io/api/project_badges/measure?project=usdot-fhwa-stol_carma-geodetic-lib&metric=coverage)](https://sonarcloud.io/summary/new_code?id=usdot-fhwa-stol_carma-geodetic-lib)

# Architecture

The library contains the geodetic header file which defines a struct for capturing WSG84 Coordinates, UTM Coordinates and UTM  Displacement. It also provides operators with which you can combine UTM Coordinates with UTM Displacements through addition and substraction.

Finally it offers functions for projecting a point described in WSG84 coordinates to UTM coordinates

# Building the Library
## Configuring Build Environment

The project build environment is supplied as a single-image [Docker Dev Environment](https://docs.docker.com/desktop/dev-environments/), with Visual Studio Code editor configurations to enable streamlined setup.

To load the project in VSCode:

1. Clone this repository.

```
git clone git@github.com:usdot-fhwa-stol/carma-geodetic-lib.git
cd carma-geodetic-lib/
```

2. Open the VSCode editor.
3. Open the cloned project folder.
4. Accept the **Reopen in Container** prompt for **"Folder contains a Dev Container configuration file. Reopen folder to develop in a container (learn more)."**

![Dev Container Rebuild Notification](doc/images/DevContainerRebuildNotification.png)

7. If that prompt did not appear, open the **View > Command Palette** and type to locate **"Dev Containers: Rebuild and Reopen in Container"**.
6. The editor should refresh and display the updated activity in the command line.

![Dev Container Rebuild Log](doc/images/DevContainerRebuildLog.png)

If the container startup was successful, the development environment is up and running and contains the library dependencies and compilation environment. It is possible to proceed with the build.

## Building

1. In VSCode, open **Build the Terminal > Run Build Task...**.

![Library Build Log](doc/images/LibraryBuildLog.png)

2. If the build is successful, tests are automatically executed and a Debian package is generated.
3. TODO more details (output product locations, reference information for generalized docker dev solution including container configured locations etc.).
## Setting up debugger
1. In VSCode hit `shift+ctrl+p` to open the command list/search.
2. Search for `CMake: Configure` and select it.
3. Select `gcc`
4. On the bottom toolbar on VSCode click the `Build` icon to run a CMake build of all project targets.
5. On the bottom toolbar on VSCode click bug icon to launch the debugger.
## Additional IDE Configuration

Some additional configurations are provided out-of-the-box to streamline the developer's setup process. These are included for Visual Studio Code:

| Item                                  | Description                                                                                                          |
|---------------------------------------|----------------------------------------------------------------------------------------------------------------------|
| .devcontainer/devcontainer.json       | Docker Dev Environment definition file.|  
| .editorconfig                         | Some standard, robust VSCode editor configurations.|
| .github/workflows/build.yml           | GitHub CI build |
| .github/workflows/sonar-scanner.yml   | Github CI for sonar static code analysis and unit test coverage report |
| .gitignore                            | Some helpful Git Ignore rules that should apply to Cmake-based C++ projects developed with most modern code editors.|
| install_dependencies.sh               | Docker Dev Environment internal script. TODO move this file? |
| .vscode/tasks.json                    | Build task definition utilizing Docker Dev Environment. |

## Deploying
TODO
# Using the Library
## Dependency Management
TODO
## Linking Against the Library
TODO
## Configuration

TODO

# CARMA Projects

See all CARMA projects in the [USDOT FHWA STOL](https://github.com/usdot-fhwa-stol) organization on GitHub.


## Contribution

Welcome to the CARMA contributing guide. Please read this guide to learn about our development process, how to propose pull requests and improvements, and how to build and test your changes to this project. [CARMA Contributing Guide](https://github.com/usdot-fhwa-stol/carma-platform/blob/develop/Contributing.md)

## Code of Conduct

Please read our [CARMA Code of Conduct](https://github.com/usdot-fhwa-stol/carma-platform/blob/develop/Code_of_Conduct.md) which outlines our expectations for participants within the CARMA community, as well as steps to reporting unacceptable behavior. We are committed to providing a welcoming and inspiring community for all and expect our code of conduct to be honored. Anyone who violates this code of conduct may be banned from the community.

## Attribution

The development team would like to acknowledge the people who have made direct contributions to the design and code in this repository. [CARMA Attribution](https://github.com/usdot-fhwa-stol/carma-platform/blob/develop/ATTRIBUTION.md)

## License

By contributing to the Federal Highway Administration (FHWA) Connected Automated Research Mobility Applications (CARMA), you agree that your contributions will be licensed under its Apache License 2.0 license. [CARMA License](https://github.com/usdot-fhwa-stol/carma-platform/blob/develop/docs/License.md)

## Contact

Please click on the CARMA logo below to visit the Federal Highway Adminstration(FHWA) CARMA website.

[![CARMA Image](https://raw.githubusercontent.com/usdot-fhwa-stol/CARMAPlatform/develop/docs/image/CARMA_icon.png)](https://highways.dot.gov/research/research-programs/operations/CARMA)
