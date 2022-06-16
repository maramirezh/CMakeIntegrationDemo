# CPack generator
# ---------------------------
if(WIN32)
    set(CPACK_GENERATOR "NSIS")
elseif(UNIX)
    set(CPACK_GENERATOR "DEB;RPM")
endif()
# ---------------------------



# CPack shared variables
# ---------------------------

set(CPACK_PACKAGE_NAME "FullDemo")
set(CPACK_PACKAGE_VENDOR "My Company LLC")
set(CPACK_PACKAGE_CONTACT "john.doe@gmail.com")

set(CPACK_PACKAGE_DESCRIPTION "Small project showcasing how to use CPack, Doxygen, FetchContent, and CTest.")
set(CPACK_PACKAGE_DESCRIPTION_SUMMARY "FullDemo project.")
set(CPACK_PACKAGE_HOMEPAGE_URL "http://127.0.0.1")

# dont - translates to nsis header image, support limited to bitmaps
# set(CPACK_PACKAGE_ICON "${CMAKE_SOURCE_DIR}/redist/logo.png")

set(CPACK_RESOURCE_FILE_LICENSE "${CMAKE_SOURCE_DIR}/res/gpl-3.0.txt")
set(CPACK_RESOURCE_FILE_README "${CMAKE_SOURCE_DIR}/res/README")
set(CPACK_RESOURCE_FILE_WELCOME "${CMAKE_SOURCE_DIR}/res/WELCOME")

# use all available threads
set(CPACK_THREADS -1)

# Permissions 0755 for linux
set(
    CPACK_INSTALL_DEFAULT_DIRECTORY_PERMISSIONS
    OWNER_READ OWNER_WRITE OWNER_EXECUTE
    GROUP_READ GROUP_EXECUTE
    WORLD_READ WORLD_EXECUTE
)
# ---------------------------



# CPack Windows variables
# ---------------------------
if(WIN32)
    # set default dir name without versioning (e.g. "C:\Program Files\MyApp" vs "C:\Program Files\MyApp 1.0.0")
    # the user can still of course change the dir name during installation
	set(CPACK_PACKAGE_INSTALL_DIRECTORY ${CPACK_PACKAGE_NAME})
endif()
# 'The display name string that appears in the Windows Apps & features in Control Panel'
# default with versioning is fine, change if you want.
# set(CPACK_NSIS_DISPLAY_NAME ${CPACK_PACKAGE_NAME})
set(CPACK_NSIS_MUI_ICON "${CMAKE_SOURCE_DIR}/res/logo.ico")
set(CPACK_NSIS_MUI_UNIICON "${CPACK_NSIS_MUI_ICON}")
set(CPACK_NSIS_INSTALLED_ICON_NAME "bin\\\\BarCLI.exe")
# if the user wants to, they can create start menu shortcuts.
# populate list with our executables
set(CPACK_PACKAGE_EXECUTABLES
    "BarCLI" "Bar Terminal User Interface"
    "BarGUI" "Bar Graphical User Interface"
)
# create desktop shortcuts. must map 1:1 to CPACK_PACKAGE_EXECUTABLES list
set(CPACK_CREATE_DESKTOP_LINKS
    "BarCLI"
    "BarGUI"
)
set(CPACK_NSIS_URL_INFO_ABOUT ${CPACK_PACKAGE_HOMEPAGE_URL})
set(CPACK_NSIS_MANIFEST_DPI_AWARE ON)
# utf8 in cmake v.3.20: https://cmake.org/cmake/help/latest/release/3.20.html
# set(CPACK_NSIS_BRANDING_TEXT "My Company ©")
set(CPACK_NSIS_BRANDING_TEXT "My Company (C)")

# ask user to uninstall previous version of the program before install
set(CPACK_NSIS_ENABLE_UNINSTALL_BEFORE_INSTALL ON)
# allow the user to choose whether the program dir should be added to the system PATH variable,
# and whether to create a desktop icon
set(CPACK_NSIS_MODIFY_PATH ON)

# multiple escaping required for these strings, as command is parsed twice:
# first by CMake, then by CPack
#set(CPACK_NSIS_EXTRA_INSTALL_COMMANDS
#"ExecWait \\\"'$INSTDIR\\\\tmp\\\\vcredist_x64.exe' /install /quiet\\\""
#)
# ---------------------------



# CPack Linux variables
# ---------------------------
# install under /opt/fulldemo dir
if(UNIX)
	set(CPACK_PACKAGING_INSTALL_PREFIX "/opt/fulldemo")
endif()
# create multiple packages (.rpms, .debs), one for each component (FullDemoCore, FullDemoGui)
set(CPACK_COMPONENTS_GROUPING ONE_PER_GROUP)
# ---------------------------



# CPack Debian variables
# ---------------------------
# required, in this exact format
set(CPACK_DEBIAN_PACKAGE_MAINTAINER "John Doe <${CPACK_PACKAGE_CONTACT}>")
# same as CPACK_COMPONENTS_GROUPING, but a more specific option for debian
set(CPACK_DEB_COMPONENT_INSTALL ON)
set(CPACK_DEBIAN_ENABLE_COMPONENT_DEPENDS ON)
# let cmake/cpack automatically detect required dependencies
set(CPACK_DEBIAN_FULLDEMOCORE_PACKAGE_SHLIBDEPS ON)
set(CPACK_DEBIAN_FULLDEMOGUI_PACKAGE_SHLIBDEPS ON)
# ---------------------------



# CPack RPM variables
# ---------------------------
# same as CPACK_COMPONENTS_GROUPING, but a more specific option for redhat
set(CPACK_RPM_COMPONENT_INSTALL ON)
# dependencies already handled by default, as
# CPACK_RPM_PACKAGE_AUTOREQ is enabled by default
# ---------------------------
